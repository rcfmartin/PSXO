class XoRole
{
    [string]$Id
    [string]$Name
    [string[]]$Permissions

    XoRole()
    {
        $this.Init(@{})
    }
    XoRole([hashtable]$Properties)
    {
        Update-TypeData -TypeName "XoRole" -DefaultDisplayPropertySet @("Id", "Name", "Permissions") -Force
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
