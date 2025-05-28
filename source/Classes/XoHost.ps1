class XoHost
{
    [string]$Id
    [string]$NameLabel
    [string]$Address
    [System.DateTimeOffset]$AgentStartTime
    [object[]]$BiosStrings
    [string]$Build
    [object[]]$Certificates
    [object[]]$ChipsetInfo
    [string]$ControlDomain
    [object[]]$Cpus
    [object[]]$CurrentOperations
    [bool]$Enabled
    [string]$Hostname
    [bool]$HvmCapable
    [string]$IscsiIqn
    [object[]]$LicenseExpiry
    [object[]]$LicenseParams
    [object[]]$LicenseServer
    [object[]]$Logging
    [object[]]$Memory
    [bool]$Multipathing
    [string]$NameDescription
    [object[]]$OtherConfig
    [object[]]$Patches
    [object[]]$PBDs
    [object[]]$PCIs
    [object[]]$PGPUs
    [object[]]$PIFs
    [string]$Pool
    [string]$PoolId
    [object[]]$PowerOnMode
    [string]$PowerState
    [string]$ProductBrand
    [bool]$RebootRequired
    [object[]]$ResidentVms
    [System.DateTimeOffset]$StartTime
    [object[]]$SupplementalPacks
    [object[]]$Tags
    [string]$Type
    [string]$Uuid
    [string]$Version
    [string]$XapiRef
    [bool]$ZstdSupported
    XoHost()
    {
        $this.Init(@{})
    }
    XoHost([hashtable]$Properties)
    {
        Update-TypeData -TypeName XoHost -DefaultDisplayPropertySet @("Id", "NameLabel", "PowerState", "StartTime") -Force
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
