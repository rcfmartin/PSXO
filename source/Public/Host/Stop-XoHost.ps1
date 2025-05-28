function Stop-XoHost
{
    <#
    .SYNOPSIS
    Stop Host

    .DESCRIPTION
    Stop Host

    .PARAMETER Session
    XoSession object

    .PARAMETER Id
    Target Host ID

    .PARAMETER BypassBackupCheck
    Bypass backup check

    .PARAMETER BypassEvacuate
    Bypass evacuate

    .EXAMPLE
    $sess = New-XoSession -Uri "https://xo.example.com" -Token "Caywizq1kyz7G2mg25Tc2rk_KxgIb063DnM4ScqdMVE"
    Stop-XoHost -Session $sess -Id "9ace51e1-dfbd-4617-8db3-88f28974e111"
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
        $BypassEvacuate
    )

    begin
    {



    }

    process
    {
        if ($PSCmdlet.ShouldProcess($Id, "Stop Host"))
        {
            $params = @{
                id = $Id
            }
            if ($PSBoundParameters.ContainsKey("BypassBackupCheck"))
            {
                $params["bypassBackupCheck"] = $BypassBackupCheck
            }
            if ($PSBoundParameters.ContainsKey("BypassEvacuate"))
            {
                $params["bypassEvacuate"] = $BypassEvacuate
            }

            try
            {
                $body = New-JsonRpcRequest -Method "host.stop" -Params $params
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
