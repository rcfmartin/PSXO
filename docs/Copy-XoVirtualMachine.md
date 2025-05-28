---
external help file: PSXO-help.xml
Module Name: PSXO
online version:
schema: 2.0.0
---

# Copy-XoVirtualMachine

## SYNOPSIS
Clone virtual machine

## SYNTAX

### XoObject (Default)
```
Copy-XoVirtualMachine [-Session <XoSession>] [-Id <String>] [-Name <String>] [-FullCopy <Boolean>]
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

### XoVirtualMachine
```
Copy-XoVirtualMachine [-Session <XoSession>] [-Id <String>] [-Name <String>] [-FullCopy <Boolean>] [-Wait]
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Clone virtual machine

## EXAMPLES

### EXAMPLE 1
```
$sess = New-XoSession -Uri "https://xo.example.com" -Token "Caywizq1kyz7G2mg25Tc2rk_KxgIb063DnM4ScqdMVE"
Copy-XoVirtualMachine -Session $sess -Id "6d2b6673-3f2e-dd2c-ed8c-e2eefc0eb373" -Name "NewVm" -FullCopy:$true -Wait
```

## PARAMETERS

### -Session
XoSession object

```yaml
Type: XoSession
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Id
target VM Id

```yaml
Type: String
Parameter Sets: (All)
Aliases: Uuid

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Name
New vm Name

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -FullCopy
Perform a full copy

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: True
Accept pipeline input: False
Accept wildcard characters: False
```

### -Wait
Keep the session until the copy is done.

```yaml
Type: SwitchParameter
Parameter Sets: XoVirtualMachine
Aliases:

Required: False
Position: Named
Default value: False
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
### System.Object
## NOTES

## RELATED LINKS
