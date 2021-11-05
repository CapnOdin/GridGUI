#Row
<figure markdown="1">

</figure>
---
##Members

####catched

> **desc**: Whether or not the members have already been calculate.

> **type**: bool

####cells

> **desc**: A collection of arrays of [`GridGUI.Cell`](../Cell/)s indexed by the index of the columns they are placed on.

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

> **desc**: The sum of the maximal fixed heights for each column, that is the sum of the largest fixed height for each array of overlapping cells in [`GridGUI.Column.cells`](../Column/#cells).

> **type**: number

####index

> **desc**: The index of the row in the grid.

> **type**: number

####minWidth

> **desc**: The sum of the maximal minimal heights for each column, that is the sum of the largest minimal height for each array of overlapping cells in [`GridGUI.Column.cells`](../Column/#cells).

> **type**: number

####nonExpanders

> **desc**: The amount of cells with fixed size in this row.

> **type**: number

##Methods

####__CalculateConfligtingExpanders
**desc**: Updates [`GridGUI.Row.confligtingExpanders`](../Row/#confligtingexpanders) with the [`GridGUI.Cell`](../Cell/) for a cell if it has vertical conflicts.

**args**:

> **name**: c

> **desc**: The [`GridGUI.Cell`](../Cell/) to retrieve the value from.

> **type**: [GridGUI.Cell](../Cell/)

####__CalculateExpanders
**desc**: Updates [`GridGUI.Row.expanders`](../Row/#expanders) with the result of [`GridGUI.Cell.GetExpansionHeightValue`](../Cell/#getexpansionheightvalue) for a cell.

**args**:

> **name**: c

> **desc**: The [`GridGUI.Cell`](../Cell/) to retrieve the value from.

> **type**: [GridGUI.Cell](../Cell/)

####__CalculateFixedHeight
**desc**: Updates [`GridGUI.Row.fixedHeight`](../Row/#fixedheight) with the result of [`GridGUI.Cell.GetFixedHeight`](../Cell/#getfixedheight) for a cell if it is larger than the previous value.

**args**:

> **name**: c

> **desc**: The [`GridGUI.Cell`](../Cell/) to retrieve the value from.

> **type**: [GridGUI.Cell](../Cell/)

####__CalculateMinHeight
**desc**: Updates [`GridGUI.Row.minHeight`](../Row/#minheight) with the result of [`GridGUI.Cell.GetNeededHeight`](../Cell/#getneededheight) for a cell if it is larger than the previous value.

**args**:

> **name**: c

> **desc**: The [`GridGUI.Cell`](../Cell/) to retrieve the value from.

> **type**: [GridGUI.Cell](../Cell/)

####__CalculateNonExpanders
**desc**: Increments [`GridGUI.Row.nonExpanders`](../Row/#nonexpanders) if the [`GridGUI.Cell`](../Cell/) does not expand vertically.

**args**:

> **name**: c

> **desc**: The [`GridGUI.Cell`](../Cell/) to retrieve the value from.

> **type**: [GridGUI.Cell](../Cell/)

####__New
**desc**: Constructor.

**args**:

> **name**: index

> **desc**: The index of the row in the grid.

> **type**: number

**returns**:

> **desc**: A new [`GridGUI.Row`](../Row/) instance.

> **type**: GridGUI.Row

####__ResetConstants
**desc**: Resets the cached [`GridGUI.Row`](../Row/) members to their default values.

####Add
**desc**: Adds a [`GridGUI.Cell`](../Cell/) to the row.

**args**:

> **name**: c

> **desc**: The [`GridGUI.Cell`](../Cell/) to added to the row.

> **type**: [GridGUI.Cell](../Cell/)

####CalculateConstants
**desc**: Calculates the values for the [`GridGUI.Row`](../Row/) members that are cached.

####CalculateHeight
**desc**: Calculates the height of the row.

**args**:

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

> **type**: associative array

> **name**: nonExpandersW

> **desc**: An array of the amount of fixed size cells in each column.

> **type**: associative array

**returns**:

> **desc**: The height of the row.

> **type**: number

####GetExpanderMaxValue
**desc**: Getter for [`GridGUI.Row.expanderMaxValue`](../Row/#expandermaxvalue).

**returns**:

> **desc**: The largest vertical expansion weight of a cell in the row.

> **type**: number

####GetExpanders
**desc**: Getter for [`GridGUI.Row.expanders`](../Row/#expanders).

**returns**:

> **desc**: The sum of vertical expansion weight of cells in the row.

> **type**: number

####GetFixedHeight
**desc**: Getter for [`GridGUI.Row.fixedHeight`](../Row/#fixedheight).

**returns**:

> **desc**: The largest fixed height of a cell in the row.

> **type**: number

####GetMinHeight
**desc**: Getter for [`GridGUI.Row.minHeight`](../Row/#minheight).

**returns**:

> **desc**: The largest minimal height of a cell in the row.

> **type**: number

####GetNonExpanders
**desc**: Getter for [`GridGUI.Row.nonExpanders`](../Row/#nonexpanders).

**returns**:

> **desc**: The amount of cells with fixed height in the row.

> **type**: number

####Remove
**desc**: Removes a [`GridGUI.Cell`](../Cell/) from the row.

**args**:

> **name**: c

> **desc**: The [`GridGUI.Cell`](../Cell/) to remove from the row.

> **type**: [GridGUI.Cell](../Cell/)

