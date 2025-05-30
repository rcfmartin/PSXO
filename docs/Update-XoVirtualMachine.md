---
external help file: PSXO-help.xml
Module Name: PSXO
online version:
schema: 2.0.0
---

# Update-XoVirtualMachine

## SYNOPSIS
Update virtual machine settings

## SYNTAX

```
Update-XoVirtualMachine [-Session] <XoSession> [-Id] <String> [[-Tag] <String[]>] [[-AutoPoweron] <Boolean>]
 [[-NameLabel] <String>] [[-NameDescription] <String>] [[-Notes] <String>] [[-HighAvailability] <String>]
 [[-Cpus] <Int64>] [[-CpusMax] <Int64>] [[-Memory] <Int64>] [[-MemoryMin] <Int64>] [[-MemoryMax] <Int64>]
 [[-MemoryStaticMax] <Int64>] [[-PVArgs] <String>] [[-CpuMask] <Array>] [[-CpuWeight] <Int64>]
 [[-CpuCap] <Int64>] [[-AffinityHost] <String>] [[-Vga] <String>] [[-Videoram] <Int64>]
 [[-CoresPerSocket] <Int64>] [[-HasVendorDevice] <Boolean>] [[-ExpNestedHvm] <Boolean>]
 [[-NestedVirt] <Boolean>] [[-ResourceSet] <String>] [[-Share] <Boolean>] [[-StartDelay] <Int64>]
 [[-SecureBoot] <Boolean>] [[-NicType] <String>] [[-HvmBootFirmware] <String>] [[-VirtualizationMode] <String>]
 [[-Viridian] <Boolean>] [[-BlockedOperations] <Object>] [[-Creation] <Object>] [[-SuspendSr] <String>]
 [[-UefiMode] <String>] [[-XenStoreData] <Object>] [-ProgressAction <ActionPreference>] [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

## DESCRIPTION
Update all virtual machine settings

## EXAMPLES

### EXAMPLE 1
```
$sess = New-XoSession -Uri "https://xo.example.com" -Token "Caywizq1kyz7G2mg25Tc2rk_KxgIb063DnM4ScqdMVE"
$vm = Get-XoVirtualMachine -Session $sess | Where-Object {$_.NameLabel -ieq "ansible"}
Update-XoVirtualMachine -Session $sess -Id $vm.Id -NameLabel "RockyLinux" -Memory 1GB
```

### EXAMPLE 2
```
$sess = New-XoSession -Uri "https://xo.example.com" -Token "Caywizq1kyz7G2mg25Tc2rk_KxgIb063DnM4ScqdMVE"
$vm = Get-XoVirtualMachine -Session $sess | Where-Object {$_.NameLabel -ieq "ansible"}
Update-XoVirtualMachine -Session $sess -Id $vm.Id -NameLabel "RockyLinux" -Cpus 2 -Memory 2GB
```

## PARAMETERS

### -Session
XoSession object

```yaml
Type: XoSession
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Id
Target VM id

```yaml
Type: String
Parameter Sets: (All)
Aliases: Uuid

Required: True
Position: 2
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Tag
Tags to add to the VM

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -AutoPoweron
Set VM to auto power on

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -NameLabel
VM Name label

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 5
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -NameDescription
VM Description

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 6
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Notes
VM notes.
Very useful

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 7
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -HighAvailability
High Availability

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 8
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Cpus
update the total CPUs

```yaml
Type: Int64
Parameter Sets: (All)
Aliases:

Required: False
Position: 9
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -CpusMax
Update the max number of CPUs

```yaml
Type: Int64
Parameter Sets: (All)
Aliases:

Required: False
Position: 10
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -Memory
Update memory

```yaml
Type: Int64
Parameter Sets: (All)
Aliases:

Required: False
Position: 11
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -MemoryMin
Update the min memory

```yaml
Type: Int64
Parameter Sets: (All)
Aliases:

Required: False
Position: 12
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -MemoryMax
Update the max memory

```yaml
Type: Int64
Parameter Sets: (All)
Aliases:

Required: False
Position: 13
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -MemoryStaticMax
Update the max static memory

```yaml
Type: Int64
Parameter Sets: (All)
Aliases:

Required: False
Position: 14
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -PVArgs
Update PV arg

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 15
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -CpuMask
Update the CPU mask

```yaml
Type: Array
Parameter Sets: (All)
Aliases:

Required: False
Position: 16
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -CpuWeight
Updte the CPU weight

```yaml
Type: Int64
Parameter Sets: (All)
Aliases:

Required: False
Position: 17
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -CpuCap
Update the CPU cap

```yaml
Type: Int64
Parameter Sets: (All)
Aliases:

Required: False
Position: 18
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -AffinityHost
Update the target Host

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 19
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Vga
Updat the VGA settings

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 20
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Videoram
Update video ram

```yaml
Type: Int64
Parameter Sets: (All)
Aliases:

Required: False
Position: 21
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -CoresPerSocket
Udpate the number of cores per socker

```yaml
Type: Int64
Parameter Sets: (All)
Aliases:

Required: False
Position: 22
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -HasVendorDevice
Set vendor device

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: 23
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -ExpNestedHvm
Updat exp nested Hvm

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: 24
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -NestedVirt
Update nested virtualization

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: 25
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -ResourceSet
Update resource set

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 26
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Share
Update share

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: 27
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -StartDelay
Delay start

```yaml
Type: Int64
Parameter Sets: (All)
Aliases:

Required: False
Position: 28
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -SecureBoot
Update secure boot

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: 29
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -NicType
Update NIC type

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 30
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -HvmBootFirmware
update Hvm boot firmware

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 31
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -VirtualizationMode
Update virtualization mode

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 32
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Viridian
Update viridian

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: 33
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -BlockedOperations
Update blocked operations

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: 34
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Creation
Update creation

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: 35
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SuspendSr
Suspend sr

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 36
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -UefiMode
Set uefi mode

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 37
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -XenStoreData
Set Xen Store Data

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: 38
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -WhatIf
Shows what would happen if the cmdlet runs.
The cmdlet is not run.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: wi

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Confirm
Prompts you for confirmation before running the cmdlet.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: cf

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ProgressAction
{{ Fill ProgressAction Description }}

```yaml
Type: ActionPreference
Parameter Sets: (All)
Aliases: proga

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### XoVirtualMachine
## NOTES
General notes

## RELATED LINKS
