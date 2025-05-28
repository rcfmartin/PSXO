function Suspend-XoVirtualMachine
{
    <#
    .SYNOPSIS
    Suspends virtual machine

    .DESCRIPTION
    Suspends virtual machine

    .PARAMETER Session
    XoSession object

    .PARAMETER Id
    Target Virtual machine ID

    .EXAMPLE
    $sess = New-XoSession -Uri "https://xo.example.com" -Token "Caywizq1kyz7G2mg25Tc2rk_KxgIb063DnM4ScqdMVE"
    Suspend-XoVirtualMachine -Session $sess -Id "06754190-adbf-46a9-ab00-558ffcc9a22f"
    #>
    [CmdletBinding()]
    [OutputType([void])]
    param (
        [Parameter(Mandatory = $true)]
        [XoSession]
        $Session,

        [Parameter(ValueFromPipelineByPropertyName = $true, Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [Alias("Uuid")]
        [string]
        $Id


    )

    begin
    {

    }

    process
    {
        [hashtable]$params = @{
            id = $Id
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
            $body = New-JsonRpcRequest -Method "vm.suspend" -Params $params
            $resp = Send-WebSocketJsonRpc -Session $Session -Body $body -ErrorAction Stop
        }
        catch
        {
            throw $_.Exception.Message
        }
        if ($resp)
        {
            $prop = $resp.params.items.psobject.Properties.Value | Where-Object { $_.name_label -ilike "*VM.suspend*" }

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
                throw "Failed to Resume the VM. TaskId: $($task.id) Error: $($task.result.task.error_info)"
            }

        }
        $null = Get-XoTaskProgress -Session $Session -Id $prop.id

    }

    end
    {
        return
    }
}
