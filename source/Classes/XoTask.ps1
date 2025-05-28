class XoTask
{
    [string]$Id
    [object[]]$Properties
    [object[]]$Result
    [long]$Start
    [string]$Status
    [long]$UpdatedAt
    [long]$End
    [string]$Href

    XoTask()
    {
        $this.Init(@{})
    }
    XoTask([hashtable]$Properties)
    {
        Update-TypeData -TypeName "XoTask" -DefaultDisplayPropertySet @("Id", "Status", "Result") -Force
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
