class XoAcl
{
    [string]$Id
    [string]$Action
    [string]$Object
    [string]$Subject

    XoAcl()
    {
        $this.Init(@{})
    }
    XoAcl([hashtable]$Properties)
    {
        Update-TypeData -TypeName "XoAcl" -DefaultDisplayPropertySet @("Id", "Action", "Object", "Subject") -Force
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
