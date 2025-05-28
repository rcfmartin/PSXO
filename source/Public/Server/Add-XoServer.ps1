function Add-XoServer
{
    <#
    .SYNOPSIS
    Add Server

    .DESCRIPTION
    Add Server

    .PARAMETER Session
    XoSession

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
    $secure = ConvertTo-SecureString -String "password" -AsPlainText -Force
    $Creds = [pscredential]::new("username",$secure)
    Add-XoServer -Session $sess -Server 10.0.1.10 -Credential $Creds -LabelName "Xen01" -AllowUnauthorizedCerts:$true

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
        $Server,

        [Parameter(Mandatory = $true)]
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
                host     = "$($Server)"
                username = $Credential.UserName
                password = $Credential.GetNetworkCredential().Password
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
                $body = New-JsonRpcRequest -Method "server.add" -Params $params
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
                    $remote = Get-XoServer -Session $Session -Server $Server -ErrorAction Stop
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
