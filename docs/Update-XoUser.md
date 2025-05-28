---
external help file: PSXO-help.xml
Module Name: PSXO
online version:
schema: 2.0.0
---

# Update-XoUser

## SYNOPSIS
Create new users

## SYNTAX

```
Update-XoUser [-Session] <XoSession> [-Id] <String> [[-Email] <String>] [[-Password] <SecureString>] [-IsAdmin]
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Create new Users

## EXAMPLES

### EXAMPLE 1
```
$sess = New-XoSession -Uri "https://xoa.example.com" -Token "Caywizq1kyz7G2mg25Tc2rk_KxgIb063DnM4ScqdMVE"
Update-XoUser -Session $sess -Email "admin@admin.com" -Password $(ConvertTo-SecureString -String "MySecurePassword" -Force -AsPlainText)
```

### EXAMPLE 2
```
$sess = New-XoSession -Uri "https://xoa.example.com" -Token "Caywizq1kyz7G2mg25Tc2rk_KxgIb063DnM4ScqdMVE"
Update-XoUser -Session $sess -Email "admin@admin.com" -IsAdmin -Password $(ConvertTo-SecureString -String "MySecurePassword" -Force -AsPlainText)
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
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Id
Target user Id

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

### -Email
Target user's email address

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Password
New user's password

```yaml
Type: SecureString
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -IsAdmin
Switch parameter

```yaml
Type: SwitchParameter
Parameter Sets: (All)
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

### XoUser
## NOTES

## RELATED LINKS
