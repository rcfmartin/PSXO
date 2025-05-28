---
external help file: PSXO-help.xml
Module Name: PSXO
online version:
schema: 2.0.0
---

# Add-XoGroupUser

## SYNOPSIS
Adds users to group

## SYNTAX

```
Add-XoGroupUser [-Session] <XoSession> [[-Id] <String>] [-UserId] <String[]>
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Adds users to group

## EXAMPLES

### EXAMPLE 1
```
$sess = New-XoSession -Uri "https://xo.example.com" -Token "Caywizq1kyz7G2mg25Tc2rk_KxgIb063DnM4ScqdMVE"
Add-XoGroupUser -Session $sess -Id "9ace51e1-dfbd-4617-8db3-88f28974e111" -UserId "06754190-adbf-46a9-ab00-558ffcc9a22f"
```

### EXAMPLE 2
```
$sess = New-XoSession -Uri "https://xo.example.com" -Token "Caywizq1kyz7G2mg25Tc2rk_KxgIb063DnM4ScqdMVE"
Add-XoGroupUser -Session $sess -Id "9ace51e1-dfbd-4617-8db3-88f28974e111" -UserId "06754190-adbf-46a9-ab00-558ffcc9a22f","12354190-adbf-46a9-ab00-558ffcc9a21g"
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
Target group Id

```yaml
Type: String
Parameter Sets: (All)
Aliases: Uuid

Required: False
Position: 2
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -UserId
Target User(s) Id

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: True
Position: 3
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

### XoGroup
## NOTES

## RELATED LINKS
