# Changelog

---
## v1.1.10
* Added support for setting the font of [GridGUI.GuiControlClass](Classes/GuiControlClass.md) using the new method [GridGUI.GuiControlClass.Font](/Classes/GuiControlClass/#font) and for changing the size of the control after applying the font, to avoid changing the size set the font on the GUI instance instead of the control and apply the font manually.
* [GridGUI.GUI.GuiSize](/Classes/GUI/#guisize) callback is now called with a second argument that indicates if the GUI was minimized or maximized.
* Fixed a bug where [GridGUI.Cell](Classes/Cell.md)s where not removed by [GridGUI.GridGUIClass.RemoveCellByPos](/Classes/GridGUIClass/#removecellbypos).
* Added [GridGUI.Grid.Util.BGRtoRGB](/Classes/Util/#bgrtorgb) and [GridGUI.Grid.Util.RGBtoBGR](/Classes/Util/#rgbtobgr) .
* Added a utility script that converts the lib to a single script.

## v1.1.9
* Added support for removing controls from a GridGUI
* Fixed a bug where overlapping controls were not clickable. For examples of how to make overlapping controls clickable see ([Example Background.ahk](https://github.com/CapnOdin/GridGUI/blob/master/Examples/Example%20Background.ahk), [UCR Example.ahk](https://github.com/CapnOdin/GridGUI/blob/master/Examples/Recreating%20GUIs/evilC%20-%20UCR/UCR%20Example.ahk))
* Added an example showing how to remove controls from a GridGUI ([Example Grid Game.ahk](https://github.com/CapnOdin/GridGUI/blob/master/Examples/Example%20Grid%20Game.ahk))

## v1.1.8
* Added support for [Gui Events](https://www.autohotkey.com/docs/commands/Gui.htm#Labels) via the following callbacks `GuiSize`, `GuiMoved`, `GuiClose`, `GuiActivate`, `GuiContextMenu`
* Added support for drag and drop files to a `GUI` or `Control` using the method `RegisterDropTarget` of the GUI class
* Added an example showing how to use Gui Events and registering Drag and Drop ([Example Gui Events.ahk](https://github.com/CapnOdin/GridGUI/blob/master/Examples/Example%20Gui%20Events.ahk))
* Updated the examples to use the new GUI events

## v1.1.7
* Fixed the handling of minsize for expanding and filling controls (to allow a control to disappear entirely set its initial size to 0 like in this [example](https://github.com/CapnOdin/GridGUI/blob/master/Examples/Example%20Expansion%20Battle%201.ahk))
* Added two new convenience methods to the main GridGUI class that makes Position instances called `GridGUI.Pos()` and `GridGUI.Area()`
* Removed lots of potential warnings so that using `#Warn` in a script that has included this lib would not be as annoying of an experience
* Added an option to the TabControl class that makes it only calculate the positions of the selected tab
* Made the TabControl class no longer use the standard callback so that it is free to be used for input interrupts
* Updated a number of examples to work with the fixed minsize handeling

## v1.1.6
* Added SubGrids that can make a grid in a Cell of a GridGUI or really anywhere
* Added a new Control class for handling Tabs with subgrids called [TabControl](https://github.com/CapnOdin/GridGUI/blob/7af303174d89451b24a23a1c0ad7cfda43b54103/GridGUI-lib/Controls.ahk#L291)
* Added a new Control class for handling StatusBars called [StatusBarControl](https://github.com/CapnOdin/GridGUI/blob/7af303174d89451b24a23a1c0ad7cfda43b54103/GridGUI-lib/Controls.ahk#L245)
* Added an example showing how to use SubGrids ([Example SubGrids.ahk](https://github.com/CapnOdin/GridGUI/blob/master/Examples/Example%20SubGrids.ahk))
* Added an example showing how to use the new TabControl ([Example Tabs.ahk](https://github.com/CapnOdin/GridGUI/blob/master/Examples/Example%20Tabs.ahk))
* Updated the example [Example Find Text in Files.ahk](https://github.com/CapnOdin/GridGUI/blob/master/Examples/Example%20Find%20Text%20in%20Files.ahk) to show how to use the new StatusBarControl

## v1.1.5
* Added a new Control class for handling RadioButton groups called [RadioGroupControl](https://github.com/CapnOdin/GridGUI/blob/582326c40ca276ba1c432b47e9274694b9c219a3/GridGUI-lib/Controls.ahk#L206)
* Fixed a DPI issue where the cells of controls with default size would be enlarged (found by **metacognition**)
* Added two examples showing how to use the new RadioGroupControl ([example 1](https://github.com/CapnOdin/GridGUI/blob/master/Examples/Example%20RadioGroups.ahk), [example 2](https://github.com/CapnOdin/GridGUI/blob/master/Examples/Example%20RadioGroups%202.ahk))

## v1.1.4
* Added methods to retrieve the Cell group instances making up the grid
* Fixed a bug that made TreeviewControls and ListviewControls not change the default LV or TV properly
* Added an [example](https://github.com/CapnOdin/GridGUI/blob/master/Examples/Example%20CellGroups.ahk) showing how to retrieve the underlying cell container
* Change the ToStr method of Cells to provide move information
* Finished recreating the Columnize GUI, the example can be found [here](https://github.com/CapnOdin/GridGUI/blob/master/Examples/Recreating%20GUIs/tidbit%20-%20Columnize/Columnize.ahk)
* Added an [example](https://github.com/CapnOdin/GridGUI/blob/master/Examples/Example%20Find%20Text%20in%20Files.ahk) of how to use the new ListViewControl wrapper

## v1.1.3
* Added two additional control wrappers, [ListviewControl](https://github.com/CapnOdin/GridGUI/blob/b0b4f1174da2f2f124dff9a495a84913fdd6bd07/GridGUI-lib/Controls.ahk#L10) and [TreeviewControl](https://github.com/CapnOdin/GridGUI/blob/b0b4f1174da2f2f124dff9a495a84913fdd6bd07/GridGUI-lib/Controls.ahk#L206)
* Fixed bug preventing keyword arguments from being used in the AddControl method
* Fixed the two recreated guis to work with the behavioural changes introduced in v1.1.0
* Added an [example](https://github.com/CapnOdin/GridGUI/blob/master/Examples/Example%20User%20Input.ahk) of how to react to user input 

## v1.1.2
* Added support for native glabels
* Made it possible to instantiate a GUI without making a new one
* Added WinActive to the Window Class
* Updated the terminal console example to properly close the started process

## v1.1.1
* Fixed a critical bug where calculating the positions of controls for some GUIs would not terminate in certain cases
* Fixed an error in the groupbox example (found by **Mordecai**)

## v1.1.0
* Overlapping Controls are now supported 
* Controls now only expand when both the expand option and fill option is set.
* Moved the lib into a Class so that naming conflicts won't be as big of an issue
* Fixed a bug that made `WinShow` and `WinHide` not work
* Added the WindowControl class that allows windows to be added to the grid see this [example](https://github.com/CapnOdin/GridGUI/blob/master/Examples/Example%20Window%20Grid.ahk)
* Added an example showing the use of a custom WindowControl by using Powsershell and PuTTY to make a serial terminal [link](https://github.com/CapnOdin/GridGUI/blob/master/Examples/Example%20Serial%20Terminal.ahk)
