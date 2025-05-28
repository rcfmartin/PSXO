---
external help file: PSXO-help.xml
Module Name: PSXO
online version:
schema: 2.0.0
---

# New-XoSession

## SYNOPSIS
Creates a new session

## SYNTAX

```
New-XoSession [-Uri] <String> [-Token] <String> [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
This cmdlet was originally designed to authenticate to the REST api endpoints.
Since all cmdlets have been moved to JSON-RPC, this cmd is just serving as a way to pass the token around via "session"

## EXAMPLES

### EXAMPLE 1
```
New-XoSession -Uri "https://xo.example.com" -Token "DPjwthwfJLTJj1UPmAojAQIlQHtsMzNabkTOTZz5uzU"
```

## PARAMETERS

### -Uri
Target xen orchestra uri

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Token
Api Token

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

### XoSession
## NOTES

## RELATED LINKS
