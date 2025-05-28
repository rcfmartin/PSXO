class XoGroup
{
    [string]$Id
    [string]$Name
    [string[]]$Users

    XoGroup()
    {
        $this.Init(@{})
    }
    XoGroup([hashtable]$Properties)
    {
        Update-TypeData -TypeName "XoGroup" -DefaultDisplayPropertySet @("Id", "Name", "Users") -Force
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
