function Test-XoRemote
{
    <#
    .SYNOPSIS
    Test Remote

    .DESCRIPTION
    Test Remote

    .PARAMETER Session
    XoSession object

    .PARAMETER Id
    Target Remote Id

    .EXAMPLE
    $sess = New-XoSession -Uri "https://xo.example.com" -Token "Caywizq1kyz7G2mg25Tc2rk_KxgIb063DnM4ScqdMVE"
    Test-XoRemote -Session $sess -Id "85eccfa2-5657-4709-9feb-391aaab5c6dd"
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
            $body = New-JsonRpcRequest -Method "remote.test" -Params $params
            $resp = Send-WebSocketJsonRpc -Session $Session -Body $body -ErrorAction Stop
        }
        catch
        {
            throw $_.Exception.Message
        }

        if ($null -ne $resp)
        {
            if (-not ($resp.result.success))
            {
                throw $resp
            }

            return $resp.result
        }

    }

    end
    {
        # return $result
    }
}
