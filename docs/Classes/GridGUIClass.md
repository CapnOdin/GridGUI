#GridGUIClass
<figure markdown="1">

</figure>
---
##Members

!!! info ""

    ####grid
    !!! info ""

        **desc**: The grid that controls are put into.

        **type**: [GridGUI.Grid](../Grid/)

        **default**: GridGUI.Grid

!!! info ""

    ####gridlines
    !!! info ""

        **desc**: The container for the horisontal and vertical grid line controls shown when [`GridGUI.GridGUIClass.showGrid`](../GridGUIClass/#showgrid) is true.

        **type**: array

        **default**: [[], []]

        **link**: [link](https://www.autohotkey.com/docs/objects/Object.htm)

!!! info ""

    ####margins
    !!! info ""

        **desc**: The additional space that is added around controls that are added to the grid.

        **type**: object

        **default**: {x: 5, y: 5}

!!! info ""

    ####showGrid
    !!! info ""

        **desc**: Used to remember what parameter the [`GridGUI.GridGUIClass`](../GridGUIClass/) instance was created with and to decide whether or not to move the debug grid when drawn.

        **type**: bool

##Methods

!!! note ""
    ####__DrawGrid
    !!! tip ""

        ```AutoHotKey
        __DrawGrid(area)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Moves the debug grid line controls to the appropriate locations.



    ??? example "parameters"

        !!! info ""

            **name**: area

            **desc**: the area where in the debug grid lines are moved.

            **type**: [GridGUI.Position](../Position/)

!!! note ""
    ####__Init
    !!! tip ""

        ```AutoHotKey
        __Init(showGrid)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Initialises the class members.



    ??? example "parameters"

        !!! info ""

            **name**: showGrid

            **desc**: Whether or not to show a grid for the control that where placed on the gui before it was shown the first time.

            **type**: bool

!!! note ""
    ####__New
    !!! tip ""

        ```AutoHotKey
        __New(title := "", options := "", showGrid := false, justify := false)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Constructor.



    ??? example "parameters"

        !!! info ""

            **name**: title

            **desc**: The title that the new gui window will have

            **type**: string

            **default**: ""

        !!! info ""

            **name**: options

            **desc**: The ahk gui options that the window will be created with

            **type**: string

            **default**: ""

            **link**: [link](https://www.autohotkey.com/docs/commands/Gui.htm#Options)

        !!! info ""

            **name**: showGrid

            **desc**: Whether or not to show a grid for the control that where placed on the gui before it was shown the first time.

            **type**: bool

            **default**: false

        !!! info ""

            **name**: justify

            **desc**: The position of the controls with in the grid, can be any combination of `C` (Center), `N` (North), `S` (South), `W` (West) and `E` (East).

            **type**: string|false

            **default**: false

    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: Returns a new instance of [`GridGUI.GridGUIClass`](../GridGUIClass/)

            **type**: [GridGUI.GridGUIClass](../GridGUIClass/)

!!! note ""
    ####__TranslateGridPos
    !!! tip ""

        ```AutoHotKey
        __TranslateGridPos(x, y)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Transforms the cordinate syntax used when adding controls to a grid area



    ??? example "parameters"

        !!! info ""

            **name**: x

            **desc**: The Columns that the cell spans over. When more than one column is wanted separate the start and end columns with a hyphen, e.g. "2-5".

            **type**: string|number

        !!! info ""

            **name**: y

            **desc**: The Rows that the cell spans over. When more than one row is wanted separate the start and end rows with a hyphen, e.g. "2-5".

            **type**: string|number

    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: Returns the translated position as a point with a width and a height.

            **type**: [GridGUI.Position](../Position/)

!!! note ""
    ####_GuiMoved
    !!! tip ""

        ```AutoHotKey
        _GuiMoved(pos)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } A callback called when the gui was moved that calls the [`GridGUI.GUI._GuiMoved`](../GUI/#_guimoved) and shows a debug tooltip with the position if [`GridGUI.GridGUIClass.showGrid`](../GridGUIClass/#showgrid) is true.



    ??? example "parameters"

        !!! info ""

            **name**: pos

            **desc**: The new position, only containing coordinate of the top right corner.

            **type**: [GridGUI.Position](../Position/)

!!! note ""
    ####_GuiSize
    !!! tip ""

        ```AutoHotKey
        _GuiSize(pos)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } A callback called when the gui was resized, that calls the [`GridGUI.GridGUIClass.Draw`](../GridGUIClass/#draw) method, [`GridGUI.GUI._GuiSize`](../GUI/#_guisize) and draws the debug grid if [`GridGUI.GridGUIClass.showGrid`](../GridGUIClass/#showgrid) is true.



    ??? example "parameters"

        !!! info ""

            **name**: pos

            **desc**: The new area, only containing width and height of the gui, that is x and y is both zero.

            **type**: [GridGUI.Position](../Position/)

!!! note ""
    ####Add
    !!! tip ""

        ```AutoHotKey
        Add(x, y, type, options := "", text := "", exW := 0, exH := 0, fillW := false, fillH := false, justify := "C")
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Adds a new cell with any of the standard controls to the grid and gui.



    ??? example "parameters"

        !!! info ""

            **name**: x

            **desc**: The Columns that the cell spans over. When more than one column is wanted separate the start and end columns with a hyphen, e.g. "2-5".

            **type**: string|number

        !!! info ""

            **name**: y

            **desc**: The Rows that the cell spans over. When more than one row is wanted separate the start and end rows with a hyphen, e.g. "2-5".

            **type**: string|number

        !!! info ""

            **name**: type

            **desc**: The type of the control. Can be `Text, Edit, UpDown, Picture, Button, Checkbox, DropDownList, ComboBox, ListBox, Link, Hotkey, DateTime, MonthCal, Slider, Progress, GroupBox and ActiveX`. For `Radio, ListView, TreeView, Tab3 and StatusBar` see [AdditionalControls](AdditionalControls)

            **type**: string

        !!! info ""

            **name**: options

            **desc**: The options that the GuiControl will be created with. Does not accept vVars. Can be an object with keys the same names as the optional arguments that this method takes.

            **type**: string

            **default**: ""

            **link**: [link](https://www.autohotkey.com/docs/commands/Gui.htm#OtherOptions)

        !!! info ""

            **name**: text

            **desc**: The text that the control will be created with.

            **type**: string

            **default**: ""

        !!! info ""

            **name**: exW

            **desc**: How much of the excess width the cell should take up relative to the other width expanding cells. Can be an object with keys the same names as the optional arguments that this method takes.

            **type**: number

            **default**: 0

        !!! info ""

            **name**: exH

            **desc**: How much of the excess height the cell should take up relative to the other height expanding cells.

            **type**: number

            **default**: 0

        !!! info ""

            **name**: fillW

            **desc**: Whether or not the control should fill the width of the cell.

            **type**: bool

            **default**: false

        !!! info ""

            **name**: fillH

            **desc**: Whether or not the control should fill the height of the cell.

            **type**: bool

            **default**: false

        !!! info ""

            **name**: justify

            **desc**: The position of the control with in the cell, can be any combination of `C` (Center), `N` (North), `S` (South), `W` (West) and `E` (East).

            **type**: string

            **default**: "C"

    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: Returns the added control

            **type**: [GridGUI.ArbitraryControl](../ArbitraryControl/)

!!! note ""
    ####AddControl
    !!! tip ""

        ```AutoHotKey
        AddControl(x, y, ctrl, exW := 0, exH := 0, fillW := false, fillH := false, justify := "C")
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Adds a new cell to the grid and sets the cells control to the supplied control class instance.



    ??? example "parameters"

        !!! info ""

            **name**: x

            **desc**: The Columns that the cell spans over. When more than one column is wanted separate the start and end columns with a hyphen, e.g. "2-5".

            **type**: string|number

        !!! info ""

            **name**: y

            **desc**: The Rows that the cell spans over. When more than one row is wanted separate the start and end rows with a hyphen, e.g. "2-5".

            **type**: string|number

        !!! info ""

            **name**: ctrl

            **desc**: The control that will be put in the cell.

            **type**: [GridGUI.GuiControlClass](../GuiControlClass/)

        !!! info ""

            **name**: exW

            **desc**: How much of the excess width the cell should take up relative to the other width expanding cells. Can be an object with keys the same names as the optional arguments that this method takes.

            **type**: number

            **default**: 0

        !!! info ""

            **name**: exH

            **desc**: How much of the excess height the cell should take up relative to the other height expanding cells.

            **type**: number

            **default**: 0

        !!! info ""

            **name**: fillW

            **desc**: Whether or not the control should fill the width of the cell.

            **type**: bool

            **default**: false

        !!! info ""

            **name**: fillH

            **desc**: Whether or not the control should fill the height of the cell.

            **type**: bool

            **default**: false

        !!! info ""

            **name**: justify

            **desc**: The position of the control with in the cell, can be any combination of `C` (Center), `N` (North), `S` (South), `W` (West) and `E` (East).

            **type**: string

            **default**: "C"

    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: Returns the control that the method was called with.

            **type**: [GridGUI.GuiControlClass](../GuiControlClass/)

!!! note ""
    ####AutoSize
    !!! tip ""

        ```AutoHotKey
        AutoSize()
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Calculates the minimum size required to show all the controls in the grid and sets the [`GridGUI.GUI.pos`](../GUI/#pos) to the calculated width and height, as well as updates the controls in the grid to their positions. Can be used to reduce the number of controls that a noticeable misplaced when the gui is drawn the first time if called before calling [`GridGUI.GridGUIClass.Show`](../GridGUIClass/#show).



!!! note ""
    ####Draw
    !!! tip ""

        ```AutoHotKey
        Draw(pos)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Calculates the new positions of the controls in the grid based on the settings of their [`GridGUI.Cell`](../Cell/) and moved them to their new positions.



    ??? example "parameters"

        !!! info ""

            **name**: pos

            **desc**: The area the controls will be put into and sized to fit if [`GridGUI.Cell.exW`](../Cell/#exw), [`GridGUI.Cell.exH`](../Cell/#exh), [`GridGUI.Cell.fillW`](../Cell/#fillw) or [`GridGUI.Cell.fillH`](../Cell/#fillh) of the cell that the control occupies are set.

            **type**: [GridGUI.Position](../Position/)

!!! note ""
    ####GetCellGroup
    !!! tip ""

        ```AutoHotKey
        GetCellGroup(Ctrl)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Retrieve a [`GridGUI.Cell`](../Cell/) by its associated control.



    ??? example "parameters"

        !!! info ""

            **name**: Ctrl

            **desc**: The control used to match the right [`GridGUI.Cell`](../Cell/)

            **type**: [GridGUI.GuiControlClass](../GuiControlClass/)

    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: Returns the found [`GridGUI.Cell`](../Cell/)

            **type**: [GridGUI.Cell](../Cell/)

!!! note ""
    ####GetCellGroupsAt
    !!! tip ""

        ```AutoHotKey
        GetCellGroupsAt(GridPos)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Retrieve the array of [`GridGUI.Cell`](../Cell/)s that are in a grid position.



    ??? example "parameters"

        !!! info ""

            **name**: GridPos

            **desc**: The grid position where the [`GridGUI.Cell`](../Cell/)s are retrieved from.

            **type**: [GridGUI.Position](../Position/)

    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: returns the array of [`GridGUI.Cell`](../Cell/)s at `GridPos`

            **type**: object

!!! note ""
    ####GetNewestCellGroup
    !!! tip ""

        ```AutoHotKey
        GetNewestCellGroup()
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Retrieves the most recently added [`GridGUI.Cell`](../Cell/).



    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: Retruns the most recent [`GridGUI.Cell`](../Cell/).

            **type**: [GridGUI.Cell](../Cell/)

!!! note ""
    ####Margin
    !!! tip ""

        ```AutoHotKey
        Margin(x := "", y := "")
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Sets the [`GridGUI.GridGUIClass.margins`](../GridGUIClass/#margins) to the supplied x and y margins and updates all [`GridGUI.Cell`](../Cell/)s in [`GridGUI.GridGUIClass.grid`](../GridGUIClass/#grid) to use the new border sizes.



    ??? example "parameters"

        !!! info ""

            **name**: x

            **desc**: The new horisontal margin to use, that is the spacing to the right and left of cells. If set to "" the current value will be left unchanged.

            **type**: number|string

            **default**: ""

        !!! info ""

            **name**: y

            **desc**: The new vertical margin to use, that is the spacing above and below cells. If set to "" the current value will be left unchanged.

            **type**: number|string

            **default**: ""

!!! note ""
    ####ReDraw
    !!! tip ""

        ```AutoHotKey
        ReDraw()
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Resets cached calculations and calls [`GridGUI.GridGUIClass.Draw`](../GridGUIClass/#draw) with the current positions and size.



!!! note ""
    ####RemoveCell
    !!! tip ""

        ```AutoHotKey
        RemoveCell(Cell)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Removes a [`GridGUI.Cell`](../Cell/) and the associated control from the grid and gui.



    ??? example "parameters"

        !!! info ""

            **name**: Cell

            **desc**: The [`GridGUI.Cell`](../Cell/) that will be removed.

            **type**: [GridGUI.Cell](../Cell/)

!!! note ""
    ####RemoveCellByCtrl
    !!! tip ""

        ```AutoHotKey
        RemoveCellByCtrl(Ctrl)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Removes a [`GridGUI.Cell`](../Cell/) with a specific control from the grid.



    ??? example "parameters"

        !!! info ""

            **name**: Ctrl

            **desc**: The control that is used to search for the [`GridGUI.Cell`](../Cell/)

            **type**: [GridGUI.ControlClass](../ControlClass/)

!!! note ""
    ####RemoveCellByPos
    !!! tip ""

        ```AutoHotKey
        RemoveCellByPos(GridPos, index := 1)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Removes a [`GridGUI.Cell`](../Cell/) in the array of [`GridGUI.Cell`](../Cell/)s at a specific position in the grid, by the array index.



    ??? example "parameters"

        !!! info ""

            **name**: GridPos

            **desc**: The grid position where the [`GridGUI.Cell`](../Cell/)s are retrieved from.

            **type**: [GridGUI.Position](../Position/)

        !!! info ""

            **name**: index

            **desc**: The index to be removed.

            **type**: number

            **default**: 1

!!! note ""
    ####Show
    !!! tip ""

        ```AutoHotKey
        Show(options := AutoSize)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Shows that gui by calling [`GridGUI.GUI.Show`](../GUI/#show) with the given options.



    ??? example "parameters"

        !!! info ""

            **name**: options

            **desc**: The options that is used when calling `Gui, Show`.

            **type**: string

            **default**: AutoSize

            **link**: [link](https://www.autohotkey.com/docs/commands/Gui.htm#Show)

