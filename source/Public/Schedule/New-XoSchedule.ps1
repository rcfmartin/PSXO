function New-XoSchedule
{
    <#
    .SYNOPSIS
    Create new schedule

    .DESCRIPTION
    Create new schedule

    .PARAMETER Session
    XoSession

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
    New-XoSchedule -Session $sess -Cron "0 0 * * *" -Name "Test" -TimeZone "$($(Get-TimeZone).Id)"
    #>
    [CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = "Medium")]
    [OutputType([XoSchedule])]
    param (
        [Parameter(Mandatory = $true)]
        [XoSession]
        $Session,

        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string]
        $Cron,

        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string]
        $Name,


        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string]
        $JobId,

        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [bool]
        $Enabled = $true,

        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [string]
        $TimeZone = "$($(Get-TimeZone).Id)"
    )

    begin
    {

    }

    process
    {
        if ($PSCmdlet.ShouldProcess($Id, "Create new schedule"))
        {


            $params = @{
                cron     = $Cron
                jobId    = $JobId
                timezone = $TimeZone
                name     = $Name
                enabled  = $Enabled
            }

            try
            {
                $body = New-JsonRpcRequest -Method "schedule.create" -Params $params
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

                return [XoSchedule]::new(@{
                        Cron     = $resp.result.cron
                        Enabled  = $resp.result.enabled
                        JobId    = $resp.result.jobid
                        Name     = $resp.result.name
                        TimeZone = $resp.result.timezone
                        Id       = $resp.result.id
                    })
            }
        }

    }

    end
    {

    }
}
