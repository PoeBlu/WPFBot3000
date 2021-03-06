---
external help file: WPFBot3000-help.xml
Module Name: wpfbot3000
online version: https://msdn.microsoft.com/en-us/library/system.windows.shapes.rectangle
schema: 2.0.0
---

# Register-WPFDSLValueControl

## SYNOPSIS
Creates a WPFBot3000 cmdlet for a control that has a value

## SYNTAX

```
Register-WPFDSLValueControl [[-Name] <String>] [[-TypeName] <String>] [[-InitialValuePropertyName] <String>]
 [-HideLabel] [<CommonParameters>]
```

## DESCRIPTION
Creates a WPFBot3000 cmdlet for a control that has a value

## EXAMPLES

### EXAMPLE 1
```
Register-WPFDSLValueControl -Name Txt -Typename System.Windows.Controls.TextBox -initialValuePropertyName Text
```

Register-WPFDSLValueControl -Name PlainTextPassword -Typename System.Windows.Controls.PasswordBox -initialValuePropertyName Password
Register-WPFDSLValueControl -Name MyCheckBox -TypeName System.Windows.Controls.CheckBox -initialValuePropertyName IsChecked -HideLabel
dialog {
    Txt MyText -InitialValue Blah
    PlainTextPassword MyPass -InitialValue Password
    MyCheckBox Chk -InitialValue $true -property @{Content='Chk'}
    CheckBox Chk2 -InitialValue $true
}

## PARAMETERS

### -Name
The name of the cmdlet to be created

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -TypeName
The type name of the control to be "wrapped"

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

### -InitialValuePropertyName
The name of the property to use to set the initial value of the control

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

### -HideLabel
Whether the control shows a label or not

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable.
For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
General notes

## RELATED LINKS
