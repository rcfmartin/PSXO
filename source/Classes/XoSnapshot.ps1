class XoSnapshot
{
    [string]$Id
    [string]$NameLabel
    [string]$Container
    [string]$Pool
    [string]$PoolId
    [string]$SnapshotOf
    [string[]]$VBDs
    [string]$XapiRef
    [object[]]$Addresses
    [bool]$AutoPoweron
    [object[]]$BiosStrings
    [object[]]$BlockedOperations
    [object[]]$Boot
    [object[]]$CPUs
    [object[]]$CurrentOperations
    [bool]$ExpNestedHvm
    [bool]$HasVendorDevice
    [object[]]$HighAvailability
    [string]$Href
    [System.DateTimeOffset]$InstallTime
    [bool]$IsFirmwareSupported
    [bool]$IsNestedVirtEnabled
    [string]$MainIpAddress
    [object[]]$Memory
    [string]$NameDescription
    [bool]$NeedsVtpm
    [object[]]$OsVersion
    [object[]]$Other
    [string]$PowerState
    [bool]$SecureBoot
    [System.DateTimeOffset]$SnapshotTime
    [object[]]$Snapshots
    [int]$StartDelay
    [System.DateTimeOffset]$StartTime
    [object[]]$Tags
    [string]$Type
    [string]$Uuid
    [string]$Vga
    [object[]]$VGPUs
    [int]$Videoram
    [object[]]$VIFs
    [bool]$Viridian
    [string]$VirtualizationMode
    [object[]]$VTPMs
    [object[]]$XenStoreData

    XoSnapshot()
    {
        $this.Init(@{})
    }
    XoSnapshot([hashtable]$Properties)
    {
        Update-TypeData -TypeName "XoSnapshot" -DefaultDisplayPropertySet @("Id", "NameLabel", "NameDescription") -Force
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
