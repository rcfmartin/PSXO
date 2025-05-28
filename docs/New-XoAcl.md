---
external help file: PSXO-help.xml
Module Name: PSXO
online version:
schema: 2.0.0
---

# New-XoAcl

## SYNOPSIS
Creates a new ACL

## SYNTAX

```
New-XoAcl [-Session] <XoSession> [-Subject] <String> [-Object] <String> [-Action] <String>
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Creates a new ACL

## EXAMPLES

### EXAMPLE 1
```
$sess = New-XoSession -Uri "https://xo.example.com" -Token "Caywizq1kyz7G2mg25Tc2rk_KxgIb063DnM4ScqdMVE"
New-XoAcl -Session $sess -Subject "8054b336-3c07-4f6f-8b0a-3e8ccdb8c454" -Object "cbdb37be-0ad2-972a-9537-ccc6a7ff95fd" -Action "admin"
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

### -Subject
Target Subject

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Object
Target Object

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Action
Target Action

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 4
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
