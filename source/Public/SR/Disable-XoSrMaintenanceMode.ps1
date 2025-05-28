function Disable-XoSrMaintenanceMode
{
    <#
    .SYNOPSIS
    Disable maintenance Mode

    .DESCRIPTION
    Disable maintenance Mode

    .PARAMETER Session
    XoSession

    .PARAMETER Id
    Target SR Id

    .EXAMPLE
    $sess = New-XoSession -Uri "https://xo.example.com" -Token "Caywizq1kyz7G2mg25Tc2rk_KxgIb063DnM4ScqdMVE"
    Disable-XoSrMaintenanceMode -Session $sess -Id "a933cb47-fbf7-42a5-af39-abac9fc3feca"
    #>
    [CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = "High")]
    [OutputType([XoSr])]
    param (
        [Parameter(Mandatory = $true)]
        [XoSession]
        $Session,

        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string]
        $Id
    )

    begin
    {

    }

    process
    {
        if ($PSCmdlet.ShouldProcess($Id, "Disable maintenance Mode"))
        {


            $params = @{
                id = $Id
            }
            if ($PSBoundParameters.ContainsKey("VmsToShutdown"))
            {
                $params["vmsToShutdown"] = $VmsToShutdown
            }
            try
            {
                $body = New-JsonRpcRequest -Method "sr.disableMaintenanceMode" -Params $params
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

                $sr = Get-XoSr -Session $Session -Id $Id
            }
        }

    }

    end
    {
        if ($null -ne $sr)
        {
            return $sr
        }
    }
}
