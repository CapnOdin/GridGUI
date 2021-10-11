#Rows
<figure markdown="1">
A class managing a collection of `GridGUI.Row`s.
</figure>
---
##Members

####catched

> **desc**: Whether or not the members have already been calculate.

> **type**: bool

####expanders

> **desc**: A collection of the sum of vertical `GridGUI.Cell` expansion weights of each `GridGUI.Row` in `GridGUI.Rows.rows`.

> **type**: associative array

> **default**: {}

####expandersMaxValue

> **desc**: A collection of the maximum vertical `GridGUI.Cell` expansion weight of each `GridGUI.Row` in `GridGUI.Rows.rows`.

> **type**: associative array

> **default**: {}

####fixedHeights

> **desc**: A collection of the fixed height of each `GridGUI.Row` in `GridGUI.Rows.rows`.

> **type**: associative array

> **default**: {}

####minHeights

> **desc**: A collection of the min height of each `GridGUI.Row` in `GridGUI.Rows.rows`.

> **type**: associative array

> **default**: {}

####nonExpanders

> **desc**: A collection of the amount of vertically fixed `GridGUI.Cell`s in each `GridGUI.Row` in `GridGUI.Rows.rows`.

> **type**: associative array

> **default**: {}

####rows

> **desc**: A collection of the `GridGUI.Row`s where one or more `GridGUI.Cell`s have been placed. That is only used rows are generated.

> **type**: associative array

> **default**: {}

##Methods

####__New
**desc**: Constructor.

**returns**:

> **desc**: A new `GridGUI.Rows` instance.

> **type**: GridGUI.Rows

####__ResetConstants
**desc**: Resets the cached `GridGUI.Rows` members to their default values.

####Add
**desc**: Adds a `GridGUI.Cell` to the `GridGUI.Row`s that it spans over. If the `GridGUI.Row`s are not already in `GridGUI.Rows.rows` they are added before adding the cell.

**args**:

> **name**: c

> **desc**: The `GridGUI.Cell` to add to the `GridGUI.Row`s.

> **type**: GridGUI.Cell

####CalculateConstants
**desc**: Calculates the values for the `GridGUI.Rows` members that are cached.

####CalculateHeights
**desc**: Calculates the part of the available height that each `GridGUI.Row` in `GridGUI.Rows.rows` will get.

**args**:

> **name**: height

> **desc**: The height of the grid. That is the height that the grid should fill.

> **type**: number

> **name**: expanders

> **desc**: The member `GridGUI.Rows.expanders`

> **type**: associative array

> **name**: nonExpanders

> **desc**: The member `GridGUI.Rows.nonExpanders`

> **type**: associative array

**returns**:

> **desc**: The calculated heights of the `GridGUI.Row`s in `GridGUI.Rows.rows`.

> **type**: associative array

####GetFixedHeight
**desc**: Returns the sum of the fixed heights of the `GridGUI.Row`s in `GridGUI.Rows.rows`.

**returns**:

> **desc**: The sum of the fixed heights of the `GridGUI.Row`s in `GridGUI.Rows.rows`.

> **type**: number

####GetMinHeight
**desc**: Returns the sum of the minimal heights of the `GridGUI.Row`s in `GridGUI.Rows.rows`.

**returns**:

> **desc**: The sum of the minimal heights of the `GridGUI.Row`s in `GridGUI.Rows.rows`.

> **type**: number

####ReduceToGuiSize
**desc**: Fixes miscalculations in the height of expanding `GridGUI.Cell`s by reducing their height down until they all fit in the available height or all have reach their min height. The reduction is done starting with the tallest `GridGUI.Row` to the shortest.

**args**:

> **name**: heights

> **desc**: The calculated heights for the `GridGUI.Row`s in `GridGUI.Rows.rows`.

> **type**: associative array

> **name**: expandedHeights

> **desc**: An array of the heights of `GridGUI.Row`s with one or more vertically expanding `GridGUI.Cell` if the current height in `heights` corresponding to the row is larger than the minimum of the row otherwise it wont be included in the `expandedHeights`

> **type**: array

> **name**: sumExpandedHeights

> **desc**: The sum of the heights in `expandedHeights`.

> **type**: number

> **name**: excessHeight

> **desc**: The amount of height that the sum of `heights` would exceed the height of the grid/gui.

> **type**: number

####Remove
**desc**: Removes a `GridGUI.Cell` from the `GridGUI.Row`s that it spans over. If the `GridGUI.Row`s are empty after removing the cell the row will be removed as well.

**args**:

> **name**: c

> **desc**: The `GridGUI.Cell` to remove from the `GridGUI.Row`s.

> **type**: GridGUI.Cell

