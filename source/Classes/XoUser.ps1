class XoUser
{
    [string]$Id
    [string]$Email
    [object[]]$Groups
    [string]$Href
    [string]$Permission
    [string]$Preferences
    [string]$PwHash

    XoUser()
    {
        $this.Init(@{})
    }
    XoUser([hashtable]$Properties)
    {
        Update-TypeData -TypeName "XoUser" -DefaultDisplayPropertySet @("Id", "Email", "Groups", "Permission") -Force
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
