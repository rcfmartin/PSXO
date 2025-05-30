function Update-XoVirtualMachine
{
    <#
.SYNOPSIS
Update virtual machine settings

.DESCRIPTION
Update all virtual machine settings

.PARAMETER Session
XoSession object

.PARAMETER Id
Target VM id

.PARAMETER Tag
Tags to add to the VM

.PARAMETER AutoPoweron
Set VM to auto power on

.PARAMETER NameLabel
VM Name label

.PARAMETER NameDescription
VM Description

.PARAMETER Notes
VM notes. Very useful

.PARAMETER HighAvailability
High Availability

.PARAMETER Cpus
update the total CPUs

.PARAMETER CpusMax
Update the max number of CPUs

.PARAMETER Memory
Update memory

.PARAMETER MemoryMin
Update the min memory

.PARAMETER MemoryMax
Update the max memory

.PARAMETER MemoryStaticMax
Update the max static memory

.PARAMETER PVArgs
Update PV arg

.PARAMETER CpuMask
Update the CPU mask

.PARAMETER CpuWeight
Updte the CPU weight

.PARAMETER CpuCap
Update the CPU cap

.PARAMETER AffinityHost
Update the target Host

.PARAMETER Vga
Updat the VGA settings

.PARAMETER Videoram
Update video ram

.PARAMETER CoresPerSocket
Udpate the number of cores per socker

.PARAMETER HasVendorDevice
Set vendor device

.PARAMETER ExpNestedHvm
Updat exp nested Hvm

.PARAMETER NestedVirt
Update nested virtualization

.PARAMETER ResourceSet
Update resource set

.PARAMETER Share
Update share

.PARAMETER StartDelay
Delay start

.PARAMETER SecureBoot
Update secure boot

.PARAMETER NicType
Update NIC type

.PARAMETER HvmBootFirmware
update Hvm boot firmware

.PARAMETER VirtualizationMode
Update virtualization mode

.PARAMETER Viridian
Update viridian

.PARAMETER BlockedOperations
Update blocked operations

.PARAMETER Creation
Update creation

.PARAMETER SuspendSr
Suspend sr

.PARAMETER UefiMode
Set uefi mode

.PARAMETER XenStoreData
Set Xen Store Data

.EXAMPLE
$sess = New-XoSession -Uri "https://xo.example.com" -Token "Caywizq1kyz7G2mg25Tc2rk_KxgIb063DnM4ScqdMVE"
$vm = Get-XoVirtualMachine -Session $sess | Where-Object {$_.NameLabel -ieq "ansible"}
Update-XoVirtualMachine -Session $sess -Id $vm.Id -NameLabel "RockyLinux" -Memory 1GB

.EXAMPLE
$sess = New-XoSession -Uri "https://xo.example.com" -Token "Caywizq1kyz7G2mg25Tc2rk_KxgIb063DnM4ScqdMVE"
$vm = Get-XoVirtualMachine -Session $sess | Where-Object {$_.NameLabel -ieq "ansible"}
Update-XoVirtualMachine -Session $sess -Id $vm.Id -NameLabel "RockyLinux" -Cpus 2 -Memory 2GB

.NOTES
General notes
#>
    [CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = 'High')]
    [OutputType([XoVirtualMachine])]
    param (
        [Parameter(Mandatory = $true)]
        [XoSession]
        $Session,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
        [ValidateNotNullOrEmpty()]
        [Alias("Uuid")]
        [string]
        $Id,

        [Parameter()]
        [string[]]
        $Tag,

        [Parameter()]
        [bool]
        $AutoPoweron,

        [Parameter()]
        [string]
        $NameLabel,

        [Parameter()]
        [string]
        $NameDescription,

        [Parameter()]
        [string]
        $Notes,

        [Parameter()]
        [string]
        $HighAvailability,

        [Parameter()]
        [long]
        $Cpus,

        [Parameter()]
        [long]
        $CpusMax,

        [Parameter()]
        [long]
        $Memory,

        [Parameter()]
        [long]
        $MemoryMin,

        [Parameter()]
        [long]
        $MemoryMax,

        [Parameter()]
        [long]
        $MemoryStaticMax,

        [Parameter()]
        [string]
        $PVArgs,

        [Parameter()]
        [array]
        $CpuMask,

        [Parameter()]
        [long]
        $CpuWeight,

        [Parameter()]
        [long]
        $CpuCap,

        [Parameter()]
        [string]
        $AffinityHost,

        [Parameter()]
        [string]
        $Vga,

        [Parameter()]
        [long]
        $Videoram,

        [Parameter()]
        [long]
        $CoresPerSocket,

        [Parameter()]
        [bool]
        $HasVendorDevice,

        [Parameter()]
        [bool]
        $ExpNestedHvm,

        [Parameter()]
        [bool]
        $NestedVirt,

        [Parameter()]
        [string]
        $ResourceSet,

        [Parameter()]
        [bool]
        $Share,

        [Parameter()]
        [long]
        $StartDelay,

        [Parameter()]
        [bool]
        $SecureBoot,

        [Parameter()]
        [string]
        $NicType,

        [Parameter()]
        [string]
        $HvmBootFirmware,

        [Parameter()]
        [string]
        $VirtualizationMode,

        [Parameter()]
        [bool]
        $Viridian,

        [Parameter()]
        [object]
        $BlockedOperations,

        [Parameter()]
        [object]
        $Creation,

        [Parameter()]
        [string]
        $SuspendSr,

        [Parameter()]
        [string]
        $UefiMode,

        [Parameter()]
        [object]
        $XenStoreData
    )

    begin
    {


    }

    process
    {
        if ($PSCmdlet.ShouldProcess($Id, "Update VM"))
        {
            [hashtable]$params = @{
                id = $Id
            }
            if ($PSBoundParameters.ContainsKey("AutoPoweron"))
            {
                $params["auto_poweron"] = $AutoPoweron
            }
            if ($PSBoundParameters.ContainsKey("NameLabel"))
            {
                $params["name_label"] = $NameLabel
            }
            if ($PSBoundParameters.ContainsKey("NameDescription"))
            {
                $params["name_description"] = $NameDescription
            }
            if ($PSBoundParameters.ContainsKey("Notes"))
            {
                $params["notes"] = $Notes
            }
            if ($PSBoundParameters.ContainsKey("HighAvailability"))
            {
                $params["high_availability"] = $HighAvailability
            }
            if ($PSBoundParameters.ContainsKey("Cpus"))
            {
                $params["CPUs"] = $Cpus
            }
            if ($PSBoundParameters.ContainsKey("CpusMax"))
            {
                $params["cpusMax"] = $CpusMax
            }
            if ($PSBoundParameters.ContainsKey("Memory"))
            {
                $params["memory"] = $($Memory)
            }
            if ($PSBoundParameters.ContainsKey("MemoryMin"))
            {
                $params["memoryMin"] = $($MemoryMin)
            }
            if ($PSBoundParameters.ContainsKey("MemoryMax"))
            {
                $params["memoryMax"] = $($MemoryMax)
            }
            if ($PSBoundParameters.ContainsKey("MemoryStaticMax"))
            {
                $params["memoryStaticMax"] = $($MemoryStaticMax)
            }
            if ($PSBoundParameters.ContainsKey("PvArgs"))
            {
                $params["PV_args"] = $PvArgs
            }
            if ($PSBoundParameters.ContainsKey("CpuMask"))
            {
                $params["cpuMask"] = $CpuMask
            }
            if ($PSBoundParameters.ContainsKey("CpuWeight"))
            {
                $params["cpuWeight"] = $CpuWeight
            }
            if ($PSBoundParameters.ContainsKey("CpuCap"))
            {
                $params["cpuCap"] = $CpuCap
            }
            if ($PSBoundParameters.ContainsKey("AffinityHost"))
            {
                $params["affinityHost"] = $AffinityHost
            }
            if ($PSBoundParameters.ContainsKey("Vga"))
            {
                $params["vga"] = $Vga
            }
            if ($PSBoundParameters.ContainsKey("Videoram"))
            {
                $params["videoram"] = $Videoram
            }
            if ($PSBoundParameters.ContainsKey("CoresPerSocket"))
            {
                $params["coresPerSocket"] = $CoresPerSocket
            }
            if ($PSBoundParameters.ContainsKey("HasVendorDevice"))
            {
                $params["hasVendorDevice"] = $HasVendorDevice
            }
            if ($PSBoundParameters.ContainsKey("ExpNestedHvm"))
            {
                $params["expNestedHvm"] = $ExpNestedHvm
            }
            if ($PSBoundParameters.ContainsKey("NestedVirt"))
            {
                $params["nestedVirt"] = $NestedVirt
            }
            if ($PSBoundParameters.ContainsKey("ResourceSet"))
            {
                $params["resourceSet"] = $ResourceSet
            }
            if ($PSBoundParameters.ContainsKey("Share"))
            {
                $params["share"] = $Share
            }
            if ($PSBoundParameters.ContainsKey("StartDelay"))
            {
                $params["startDelay"] = $StartDelay
            }
            if ($PSBoundParameters.ContainsKey("SecureBoot"))
            {
                $params["secureBoot"] = $SecureBoot
            }
            if ($PSBoundParameters.ContainsKey("NicType"))
            {
                $params["nicType"] = $NicType
            }
            if ($PSBoundParameters.ContainsKey("HvmBootFirmware"))
            {
                $params["hvmBootFirmware"] = $HvmBootFirmware
            }
            if ($PSBoundParameters.ContainsKey("VirtualizationMode"))
            {
                $params["virtualizationMode"] = $VirtualizationMode
            }
            if ($PSBoundParameters.ContainsKey("Viridian"))
            {
                $params["viridian"] = $Viridian
            }
            if ($PSBoundParameters.ContainsKey("BlockedOperations"))
            {
                $params["blockedOperations"] = $BlockedOperations
            }
            if ($PSBoundParameters.ContainsKey("Creation"))
            {
                $params["creation"] = $Creation
            }
            if ($PSBoundParameters.ContainsKey("SuspendSr"))
            {
                $params["suspendSr"] = $SuspendSr
            }
            if ($PSBoundParameters.ContainsKey("UefiMode"))
            {
                $params["uefiMode"] = $UefiMode
            }
            if ($PSBoundParameters.ContainsKey("XenStoreData"))
            {
                $params["xenStoreData"] = $XenStoreData
            }

            if ($PSBoundParameters.ContainsKey("Tag"))
            {
                try
                {
                    $null = Add-XoTag -Session $Session -Id $Id -Tag $Tag -ErrorAction Stop
                }
                catch
                {
                    throw $_.Exception.Message
                }
            }
            try
            {
                $body = New-JsonRpcRequest -Method "vm.set" -Params $params
                $null = Send-WebSocketJsonRpc -Session $Session -Body $body -ErrorAction Stop
            }
            catch
            {
                throw $_.Exception.Message
            }

            try
            {
                $vm = Get-XoVirtualMachine -Session $Session -Id $Id -ErrorAction Stop
            }
            catch
            {
                throw $_
            }
            if ($vm)
            {
                return $vm
            }
        }
    }

    end
    {

    }
}
