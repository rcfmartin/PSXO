function Update-XoServer
{
    <#
    .SYNOPSIS
    Update Server

    .DESCRIPTION
    Update Server

    .PARAMETER Session
    XoSession

    .PARAMETER Id
    Target server Id

    .PARAMETER Server
    Target server IP address

    .PARAMETER Credential
    PSCredential to connect to the server

    .PARAMETER LabelName
    Label name for the server

    .PARAMETER AutoConnect
    Auto connect

    .PARAMETER HttpProxy
    Proxy address

    .PARAMETER AllowUnauthorizedCerts
    Allow unauthorized certificates

    .EXAMPLE
    $sess = New-XoSession -Uri "https://xo.example.com" -Token "Caywizq1kyz7G2mg25Tc2rk_KxgIb063DnM4ScqdMVE"
    Update-XoServer -Session $sess -Id "19ee9e08-75a3-4aa0-a21b-208e6d779a92" -LabelName "Xen03"

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
        [string]
        $Id,

        [Parameter()]
        [string]
        $Server,

        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [pscredential]
        $Credential,

        [Parameter()]
        [string]
        $LabelName,

        [Parameter()]
        [bool]
        $AutoConnect,

        [Parameter()]
        [string]
        $HttpProxy,

        [Parameter()]
        [bool]
        $AllowUnauthorizedCerts
    )

    begin
    {

    }

    process
    {
        if ($PSCmdlet.ShouldProcess($Server, "Add server"))
        {


            $params = @{
                id = $Id
            }
            if ($PSBoundParameters.ContainsKey("Credential"))
            {
                $params["username"] = $Credential.UserName
                $params["password"] = $Credential.GetNetworkCredential().Password
            }

            if ($PSBoundParameters.ContainsKey("Server"))
            {
                $params["host"] = $Server
            }
            if ($PSBoundParameters.ContainsKey("LabelName"))
            {
                $params["label"] = $LabelName
            }

            if ($PSBoundParameters.ContainsKey("AutoConnect"))
            {
                $params["autoConnect"] = $AutoConnect
            }
            if ($PSBoundParameters.ContainsKey("HttpProxy"))
            {
                $params["httpProxy"] = $HttpProxy
            }
            if ($PSBoundParameters.ContainsKey("AllowUnauthorizedCerts"))
            {
                $params["allowUnauthorized"] = $AllowUnauthorizedCerts
            }
            try
            {
                $body = New-JsonRpcRequest -Method "server.set" -Params $params
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
