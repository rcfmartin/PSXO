function New-XoSnapshot
{
    <#
    .SYNOPSIS
    Takes a snapshot of the target virtual machine

    .DESCRIPTION
    Takes a snapshot of the target virtual machine

    .PARAMETER Session
    XoSession object

    .PARAMETER Id
    Target Virtual machine ID

    .PARAMETER Name
    New snapshot name

    .PARAMETER Description
    New snapshot description

    .PARAMETER SaveMemory
    Save VM memory

    .EXAMPLE
    $sess = New-XoSession -Uri "https://xo.example.com" -Token "Caywizq1kyz7G2mg25Tc2rk_KxgIb063DnM4ScqdMVE"
    New-XoSnapshot -Session $sess -Id "06754190-adbf-46a9-ab00-558ffcc9a22f"
    #>
    [CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = "High")]
    [OutputType([void])]
    param (
        [Parameter(Mandatory = $true)]
        [XoSession]
        $Session,

        [Parameter(ValueFromPipelineByPropertyName = $true, Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [Alias("Uuid")]
        [string]
        $Id,

        [Parameter()]
        [string]
        $Name,

        [Parameter()]
        [string]
        $Description,

        [Parameter()]
        [bool]
        $SaveMemory

    )

    begin
    {

    }

    process
    {
        if ($PSCmdlet.ShouldProcess($Id, "New Snapshot"))
        {

            [hashtable]$params = @{
                id = $Id
            }
            if ($PSBoundParameters.ContainsKey("Name"))
            {
                $params["name"] = $Name
            }
            if ($PSBoundParameters.ContainsKey("Description"))
            {
                $params["description"] = $Description
            }

            if ($PSBoundParameters.ContainsKey("SaveMemory"))
            {
                $params["saveMemory"] = $SaveMemory
            }
            try
            {
                $vmExists = Get-XoVirtualMachine -Session $Session -Id $Id -ErrorAction Stop
            }
            catch
            {
                throw $_.Exception.Message
            }

            if (-not($vmExists.Id))
            {
                throw "VM not found"
            }
            try
            {
                $body = New-JsonRpcRequest -Method "vm.snapshot" -Params $params
                $resp = Send-WebSocketJsonRpc -Session $Session -Body $body -ErrorAction Stop
            }
            catch
            {
                throw $_.Exception.Message
            }
            if ($resp)
            {
                $prop = $resp.params.items.psobject.Properties.Value | Where-Object { $_.name_label -ilike "*VM.*snapshot*" }

                if ($prop.status -ieq "failure")
                {
                    try
                    {
                        $task = Get-XoTask -Session $sess -ErrorAction Stop | Where-Object { $_.Result.Task.uuid -ieq "$($prop.id)" }

                    }
                    catch
                    {
                        throw $_.Exception.Message
                    }
                    throw "Failed to take a snapshot of the VM. TaskId: $($task.id) Error: $($task.result.task.error_info)"
                }

            }

            $null = Get-XoTaskProgress -Session $Session -Id $prop.id
        }

    }

    end
    {
        return
    }
}
