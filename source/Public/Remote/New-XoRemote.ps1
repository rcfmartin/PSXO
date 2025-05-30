function New-XoRemote
{
    <#
    .SYNOPSIS
    Create a new remote

    .DESCRIPTION
    Create a new remote

    .PARAMETER Session
    XoSession object

    .PARAMETER Name
    New remote name

    .PARAMETER Url
    target remote url

    .PARAMETER Proxy
    Proxy settings

    .PARAMETER Options
    Extra options settings

    .EXAMPLE
    $sess = New-XoSession -Uri "https://xo.example.com" -Token "Caywizq1kyz7G2mg25Tc2rk_KxgIb063DnM4ScqdMVE"
    New-XoRemote -Session $Session -Name "test" -Url "nfs://10.0.0.99:/mnt/MyShares/test"
    #>
    [CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = "Medium")]
    [OutputType([XoRemote])]
    param (
        [Parameter(Mandatory = $true)]
        [XoSession]
        $Session,

        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string]
        $Name,

        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string]
        $Url,

        [Parameter()]
        [string]
        $Proxy,

        [Parameter()]
        [string]
        $Options
    )

    begin
    {

    }

    process
    {
        if ($PSCmdlet.ShouldProcess($Name, "Create Remote"))
        {
            $params = @{
                name = $Name
                url  = $Url
            }

            if ($PSBoundParameters.ContainsKey("Proxy"))
            {
                $params["proxy"] = $Proxy
            }

            try
            {
                $body = New-JsonRpcRequest -Method "remote.create" -Params $params
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
                    $remote = Get-XoRemote -Session $Session -Id $resp.result.id -ErrorAction Stop
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
