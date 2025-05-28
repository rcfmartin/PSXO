function Invoke-XoScheduleSequence
{
    <#
    .SYNOPSIS
    Run schedules in sequence

    .DESCRIPTION
    Run schedules in sequence

    .PARAMETER Session
    XoSession

    .PARAMETER Id
    Target Schedule Id

    .EXAMPLE
    $sess = New-XoSession -Uri "https://xo.example.com" -Token "Caywizq1kyz7G2mg25Tc2rk_KxgIb063DnM4ScqdMVE"
    Invoke-XoScheduleSequence -Session $sess -Id "a933cb47-fbf7-42a5-af39-abac9fc3feca"
    #>
    [CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = "Medium")]
    [OutputType([void])]
    param (
        [Parameter(Mandatory = $true)]
        [XoSession]
        $Session,

        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        $Id
    )

    begin
    {

    }

    process
    {
        if ($PSCmdlet.ShouldProcess($Id, "Run schedules in sequence"))
        {


            $params = @{
                schedules = $Id
            }

            try
            {
                $body = New-JsonRpcRequest -Method "schedule.runSequence" -Params $params
                $resp = Send-WebSocketJsonRpc -Session $Session -Body $body -ErrorAction Stop
            }
            catch
            {
                throw $_.Exception.Message
            }

            if ($null -ne $resp)
            {
                if ($resp.result.error)
                {
                    throw $resp.result.error
                }
            }
        }

    }

    end
    {

    }
}
