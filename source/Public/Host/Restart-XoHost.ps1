function Restart-XoHost
{
    <#
   .SYNOPSIS
   Restart Host

   .DESCRIPTION
   Restart Host

   .PARAMETER Session
   XoSession object

   .PARAMETER Id
   Target Host Id

   .PARAMETER BypassBackupCheck
   Bypass backup check

   .PARAMETER BypassBlockedSuspend
   Bypass blocked suspend

   .PARAMETER BypassCurrentVmCheck
   Bypass current VM check

   .PARAMETER Force
   Force restart

   .PARAMETER SuspendResidentVms
   Suspend vms before restarting

   .PARAMETER BypassVersionCheck
   Bypass version check

   .EXAMPLE
    $sess = New-XoSession -Uri "https://xo.example.com" -Token "Caywizq1kyz7G2mg25Tc2rk_KxgIb063DnM4ScqdMVE"
    Restart-XoHost -Session $sess -Id "9ace51e1-dfbd-4617-8db3-88f28974e111"

    .EXAMPLE
    $sess = New-XoSession -Uri "https://xo.example.com" -Token "Caywizq1kyz7G2mg25Tc2rk_KxgIb063DnM4ScqdMVE"
    Restart-XoHost -Session $sess -Id "9ace51e1-dfbd-4617-8db3-88f28974e111" -SuspendResidentVms:$true
   #>
    [CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = 'High')]
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
        [bool]
        $BypassBackupCheck,

        [Parameter()]
        [bool]
        $BypassBlockedSuspend,

        [Parameter()]
        [bool]
        $BypassCurrentVmCheck,

        [Parameter()]
        [bool]
        $Force,

        [Parameter()]
        [bool]
        $SuspendResidentVms,

        [Parameter()]
        [bool]
        $BypassVersionCheck
    )

    begin
    {



    }

    process
    {
        if ($PSCmdlet.ShouldProcess($Id, "Restart the Host"))
        {
            $params = @{
                id = $Id
            }

            if ($PSBoundParameters.ContainsKey("BypassBackupCheck"))
            {
                $params["bypassBackupCheck"] = $BypassBackupCheck
            }
            if ($PSBoundParameters.ContainsKey("BypassBlockedSuspend"))
            {
                $params["bypassBlockedSuspend"] = $BypassBlockedSuspend
            }
            if ($PSBoundParameters.ContainsKey("BypassCurrentVmCheck"))
            {
                $params["bypassCurrentVmCheck"] = $BypassCurrentVmCheck
            }
            if ($PSBoundParameters.ContainsKey("Force"))
            {
                $params["force"] = $Force
            }
            if ($PSBoundParameters.ContainsKey("SuspendResidentVms"))
            {
                $params["suspendResidentVms"] = $SuspendResidentVms
            }
            if ($PSBoundParameters.ContainsKey("BypassVersionCheck"))
            {
                $params["bypassVersionCheck"] = $BypassVersionCheck
            }

            try
            {
                $body = New-JsonRpcRequest -Method "host.restart" -Params $params
                $null = Send-WebSocketJsonRpc -Session $Session -Body $body -ErrorAction Stop
                # return $resp
            }
            catch
            {
                throw $_.Exception.Message
            }
        }

    }

    end
    {

    }
}
