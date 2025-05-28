function Restart-XoHostAgent
{
    <#
    .SYNOPSIS
    Restart Host agent

    .DESCRIPTION
    Restart Host agent

    .PARAMETER Session
    XoSession object

    .PARAMETER Id
    Target Host ID

    .EXAMPLE
    $sess = New-XoSession -Uri "https://xo.example.com" -Token "Caywizq1kyz7G2mg25Tc2rk_KxgIb063DnM4ScqdMVE"
    Restart-XoHostAgent -Session $sess -Id "9ace51e1-dfbd-4617-8db3-88f28974e111"
    #>
    [CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = 'medium')]
    [OutputType([void])]
    param (
        [Parameter(Mandatory = $true)]
        [XoSession]
        $Session,

        [Parameter(ValueFromPipelineByPropertyName = $true, Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [Alias("Uuid")]
        [string]
        $Id
    )

    begin
    {



    }

    process
    {
        if ($PSCmdlet.ShouldProcess($Id, "Restart Host agent"))
        {
            $params = @{
                id = $Id
            }

            try
            {
                $body = New-JsonRpcRequest -Method "host.restartAgent" -Params $params
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
