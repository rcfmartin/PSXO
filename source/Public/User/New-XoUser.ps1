function New-XoUser
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
    New-XoUser -Session $sess -Email "admin@admin.com" -Password $(ConvertTo-SecureString -String "MySecurePassword" -Force -AsPlainText)

    .EXAMPLE
    $sess = New-XoSession -Uri "https://xoa.example.com" -Token "Caywizq1kyz7G2mg25Tc2rk_KxgIb063DnM4ScqdMVE"
    New-XoUser -Session $sess -Email "admin@admin.com" -IsAdmin -Password $(ConvertTo-SecureString -String "MySecurePassword" -Force -AsPlainText)
    #>
    [CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = 'High')]
    [OutputType([XoUser])]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
        [XoSession]$Session,

        [Parameter(Mandatory = $true)]
        [ValidatePattern('^[^@\s]+@[^@\s]+\.[^@\s]+$')]
        [string]
        $Email,

        [Parameter(Mandatory = $true)]
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
        if ($PSCmdlet.ShouldProcess($Email, "Create new user"))
        {

            $params = @{
                email    = $Email
                password = $(ConvertFrom-SecureString -SecureString $Password -AsPlainText)
            }
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
            if ($PSBoundParameters.ContainsKey("IsAdmin"))
            {
                $params["permission"] = "admin"
            }
            try
            {
                $body = New-JsonRpcRequest -Method "user.create" -Params $params
                $resp = Send-WebSocketJsonRpc -Session $Session -Body $body -ErrorAction Stop
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
                $newUser = Get-XoUser -Session $Session -Id "$($resp.result)"
            }
            catch
            {
                throw $_.Exception.Message
            }
            if (-not $newUser.Id)
            {
                throw "Failed to create the new user"
            }
            return $newUser
        }
    }

    end
    {

    }
}
