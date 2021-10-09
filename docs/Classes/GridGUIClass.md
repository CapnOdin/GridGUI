#GridGUIClass
<figure markdown="1">
A class representing a gui with a grid.
</figure>
---
##Members

####grid

> **desc**: The grid that controls are put into.

> **type**: GridGUI.Grid

> **default**: GridGUI.Grid

####gridlines

> **desc**: The container for the horisontal and vertical grid line controls shown when `GridGUIClass.showGrid` is true.

> **type**: array

> **default**: [[], []]

####margins

> **desc**: The additional space that is added around controls that are added to the grid.

> **type**: object

> **default**: {x: 5, y: 5}

####showGrid

> **desc**: Used to remember what parameter the `GridGUI.GridGUIClass` instance was created with and to decide whether or not to move the debug grid when drawn.

> **type**: bool

##Methods

####__DrawGrid
**desc**: Moves the debug grid line controls to the appropriate locations.

**args**:

> **name**: area

> **desc**: the area where in the debug grid lines are moved.

> **type**: GridGUI.Position

####__Init
**desc**: Initialises the class members.

**args**:

> **name**: showGrid

> **desc**: Whether or not to show a grid for the control that where placed on the gui before it was shown the first time.

> **type**: bool

####__New
**desc**: 

**args**:

> **name**: title

> **desc**: The title that the new gui window will have

> **type**: string

> **name**: options

> **desc**: The ahk gui options that the window will be created with

> **type**: string

> **name**: showGrid

> **desc**: Whether or not to show a grid for the control that where placed on the gui before it was shown the first time.

> **type**: bool

**returns**:

> **desc**: Returns a new instance of `GridGUI.GridGUIClass`

> **type**: GridGUI.GridGUIClass

####__TranslateGridPos
**desc**: Transforms the cordinate syntax used when adding controls to a grid area

**args**:

> **name**: x

> **desc**: The Columns that the cell spans over. When more than one column is wanted separate the start and end columns with a hyphen, e.g. "2-5".

> **type**: string|number

> **name**: y

> **desc**: The Rows that the cell spans over. When more than one row is wanted separate the start and end rows with a hyphen, e.g. "2-5".

> **type**: string|number

**returns**:

> **desc**: Returns the translated position as a point with a width and a height.

> **type**: GridGUI.Position

####_GuiMoved
**desc**: A callback called when the gui was moved that calls the `GridGUI.GUI._GuiMoved` and shows a debug tooltip with the position if `GridGUI.GridGUIClass.showGrid` is true.

**args**:

> **name**: pos

> **desc**: The new position, only containing coordinate of the top right corner.

> **type**: GridGUI.Position

####_GuiSize
**desc**: A callback called when the gui was resized, that calls the `GridGUI.GridGUIClass.Draw` method, `GridGUI.GUI._GuiSize` and draws the debug grid if `GridGUI.GridGUIClass.showGrid` is true.

**args**:

> **name**: pos

> **desc**: The new area, only containing width and height of the gui, that is x and y is both zero.

> **type**: GridGUI.Position

####Add
**desc**: Adds a new cell with any of the standard controls to the grid and gui.

**args**:

> **name**: x

> **desc**: The Columns that the cell spans over. When more than one column is wanted separate the start and end columns with a hyphen, e.g. "2-5".

> **type**: string|number

> **name**: y

> **desc**: The Rows that the cell spans over. When more than one row is wanted separate the start and end rows with a hyphen, e.g. "2-5".

> **type**: string|number

> **name**: type

> **desc**: The type of the control. Can be `Text, Edit, UpDown, Picture, Button, Checkbox, DropDownList, ComboBox, ListBox, Link, Hotkey, DateTime, MonthCal, Slider, Progress, GroupBox and ActiveX`. For `Radio, ListView, TreeView, Tab3 and StatusBar` see [AdditionalControls](AdditionalControls)

> **type**: string

> **name**: options

> **desc**: The options that the GuiControl will be created with. Does not accept vVars. Can be an object with keys the same names as the optional arguments that this method takes.

> **type**: string

> **name**: text

> **desc**: The text that the control will be created with.

> **type**: string

> **name**: exW

> **desc**: How much of the excess width the cell should take up relative to the other width expanding cells. Can be an object with keys the same names as the optional arguments that this method takes.

> **type**: number

> **name**: exH

> **desc**: How much of the excess height the cell should take up relative to the other height expanding cells.

> **type**: number

> **name**: fillW

> **desc**: Whether or not the control should fill the width of the cell.

> **type**: bool

> **name**: fillH

> **desc**: Whether or not the control should fill the height of the cell.

> **type**: bool

> **name**: justify

> **desc**: The position of the control with in the cell, can be any combination of `C` (Center), `N` (North), `S` (South), `W` (West) and `E` (East).

> **type**: string

> **default**: C

**returns**:

> **desc**: Returns the added control

> **type**: GridGUI.ArbitraryControl

####AddControl
**desc**: Adds a new cell to the grid and sets the cells control to the supplied control class instance.

**args**:

> **name**: x

> **desc**: The Columns that the cell spans over. When more than one column is wanted separate the start and end columns with a hyphen, e.g. "2-5".

> **type**: string|number

> **name**: y

> **desc**: The Rows that the cell spans over. When more than one row is wanted separate the start and end rows with a hyphen, e.g. "2-5".

> **type**: string|number

> **name**: ctrl

> **desc**: The control that will be put in the cell.

> **type**: GridGUI.GuiControlClass

> **name**: exW

> **desc**: How much of the excess width the cell should take up relative to the other width expanding cells. Can be an object with keys the same names as the optional arguments that this method takes.

> **type**: number

> **name**: exH

> **desc**: How much of the excess height the cell should take up relative to the other height expanding cells.

> **type**: number

> **name**: fillW

> **desc**: Whether or not the control should fill the width of the cell.

> **type**: bool

> **name**: fillH

> **desc**: Whether or not the control should fill the height of the cell.

> **type**: bool

> **name**: justify

> **desc**: The position of the control with in the cell, can be any combination of `C` (Center), `N` (North), `S` (South), `W` (West) and `E` (East).

> **type**: string

> **default**: C

**returns**:

> **desc**: Returns the control that the method was called with.

> **type**: GridGUI.GuiControlClass

####AutoSize
**desc**: Calculates the minimum size required to show all the controls in the grid and sets the `GridGUI.GUI.pos` to the calculated width and height, as well as updates the controls in the grid to their positions. Can be used to reduce the number of controls that a noticeable misplaced when the gui is drawn the first time if called before calling `GridGUI.GridGUIClass.Show`.

####Draw
**desc**: Calculates the new positions of the controls in the grid based on the settings of their `GridGUI.Cell` and moved them to their new positions.

**args**:

> **name**: pos

> **desc**: The area the controls will be put into and sized to fit if `GridGUI.Cell.exW`, `GridGUI.Cell.exH`, `GridGUI.Cell.fillW` or `GridGUI.Cell.fillH` of the cell that the control occupies are set.

> **type**: GridGUI.Position

####GetCellGroup
**desc**: Retrieve a `GridGUI.Cell` by its associated control.

**args**:

> **name**: Ctrl

> **desc**: The control used to match the right `GridGUI.Cell`

> **type**: GridGUI.GuiControlClass

**returns**:

> **desc**: Returns the found `GridGUI.Cell`

> **type**: GridGUI.Cell

####GetCellGroupsAt
**desc**: Retrieve the array of `GridGUI.Cell`s that are in a grid position.

**args**:

> **name**: GridPos

> **desc**: The grid position where the `GridGUI.Cell`s are retrieved from.

> **type**: GridGUI.Position

**returns**:

> **desc**: returns the array of `GridGUI.Cell`s at `GridPos`

> **type**: object

####GetNewestCellGroup
**desc**: Retrieves the most recently added `GridGUI.Cell`.

**returns**:

> **desc**: Retruns the most recent `GridGUI.Cell`.

> **type**: GridGUI.Cell

####Margin
**desc**: Sets the `GridGUI.GridGUIClass.margins` to the supplied x and y margins and updates all `GridGUI.Cell`s in `GridGUI.GridGUIClass.grid` to use the new border sizes.

**args**:

> **name**: x

> **desc**: The new horisontal margin to use, that is the spacing to the right and left of cells. If set to "" the current value will be left unchanged.

> **type**: number|string

> **name**: y

> **desc**: The new vertical margin to use, that is the spacing above and below cells. If set to "" the current value will be left unchanged.

> **type**: number|string

####ReDraw
**desc**: Resets cached calculations and calls `GridGUI.GridGUIClass.Draw` with the current positions and size.

####RemoveCell
**desc**: Removes a `GridGUI.Cell` and the associated control from the grid and gui.

**args**:

> **name**: Cell

> **desc**: The `GridGUI.Cell` that will be removed.

> **type**: GridGUI.Cell

####RemoveCellByCtrl
**desc**: Removes a `GridGUI.Cell` with a specific control from the grid.

**args**:

> **name**: Ctrl

> **desc**: The control that is used to search for the `GridGUI.Cell`

> **type**: GridGUI.ControlClass

####RemoveCellByPos
**desc**: Removes a `GridGUI.Cell` in the array of `GridGUI.Cell`s at a specific position in the grid, by the array index.

**args**:

> **name**: GridPos

> **desc**: The grid position where the `GridGUI.Cell`s are retrieved from.

> **type**: GridGUI.Position

> **name**: index

> **desc**: The index to be removed.

> **type**: number

> **default**: 1

####Show
**desc**: Shows that gui by calling `GridGUI.GUI.Show` with the given options.

**args**:

> **name**: options

> **desc**: The options that is used when calling `Gui, Show`.

> **type**: string

> **default**: AutoSize

