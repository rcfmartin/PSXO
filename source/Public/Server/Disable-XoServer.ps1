function Disable-XoServer
{
    <#
    .SYNOPSIS
    Disable Server

    .DESCRIPTION
    Disable Server

    .PARAMETER Session
    XoSession

    .PARAMETER Id
    Target Server Id

    .EXAMPLE
    $sess = New-XoSession -Uri "https://xo.example.com" -Token "Caywizq1kyz7G2mg25Tc2rk_KxgIb063DnM4ScqdMVE"
    Disable-XoServer -Session $sess -Id "a933cb47-fbf7-42a5-af39-abac9fc3feca"

    .NOTES
    General notes
    #>
    [CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = "High")]
    [OutputType([XoRemote])]
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
        if ($PSCmdlet.ShouldProcess($Id, "Disable Server"))
        {


            $params = @{
                id = $Id
            }

            try
            {
                $body = New-JsonRpcRequest -Method "server.disable" -Params $params
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
                    $remote = Get-XoServer -Session $Session -Id $Id -ErrorAction Stop
                }
                catch
                {
                    throw $_.Exception.Message
                }
            }
        }

    }

    end
    {
        if ($remote)
        {
            return $remote
        }
    }
}
