class XoRemote
{
    [string]$Id
    [string]$Name
    [string]$Url
    [bool]$Enabled
    [object[]]$Benchmarks

    XoRemote()
    {
        $this.Init(@{})
    }
    XoRemote([hashtable]$Properties)
    {
        Update-TypeData -TypeName "XoRemote" -DefaultDisplayPropertySet @("Id", "Name", "Url", "Enabled") -Force
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
