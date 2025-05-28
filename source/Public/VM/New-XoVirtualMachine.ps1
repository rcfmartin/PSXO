function New-XoVirtualMachine
{
    <#
    .SYNOPSIS
    Creates a new virtual machine based on the provided template

    .DESCRIPTION
    Creates a new virtual machine based on the provided template

    .PARAMETER Session
    XoSession object

    .PARAMETER NameLabel
    New VM name

    .PARAMETER TemplateId
    Target Template Id

    .PARAMETER Tag
    Tadd to add to the VM

    .PARAMETER Acls
    Target ACLs

    .PARAMETER AffinityHostId
    Target Host

    .PARAMETER BootAfterCreate
    Boot after Create

    .PARAMETER CloudConfig
    Cloud configuration

    .PARAMETER CreateVtpm
    Create VTPM

    .PARAMETER NetworkConfig
    Network configuration

    .PARAMETER CoreOs
    Set Core os

    .PARAMETER Clone
    Clone VM

    .PARAMETER CoresPerSocket
    Number of cores per socket

    .PARAMETER ResourceSet
    Set resource

    .PARAMETER DestroyCloudConfigVdiAfterBoot
    Remove cloud cofig after creation

    .PARAMETER Installation
    Installation settings

    .PARAMETER VgpuType
    Type of VGPU

    .PARAMETER GpuGroup
    GPO Group

    .PARAMETER NameDescription
    New VM Description

    .PARAMETER PvArgs
    PV Arguments

    .PARAMETER Share
    Share settings

    .PARAMETER VIFs
    VIFs setttings

    .PARAMETER VDIs
    VDIs settings

    .PARAMETER ExistingDisks
    Add existing Disk

    .PARAMETER HvmBootFirmware
    Boot firmaware

    .PARAMETER CopyHostBiosStrings
    Copy host bios string

    .EXAMPLE
    $sess = New-XoSession -Uri "https://xo.example.com" -Token "Caywizq1kyz7G2mg25Tc2rk_KxgIb063DnM4ScqdMVE"
    New-XoVirtualMachine -Session $sess -NameLabel "My New VM" -TemplateId "06754190-adbf-46a9-ab00-558ffcc9a22f" -AffinityHostId "06754190-adbf-46a9-ab00-558ffcc9a22f"

    .EXAMPLE
    $sess = New-XoSession -Uri "https://xo.example.com" -Token "Caywizq1kyz7G2mg25Tc2rk_KxgIb063DnM4ScqdMVE"
    New-XoVirtualMachine -Session $sess -NameLabel "My New VM" -TemplateId "06754190-adbf-46a9-ab00-558ffcc9a22f" -BootAfterCreate:$true
    #>
    [CmdletBinding()]
    [OutputType([void])]
    param (
        [Parameter(Mandatory = $true)]
        [XoSession]
        $Session,

        [Parameter(Mandatory = $true)]
        [string]
        $NameLabel,

        [Parameter(Mandatory = $true)]
        [string]
        $TemplateId,
        [Parameter()]
        [string[]]
        $Tag,

        [Parameter()]
        [array]
        $Acls,

        [Parameter()]
        [string]
        $AffinityHostId,

        [Parameter()]
        [bool]
        $BootAfterCreate,

        [Parameter()]
        [string]
        $CloudConfig,

        [Parameter()]
        [bool]
        $CreateVtpm,

        [Parameter()]
        [string]
        $NetworkConfig,

        [Parameter()]
        [bool]
        $CoreOs,

        [Parameter()]
        [bool]
        $Clone,

        [Parameter()]
        [long]
        $CoresPerSocket,

        [Parameter()]
        [string]
        $ResourceSet,

        [Parameter()]
        [bool]
        $DestroyCloudConfigVdiAfterBoot,

        [Parameter()]
        [object]
        $Installation,

        [Parameter()]
        [string]
        $VgpuType,

        [Parameter()]
        [string]
        $GpuGroup,

        [Parameter()]
        [string]
        $NameDescription,

        [Parameter()]
        [string]
        $PvArgs,

        [Parameter()]
        [bool]
        $Share,

        [Parameter()]
        [array]
        $VIFs,

        [Parameter()]
        [array]
        $VDIs,

        [Parameter()]
        [object]
        $ExistingDisks,

        [Parameter()]
        [string]
        $HvmBootFirmware,

        [Parameter()]
        [bool]
        $CopyHostBiosStrings


    )

    begin
    {

    }

    process
    {
        [hashtable]$params = @{
            "name_label" = $NameLabel
            "template"   = $TemplateId
        }
        if ($PSBoundParameters.ContainsKey("Acls"))
        {
            $params["acls"] = $Acls
        }
        if ($PSBoundParameters.ContainsKey("AffinityHostId"))
        {
            $params["affinityHost"] = $AffinityHostId
        }
        if ($PSBoundParameters.ContainsKey("BootAfterCreate"))
        {
            $params["bootAfterCreate"] = $BootAfterCreate
        }
        if ($PSBoundParameters.ContainsKey("CloudConfig"))
        {
            $params["cloudConfig"] = $CloudConfig
        }
        if ($PSBoundParameters.ContainsKey("CreateVtpm"))
        {
            $params["createVtpm"] = $CreateVtpm
        }
        if ($PSBoundParameters.ContainsKey("NetworkConfig"))
        {
            $params["networkConfig"] = $NetworkConfig
        }
        if ($PSBoundParameters.ContainsKey("CoreOs"))
        {
            $params["coreOs"] = $CoreOs
        }
        if ($PSBoundParameters.ContainsKey("Clone"))
        {
            $params["clone"] = $Clone
        }
        if ($PSBoundParameters.ContainsKey("CoresPerSocket"))
        {
            $params["coresPerSocket"] = $CoresPerSocket
        }
        if ($PSBoundParameters.ContainsKey("ResourceSet"))
        {
            $params["resourceSet"] = $ResourceSet
        }
        if ($PSBoundParameters.ContainsKey("DestroyCloudConfigVdiAfterBoot"))
        {
            $params["destroyCloudConfigVdiAfterBoot"] = $DestroyCloudConfigVdiAfterBoot
        }
        if ($PSBoundParameters.ContainsKey("Installation"))
        {
            $params["installation"] = $Installation
        }
        if ($PSBoundParameters.ContainsKey("VgpuType"))
        {
            $params["vgpuType"] = $VgpuType
        }
        if ($PSBoundParameters.ContainsKey("GpuGroup"))
        {
            $params["gpuGroup"] = $GpuGroup
        }
        if ($PSBoundParameters.ContainsKey("NameDescription"))
        {
            $params["name_description"] = $NameDescription
        }
        if ($PSBoundParameters.ContainsKey("PvArgs"))
        {
            $params["pv_args"] = $PvArgs
        }
        if ($PSBoundParameters.ContainsKey("Share"))
        {
            $params["share"] = $Share
        }
        if ($PSBoundParameters.ContainsKey("VIFs"))
        {
            $params["VIFs"] = $VIFs
        }
        if ($PSBoundParameters.ContainsKey("VDIs"))
        {
            $params["VDIs"] = $VDIs
        }
        if ($PSBoundParameters.ContainsKey("ExistingDisks"))
        {
            $params["existingDisks"] = $ExistingDisks
        }
        if ($PSBoundParameters.ContainsKey("HvmBootFirmware"))
        {
            $params["hvmBootFirmware"] = $HvmBootFirmware
        }
        if ($PSBoundParameters.ContainsKey("CopyHostBiosStrings"))
        {
            $params["copyHostBiosStrings"] = $CopyHostBiosStrings
        }

        try
        {
            $body = New-JsonRpcRequest -Method "vm.create" -Params $params
            $resp = Send-WebSocketJsonRpc -Session $Session -Body $body -ErrorAction Stop
        }
        catch
        {
            throw $_.Exception.Message
        }
        if ($resp)
        {
            $prop = $resp.params.items.psobject.Properties.Value | Where-Object { $_.name_label -ilike "*VM.*clone*" }

            if ($prop.status -ieq "failure")
            {
                try
                {
                    $task = Get-XoTask -Session $sess -ErrorAction Stop | Where-Object { $_.Result.Task.uuid -ieq "$($prop.id)" }

                }
                catch
                {
                    throw $_.Exception.Message
                }
                throw "Failed to Resume the VM. TaskId: $($task.id) Error: $($task.result.task.error_info)"
            }

        }
        $null = Get-XoTaskProgress -Session $Session -Id $prop.id

        try
        {
            $vm = Get-XoVirtualMachine -Session $Session -Name "$($NameLabel)" -ErrorAction Stop
        }
        catch
        {
            throw $_.Exception.Message
        }
        if (-not $vm.Id)
        {
            throw "Failed to get new VM. The VM was not found or is not ready."
        }
        if ($PSBoundParameters.ContainsKey("Tag"))
        {

            try
            {
                if (-not $vm.Id)
                {
                    throw "Failed to add tag to the VM. VM was not found or is not ready."
                }
                $null = Add-XoTag -Session $Session -Id $vm.Id -Tag $Tag -ErrorAction Stop
            }
            catch
            {
                throw $_.Exception.Message
            }
        }

    }

    end
    {
        return $vm
    }
}
