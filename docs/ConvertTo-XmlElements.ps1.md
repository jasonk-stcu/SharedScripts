---
external help file: -help.xml
Module Name:
online version:
schema: 2.0.0
---

# ConvertTo-XmlElements.ps1

## SYNOPSIS
Serializes complex content into XML elements.

## SYNTAX

```
ConvertTo-XmlElements.ps1 [[-Value] <Object>] [<CommonParameters>]
```

## DESCRIPTION
{{ Fill in the Description }}

## EXAMPLES

### EXAMPLE 1
```
ConvertTo-XmlElements.ps1 @{html=@{body=@{p='Some text.'}}}
```

\<html\>\<body\>\<p\>Some text.\</p\>\</body\>\</html\>

### EXAMPLE 2
```
[pscustomobject]@{UserName=$env:USERNAME;Computer=$env:COMPUTERNAME} |ConvertTo-XmlElements.ps1
```

\<Computer\>COMPUTERNAME\</Computer\>
\<UserName\>username\</UserName\>

### EXAMPLE 3
```
Get-ChildItem *.txt |ConvertTo-XmlElements.ps1
```

\<PSPath\>Microsoft.PowerShell.Core\FileSystem::C:\temp\test.txt\</PSPath\>
\<PSParentPath\>Microsoft.PowerShell.Core\FileSystem::C:\scripts\</PSParentPath\>
\<PSChildName\>test.txt\</PSChildName\>
\<PSDrive\>\</PSDrive\>
\<PSProvider\>\</PSProvider\>
\<VersionInfo\>\<FileVersionRaw\>\</FileVersionRaw\>
\<ProductVersionRaw\>\</ProductVersionRaw\>
…

## PARAMETERS

### -Value
A hash or XML element or other object to be serialized as XML elements.

Each hash value or object property value may itself be a hash or object or XML element.

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### System.Object (any object) to serialize.
## OUTPUTS

### System.String for each XML-serialized value or property.
## NOTES

## RELATED LINKS
