---
external help file: PSXO-help.xml
Module Name: PSXO
online version:
schema: 2.0.0
---

# Get-XoSession

## SYNOPSIS
Get open web sessions

## SYNTAX

```
Get-XoSession [[-Session] <XoSession>] [[-Id] <String>] [-ProgressAction <ActionPreference>]
 [<CommonParameters>]
```

## DESCRIPTION
Get open web sessions

## EXAMPLES

### EXAMPLE 1
```
Get-XoSession
```

### EXAMPLE 2
```
$session = New-XoSession -Uri "https://xo.example.com" -Token "MyToken"
Get-XoSession -Session $session
```

### EXAMPLE 3
```
$session = New-XoSession -Uri "https://xo.example.com" -Token "MyToken"
Get-XoSession -Id $session.Id
```

## PARAMETERS

### -Session
XoSession object returned from New-XoSession

```yaml
Type: XoSession
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Id
Target Session Id

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
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

## NOTES

## RELATED LINKS
