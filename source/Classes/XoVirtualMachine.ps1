class XoVirtualMachine
{
    [string]$Id
    [object[]]$Addresses
    [string]$AffinityHost
    [bool]$AutoPoweron
    [object[]]$BiosStrings
    [object[]]$BlockedOperations
    [object[]]$Boot
    [string]$Container
    [long]$CoresPerSocket
    [object[]]$CPUs
    [object[]]$Creation
    [object[]]$CurrentOperations
    [bool]$ExpNestedHvm
    [bool]$HasVendorDevice
    [string]$HighAvailability
    [string]$Href
    [System.DateTimeOffset]$InstallTime
    [bool]$IsFirmwareSupported
    [object[]]$Memory
    [string]$NameDescription
    [string]$NameLabel
    [bool]$NeedsVtpm
    [object[]]$OsVersion
    [object[]]$Other
    [string]$Pool
    [string]$PoolId
    [string]$PowerState
    [bool]$SecureBoot
    [object[]]$Snapshots
    [long]$StartDelay
    [System.DateTimeOffset]$StartTime
    [object[]]$Tags
    [string]$Type
    [string]$Uuid
    [object[]]$VBDs
    [string]$Vga
    [object[]]$VGPUs
    [string]$Videoram
    [object[]]$ViFs
    [bool]$Viridian
    [string]$VirtualizationMode
    [object[]]$VtPMs
    [string]$XapiRef
    [object[]]$XenStoreData
    XoVirtualMachine()
    {
        $this.Init(@{})
    }
    XoVirtualMachine([hashtable]$Properties)
    {
        Update-TypeData -TypeName XoVirtualMachine -DefaultDisplayPropertySet @("Id", "NameLabel", "PowerState", "CPUs", "Memory") -Force
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
