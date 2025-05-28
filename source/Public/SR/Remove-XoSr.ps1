function Remove-XoSr
{
    <#
    .SYNOPSIS
    Remove SR

    .DESCRIPTION
    Remove SR

    .PARAMETER Session
    XoSession

    .PARAMETER Id
    Target SR Id

    .EXAMPLE
    $sess = New-XoSession -Uri "https://xo.example.com" -Token "Caywizq1kyz7G2mg25Tc2rk_KxgIb063DnM4ScqdMVE"
    Remove-XoSr -Session $sess -Id "a933cb47-fbf7-42a5-af39-abac9fc3feca"
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
        $Id
    )

    begin
    {

    }

    process
    {
        if ($PSCmdlet.ShouldProcess($Id, "Remove SR"))
        {


            $params = @{
                id = $Id
            }

            try
            {
                $body = New-JsonRpcRequest -Method "sr.destroy" -Params $params
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
