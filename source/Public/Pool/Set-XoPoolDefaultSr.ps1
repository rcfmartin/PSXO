function Set-XoPoolDefaultSr
{
    <#
    .SYNOPSIS
    Set default SR for the pool

    .DESCRIPTION
    Set default SR for the pool

    .PARAMETER Session
    XoSession object

    .PARAMETER SrId
    Target SR ID

    .EXAMPLE
    $sess = New-XoSession -Uri "https://xo.example.com" -Token "Caywizq1kyz7G2mg25Tc2rk_KxgIb063DnM4ScqdMVE"
    Set-XoPoolDefaultSr -Session $sess -SrId "9ace51e1-dfbd-4617-8db3-88f28974e111"
    #>
    [CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = 'high')]
    [OutputType([void])]
    param (
        [Parameter(Mandatory = $true)]
        [XoSession]
        $Session,

        [Parameter(ValueFromPipelineByPropertyName = $true, Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [Alias("Uuid")]
        [string]
        $SrId
    )

    begin
    {



    }

    process
    {
        if ($PSCmdlet.ShouldProcess($SrId, "Set default SR"))
        {
            $params = @{
                sr = $SrId
            }

            try
            {
                $body = New-JsonRpcRequest -Method "pool.setDefaultSr" -Params $params
                $resp = Send-WebSocketJsonRpc -Session $Session -Body $body -ErrorAction Stop

            }
            catch
            {
                throw $_.Exception.Message
            }

            if (-not $resp.result)
            {
                throw $resp
            }
        }

    }

    end
    {

    }
}
