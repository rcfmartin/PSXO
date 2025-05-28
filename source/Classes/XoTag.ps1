class XoTag
{
    [string]$Tag
    [string]$Color
    XoTag()
    {
        $this.Init(@{})
    }
    XoTag([hashtable]$Properties)
    {
        # Update-TypeData -TypeName "XoTag" -DefaultDisplayPropertySet @("Id", "Color") -Force
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
