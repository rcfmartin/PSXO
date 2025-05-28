function New-XoSession
{
    <#
    .SYNOPSIS
    Creates a new session

    .DESCRIPTION
    This cmdlet was originally designed to authenticate to the REST api endpoints.
    Since all cmdlets have been moved to JSON-RPC, this cmd is just serving as a way to pass the token around via "session"

    .PARAMETER Uri
    Target xen orchestra uri

    .PARAMETER Token
    Api Token

    .EXAMPLE
    New-XoSession -Uri "https://xo.example.com" -Token "DPjwthwfJLTJj1UPmAojAQIlQHtsMzNabkTOTZz5uzU"
    #>
    [CmdletBinding()]
    [OutputType([XoSession])]
    param (
        [Parameter(Mandatory = $true)]
        [string]$Uri,

        [Parameter(Mandatory = $true)]
        [string]$Token

    )

    begin
    {

    }

    process
    {
        $cookie = [System.Net.Cookie]::new('authenticationToken', "$($Token)")

        $newSession = [Microsoft.PowerShell.Commands.WebRequestSession]::new()


        $newSession.Cookies.Add("$($Uri -replace '\/$','')", $cookie)

        $xoSession = [XoSession]::new(@{
                Uri     = "$($Uri -replace '\/$', '')"
                Session = $newSession
            })

        try
        {
            $null = Test-XoSession -Session $xoSession -ErrorAction Stop
        }
        catch
        {
            throw $_.Exception.Message
        }

        $Script:XoSessions.AddSession($xoSession)
    }

    end
    {
        return $Script:XoSessions.GetSession($xoSession.Id)
    }
}
