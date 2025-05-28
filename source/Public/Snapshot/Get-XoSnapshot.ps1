function Get-XoSnapshot
{
    <#
    .SYNOPSIS
    Get Tasks

    .DESCRIPTION
    Get list of tasks

    .PARAMETER Session
    XoSession object

    .PARAMETER SnapshotId
    Target snapshot Id

    .PARAMETER Name
    Target snapshot name

    .EXAMPLE
    $sess = New-XoSession -Uri "https://xoa.example.com" -Token "Caywizq1kyz7G2mg25Tc2rk_KxgIb063DnM4ScqdMVE"
    Get-XoSnapshot -Session $sess

    .EXAMPLE
    $sess = New-XoSession -Uri "https://xoa.example.com" -Token "Caywizq1kyz7G2mg25Tc2rk_KxgIb063DnM4ScqdMVE"
    Get-XoSnapshot -Session $sess -Name "My Backup"

    #>
    [CmdletBinding()]
    [OutputType([XoSnapshot])]
    param (
        [Parameter(Mandatory = $true)]
        [XoSession]
        $Session,

        [Parameter(ValueFromPipelineByPropertyName = $true)]
        [ValidateNotNullOrEmpty()]
        [Alias("Uuid")]
        [string]
        $SnapshotId,

        [Parameter()]
        [string]
        $Name
    )

    begin
    {
        $params = @{
            Session = $Session
            Type    = "VM-Snapshot"
        }

    }

    process
    {
        if ($PSBoundParameters.ContainsKey("Id"))
        {
            $params["Id"] = $SnapshotId
        }
        if ($PSBoundParameters.ContainsKey("Name"))
        {
            $params["Name"] = $Name
        }

        try
        {
            $result = Get-XoVirtualMachine @params | Where-Object { $_.Type -ieq "VM-snapshot" }
        }
        catch
        {
            throw $_
        }



        foreach ($snap in $result)
        {
            [XoSnapshot]::new(@{
                    Id                  = $snap.Id
                    NameLabel           = $snap.NameLabel
                    Container           = $snap.Container
                    Pool                = $snap.Pool
                    PoolId              = $snap.PoolId
                    SnapshotOf          = $snap.SnapshotOf
                    VBDs                = $snap.VBDs
                    XapiRef             = $snap.XapiRef
                    Addresses           = $snap.Addresses
                    AutoPoweron         = $snap.AutoPoweron
                    BiosStrings         = $snap.BiosStrings
                    BlockedOperations   = $snap.BlockedOperations
                    Boot                = $snap.Boot
                    CPUs                = $snap.CPUs
                    CurrentOperations   = $snap.CurrentOperations
                    ExpNestedHvm        = $snap.ExpNestedHvm
                    HasVendorDevice     = $snap.HasVendorDevice
                    HighAvailability    = $snap.HighAvailability
                    Href                = $snap.Href
                    InstallTime         = $snap.InstallTime
                    IsFirmwareSupported = $snap.IsFirmwareSupported
                    IsNestedVirtEnabled = $snap.IsNestedVirtEnabled
                    MainIpAddress       = $snap.MainIpAddress
                    Memory              = $snap.Memory
                    NameDescription     = $snap.NameDescription
                    NeedsVtpm           = $snap.NeedsVtpm
                    OsVersion           = $snap.OsVersion
                    Other               = $snap.Other
                    PowerState          = $snap.PowerState
                    SecureBoot          = $snap.SecureBoot
                    SnapshotTime        = [System.DateTimeOffset]::FromUnixTimeSeconds($snap.SnapshotTime).ToLocalTime()
                    Snapshots           = $snap.Snapshots
                    StartDelay          = $snap.StartDelay
                    StartTime           = $snap.StartTime
                    Tags                = $snap.Tags
                    Type                = $snap.Type
                    Uuid                = $snap.Uuid
                    Vga                 = $snap.Vga
                    VGPUs               = $snap.VGPUs
                    Videoram            = $snap.Videoram
                    VIFs                = $snap.VIFs
                    Viridian            = $snap.Viridian
                    VirtualizationMode  = $snap.VirtualizationMode
                    VTPMs               = $snap.VTPMs
                    XenStoreData        = $snap.XenStoreData
                })

        }

    }

    end
    {

    }
}
