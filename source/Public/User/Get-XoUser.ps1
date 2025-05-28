function Get-XoUser
{
    <#
    .SYNOPSIS
    Get users

    .DESCRIPTION
    Get Users

    .PARAMETER Session
    XoSession object

    .PARAMETER Id
    Target user Id

    .PARAMETER Email
    Target user's email address

    .EXAMPLE
    $sess = New-XoSession -Uri "https://xoa.example.com" -Token "Caywizq1kyz7G2mg25Tc2rk_KxgIb063DnM4ScqdMVE"
    Get-XoUser -Session $sess

    .EXAMPLE
    $sess = New-XoSession -Uri "https://xoa.example.com" -Token "Caywizq1kyz7G2mg25Tc2rk_KxgIb063DnM4ScqdMVE"
    Get-XoUser -Session $sess -Email admin@admin.com

    .NOTES
    General notes
    #>
    [CmdletBinding()]
    [OutputType([XoUser])]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
        [XoSession]$Session,

        [Parameter(ValueFromPipelineByPropertyName = $true)]
        [ValidateNotNullOrEmpty()]
        [Alias("Uuid")]
        [string]$Id,

        [Parameter()]
        [ValidatePattern('^[^@\s]+@[^@\s]+\.[^@\s]+$')]
        [string]
        $Email
    )

    begin
    {
        $result = $null
        $params = @{

        }
    }

    process
    {

        try
        {
            $body = New-JsonRpcRequest -Method "user.getAll" -Params $params
            $resp = Send-WebSocketJsonRpc -Session $Session -Body $body -ErrorAction Stop
        }
        catch
        {
            throw $_.Exception.Message
        }


        if (!$resp.Error)
        {
            $result = foreach ($output in $resp.result)
            {
                [XoUser]::new(@{
                        Email       = [pscustomobject]$output.email
                        Groups      = [pscustomobject]$output.groups
                        Href        = [pscustomobject]$output.href
                        Id          = [pscustomobject]$output.id
                        Permission  = [pscustomobject]$output.permission
                        Preferences = [pscustomobject]$output.preferences
                        PwHash      = [pscustomobject]$output.pw_hash
                    })
            }
        }
    }

    end
    {
        if ($PSBoundParameters.ContainsKey("Id"))
        {
            return $result | Where-Object -Property Id -ieq $Id
        }
        if ($PSBoundParameters.ContainsKey("Email"))
        {
            return $result | Where-Object -Property Email -ieq $Email
        }

        return $result
    }
}
