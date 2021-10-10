#Grid
<figure markdown="1">
A class representing a grid with rows, columns and cells.
</figure>
---
##Members

####arbitrator

> **desc**: An instance of `GridGUI.ExpanderArbitrator` that keeps tack of the expanding `GridGUI.Cell`s in the grid.

> **type**: GridGUI.ExpanderArbitrator

####cells

> **desc**: An array of the `GridGUI.Cell`s that have been added to the grid.

> **type**: array

> **default**: []

####columns

> **desc**: An instance of `GridGUI.Columns` that keeps tack of the `GridGUI.Column`s comprising the grid.

> **type**: GridGUI.Columns

####heights

> **desc**: The latest calculated row heights.

> **type**: array

> **default**: []

####rows

> **desc**: An instance of `GridGUI.Rows` that keeps tack of the `GridGUI.Row`s comprising the grid.

> **type**: GridGUI.Rows

####widths

> **desc**: The latest calculated column widths.

> **type**: array

> **default**: []

##Methods

####__New
**desc**: Constructor.

**returns**:

> **desc**: A new `GridGUI.Grid` instance.

> **type**: GridGUI.Grid

####AddCell
**desc**: Adds a `GridGUI.Cell` to the grid in the rows and columns indicated by the `GridGUI.Cell.gridpos` member of the cell.

**args**:

> **name**: c

> **desc**: The `GridGUI.Cell` to add to the grid.

> **type**: GridGUI.Cell

####CalculatePositions
**desc**: Calculates the positions and sizes of the `GridGUI.Cell`s in the grid and draws them.

**args**:

> **name**: area

> **desc**: The position and size of the grid. This is needed to support `GridGUI.SubGrid`s.

> **type**: GridGUI.Position

####GetMinHeight
**desc**: Returns the minimal needed height to show the `GridGUI.Cell`s.

**returns**:

> **desc**: The minimal needed height to show the `GridGUI.Cell`s

> **type**: number

####GetMinWidth
**desc**: Returns the minimal needed width to show the `GridGUI.Cell`s.

**returns**:

> **desc**: The minimal needed width to show the `GridGUI.Cell`s

> **type**: number

####RemoveCell
**desc**: Removes a `GridGUI.Cell` from the grid by removing it from the rows and columns it was in, as well as removing it from the `GridGUI.Grid.arbitrator`.

**args**:

> **name**: c

> **desc**: The `GridGUI.Cell` to remove from the grid.

> **type**: GridGUI.Cell

####ResetConstants
**desc**: Resets the cached constants of the members.

