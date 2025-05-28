class XoServer
{
    [bool]$AllowUnauthorized
    [string]$Server
    [string]$Label
    [string]$Username
    [string]$PoolNameLabel
    [bool]$Enabled
    [bool]$ReadOnly
    [string]$Id
    [string]$Status
    [string]$PoolId

    XoServer()
    {
        $this.Init(@{})
    }
    XoServer([hashtable]$Properties)
    {
        Update-TypeData -TypeName "XoServer" -DefaultDisplayPropertySet @("Id", "Server", "Label", "Enabled", "Status") -Force
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
