function Enable-XoServer
{
    <#
    .SYNOPSIS
    Enable Server

    .DESCRIPTION
    Enable Server

    .PARAMETER Session
    XoSession

    .PARAMETER Id
    Target Server Id

    .EXAMPLE
    $sess = New-XoSession -Uri "https://xo.example.com" -Token "Caywizq1kyz7G2mg25Tc2rk_KxgIb063DnM4ScqdMVE"
    Enable-XoServer -Session $sess -Id "a933cb47-fbf7-42a5-af39-abac9fc3feca"

    .NOTES
    General notes
    #>
    [CmdletBinding()]
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

        $params = @{
            id = $Id
        }

        try
        {
            $body = New-JsonRpcRequest -Method "server.enable" -Params $params
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

    end
    {
        if ($remote)
        {
            return $remote
        }
    }
}
