function Update-XoUser
{
    <#
    .SYNOPSIS
    Create new users

    .DESCRIPTION
    Create new Users

    .PARAMETER Session
    XoSession object

    .PARAMETER Id
    Target user Id

    .PARAMETER Email
    Target user's email address

    .PARAMETER Password
    New user's password

    .PARAMETER IsAdmin
    Switch parameter

    .EXAMPLE
    $sess = New-XoSession -Uri "https://xoa.example.com" -Token "Caywizq1kyz7G2mg25Tc2rk_KxgIb063DnM4ScqdMVE"
    Update-XoUser -Session $sess -Email "admin@admin.com" -Password $(ConvertTo-SecureString -String "MySecurePassword" -Force -AsPlainText)

    .EXAMPLE
    $sess = New-XoSession -Uri "https://xoa.example.com" -Token "Caywizq1kyz7G2mg25Tc2rk_KxgIb063DnM4ScqdMVE"
    Update-XoUser -Session $sess -Email "admin@admin.com" -IsAdmin -Password $(ConvertTo-SecureString -String "MySecurePassword" -Force -AsPlainText)
    #>
    [CmdletBinding()]
    [OutputType([XoUser])]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
        [XoSession]$Session,

        [Parameter(ValueFromPipelineByPropertyName = $true, Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [Alias("Uuid")]
        [string]$Id,

        [Parameter()]
        [ValidatePattern('^[^@\s]+@[^@\s]+\.[^@\s]+$')]
        [string]
        $Email,

        [Parameter()]
        [securestring]
        $Password,

        [Parameter()]
        [switch]
        $IsAdmin
    )

    begin
    {

    }

    process
    {
        $params = @{
            id = $Id
        }

        if ($PSBoundParameters.ContainsKey("Email"))
        {
            try
            {
                $user = Get-XoUser -Session $Session -Email "$($Email)"
            }
            catch
            {
                throw $_.Exception.Message
            }
            if ($user.Id)
            {
                throw "Email address already in use"
            }
            $params["email"] = $Email
        }
        if ($PSBoundParameters.ContainsKey("Password"))
        {
            $params["password"] = "$(ConvertFrom-SecureString -SecureString $Password -AsPlainText)"
        }
        if ($PSBoundParameters.ContainsKey("IsAdmin"))
        {
            $params["permission"] = "admin"
        }
        try
        {
            $body = New-JsonRpcRequest -Method "user.set" -Params $params
            $null = Send-WebSocketJsonRpc -Session $Session -Body $body -ErrorAction Stop
        }
        catch
        {
            throw $_.Exception.Message
        }


        if ($resp.Error)
        {
            throw $resp
        }

        try
        {
            $User = Get-XoUser -Session $Session -Id "$($Id)"
        }
        catch
        {
            throw $_.Exception.Message
        }
    }

    end
    {
        return $User
    }
}
