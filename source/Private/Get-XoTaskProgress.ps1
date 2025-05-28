function Get-XoTaskProgress
{
    <#
    .SYNOPSIS
    Get the current Task status

    .DESCRIPTION
    Get the current Task status

    .PARAMETER Session
    XoSession object

    .PARAMETER Id
    Target object ID

    .EXAMPLE
    Get-XoTaskProgress -Session $Session -Id "6d6c8483-f9f0-404f-bfbe-402993e27b74"
    #>
    [CmdletBinding()]
    [OutputType([void])]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
        [XoSession]$Session,

        [Parameter(Mandatory = $true)]
        $Id
    )

    begin
    {

    }

    process
    {
        do
        {
            try
            {
                $body = New-JsonRpcRequest -Method "xo.getAllObjects" -Params @{filter = "id:$($Id)" }
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

    end
    {

    }
}
