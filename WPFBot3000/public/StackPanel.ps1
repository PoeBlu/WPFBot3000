<#
.SYNOPSIS
A StackPanel control that encapsulates the Windows Presentation Foundation (WPF) System.Windows.Controls.StackPanel class

.DESCRIPTION
A StackPanel control that contains other controls

.PARAMETER Contents
A scriptblock that outputs controls you want in this StackPanel

.PARAMETER Property
Properties to extend/override the base properties defined in the function

.PARAMETER Orientation
Horizontal or vertical (how it "stacks" the controls)

.PARAMETER Name
The name of the stackpanel control

.EXAMPLE
Dialog {
    StackPanel -Name Options -orientation Horizontal {
       CheckBox Eeny
       CheckBox Meeny
       CheckBox Miny
    }
    TextBox Moe
}

.LINK
https://msdn.microsoft.com/en-us/library/system.windows.controls.stackpanel
#>
function StackPanel {
    [CmdletBinding()]
    Param([Scriptblock]$Contents,
        [Hashtable]$Property = @{},
        [ValidateSet('Horizontal', 'Vertical')]$Orientation = 'Horizontal',
        [string]$Name)
    $baseProperties = @{
        Orientation = [System.Windows.Controls.Orientation]$Orientation
    }
    if ($Name) {
        $baseProperties.Name = $Name
    }
    $stack = New-WPFControl -type System.Windows.Controls.StackPanel -Properties $baseProperties, $Property

    [System.Windows.UIElement[]]$c = & $Contents
    $c | foreach-object { $stack.Children.Add($_) | out-null }
    $stack | add-member -Name Window -MemberType ScriptProperty -Value {[System.Windows.Window]::GetWindow($this)}
    $stack | add-member -MemberType ScriptMethod -Name GetControlByName -Value $function:GetControlByName
    $stack | add-member -Name GetControlValue -MemberType ScriptMethod -Value {$d = @{}
        $this.Children | ForEach-Object {if ($_| get-member GetControlValue) {
                $d.Add($_.Name, $_.GetControlValue())
            }
        }
        [pscustomobject]$d

    }
    $stack  | add-member -MemberType NoteProperty -Name HideLabel -Value $True -PassThru
}
