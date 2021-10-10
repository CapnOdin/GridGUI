#Row
<figure markdown="1">
A class representing a grid row.
</figure>
---
##Members

####catched

> **desc**: Whether or not the members have already been calculate.

> **type**: bool

####cells

> **desc**: A collection of arrays of `GridGUI.Cell`s indexed by the index of the columns they are placed on.

> **type**: Associative Array

> **default**: {}

####confligtingExpanders

> **desc**: A collection of cells that have vertical expansion conflicts.

> **type**: Associative Array

> **default**: {}

####expanderMaxValue

> **desc**: The largest vertical expansion weight in this row.

> **type**: number

####expanders

> **desc**: The sum of all the vertical expansion weights of cells that are in this row.

> **type**: number

####fixedWidth

> **desc**: The sum of the maximal fixed heights for each column, that is the sum of the largest fixed height for each array of overlapping cells in `GridGUI.Column.cells`.

> **type**: number

####index

> **desc**: The index of the row in the grid.

> **type**: number

####minWidth

> **desc**: The sum of the maximal minimal heights for each column, that is the sum of the largest minimal height for each array of overlapping cells in `GridGUI.Column.cells`.

> **type**: number

####nonExpanders

> **desc**: The amount of cells with fixed size in this row.

> **type**: number

##Methods

####__CalculateConfligtingExpanders
**desc**: Updates `GridGUI.Row.confligtingExpanders` with the `GridGUI.Cell` for a cell if it has vertical conflicts.

**args**:

> **name**: c

> **desc**: The `GridGUI.Cell` to retrieve the value from.

> **type**: GridGUI.Cell

####__CalculateExpanders
**desc**: Updates `GridGUI.Row.expanders` with the result of `GridGUI.Cell.GetExpansionHeightValue` for a cell.

**args**:

> **name**: c

> **desc**: The `GridGUI.Cell` to retrieve the value from.

> **type**: GridGUI.Cell

####__CalculateFixedHeight
**desc**: Updates `GridGUI.Row.fixedHeight` with the result of `GridGUI.Cell.GetFixedHeight` for a cell if it is larger than the previous value.

**args**:

> **name**: c

> **desc**: The `GridGUI.Cell` to retrieve the value from.

> **type**: GridGUI.Cell

####__CalculateMinHeight
**desc**: Updates `GridGUI.Row.minHeight` with the result of `GridGUI.Cell.GetNeededHeight` for a cell if it is larger than the previous value.

**args**:

> **name**: c

> **desc**: The `GridGUI.Cell` to retrieve the value from.

> **type**: GridGUI.Cell

####__CalculateNonExpanders
**desc**: Increments `GridGUI.Row.nonExpanders` if the `GridGUI.Cell` does not expand vertically.

**args**:

> **name**: c

> **desc**: The `GridGUI.Cell` to retrieve the value from.

> **type**: GridGUI.Cell

####__New
**desc**: Constructor.

**args**:

> **name**: index

> **desc**: The index of the row in the grid.

> **type**: number

**returns**:

> **desc**: A new `GridGUI.Row` instance.

> **type**: GridGUI.Row

####__ResetConstants
**desc**: Resets the row members to their default values.

####Add
**desc**: Adds a `GridGUI.Cell` to the row.

**args**:

> **name**: c

> **desc**: The `GridGUI.Cell` to added to the row.

> **type**: GridGUI.Cell

####CalculateConstants
**desc**: Calculates the values for the members.

####CalculateHeight
**desc**: Calculates the height of the row.

**args**:

> **name**: height

> **desc**: The height of the grid, that is the height of the GUI or subgrid.

> **type**: number

> **name**: expanders

> **desc**: An array of the sum of vertical expansion weights for each row.

> **type**: array

> **name**: nonExpanders

> **desc**: An array of the amount of fixed size cells in each row.

> **type**: array

**returns**:

> **desc**: The height of the row.

> **type**: number

####GetExpanderMaxValue
**desc**: Getter for `GridGUI.Row.expanderMaxValue`.

**returns**:

> **desc**: The largest vertical expansion weight of a cell in the row.

> **type**: number

####GetExpanders
**desc**: Getter for `GridGUI.Row.expanders`.

**returns**:

> **desc**: The sum of vertical expansion weight of cells in the row.

> **type**: number

####GetFixedHeight
**desc**: Getter for `GridGUI.Row.fixedHeight`.

**returns**:

> **desc**: The largest fixed height of a cell in the row.

> **type**: number

####GetMinHeight
**desc**: Getter for `GridGUI.Row.minHeight`.

**returns**:

> **desc**: The largest minimal height of a cell in the row.

> **type**: number

####GetNonExpanders
**desc**: Getter for `GridGUI.Row.nonExpanders`.

**returns**:

> **desc**: The amount of cells with fixed height in the row.

> **type**: number

####Remove
**desc**: Removes a `GridGUI.Cell` from the row.

**args**:

> **name**: c

> **desc**: The `GridGUI.Cell` to remove from the row.

> **type**: GridGUI.Cell

