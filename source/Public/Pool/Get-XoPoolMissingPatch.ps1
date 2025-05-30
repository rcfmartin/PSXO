function Get-XoPoolMissingPatch
{
    <#
    .SYNOPSIS
    Get all groups

    .DESCRIPTION
    Get all groups

    .PARAMETER Session
    XoSession object

    .PARAMETER HostId
    Target Host ID

    .EXAMPLE
    $sess = New-XoSession -Uri "https://xo.example.com" -Token "Caywizq1kyz7G2mg25Tc2rk_KxgIb063DnM4ScqdMVE"
    Get-XoPoolMissingPatch -Session $sess -HostId "9ace51e1-dfbd-4617-8db3-88f28974e111"
    #>
    [CmdletBinding()]
    [OutputType([XoGroup])]
    param (
        [Parameter(Mandatory = $true)]
        [XoSession]
        $Session,

        [Parameter(ValueFromPipelineByPropertyName = $true)]
        [ValidateNotNullOrEmpty()]
        [Alias("Uuid")]
        [string]
        $HostId
    )

    begin
    {
        function Get-XoPatch
        {
            [CmdletBinding()]
            param (
                [hashtable]$Params,

                [XoSession]$Session
            )

            begin
            {

            }

            process
            {
                try
                {
                    $body = New-JsonRpcRequest -Method "pool.listMissingPatches" -Params $Params
                    $resp = Send-WebSocketJsonRpc -Session $Session -Body $body -ErrorAction Stop
                }
                catch
                {
                    throw $_.Exception.Message
                }
            }

            end
            {
                return $resp
            }
        }
    }

    process
    {

        $params = @{
            host = $HostId
        }

        $resp = Get-XoPatch -Session $Session -Params $params

        if ($resp.params.items)
        {
            $prop = $resp.params.items.psobject.Properties.Value | Where-Object { $_.type -ilike "*task*" }

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
                throw "Failed to find the Task. TaskId: $($task.id) Error: $($task.result.task.error_info)"
            }

            do
            {
                try
                {
                    $body = New-JsonRpcRequest -Method "xo.getAllObjects" -Params @{filter = "id:$($prop.id)" }
                    $test = Send-WebSocketJsonRpc -Session $Session -Body $body -ErrorAction Stop
                }
                catch
                {
                    throw $_.Exception.Message
                }
                $status = "Task: $($test.result.psobject.Properties.Value.name_label)"
                $percent = [System.Math]::Round(($test.result.psobject.Properties.Value.progress * 100))
                $act = "Progress $($percent)%"
                if ($percent)
                {
                    Write-Progress -Status $status -Activity $act -PercentComplete $percent -Id 1
                }
                Start-Sleep -Seconds 1
            }while ($null -ne $test.result.psobject.Properties.Value)
            Start-Sleep -Seconds 3
            Write-Progress -Status $status -Activity $act -Completed -Id 1
        }

        $output = Get-XoPatch -Session $Session -Params $params
        if ($output.result)
        {
            $items = [pscustomobject]$output.result
            foreach ($item in $items)
            {
                [XoPatch]::new(@{
                        Url         = $item.url
                        Version     = $item.version
                        Name        = $item.name
                        License     = $item.license
                        Changelog   = $item.changelog
                        Release     = $item.release
                        Size        = $item.size
                        Description = $item.description
                    })
            }
        }

    }

    end
    {
        # return $result
    }
}
