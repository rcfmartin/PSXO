class XoPatch
{
    [string]$Url
    [string]$Version
    [string]$Name
    [string]$License
    [object[]]$Changelog
    [string]$Release
    [string]$Size
    [string]$Description

    XoPatch()
    {
        $this.Init(@{})
    }
    XoPatch([hashtable]$Properties)
    {
        Update-TypeData -TypeName "XoPatch" -DefaultDisplayPropertySet @("Name", "Version", "Release", "Description", "Url") -Force
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
