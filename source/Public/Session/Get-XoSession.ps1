function Get-XoSession
{
    <#
    .SYNOPSIS
    Get open web sessions

    .DESCRIPTION
    Get open web sessions

    .PARAMETER Session
    XoSession object returned from New-XoSession

    .PARAMETER Id
    Target Session Id

    .EXAMPLE
    Get-XoSession

    .EXAMPLE
    $session = New-XoSession -Uri "https://xo.example.com" -Token "MyToken"
    Get-XoSession -Session $session

    .EXAMPLE
    $session = New-XoSession -Uri "https://xo.example.com" -Token "MyToken"
    Get-XoSession -Id $session.Id
    #>
    [CmdletBinding()]
    param (
        [Parameter()]
        [XoSession]
        $Session,
        [Parameter()]
        [string]
        $Id
    )

    begin
    {

    }

    process
    {
        if ($PSBoundParameters.ContainsKey("Session"))
        {
            return $Script:XoSessions.GetSession($Session.Id)
        }
        if ($PSBoundParameters.ContainsKey("Id"))
        {
            return $Script:XoSessions.GetSession($Id)
        }
        return $Script:XoSessions.Sessions

    }

    end
    {

    }
}
