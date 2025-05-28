function Get-XoVirtualMachine
{
    <#
    .SYNOPSIS
    Get all virtual machines

    .DESCRIPTION
    Get all virtual machines

    .PARAMETER Session
    XoSession object

    .PARAMETER Id
    Target Virtual machine ID

    .PARAMETER Name
    Target Virtual machine name

    .PARAMETER Type
    Type of virtual machine to get

    .EXAMPLE
    $sess = New-XoSession -Uri "https://xo.example.com" -Token "Caywizq1kyz7G2mg25Tc2rk_KxgIb063DnM4ScqdMVE"
    Get-XoVirtualMachine -Session $sess

    .EXAMPLE
    $sess = New-XoSession -Uri "https://xo.example.com" -Token "Caywizq1kyz7G2mg25Tc2rk_KxgIb063DnM4ScqdMVE"
    Get-XoVirtualMachine -Session $sess -Name "MyVM"

    .EXAMPLE
    $sess = New-XoSession -Uri "https://xo.example.com" -Token "Caywizq1kyz7G2mg25Tc2rk_KxgIb063DnM4ScqdMVE"
    Get-XoVirtualMachine -Session $sess -Id "9ace51e1-dfbd-4617-8db3-88f28974e111"
    #>
    [CmdletBinding()]
    [OutputType([XoVirtualMachine])]
    param (
        [Parameter(Mandatory = $true)]
        [XoSession]
        $Session,

        [Parameter(ValueFromPipelineByPropertyName = $true)]
        [ValidateNotNullOrEmpty()]
        [Alias("Uuid")]
        [string]
        $Id,

        [Parameter()]
        [string]
        $Name,

        [Parameter()]
        [ArgumentCompletions("VM", "VM-template", "VM-snapshot")]
        [string]
        $Type = "VM"
    )

    begin
    {
        $result = $null
        $filter = "type:$($Type)"

    }

    process
    {

        if ($PSBoundParameters.ContainsKey("Id"))
        {
            $filter = "id:$($Id)"
        }
        if ($PSBoundParameters.ContainsKey("Name"))
        {
            $filter = "name_label:$($Name)"
        }


        try
        {
            $body = New-JsonRpcRequest -Method "xo.getAllObjects" -Params @{filter = $filter }
            $resp = Send-WebSocketJsonRpc -Session $Session -Body $body -ErrorAction Stop
        }
        catch
        {
            throw $_.Exception.Message
        }

        if ($null -ne $resp)
        {
            $items = $resp.result
            $result = foreach ($item in $items.psobject.Properties.Name)
            {
                $output = $items.$item #| Where-Object { $_.type -ieq "vm" }
                if (-not $output -or $($output.type -ine "$($Type)"))
                {
                    continue
                }
                [XoVirtualMachine]::new(@{
                        "Type"                = [pscustomobject]$output.type
                        "Addresses"           = [pscustomobject]$output.addresses
                        "AffinityHost"        = [pscustomobject]$output.affinityHost
                        "AutoPoweron"         = [pscustomobject]$output.auto_poweron
                        "BiosStrings"         = [pscustomobject]$output.bios_strings
                        "BlockedOperations"   = [pscustomobject]$output.blockedOperations
                        "Boot"                = [pscustomobject]$output.boot
                        "CPUs"                = [pscustomobject]$output.CPUs
                        "Creation"            = [pscustomobject]$output.creation
                        "CurrentOperations"   = [pscustomobject]$output.current_operations
                        "ExpNestedHvm"        = [pscustomobject]$output.expNestedHvm
                        "Viridian"            = [pscustomobject]$output.viridian
                        "HighAvailability"    = [pscustomobject]$output.high_availability
                        "IsFirmwareSupported" = [pscustomobject]$output.isFirmwareSupported
                        "Memory"              = [pscustomobject]$output.memory
                        "InstallTime"         = [pscustomobject][System.DateTimeOffset]::FromUnixTimeSeconds($output.installTime).ToLocalTime()
                        "NameDescription"     = [pscustomobject]$output.name_description
                        "NameLabel"           = [pscustomobject]$output.name_label
                        "NeedsVtpm"           = [pscustomobject]$output.needsVtpm
                        "Other"               = [pscustomobject]$output.other
                        "OsVersion"           = [pscustomobject]$output.os_version
                        "PowerState"          = [pscustomobject]$output.power_state
                        "HasVendorDevice"     = [pscustomobject]$output.hasVendorDevice
                        "Snapshots"           = [pscustomobject]$output.snapshots
                        "StartDelay"          = [pscustomobject]$output.startDelay
                        "StartTime"           = [pscustomobject][System.DateTimeOffset]::FromUnixTimeSeconds($output.startTime).ToLocalTime()
                        "SecureBoot"          = [pscustomobject]$output.secureBoot
                        "Tags"                = [pscustomobject]$output.tags
                        "ViFs"                = [pscustomobject]$output.VIFs
                        "VtPMs"               = [pscustomobject]$output.VTPMs
                        "VirtualizationMode"  = [pscustomobject]$output.virtualizationMode
                        "Container"           = [pscustomobject]$output."`$container"
                        "VBDs"                = [pscustomobject]$output."`$VBDs"
                        "VGPUs"               = [pscustomobject]$output.VGPUs
                        "XenStoreData"        = [pscustomobject]$output.xenStoreData
                        "Vga"                 = [pscustomobject]$output.vga
                        "Videoram"            = [pscustomobject]$output.videoram
                        "CoresPerSocket"      = [pscustomobject]$output.coresPerSocket
                        "Id"                  = [pscustomobject]$output.id
                        "Uuid"                = [pscustomobject]$output.uuid
                        "Pool"                = [pscustomobject]$output."`$pool"
                        "PoolId"              = [pscustomobject]$output."`$poolId"
                        "XapiRef"             = [pscustomobject]$output._xapiRef
                        "Href"                = [pscustomobject]$output.href
                    })
            }
        }

    }

    end
    {
        return $result
    }
}
