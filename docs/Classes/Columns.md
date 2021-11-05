#Columns
<figure markdown="1">

</figure>
---
##Members

####catched

> **desc**: Whether or not the members have already been calculate.

> **type**: bool

####columns

> **desc**: A collection of the [`GridGUI.Column`](../Column/)s where one or more [`GridGUI.Cell`](../Cell/)s have been placed. That is only used columns are generated.

> **type**: associative array

> **default**: {}

####expanders

> **desc**: A collection of the sum of horisontal [`GridGUI.Cell`](../Cell/) expansion weights of each [`GridGUI.Column`](../Column/) in [`GridGUI.Columns.columns`](../Columns/#columns).

> **type**: associative array

> **default**: {}

####expandersMaxValue

> **desc**: A collection of the maximum horisontal [`GridGUI.Cell`](../Cell/) expansion weight of each [`GridGUI.Column`](../Column/) in [`GridGUI.Columns.columns`](../Columns/#columns).

> **type**: associative array

> **default**: {}

####fixedWidths

> **desc**: A collection of the fixed width of each [`GridGUI.Column`](../Column/) in [`GridGUI.Columns.columns`](../Columns/#columns).

> **type**: associative array

> **default**: {}

####minWidths

> **desc**: A collection of the min width of each [`GridGUI.Column`](../Column/) in [`GridGUI.Columns.columns`](../Columns/#columns).

> **type**: associative array

> **default**: {}

####nonExpanders

> **desc**: A collection of the amount of horisontally fixed [`GridGUI.Cell`](../Cell/)s in each [`GridGUI.Column`](../Column/) in [`GridGUI.Columns.columns`](../Columns/#columns).

> **type**: associative array

> **default**: {}

##Methods

####__New
**desc**: Constructor.

**returns**:

> **desc**: A new [`GridGUI.Columns`](../Columns/) instance.

> **type**: GridGUI.Columns

####__ResetConstants
**desc**: Resets the cached [`GridGUI.Columns`](../Columns/) members to their default values.

####Add
**desc**: Adds a [`GridGUI.Cell`](../Cell/) to the [`GridGUI.Column`](../Column/)s that it spans over. If the [`GridGUI.Column`](../Column/)s are not already in [`GridGUI.Columns.columns`](../Columns/#columns) they are added before adding the cell.

**args**:

> **name**: c

> **desc**: The [`GridGUI.Cell`](../Cell/) to add to the [`GridGUI.Column`](../Column/)s.

> **type**: [GridGUI.Cell](../Cell/)

####CalculateConstants
**desc**: Calculates the values for the [`GridGUI.Columns`](../Columns/) members that are cached.

####CalculateWidths
**desc**: Calculates the part of the available width that each [`GridGUI.Column`](../Column/) in [`GridGUI.Columns.columns`](../Columns/#columns) will get.

**args**:

> **name**: width

> **desc**: The width of the grid. That is the width that the grid should fill.

> **type**: number

> **name**: expandersW,

> **desc**: The member [`GridGUI.Columns.expanders`](../Columns/#expanders)

> **type**: associative array

> **name**: nonExpandersW,

> **desc**: The member [`GridGUI.Columns.nonExpanders`](../Columns/#nonexpanders)

> **type**: associative array

> **name**: height

> **desc**: The unclaimed height of the grid. That is the height of the grid that is left after removing the height of the fixed cells.

> **type**: number

> **name**: expandersH

> **desc**: The member [`GridGUI.Rows.expanders`](../Rows/#expanders)

> **type**: associative array

> **name**: nonExpandersH

> **desc**: The member [`GridGUI.Rows.nonExpanders`](../Rows/#nonexpanders)

> **type**: associative array

**returns**:

> **desc**: The calculated widths of the [`GridGUI.Column`](../Column/)s in [`GridGUI.Columns.columns`](../Columns/#columns).

> **type**: associative array

####GetFixedWidth
**desc**: Returns the sum of the fixed widths of the [`GridGUI.Column`](../Column/)s in [`GridGUI.Columns.columns`](../Columns/#columns).

**returns**:

> **desc**: The sum of the fixed widths of the [`GridGUI.Column`](../Column/)s in [`GridGUI.Columns.columns`](../Columns/#columns).

> **type**: number

####GetMinWidth
**desc**: Returns the sum of the minimal widths of the [`GridGUI.Column`](../Column/)s in [`GridGUI.Columns.columns`](../Columns/#columns).

**returns**:

> **desc**: The sum of the minimal widths of the [`GridGUI.Column`](../Column/)s in [`GridGUI.Columns.columns`](../Columns/#columns).

> **type**: number

####ReduceToGuiSize
**desc**: Fixes miscalculations in the width of expanding [`GridGUI.Cell`](../Cell/)s by reducing their width down until they all fit in the available width or all have reach their min width. The reduction is done starting with the widest [`GridGUI.Column`](../Column/) to the thinnest.

**args**:

> **name**: widths

> **desc**: The calculated widths for the [`GridGUI.Column`](../Column/)s in [`GridGUI.Columns.columns`](../Columns/#columns).

> **type**: associative array

> **name**: expandedWidths

> **desc**: An array of the widths of [`GridGUI.Column`](../Column/)s with one or more horisontally expanding [`GridGUI.Cell`](../Cell/) if the current width in `widths` corresponding to the column is larger than the minimum of the column otherwise it wont be included in the `expandedWidths`

> **type**: array

> **name**: sumExpandedWidths

> **desc**: The sum of the widths in `expandedWidths`.

> **type**: number

> **name**: excessWidth

> **desc**: The amount of width that the sum of `widths` would exceed the width of the grid/gui.

> **type**: number

####Remove
**desc**: Removes a [`GridGUI.Cell`](../Cell/) from the [`GridGUI.Column`](../Column/)s that it spans over. If the [`GridGUI.Column`](../Column/)s are empty after removing the cell the column will be removed as well.

**args**:

> **name**: c

> **desc**: The [`GridGUI.Cell`](../Cell/) to remove from the [`GridGUI.Column`](../Column/)s.

> **type**: [GridGUI.Cell](../Cell/)

