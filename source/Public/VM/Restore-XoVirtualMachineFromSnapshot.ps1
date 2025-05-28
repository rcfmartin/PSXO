function Restore-XoVirtualMachineFromSnapshot
{
    <#
    .SYNOPSIS
    Restores virtual machine from snapshot

    .DESCRIPTION
    Restores virtual machine from snapshot

    .PARAMETER Session
    XoSession object

    .PARAMETER SnapshotId
    Target snapshot machine ID

    .EXAMPLE
    $sess = New-XoSession -Uri "https://xo.example.com" -Token "Caywizq1kyz7G2mg25Tc2rk_KxgIb063DnM4ScqdMVE"
    Restore-XoVirtualMachineFromSnapshot -Session $sess -SnapshotId "06754190-adbf-46a9-ab00-558ffcc9a22f"
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
        $SnapshotId


    )

    begin
    {

    }

    process
    {
        [hashtable]$params = @{
            snapshot = $SnapshotId
        }
        try
        {
            $vmExists = Get-XoVirtualMachine -Session $Session -Id $SnapshotId -ErrorAction Stop
        }
        catch
        {
            throw $_.Exception.Message
        }

        if (-not($vmExists.Id))
        {
            throw "Snapshot not found"
        }
        try
        {
            $body = New-JsonRpcRequest -Method "vm.revert" -Params $params
            $resp = Send-WebSocketJsonRpc -Session $Session -Body $body -ErrorAction Stop
        }
        catch
        {
            throw $_.Exception.Message
        }
        if ($resp)
        {
            $prop = $resp.params.items.psobject.Properties.Value | Where-Object { $_.name_label -ilike "*VM.revert*" }

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
