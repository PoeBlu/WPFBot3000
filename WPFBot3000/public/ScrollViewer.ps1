<#
.SYNOPSIS
A ScrollViewer control that encapsulates the Windows Presentation Foundation (WPF) System.Windows.Controls.ScrollViewer class

.DESCRIPTION
Outputs a ScrollViewer control, along with control(s) contained in it.  If more than one control is in $Contents, a StackPanel is inserted (because ScrollViewers only have one child)

.PARAMETER Contents
The control(s) contained in the ScrollViewer

.PARAMETER Property
Additional properties to be set on the ScrollViewer.

.PARAMETER Name
The name of the ScrollViewer control.  The name will be used as a property name in the output of the Dialog function.

.EXAMPLE
Dialog {
    ScrollViewer  {
        TextBox Fred -property @{MinWidth=50}
        TextBox Barney
    } -Property @{ScrollViewerBrush='Red';ScrollViewerThickness=5} -name Flintstones
}

.LINK
https://msdn.microsoft.com/en-us/library/system.windows.controls.scrollviewer
#>
function ScrollViewer {
    [CmdletBinding()]
    Param([Scriptblock]$Contents,
        [hashtable]$Property = @{},
        [string]$Name)
    $baseProperties = @{
    }
    if ($Name) {
        $baseProperties.Name = $Name
    }
    $ScrollViewer = New-WPFControl -type System.Windows.Controls.ScrollViewer -Properties $baseProperties, $Property

    $c = & $Contents
    if ($c -is [System.Windows.UIElement]) {
        $ScrollViewer.Content = $c
    }
    else {
        $ScrollViewer.Content = StackPanel {$c}
    }
    $ScrollViewer | add-member -Name Window -MemberType ScriptProperty -Value {[System.Windows.Window]::GetWindow($this)}
    $ScrollViewer | add-member -MemberType ScriptMethod -Name GetControlByName -Value $function:GetControlByName
    $ScrollViewer | add-member -Name GetControlValue -MemberType ScriptMethod -Value {$d = @{}
        $this.Content | ForEach-Object {if ($_| get-member GetControlValue) {
                $d.Add($_.Name, $_.GetControlValue())
            }
        }
        [pscustomobject]$d
    }
    $ScrollViewer  | add-member -MemberType NoteProperty -Name HideLabel -Value $True -PassThru
}
