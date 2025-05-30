function Update-XoRemote
{
    <#
    .SYNOPSIS
    Create a new remote

    .DESCRIPTION
    Create a new remote

    .PARAMETER Session
    XoSession object

    .PARAMETER Id
    Target Remote Id

    .PARAMETER Name
    New remote name

    .PARAMETER Url
    target remote url

    .PARAMETER Proxy
    Proxy settings

    .PARAMETER Options
    Extra options settings

    .PARAMETER Enabled
    Enable remote

    .EXAMPLE
    $sess = New-XoSession -Uri "https://xo.example.com" -Token "Caywizq1kyz7G2mg25Tc2rk_KxgIb063DnM4ScqdMVE"
    Update-XoRemote -Session $Session -Name "test" -Url "nfs://10.0.0.99:/mnt/MyShares/test"
    #>
    [CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = 'High')]
    [OutputType([XoRemote])]
    param (
        [Parameter(Mandatory = $true)]
        [XoSession]
        $Session,

        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string]
        $Id,

        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [string]
        $Name,

        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [string]
        $Url,

        [Parameter()]
        [string]
        $Proxy,

        [Parameter()]
        [string]
        $Options,

        [Parameter()]
        [bool]
        $Enabled
    )

    begin
    {

    }

    process
    {
        if ($PSCmdlet.ShouldProcess($Id, "Update Remote"))
        {
            $params = @{
                id = $Id
            }
            if ($PSBoundParameters.ContainsKey("Name"))
            {
                $params["name"] = $Name
            }
            if ($PSBoundParameters.ContainsKey("Url"))
            {
                $params["url"] = $Url
            }
            if ($PSBoundParameters.ContainsKey("Options"))
            {
                $params["options"] = $Options
            }
            if ($PSBoundParameters.ContainsKey("Proxy"))
            {
                $params["proxy"] = $Proxy
            }
            if ($PSBoundParameters.ContainsKey("Enabled"))
            {
                $params["enabled"] = $Enabled
            }

            try
            {
                $body = New-JsonRpcRequest -Method "remote.set" -Params $params
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
                    $remote = Get-XoRemote -Session $Session -Id $Id -ErrorAction Stop
                }
                catch
                {
                    throw $_.Exception.Message
                }
            }
            if ($remote)
            {
                return $remote
            }
        }
    }
    end
    {

    }
}
