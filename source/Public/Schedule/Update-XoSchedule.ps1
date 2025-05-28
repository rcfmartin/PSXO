function Update-XoSchedule
{
    <#
    .SYNOPSIS
    Update schedule

    .DESCRIPTION
    Update schedule

    .PARAMETER Session
    XoSession

    .PARAMETER Id
    Target Schedule ID

    .PARAMETER Cron
    Cron string

    .PARAMETER Name
    New schedule name

    .PARAMETER JobId
    Target Job Id

    .PARAMETER Enabled
    True by default

    .PARAMETER TimeZone
    Target Time zone. Current computer's timezone by default.

    .EXAMPLE
    $sess = New-XoSession -Uri "https://xo.example.com" -Token "Caywizq1kyz7G2mg25Tc2rk_KxgIb063DnM4ScqdMVE"
    Update-XoSchedule -Session $sess -Id "a933cb47-fbf7-42a5-af39-abac9fc3feca" -Cron "0 0 * * *" -Name "Test" -TimeZone "$($(Get-TimeZone).Id)"
    #>
    [CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = "High")]
    [OutputType([void])]
    param (
        [Parameter(Mandatory = $true)]
        [XoSession]
        $Session,

        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string]
        $Id,

        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [string]
        $Cron,

        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [string]
        $Name,


        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [string]
        $JobId,

        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [bool]
        $Enabled,

        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [string]
        $TimeZone
    )

    begin
    {

    }

    process
    {
        if ($PSCmdlet.ShouldProcess($Id, "Update schedule"))
        {


            $params = @{
                id = $Id
            }
            if ($PSBoundParameters.ContainsKey("Cron"))
            {
                $params["cron"] = $Cron
            }

            if ($PSBoundParameters.ContainsKey("Enabled"))
            {
                $params["enabled"] = $Enabled
            }

            if ($PSBoundParameters.ContainsKey("JobId"))
            {
                $params["jobId"] = $JobId
            }

            if ($PSBoundParameters.ContainsKey("Name"))
            {
                $params["name"] = $Name
            }

            if ($PSBoundParameters.ContainsKey("TimeZone"))
            {
                $params["timezone"] = $TimeZone
            }

            try
            {
                $body = New-JsonRpcRequest -Method "schedule.set" -Params $params
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

                try
                {
                    $schedule = Get-XoSchedule -Session -Id $Id -ErrorAction Stop
                }
                catch
                {
                    throw $_.Exception.Message
                }

                if ($null -ne $schedule)
                {
                    return $schedule
                }
            }
        }

    }

    end
    {

    }
}
