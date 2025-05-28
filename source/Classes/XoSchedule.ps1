class XoSchedule
{
    [string]$Id
    [string]$Cron
    [bool]$Enabled
    [string]$JobId
    [string]$Name
    [string]$TimeZone


    XoSchedule()
    {
        $this.Init(@{})
    }
    XoSchedule([hashtable]$Properties)
    {
        Update-TypeData -TypeName "XoSchedule" -DefaultDisplayPropertySet @("Id", "Name", "Cron", "Enabled") -Force
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
