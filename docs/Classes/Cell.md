#Cell
<figure markdown="1">

</figure>
---
##Members

####aspectRatio

> **desc**: The aspect ratio of the cell in width divided by height. An aspect ratio of **0** means that aspectRatio wont be applied to the cell.

> **type**: number

####border

> **desc**: The border of the cell.

> **type**: [GridGUI.Position](../Position/)

####borderX

> **desc**: The horisontal border or margin of the cell that is the amount of additional width beyond what the [`GridGUI.Cell.ctrl`](../Cell/#ctrl) needs that is taken up by the cell.

> **type**: number

> **default**: 5

####borderY

> **desc**: The vertical border or margin of the cell that is the amount of additional height beyond what the [`GridGUI.Cell.ctrl`](../Cell/#ctrl) needs that is taken up by the cell.

> **type**: number

> **default**: 5

####ctrl

> **desc**: The control that is managed by this cell. The control class needs to implement the two methods `ControlGetPos` and `Draw` as well as have the four members `initialWidth`, `initialHeight`, `initialWidthVal` and `initialHeightVal`.

> **type**: [GridGUI.Control](../GridGUI/#control)

####ctrlInitialPos

> **desc**: The initial position and size of the [`GridGUI.Cell.ctrl`](../Cell/#ctrl). It is used as the min size of the [`GridGUI.Cell.ctrl`](../Cell/#ctrl) if no min size is specified.

> **type**: [GridGUI.Position](../Position/)

####ctrlPos

> **desc**: The position and size when the [`GridGUI.Cell.ctrl`](../Cell/#ctrl) was last drawn.

> **type**: [GridGUI.Position](../Position/)

####exH

> **desc**: The vertical expansion weight of the cell. This is used to calculate the part of the additional GUI height that this cell should take.

> **type**: number

####exW

> **desc**: The horisontal expansion weight of the cell. This is used to calculate the part of the additional GUI width that this cell should take.

> **type**: number

####fillH

> **desc**: Whether or not to set the height of the [`GridGUI.Cell.ctrl`](../Cell/#ctrl) to the height of the cell.

> **type**: bool

####fillW

> **desc**: Whether or not to set the width of the [`GridGUI.Cell.ctrl`](../Cell/#ctrl) to the width of the cell.

> **type**: bool

####gridpos

> **desc**: The position and size of the cell in the grid in columns and rows. That is in the same coordinate system that is used when adding cells to a [`GridGUI.GridGUIClass`](../GridGUIClass/).

> **type**: [GridGUI.Position](../Position/)

####hasHConfligts

> **desc**: Whether or not the cell needs to take any other cells into account when calculating its height.

> **type**: bool

####hasWConfligts

> **desc**: Whether or not the cell needs to take any other cells into account when calculating its width.

> **type**: bool

####justifyOptions

> **desc**: How the [`GridGUI.Cell.ctrl`](../Cell/#ctrl) will be positioned in the cell when drawn. Can be any combination of `C` (Center), `N` (North), `S` (South), `W` (West) and `E` (East).

> **type**: string

> **default**: C

####othersH

> **desc**: The combined vertical expansion weight of other cells that this cell is in conflict with. This is used to calculate the part of the additional GUI height that this cell should take.

> **type**: number

####othersW

> **desc**: The combined horisontal expansion weight of other cells that this cell is in conflict with. This is used to calculate the part of the additional GUI width that this cell should take.

> **type**: number

####pos

> **desc**: The position and size of the cell.

> **type**: [GridGUI.Position](../Position/)

##Methods

####__Delete
**desc**: Destructor. Destroys the [`GridGUI.Cell.ctrl`](../Cell/#ctrl).

####__FindLeastUsedRowColumn
**desc**: Returns the index of the where there are the lest amount of cells with a fixed size or where there is the largest expansion weight.

**args**:

> **name**: size

> **desc**: How many indexes to check.

> **type**: number

> **name**: start

> **desc**: What index to start checking from.

> **type**: number

> **name**: nonExpanders

> **desc**: An array of how many fixed sized cells there are in either the columns or rows.

> **type**: array

> **name**: expanders

> **desc**: An array of how many expanding cells there are in either the columns or rows.

> **type**: array

**returns**:

> **desc**: The found index.

> **type**: number

####__GetExpandedHeight
**desc**: Calculates the amount of the additional height that the cell should take up.

**args**:

> **name**: index

> **desc**: What index of the positions in the grid that the height is wanted for.

> **type**: number

> **name**: height

> **desc**: The unclaimed height of the grid, that is the height of the grid or subgrid left after removing the height of the fixed cells.

> **type**: number

> **name**: expanders

> **desc**: An array of the sum of vertical expansion weights for each row.

> **type**: associative array

> **name**: nonExpanders

> **desc**: An array of the amount of fixed size cells in each row.

> **type**: associative array

**returns**:

> **desc**: The calculated height.

> **type**: number

####__GetExpandedHeights
**desc**: Calculates the heights that the cell wants to have in each of rows that it spans over.

**args**:

> **name**: index

> **desc**: What index of the positions in the grid that the height is wanted for.

> **type**: number

> **name**: height

> **desc**: The unclaimed height of the grid, that is the height of the grid or subgrid left after removing the height of the fixed cells.

> **type**: number

> **name**: expanders

> **desc**: An array of the sum of vertical expansion weights for each row.

> **type**: associative array

> **name**: nonExpanders

> **desc**: An array of the amount of fixed size cells in each row.

> **type**: associative array

**returns**:

> **desc**: The wanted height of the cell in each row.

> **type**: array

####__GetExpandedWidth
**desc**: Calculates the amount of the additional width that the cell should take up.

**args**:

> **name**: index

> **desc**: What index of the positions in the grid that the width is wanted for.

> **type**: number

> **name**: width

> **desc**: The unclaimed width of the grid, that is the width of the GUI or subgrid left after removing the width of the fixed cells.

> **type**: number

> **name**: expanders

> **desc**: An array of the sum of horisontal expansion weights for each column.

> **type**: array

> **name**: nonExpanders

> **desc**: An array of the amount of fixed size cells in each column.

> **type**: array

**returns**:

> **desc**: The calculated width.

> **type**: number

####__GetExpandedWidths
**desc**: Calculates the widths that the cell wants to have in each of columns that it spans over.

**args**:

> **name**: index

> **desc**: What index of the positions in the grid that the width is wanted for.

> **type**: number

> **name**: width

> **desc**: The unclaimed width of the grid, that is the width of the GUI or subgrid left after removing the width of the fixed cells.

> **type**: number

> **name**: expanders

> **desc**: An array of the sum of horisontal expansion weights for each column.

> **type**: array

> **name**: nonExpanders

> **desc**: An array of the amount of fixed size cells in each column.

> **type**: array

**returns**:

> **desc**: The wanted width of the cell in each column.

> **type**: array

####__GetFixedHeight
**desc**: Returns the fixed height of the cell.

**returns**:

> **desc**: The fixed height of the cell. For non vertically expanding and non vertically filling cells the min-height of the [`GridGUI.Cell.ctrl`](../Cell/#ctrl) plus 2 times the vertical margin is returned. For vertically expanding and or vertically filling cells 0 is returned unless an min-height where specified in which case the min-height of the [`GridGUI.Cell.ctrl`](../Cell/#ctrl) plus 2 time the vertical margin is returned unless the min-height is 0 then 0 is returned.

> **type**: number

####__GetFixedWidth
**desc**: Returns the fixed width of the cell.

**returns**:

> **desc**: The fixed width of the cell. For non horisontally expanding and non horisontally filling cells the min-width of the [`GridGUI.Cell.ctrl`](../Cell/#ctrl) plus 2 times the horisontal margin is returned. For horisontally expanding and or horisontally filling cells 0 is returned unless an min-width where specified in which case the min-width of the [`GridGUI.Cell.ctrl`](../Cell/#ctrl) plus 2 time the vertical margin is returned unless the min-width is 0 then 0 is returned.

> **type**: number

####__GetNeededHeight
**desc**: Returns the needed height of the cell.

**returns**:

> **desc**: The needed height of the cell. That is the min-height of the [`GridGUI.Cell.ctrl`](../Cell/#ctrl) plus two times the vertical margin.

> **type**: number

####__GetNeededWidth
**desc**: Returns the needed width of the cell.

**returns**:

> **desc**: The needed width of the cell. That is the min-width of the [`GridGUI.Cell.ctrl`](../Cell/#ctrl) plus two times the horisontal margin.

> **type**: number

####__New
**desc**: Constructor.

**args**:

> **name**: pos

> **desc**: The position and size of the cell in the grid in columns and rows. That is in the same coordinate system that is used when adding cells to a [`GridGUI.GridGUIClass`](../GridGUIClass/).

> **type**: [GridGUI.Position](../Position/)

> **name**: ctrl

> **desc**: The control that will be managed by this cell. The control class needs to implement the two methods `ControlGetPos` and `Draw` as well as have the four members `initialWidth`, `initialHeight`, `initialWidthVal` and `initialHeightVal`.

> **type**: [GridGUI.Control](../GridGUI/#control)

> **name**: exW

> **desc**: The horisontal expansion weight of the cell. This is used to calculate the part of the additional GUI width that this cell should take.

> **type**: number

> **name**: exH

> **desc**: The vertical expansion weight of the cell. This is used to calculate the part of the additional GUI height that this cell should take.

> **type**: number

> **name**: fillW

> **desc**: Whether or not to set the width of the [`GridGUI.Cell.ctrl`](../Cell/#ctrl) to the width of the cell.

> **type**: bool

> **name**: fillH

> **desc**: Whether or not to set the height of the [`GridGUI.Cell.ctrl`](../Cell/#ctrl) to the height of the cell.

> **type**: bool

> **name**: justify

> **desc**: How the [`GridGUI.Cell.ctrl`](../Cell/#ctrl) will be positioned in the cell when drawn. Can be any combination of `C` (Center), `N` (North), `S` (South), `W` (West) and `E` (East).

> **type**: string

> **default**: C

> **name**: borderX

> **desc**: The horisontal border or margin of the cell that is the amount of additional width beyond what the control needs that is taken up by the cell.

> **type**: number

> **default**: 5

> **name**: borderY

> **desc**: The vertical border or margin of the cell that is the amount of additional height beyond what the control needs that is taken up by the cell.

> **type**: number

> **default**: 5

> **name**: aspectRatio

> **desc**: The aspect ratio of the cell in width divided by height. An aspect ratio of **0** means that aspectRatio wont be applied to the cell.

> **type**: number

**returns**:

> **desc**: A new [`GridGUI.Cell`](../Cell/) instance.

> **type**: GridGUI.Cell

####__Sum
**desc**: Calculates a partial sum of values in an array from a start index to an end index.

**args**:

> **name**: obj

> **desc**: The array to calculate the sum of.

> **type**: array

> **name**: start

> **desc**: The start index of the range to sum.

> **type**: number

> **name**: end

> **desc**: The end index of the range to sum.

> **type**: number

**returns**:

> **desc**: The sum of the sub-array.

> **type**: number

####CalculateCtrlSize
**desc**: Calculates the size the [`GridGUI.Cell.ctrl`](../Cell/#ctrl) should use given a specific cell size.

**args**:

> **name**: pos

> **desc**: The size to fit the [`GridGUI.Cell.ctrl`](../Cell/#ctrl) within.

> **type**: [GridGUI.Position](../Position/)

**returns**:

> **desc**: An area sized according to the cell members to fit within `pos`.

> **type**: GridGUI.Position

####Center
**desc**: Centres one area in another.

**args**:

> **name**: area

> **desc**: The area that should be centred in relation to.

> **type**: [GridGUI.Position](../Position/)

> **name**: pos

> **desc**: The area to centre.

> **type**: [GridGUI.Position](../Position/)

**returns**:

> **desc**: A copy of `pos` centred in `area`.

> **type**: GridGUI.Position

####DestroyCtrl
**desc**: Destroys the [`GridGUI.Cell.ctrl`](../Cell/#ctrl).

####GetExpandedHeight
**desc**: Calculates the amount of the additional height that the cell should take up and applies the aspect ratio of [`GridGUI.Cell.aspectRatio`](../Cell/#aspectratio) if non zero.

**args**:

> **name**: index

> **desc**: What index of the positions in the grid that the height is wanted for.

> **type**: number

> **name**: height

> **desc**: The unclaimed height of the grid, that is the height of the grid or subgrid left after removing the height of the fixed cells.

> **type**: number

> **name**: expandersH

> **desc**: An array of the sum of vertical expansion weights for each row.

> **type**: associative array

> **name**: nonExpandersH

> **desc**: An array of the amount of fixed size cells in each row.

> **type**: associative array

> **name**: width

> **desc**: The unclaimed width of the grid, that is the width of the GUI or subgrid left after removing the width of the fixed cells.

> **type**: number

> **name**: expandersW

> **desc**: An array of the sum of horisontal expansion weights for each column.

> **type**: array

> **name**: nonExpandersW

> **desc**: An array of the amount of fixed size cells in each column.

> **type**: array

**returns**:

> **desc**: The calculated height.

> **type**: number

####GetExpandedWidth
**desc**: Calculates the amount of the additional width that the cell should take up and applies the aspect ratio of [`GridGUI.Cell.aspectRatio`](../Cell/#aspectratio) if non zero.

**args**:

> **name**: index

> **desc**: What index of the positions in the grid that the width is wanted for.

> **type**: number

> **name**: width

> **desc**: The unclaimed width of the grid, that is the width of the GUI or subgrid left after removing the width of the fixed cells.

> **type**: number

> **name**: expandersW

> **desc**: An array of the sum of horisontal expansion weights for each column.

> **type**: array

> **name**: nonExpandersW

> **desc**: An array of the amount of fixed size cells in each column.

> **type**: array

> **name**: height

> **desc**: The unclaimed height of the grid, that is the height of the grid or subgrid left after removing the height of the fixed cells.

> **type**: number

> **name**: expandersH

> **desc**: An array of the sum of vertical expansion weights for each row.

> **type**: associative array

> **name**: nonExpandersH

> **desc**: An array of the amount of fixed size cells in each row.

> **type**: associative array

**returns**:

> **desc**: The calculated width.

> **type**: number

####GetExpansionHeightValue
**desc**: Getter for [`GridGUI.Cell.exH`](../Cell/#exh).

**returns**:

> **desc**: The vertical expansion weight.

> **type**: number

####GetExpansionWidthValue
**desc**: Getter for [`GridGUI.Cell.exW`](../Cell/#exw).

**returns**:

> **desc**: The horisontal expansion weight.

> **type**: number

####GetFixedHeight
**desc**: Returns the fixed height of the cell and applies the aspect ratio of [`GridGUI.Cell.aspectRatio`](../Cell/#aspectratio) if non zero.

**returns**:

> **desc**: The fixed height of the cell. For non vertically expanding and non vertically filling cells the min-height of the [`GridGUI.Cell.ctrl`](../Cell/#ctrl) plus 2 times the vertical margin is returned. For vertically expanding and or vertically filling cells 0 is returned unless an min-height where specified in which case the min-height of the [`GridGUI.Cell.ctrl`](../Cell/#ctrl) plus 2 time the vertical margin is returned unless the min-height is 0 then 0 is returned.

> **type**: number

####GetFixedWidth
**desc**: Returns the fixed width of the cell and applies the aspect ratio of [`GridGUI.Cell.aspectRatio`](../Cell/#aspectratio) if non zero.

**returns**:

> **desc**: The fixed width of the cell. For non horisontally expanding and non horisontally filling cells the min-width of the [`GridGUI.Cell.ctrl`](../Cell/#ctrl) plus 2 times the horisontal margin is returned. For horisontally expanding and or horisontally filling cells 0 is returned unless an min-width where specified in which case the min-width of the [`GridGUI.Cell.ctrl`](../Cell/#ctrl) plus 2 time the vertical margin is returned unless the min-width is 0 then 0 is returned.

> **type**: number

####GetNeededHeight
**desc**: Returns the needed height of the cell and applies the aspect ratio of [`GridGUI.Cell.aspectRatio`](../Cell/#aspectratio) if non zero.

**returns**:

> **desc**: The needed height of the cell. That is the min-height of the [`GridGUI.Cell.ctrl`](../Cell/#ctrl) plus two times the vertical margin.

> **type**: number

####GetNeededWidth
**desc**: Returns the needed width of the cell and applies the aspect ratio of [`GridGUI.Cell.aspectRatio`](../Cell/#aspectratio) if non zero.

**returns**:

> **desc**: The needed width of the cell. That is the min-width of the [`GridGUI.Cell.ctrl`](../Cell/#ctrl) plus two times the horisontal margin.

> **type**: number

####Justify
**desc**: Justifies an area within another area. That is places the area according to a set of rules within the larger area.

**args**:

> **name**: area

> **desc**: The area to position the other area within.

> **type**: [GridGUI.Position](../Position/)

> **name**: pos

> **desc**: The area to position in the larger area.

> **type**: [GridGUI.Position](../Position/)

**returns**:

> **desc**: A copy of `pos` that is justified within `area`.

> **type**: GridGUI.Position

####SetArea
**desc**: Sets the position and size of the cell.

**args**:

> **name**: offset

> **desc**: The coordinate offset that the cell should be translated by. Used to support [`GridGUI.SubGrid`](../SubGrid/)s within a GUI, since the calculated positions are relative to the client area.

> **type**: [GridGUI.Position](../Position/)

> **name**: widths

> **desc**: An array of the calculate width for each column.

> **type**: array

> **name**: heights

> **desc**: An array of the calculate height for each row.

> **type**: array

####SetAspectRatio
**desc**: Sets the aspect ratio of the cell.

**args**:

> **name**: ratio

> **desc**: The ratio to set for the cell in width divided by height. An empty ratio will set the ratio to the current width of the cell divided by the current height of the cell.

> **type**: number|""

####ToolTip
**desc**: Shows a tooltip of the cell as a string.

####ToStr
**desc**: Converts the object to a string.

**args**:

> **name**: indent

> **desc**: The amount of indentation to add on each line.

> **type**: string

**returns**:

> **desc**: A string representing this cell.

> **type**: string

####Update
**desc**: Updates the position of the [`GridGUI.Cell.ctrl`](../Cell/#ctrl) and draws it.

