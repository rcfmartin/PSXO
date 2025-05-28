---
external help file: PSXO-help.xml
Module Name: PSXO
online version:
schema: 2.0.0
---

# Get-XoServer

## SYNOPSIS
Get registered servers

## SYNTAX

### Default (Default)
```
Get-XoServer [-Session <XoSession>] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

### Server
```
Get-XoServer [-Session <XoSession>] [-Server <String>] [-ProgressAction <ActionPreference>]
 [<CommonParameters>]
```

### Name
```
Get-XoServer [-Session <XoSession>] [-Label <String>] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

### Id
```
Get-XoServer [-Session <XoSession>] [-Id <String>] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Get registered servers

## EXAMPLES

### EXAMPLE 1
```
$sess = New-XoSession -Uri "https://xo.example.com" -Token "Caywizq1kyz7G2mg25Tc2rk_KxgIb063DnM4ScqdMVE"
Get-XoServer -Session $sess
```

### EXAMPLE 2
```
$sess = New-XoSession -Uri "https://xo.example.com" -Token "Caywizq1kyz7G2mg25Tc2rk_KxgIb063DnM4ScqdMVE"
Get-XoServer -Session $sess -Name "Server01"
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
Target Server Id

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

### -Label
Target Label

```yaml
Type: String
Parameter Sets: Name
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Server
Target server

```yaml
Type: String
Parameter Sets: Server
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

### XoServer
## NOTES

## RELATED LINKS
