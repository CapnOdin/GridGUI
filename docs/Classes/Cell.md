#Cell
<figure markdown="1">

</figure>
---
##Members

!!! info ""

    ####aspectRatio
    !!! info ""

        **desc**: The aspect ratio of the cell in width divided by height. An aspect ratio of **0** means that aspectRatio wont be applied to the cell.

        **type**: number

        **default**: 

!!! info ""

    ####border
    !!! info ""

        **desc**: The border of the cell.

        **type**: [GridGUI.Position](../Position/)

        **meta**: [object]

!!! info ""

    ####borderX
    !!! info ""

        **desc**: The horizontal border or margin of the cell that is the amount of additional width beyond what the [`GridGUI.Cell.ctrl`](../Cell/#ctrl) needs that is taken up by the cell.

        **type**: number

        **default**: 5

!!! info ""

    ####borderY
    !!! info ""

        **desc**: The vertical border or margin of the cell that is the amount of additional height beyond what the [`GridGUI.Cell.ctrl`](../Cell/#ctrl) needs that is taken up by the cell.

        **type**: number

        **default**: 5

!!! info ""

    ####ctrl
    !!! info ""

        **desc**: The control that is managed by this cell. The control class needs to implement the two methods `ControlGetPos` and `Draw` as well as have the four members `initialWidth`, `initialHeight`, `initialWidthVal` and `initialHeightVal`.

        **type**: [GridGUI.Control](../GridGUI/#control)

        **meta**: [object]

!!! info ""

    ####ctrlInitialPos
    !!! info ""

        **desc**: The initial position and size of the [`GridGUI.Cell.ctrl`](../Cell/#ctrl). It is used as the min size of the [`GridGUI.Cell.ctrl`](../Cell/#ctrl) if no min size is specified.

        **type**: [GridGUI.Position](../Position/)

        **meta**: [object]

!!! info ""

    ####ctrlPos
    !!! info ""

        **desc**: The position and size when the [`GridGUI.Cell.ctrl`](../Cell/#ctrl) was last drawn.

        **type**: [GridGUI.Position](../Position/)

        **meta**: [object]

!!! info ""

    ####exH
    !!! info ""

        **desc**: The vertical expansion weight of the cell. This is used to calculate the part of the additional GUI height that this cell should take.

        **type**: number

        **default**: 0

!!! info ""

    ####exW
    !!! info ""

        **desc**: The horizontal expansion weight of the cell. This is used to calculate the part of the additional GUI width that this cell should take.

        **type**: number

        **default**: 0

!!! info ""

    ####fillH
    !!! info ""

        **desc**: Whether or not to set the height of the [`GridGUI.Cell.ctrl`](../Cell/#ctrl) to the height of the cell.

        **type**: bool

        **default**: false

!!! info ""

    ####fillW
    !!! info ""

        **desc**: Whether or not to set the width of the [`GridGUI.Cell.ctrl`](../Cell/#ctrl) to the width of the cell.

        **type**: bool

        **default**: false

!!! info ""

    ####gridpos
    !!! info ""

        **desc**: The position and size of the cell in the grid in columns and rows. That is in the same coordinate system that is used when adding cells to a [`GridGUI.GridGUIClass`](../GridGUIClass/).

        **type**: [GridGUI.Position](../Position/)

        **meta**: [object]

!!! info ""

    ####hasHConfligts
    !!! info ""

        **desc**: Whether or not the cell needs to take any other cells into account when calculating its height.

        **type**: bool

        **default**: false

!!! info ""

    ####hasWConfligts
    !!! info ""

        **desc**: Whether or not the cell needs to take any other cells into account when calculating its width.

        **type**: bool

        **default**: false

!!! info ""

    ####justifyOptions
    !!! info ""

        **desc**: How the [`GridGUI.Cell.ctrl`](../Cell/#ctrl) will be positioned in the cell when drawn. Can be any combination of `C` (Center), `N` (North), `S` (South), `W` (West) and `E` (East).

        **type**: string

        **default**: C

!!! info ""

    ####othersH
    !!! info ""

        **desc**: The combined vertical expansion weight of other cells that this cell is in conflict with. This is used to calculate the part of the additional GUI height that this cell should take.

        **type**: number

        **default**: 0

!!! info ""

    ####othersW
    !!! info ""

        **desc**: The combined horizontal expansion weight of other cells that this cell is in conflict with. This is used to calculate the part of the additional GUI width that this cell should take.

        **type**: number

        **default**: 0

!!! info ""

    ####pos
    !!! info ""

        **desc**: The position and size of the cell.

        **type**: [GridGUI.Position](../Position/)

        **meta**: [object]

##Methods

!!! note ""
    ####__Delete
    !!! tip ""

        ```AutoHotKey
        __Delete()
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Destructor. Destroys the [`GridGUI.Cell.ctrl`](../Cell/#ctrl).



!!! note ""
    ####__FindLeastUsedRowColumn
    !!! tip ""

        ```AutoHotKey
        __FindLeastUsedRowColumn(size, start, nonExpanders, expanders)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Returns the index of the where there are the lest amount of cells with a fixed size or where there is the largest expansion weight.



    ??? example "parameters"

        !!! info ""

            **name**: size

            **desc**: How many indexes to check.

            **type**: number

        !!! info ""

            **name**: start

            **desc**: What index to start checking from.

            **type**: number

        !!! info ""

            **name**: nonExpanders

            **desc**: An array of how many fixed sized cells there are in either the columns or rows.

            **type**: array

        !!! info ""

            **name**: expanders

            **desc**: An array of how many expanding cells there are in either the columns or rows.

            **type**: array

    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: The found index.

            **type**: number

!!! note ""
    ####__GetExpandedHeight
    !!! tip ""

        ```AutoHotKey
        __GetExpandedHeight(index, height, expanders, nonExpanders)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Calculates the amount of the additional height that the cell should take up.



    ??? example "parameters"

        !!! info ""

            **name**: index

            **desc**: What index of the positions in the grid that the height is wanted for.

            **type**: number

        !!! info ""

            **name**: height

            **desc**: The unclaimed height of the grid, that is the height of the grid or subgrid left after removing the height of the fixed cells.

            **type**: number

        !!! info ""

            **name**: expanders

            **desc**: An array of the sum of vertical expansion weights for each row.

            **type**: associative array

        !!! info ""

            **name**: nonExpanders

            **desc**: An array of the amount of fixed size cells in each row.

            **type**: associative array

    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: The calculated height.

            **type**: number

!!! note ""
    ####__GetExpandedHeights
    !!! tip ""

        ```AutoHotKey
        __GetExpandedHeights(index, height, expanders, nonExpanders)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Calculates the heights that the cell wants to have in each of rows that it spans over.



    ??? example "parameters"

        !!! info ""

            **name**: index

            **desc**: What index of the positions in the grid that the height is wanted for.

            **type**: number

        !!! info ""

            **name**: height

            **desc**: The unclaimed height of the grid, that is the height of the grid or subgrid left after removing the height of the fixed cells.

            **type**: number

        !!! info ""

            **name**: expanders

            **desc**: An array of the sum of vertical expansion weights for each row.

            **type**: associative array

        !!! info ""

            **name**: nonExpanders

            **desc**: An array of the amount of fixed size cells in each row.

            **type**: associative array

    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: The wanted height of the cell in each row.

            **type**: array

!!! note ""
    ####__GetExpandedWidth
    !!! tip ""

        ```AutoHotKey
        __GetExpandedWidth(index, width, expanders, nonExpanders)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Calculates the amount of the additional width that the cell should take up.



    ??? example "parameters"

        !!! info ""

            **name**: index

            **desc**: What index of the positions in the grid that the width is wanted for.

            **type**: number

        !!! info ""

            **name**: width

            **desc**: The unclaimed width of the grid, that is the width of the GUI or subgrid left after removing the width of the fixed cells.

            **type**: number

        !!! info ""

            **name**: expanders

            **desc**: An array of the sum of horizontal expansion weights for each column.

            **type**: array

        !!! info ""

            **name**: nonExpanders

            **desc**: An array of the amount of fixed size cells in each column.

            **type**: array

    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: The calculated width.

            **type**: number

!!! note ""
    ####__GetExpandedWidths
    !!! tip ""

        ```AutoHotKey
        __GetExpandedWidths(index, width, expanders, nonExpanders)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Calculates the widths that the cell wants to have in each of columns that it spans over.



    ??? example "parameters"

        !!! info ""

            **name**: index

            **desc**: What index of the positions in the grid that the width is wanted for.

            **type**: number

        !!! info ""

            **name**: width

            **desc**: The unclaimed width of the grid, that is the width of the GUI or subgrid left after removing the width of the fixed cells.

            **type**: number

        !!! info ""

            **name**: expanders

            **desc**: An array of the sum of horizontal expansion weights for each column.

            **type**: array

        !!! info ""

            **name**: nonExpanders

            **desc**: An array of the amount of fixed size cells in each column.

            **type**: array

    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: The wanted width of the cell in each column.

            **type**: array

!!! note ""
    ####__GetFixedHeight
    !!! tip ""

        ```AutoHotKey
        __GetFixedHeight()
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Returns the fixed height of the cell.



    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: The fixed height of the cell. For non vertically expanding and non vertically filling cells the min-height of the [`GridGUI.Cell.ctrl`](../Cell/#ctrl) plus 2 times the vertical margin is returned. For vertically expanding and or vertically filling cells 0 is returned unless an min-height where specified in which case the min-height of the [`GridGUI.Cell.ctrl`](../Cell/#ctrl) plus 2 time the vertical margin is returned unless the min-height is 0 then 0 is returned.

            **type**: number

!!! note ""
    ####__GetFixedWidth
    !!! tip ""

        ```AutoHotKey
        __GetFixedWidth()
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Returns the fixed width of the cell.



    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: The fixed width of the cell. For non horizontally expanding and non horizontally filling cells the min-width of the [`GridGUI.Cell.ctrl`](../Cell/#ctrl) plus 2 times the horizontal margin is returned. For horizontally expanding and or horizontally filling cells 0 is returned unless an min-width where specified in which case the min-width of the [`GridGUI.Cell.ctrl`](../Cell/#ctrl) plus 2 time the vertical margin is returned unless the min-width is 0 then 0 is returned.

            **type**: number

!!! note ""
    ####__GetNeededHeight
    !!! tip ""

        ```AutoHotKey
        __GetNeededHeight()
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Returns the needed height of the cell.



    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: The needed height of the cell. That is the min-height of the [`GridGUI.Cell.ctrl`](../Cell/#ctrl) plus two times the vertical margin.

            **type**: number

!!! note ""
    ####__GetNeededWidth
    !!! tip ""

        ```AutoHotKey
        __GetNeededWidth()
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Returns the needed width of the cell.



    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: The needed width of the cell. That is the min-width of the [`GridGUI.Cell.ctrl`](../Cell/#ctrl) plus two times the horizontal margin.

            **type**: number

!!! note ""
    ####__New
    !!! tip ""

        ```AutoHotKey
        __New(pos, ctrl, exW := 0, exH := 0, fillW := false, fillH := false, justify := C, borderX := 5, borderY := 5, aspectRatio := )
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Constructor.



    ??? example "parameters"

        !!! info ""

            **name**: pos

            **desc**: The position and size of the cell in the grid in columns and rows. That is in the same coordinate system that is used when adding cells to a [`GridGUI.GridGUIClass`](../GridGUIClass/).

            **type**: [GridGUI.Position](../Position/)

        !!! info ""

            **name**: ctrl

            **desc**: The control that will be managed by this cell. The control class needs to implement the two methods `ControlGetPos` and `Draw` as well as have the four members `initialWidth`, `initialHeight`, `initialWidthVal` and `initialHeightVal`.

            **type**: [GridGUI.Control](../GridGUI/#control)

        !!! info ""

            **name**: exW

            **desc**: The horizontal expansion weight of the cell. This is used to calculate the part of the additional GUI width that this cell should take.

            **type**: number

            **default**: 0

        !!! info ""

            **name**: exH

            **desc**: The vertical expansion weight of the cell. This is used to calculate the part of the additional GUI height that this cell should take.

            **type**: number

            **default**: 0

        !!! info ""

            **name**: fillW

            **desc**: Whether or not to set the width of the [`GridGUI.Cell.ctrl`](../Cell/#ctrl) to the width of the cell.

            **type**: bool

            **default**: false

        !!! info ""

            **name**: fillH

            **desc**: Whether or not to set the height of the [`GridGUI.Cell.ctrl`](../Cell/#ctrl) to the height of the cell.

            **type**: bool

            **default**: false

        !!! info ""

            **name**: justify

            **desc**: How the [`GridGUI.Cell.ctrl`](../Cell/#ctrl) will be positioned in the cell when drawn. Can be any combination of `C` (Center), `N` (North), `S` (South), `W` (West) and `E` (East).

            **type**: string

            **default**: C

        !!! info ""

            **name**: borderX

            **desc**: The horizontal border or margin of the cell that is the amount of additional width beyond what the control needs that is taken up by the cell.

            **type**: number

            **default**: 5

        !!! info ""

            **name**: borderY

            **desc**: The vertical border or margin of the cell that is the amount of additional height beyond what the control needs that is taken up by the cell.

            **type**: number

            **default**: 5

        !!! info ""

            **name**: aspectRatio

            **desc**: The aspect ratio of the cell in width divided by height. An aspect ratio of **0** means that aspectRatio wont be applied to the cell.

            **type**: number

            **default**: 

    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: A new [`GridGUI.Cell`](../Cell/) instance.

            **type**: [GridGUI.Cell](../Cell/)

!!! note ""
    ####__Sum
    !!! tip ""

        ```AutoHotKey
        __Sum(obj, start, end)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Calculates a partial sum of values in an array from a start index to an end index.



    ??? example "parameters"

        !!! info ""

            **name**: obj

            **desc**: The array to calculate the sum of.

            **type**: array

        !!! info ""

            **name**: start

            **desc**: The start index of the range to sum.

            **type**: number

        !!! info ""

            **name**: end

            **desc**: The end index of the range to sum.

            **type**: number

    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: The sum of the sub-array.

            **type**: number

!!! note ""
    ####CalculateCtrlSize
    !!! tip ""

        ```AutoHotKey
        CalculateCtrlSize(pos)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Calculates the size the [`GridGUI.Cell.ctrl`](../Cell/#ctrl) should use given a specific cell size.



    ??? example "parameters"

        !!! info ""

            **name**: pos

            **desc**: The size to fit the [`GridGUI.Cell.ctrl`](../Cell/#ctrl) within.

            **type**: [GridGUI.Position](../Position/)

    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: An area sized according to the cell members to fit within `pos`.

            **type**: [GridGUI.Position](../Position/)

!!! note ""
    ####Center
    !!! tip ""

        ```AutoHotKey
        Center(area, pos)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Centres one area in another.



    ??? example "parameters"

        !!! info ""

            **name**: area

            **desc**: The area that should be centred in relation to.

            **type**: [GridGUI.Position](../Position/)

        !!! info ""

            **name**: pos

            **desc**: The area to centre.

            **type**: [GridGUI.Position](../Position/)

    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: A copy of `pos` centred in `area`.

            **type**: [GridGUI.Position](../Position/)

!!! note ""
    ####DestroyCtrl
    !!! tip ""

        ```AutoHotKey
        DestroyCtrl()
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Destroys the [`GridGUI.Cell.ctrl`](../Cell/#ctrl).



!!! note ""
    ####GetExpandedHeight
    !!! tip ""

        ```AutoHotKey
        GetExpandedHeight(index, height, expandersH, nonExpandersH, width, expandersW, nonExpandersW)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Calculates the amount of the additional height that the cell should take up and applies the aspect ratio of [`GridGUI.Cell.aspectRatio`](../Cell/#aspectratio) if non zero.



    ??? example "parameters"

        !!! info ""

            **name**: index

            **desc**: What index of the positions in the grid that the height is wanted for.

            **type**: number

        !!! info ""

            **name**: height

            **desc**: The unclaimed height of the grid, that is the height of the grid or subgrid left after removing the height of the fixed cells.

            **type**: number

        !!! info ""

            **name**: expandersH

            **desc**: An array of the sum of vertical expansion weights for each row.

            **type**: associative array

        !!! info ""

            **name**: nonExpandersH

            **desc**: An array of the amount of fixed size cells in each row.

            **type**: associative array

        !!! info ""

            **name**: width

            **desc**: The unclaimed width of the grid, that is the width of the GUI or subgrid left after removing the width of the fixed cells.

            **type**: number

        !!! info ""

            **name**: expandersW

            **desc**: An array of the sum of horizontal expansion weights for each column.

            **type**: array

        !!! info ""

            **name**: nonExpandersW

            **desc**: An array of the amount of fixed size cells in each column.

            **type**: array

    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: The calculated height.

            **type**: number

!!! note ""
    ####GetExpandedWidth
    !!! tip ""

        ```AutoHotKey
        GetExpandedWidth(index, width, expandersW, nonExpandersW, height, expandersH, nonExpandersH)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Calculates the amount of the additional width that the cell should take up and applies the aspect ratio of [`GridGUI.Cell.aspectRatio`](../Cell/#aspectratio) if non zero.



    ??? example "parameters"

        !!! info ""

            **name**: index

            **desc**: What index of the positions in the grid that the width is wanted for.

            **type**: number

        !!! info ""

            **name**: width

            **desc**: The unclaimed width of the grid, that is the width of the GUI or subgrid left after removing the width of the fixed cells.

            **type**: number

        !!! info ""

            **name**: expandersW

            **desc**: An array of the sum of horizontal expansion weights for each column.

            **type**: array

        !!! info ""

            **name**: nonExpandersW

            **desc**: An array of the amount of fixed size cells in each column.

            **type**: array

        !!! info ""

            **name**: height

            **desc**: The unclaimed height of the grid, that is the height of the grid or subgrid left after removing the height of the fixed cells.

            **type**: number

        !!! info ""

            **name**: expandersH

            **desc**: An array of the sum of vertical expansion weights for each row.

            **type**: associative array

        !!! info ""

            **name**: nonExpandersH

            **desc**: An array of the amount of fixed size cells in each row.

            **type**: associative array

    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: The calculated width.

            **type**: number

!!! note ""
    ####GetExpansionHeightValue
    !!! tip ""

        ```AutoHotKey
        GetExpansionHeightValue()
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Getter for [`GridGUI.Cell.exH`](../Cell/#exh).



    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: The vertical expansion weight.

            **type**: number

!!! note ""
    ####GetExpansionWidthValue
    !!! tip ""

        ```AutoHotKey
        GetExpansionWidthValue()
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Getter for [`GridGUI.Cell.exW`](../Cell/#exw).



    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: The horizontal expansion weight.

            **type**: number

!!! note ""
    ####GetFixedHeight
    !!! tip ""

        ```AutoHotKey
        GetFixedHeight()
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Returns the fixed height of the cell and applies the aspect ratio of [`GridGUI.Cell.aspectRatio`](../Cell/#aspectratio) if non zero.



    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: The fixed height of the cell. For non vertically expanding and non vertically filling cells the min-height of the [`GridGUI.Cell.ctrl`](../Cell/#ctrl) plus 2 times the vertical margin is returned. For vertically expanding and or vertically filling cells 0 is returned unless an min-height where specified in which case the min-height of the [`GridGUI.Cell.ctrl`](../Cell/#ctrl) plus 2 time the vertical margin is returned unless the min-height is 0 then 0 is returned.

            **type**: number

!!! note ""
    ####GetFixedWidth
    !!! tip ""

        ```AutoHotKey
        GetFixedWidth()
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Returns the fixed width of the cell and applies the aspect ratio of [`GridGUI.Cell.aspectRatio`](../Cell/#aspectratio) if non zero.



    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: The fixed width of the cell. For non horizontally expanding and non horizontally filling cells the min-width of the [`GridGUI.Cell.ctrl`](../Cell/#ctrl) plus 2 times the horizontal margin is returned. For horizontally expanding and or horizontally filling cells 0 is returned unless an min-width where specified in which case the min-width of the [`GridGUI.Cell.ctrl`](../Cell/#ctrl) plus 2 time the vertical margin is returned unless the min-width is 0 then 0 is returned.

            **type**: number

!!! note ""
    ####GetNeededHeight
    !!! tip ""

        ```AutoHotKey
        GetNeededHeight()
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Returns the needed height of the cell and applies the aspect ratio of [`GridGUI.Cell.aspectRatio`](../Cell/#aspectratio) if non zero.



    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: The needed height of the cell. That is the min-height of the [`GridGUI.Cell.ctrl`](../Cell/#ctrl) plus two times the vertical margin.

            **type**: number

!!! note ""
    ####GetNeededWidth
    !!! tip ""

        ```AutoHotKey
        GetNeededWidth()
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Returns the needed width of the cell and applies the aspect ratio of [`GridGUI.Cell.aspectRatio`](../Cell/#aspectratio) if non zero.



    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: The needed width of the cell. That is the min-width of the [`GridGUI.Cell.ctrl`](../Cell/#ctrl) plus two times the horizontal margin.

            **type**: number

!!! note ""
    ####Justify
    !!! tip ""

        ```AutoHotKey
        Justify(area, pos)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Justifies an area within another area. That is places the area according to a set of rules within the larger area.



    ??? example "parameters"

        !!! info ""

            **name**: area

            **desc**: The area to position the other area within.

            **type**: [GridGUI.Position](../Position/)

        !!! info ""

            **name**: pos

            **desc**: The area to position in the larger area.

            **type**: [GridGUI.Position](../Position/)

    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: A copy of `pos` that is justified within `area`.

            **type**: [GridGUI.Position](../Position/)

!!! note ""
    ####SetArea
    !!! tip ""

        ```AutoHotKey
        SetArea(offset, widths, heights)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Sets the position and size of the cell.



    ??? example "parameters"

        !!! info ""

            **name**: offset

            **desc**: The coordinate offset that the cell should be translated by. Used to support [`GridGUI.SubGrid`](../SubGrid/)s within a GUI, since the calculated positions are relative to the client area.

            **type**: [GridGUI.Position](../Position/)

        !!! info ""

            **name**: widths

            **desc**: An array of the calculate width for each column.

            **type**: array

        !!! info ""

            **name**: heights

            **desc**: An array of the calculate height for each row.

            **type**: array

!!! note ""
    ####SetAspectRatio
    !!! tip ""

        ```AutoHotKey
        SetAspectRatio(ratio := "")
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Sets the aspect ratio of the cell.



    ??? example "parameters"

        !!! info ""

            **name**: ratio

            **desc**: The ratio to set for the cell in width divided by height. An empty ratio will set the ratio to the current width of the cell divided by the current height of the cell.

            **type**: number|""

            **default**: ""

!!! note ""
    ####ToolTip
    !!! tip ""

        ```AutoHotKey
        ToolTip()
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Shows a tooltip of the cell as a string.



!!! note ""
    ####ToStr
    !!! tip ""

        ```AutoHotKey
        ToStr(indent := "")
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Converts the object to a string.



    ??? example "parameters"

        !!! info ""

            **name**: indent

            **desc**: The amount of indentation to add on each line.

            **type**: string

            **default**: ""

    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: A string representing this cell.

            **type**: string

!!! note ""
    ####Update
    !!! tip ""

        ```AutoHotKey
        Update()
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Updates the position of the [`GridGUI.Cell.ctrl`](../Cell/#ctrl) and draws it.



