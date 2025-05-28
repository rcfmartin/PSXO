---
external help file: PSXO-help.xml
Module Name: PSXO
online version:
schema: 2.0.0
---

# Get-XoAcl

## SYNOPSIS
Get Acls

## SYNTAX

### Default (Default)
```
Get-XoAcl [-Session <XoSession>] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

### Subject
```
Get-XoAcl [-Session <XoSession>] [-Subject <String>] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

### Object
```
Get-XoAcl [-Session <XoSession>] [-Object <String>] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

### Action
```
Get-XoAcl [-Session <XoSession>] [-Action <String>] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

### Id
```
Get-XoAcl [-Session <XoSession>] [-Id <String>] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Get Acls

## EXAMPLES

### EXAMPLE 1
```
$sess = New-XoSession -Uri "https://xo.example.com" -Token "Caywizq1kyz7G2mg25Tc2rk_KxgIb063DnM4ScqdMVE"
Get-XoAcl -Session $sess
```

### EXAMPLE 2
```
$sess = New-XoSession -Uri "https://xo.example.com" -Token "Caywizq1kyz7G2mg25Tc2rk_KxgIb063DnM4ScqdMVE"
Get-XoAcl -Session $sess -Action Admin
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
Target ACL Id

```yaml
Type: String
Parameter Sets: Id
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Action
Target action

```yaml
Type: String
Parameter Sets: Action
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Subject
Target subject

```yaml
Type: String
Parameter Sets: Subject
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Object
Target Object

```yaml
Type: String
Parameter Sets: Object
Aliases:

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

### XoAcl
## NOTES

## RELATED LINKS
