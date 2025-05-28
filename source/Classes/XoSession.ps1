$Script:XoSessions = [XoSessionList]::new()
class XoSession
{
    [string]$Id = ([Guid]::NewGuid()).Guid
    [string]$Uri
    [Microsoft.PowerShell.Commands.WebRequestSession]$Session

    XoSession()
    {
        $this.Init(@{})
    }
    XoSession([hashtable]$Properties)
    {
        Update-TypeData -TypeName "XoSession" -DefaultDisplayPropertySet @("Id", "Session") -Force
        $this.Init($Properties)
    }
    [void] Init([object]$Properties)
    {
        foreach ($Property in $Properties.Keys)
        {
            $this.$Property = $Properties.$Property
        }
    }
}

class XoSessionList
{
    [System.Collections.Generic.List[XoSession]]$Sessions

    XoSessionList()
    {
        $this.Sessions = New-Object 'System.Collections.Generic.List[XoSession]'
    }

    [void]AddSession([XoSession]$Session)
    {
        $this.Sessions.Add($Session)
    }

    [XoSession]GetSession([string]$Id)
    {
        return $this.Sessions | Where-Object { $_.Id -eq $Id } | Select-Object -First 1
    }

    [void]RemoveSession([string]$Id)
    {
        $sessionToRemove = $this.GetSession($Id)
        if ($sessionToRemove)
        {
            $this.Sessions.Remove($sessionToRemove)
        }
    }

    ListSessions()
    {
        $this.Sessions
    }

    [void] Clear()
    {
        $this.Sessions.Clear()
    }

}
