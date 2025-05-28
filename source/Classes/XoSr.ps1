class XoSr
{
    [string]$AllocationStrategy
    [string]$Container
    [string]$ContentType
    [object[]]$CurrentOperations
    [string]$Id
    [string]$InMaintenanceMode
    [string]$NameDescription
    [string]$NameLabel
    [object[]]$OtherConfig
    [object[]]$PBDs
    [long]$PhysicalUsage
    [string]$Pool
    [string]$PoolId
    [string]$Shared
    [long]$Size
    [object[]]$SmConfig
    [string]$SRType
    [object[]]$Tags
    [string]$Type
    [string]$Usage
    [string]$Uuid
    [object[]]$VDIs
    [string]$XapiRef

    XoSr()
    {
        $this.Init(@{})
    }
    XoSr([hashtable]$Properties)
    {
        Update-TypeData -TypeName "XoSr" -DefaultDisplayPropertySet @("Id", "NameLabel", "Size", "PhysicalUsage", "Usage", "InMaintenanceMode") -Force
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
