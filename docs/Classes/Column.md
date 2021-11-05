#Column
<figure markdown="1">

</figure>
---
##Members

####catched

> **desc**: Whether or not the members have already been calculate.

> **type**: bool

####cells

> **desc**: A collection of arrays of [`GridGUI.Cell`](../Cell/)s indexed by the index of the rows they are placed on.

> **type**: Associative Array

> **default**: {}

####confligtingExpanders

> **desc**: A collection of cells that have horisontal expansion conflicts.

> **type**: Associative Array

> **default**: {}

####expanderMaxValue

> **desc**: The largest horisontal expansion weight in this column.

> **type**: number

####expanders

> **desc**: The sum of all the horisontal expansion weights of cells that are in this column.

> **type**: number

####fixedWidth

> **desc**: The maximal fixed width of the cells, that is the largest fixed width for a cell in [`GridGUI.Column.cells`](../Column/#cells).

> **type**: number

####index

> **desc**: The index of the column in the grid.

> **type**: number

####minWidth

> **desc**: The maximal minimal width for the cells, that is the largest minimal width for a cell in [`GridGUI.Column.cells`](../Column/#cells).

> **type**: number

####nonExpanders

> **desc**: The amount of cells with fixed size in this column.

> **type**: number

##Methods

####__CalculateConfligtingExpanders
**desc**: Updates [`GridGUI.Column.confligtingExpanders`](../Column/#confligtingexpanders) with the [`GridGUI.Cell`](../Cell/) for a cell if it has horisontal conflicts.

**args**:

> **name**: c

> **desc**: The [`GridGUI.Cell`](../Cell/) to retrieve the value from.

> **type**: [GridGUI.Cell](../Cell/)

####__CalculateExpanders
**desc**: Updates [`GridGUI.Column.expanders`](../Column/#expanders) with the result of [`GridGUI.Cell.GetExpansionWidthValue`](../Cell/#getexpansionwidthvalue) for a cell.

**args**:

> **name**: c

> **desc**: The [`GridGUI.Cell`](../Cell/) to retrieve the value from.

> **type**: [GridGUI.Cell](../Cell/)

####__CalculateFixedWidth
**desc**: Updates [`GridGUI.Column.fixedWidth`](../Column/#fixedwidth) with the result of [`GridGUI.Cell.GetFixedWidth`](../Cell/#getfixedwidth) for a cell if it is larger than the previous value.

**args**:

> **name**: c

> **desc**: The [`GridGUI.Cell`](../Cell/) to retrieve the value from.

> **type**: [GridGUI.Cell](../Cell/)

####__CalculateMinWidth
**desc**: Updates [`GridGUI.Column.minWidth`](../Column/#minwidth) with the result of [`GridGUI.Cell.GetNeededWidth`](../Cell/#getneededwidth) for a cell if it is larger than the previous value.

**args**:

> **name**: c

> **desc**: The [`GridGUI.Cell`](../Cell/) to retrieve the value from.

> **type**: [GridGUI.Cell](../Cell/)

####__CalculateNonExpanders
**desc**: Increments [`GridGUI.Column.nonExpanders`](../Column/#nonexpanders) if the [`GridGUI.Cell`](../Cell/) does not expand horisontally.

**args**:

> **name**: c

> **desc**: The [`GridGUI.Cell`](../Cell/) to retrieve the value from.

> **type**: [GridGUI.Cell](../Cell/)

####__New
**desc**: Constructor.

**args**:

> **name**: index

> **desc**: The index of the column in the grid.

> **type**: number

**returns**:

> **desc**: A new [`GridGUI.Column`](../Column/) instance.

> **type**: GridGUI.Column

####__ResetConstants
**desc**: Resets the cached [`GridGUI.Column`](../Column/) members to their default values.

####Add
**desc**: Adds a [`GridGUI.Cell`](../Cell/) to the column.

**args**:

> **name**: c

> **desc**: The [`GridGUI.Cell`](../Cell/) to added to the column.

> **type**: [GridGUI.Cell](../Cell/)

####CalculateConstants
**desc**: Calculates the values for the [`GridGUI.Column`](../Column/) members that are cached.

####CalculateWidth
**desc**: Calculates the width of the column.

**args**:

> **name**: width

> **desc**: The unclaimed width of the grid, that is the width of the GUI or subgrid left after removing the width of the fixed cells.

> **type**: number

> **name**: expandersW

> **desc**: An array of the sum of horisontal expansion weights for each column.

> **type**: associative array

> **name**: nonExpandersW

> **desc**: An array of the amount of fixed size cells in each column.

> **type**: associative array

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

> **desc**: The width of the column.

> **type**: number

####GetExpanderMaxValue
**desc**: Getter for [`GridGUI.Column.expanderMaxValue`](../Column/#expandermaxvalue).

**returns**:

> **desc**: The largest horisontal expansion weight of a cell in the column.

> **type**: number

####GetExpanders
**desc**: Getter for [`GridGUI.Column.expanders`](../Column/#expanders).

**returns**:

> **desc**: The sum of horisontal expansion weight of cells in the column.

> **type**: number

####GetFixedWidth
**desc**: Getter for [`GridGUI.Column.fixedWidth`](../Column/#fixedwidth).

**returns**:

> **desc**: The largest fixed width of a cell in the column.

> **type**: number

####GetMinWidth
**desc**: Getter for [`GridGUI.Column.minWidth`](../Column/#minwidth).

**returns**:

> **desc**: The largest minimal width of a cell in the column.

> **type**: number

####GetNonExpanders
**desc**: Getter for [`GridGUI.Column.nonExpanders`](../Column/#nonexpanders).

**returns**:

> **desc**: The amount of cells with fixed width in the column.

> **type**: number

####Remove
**desc**: Removes a [`GridGUI.Cell`](../Cell/) from the column.

**args**:

> **name**: c

> **desc**: The [`GridGUI.Cell`](../Cell/) to remove from the column.

> **type**: [GridGUI.Cell](../Cell/)

