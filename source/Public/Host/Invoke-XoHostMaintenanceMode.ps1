function Invoke-XoHostMaintenanceMode
{
    <#
    .SYNOPSIS
    Set host to Maintenance mode

    .DESCRIPTION
    Set host to Maintenance mode

    .PARAMETER Session
    XoSession object

    .PARAMETER Id
    Target Host ID

    .PARAMETER Maintenance
    Bool value to set the server into maintenance mode

    .EXAMPLE
    $sess = New-XoSession -Uri "https://xo.example.com" -Token "Caywizq1kyz7G2mg25Tc2rk_KxgIb063DnM4ScqdMVE"
    Invoke-XoHostMaintenanceMode -Session $sess -Id "9ace51e1-dfbd-4617-8db3-88f28974e111"
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
        $Maintenance
    )

    begin
    {



    }

    process
    {
        if ($PSCmdlet.ShouldProcess($Id, "Suspend all VMs and Shutdown host"))
        {
            $params = @{
                host = $Id
            }
            if ($PSBoundParameters.ContainsKey("Maintenance"))
            {
                $params["maintenance"] = $Maintenance
            }
            try
            {
                $body = New-JsonRpcRequest -Method "host.emergencyShutdownHost" -Params $params
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
