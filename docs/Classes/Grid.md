#Grid
<figure markdown="1">

</figure>
---
##Members

####arbitrator

> **desc**: An instance of [`GridGUI.ExpanderArbitrator`](../ExpanderArbitrator/) that keeps tack of the expanding [`GridGUI.Cell`](../Cell/)s in the grid.

> **type**: [GridGUI.ExpanderArbitrator](../ExpanderArbitrator/)

####cells

> **desc**: An array of the [`GridGUI.Cell`](../Cell/)s that have been added to the grid.

> **type**: array

> **default**: []

####columns

> **desc**: An instance of [`GridGUI.Columns`](../Columns/) that keeps tack of the [`GridGUI.Column`](../Column/)s comprising the grid.

> **type**: [GridGUI.Columns](../Columns/)

####heights

> **desc**: The latest calculated row heights.

> **type**: array

> **default**: []

####justify

> **desc**: How the [`GridGUI.Grid.cells`](../Grid/#cells) will be positioned in the grid when drawn. Can be any combination of `C` (Center), `N` (North), `S` (South), `W` (West) and `E` (East).

> **type**: string

####rows

> **desc**: An instance of [`GridGUI.Rows`](../Rows/) that keeps tack of the [`GridGUI.Row`](../Row/)s comprising the grid.

> **type**: [GridGUI.Rows](../Rows/)

####widths

> **desc**: The latest calculated column widths.

> **type**: array

> **default**: []

##Methods

####__New
**desc**: Constructor.

**returns**:

> **desc**: A new [`GridGUI.Grid`](../Grid/) instance.

> **type**: GridGUI.Grid

####AddCell
**desc**: Adds a [`GridGUI.Cell`](../Cell/) to the grid in the rows and columns indicated by the [`GridGUI.Cell.gridpos`](../Cell/#gridpos) member of the cell.

**args**:

> **name**: c

> **desc**: The [`GridGUI.Cell`](../Cell/) to add to the grid.

> **type**: [GridGUI.Cell](../Cell/)

####CalculatePositions
**desc**: Calculates the positions and sizes of the [`GridGUI.Cell`](../Cell/)s in the grid.

**args**:

> **name**: area

> **desc**: The position and size of the grid. This is needed to support [`GridGUI.SubGrid`](../SubGrid/)s.

> **type**: [GridGUI.Position](../Position/)

####Draw
**desc**: Draws the [`GridGUI.Cell`](../Cell/)s in the grid using the most recently calculated cell positions and sizes.

**args**:

> **name**: area

> **desc**: The position and size of the grid. This is needed to support [`GridGUI.SubGrid`](../SubGrid/)s.

> **type**: [GridGUI.Position](../Position/)

**returns**:

> **desc**: Returns the justified area so that the debug grid lines of [`GridGUI.GridGUIClass`](../GridGUIClass/) can be moved accordingly.

> **type**: GridGUI.Position

####GetMinHeight
**desc**: Returns the minimal needed height to show the [`GridGUI.Cell`](../Cell/)s.

**returns**:

> **desc**: The minimal needed height to show the [`GridGUI.Cell`](../Cell/)s

> **type**: number

####GetMinWidth
**desc**: Returns the minimal needed width to show the [`GridGUI.Cell`](../Cell/)s.

**returns**:

> **desc**: The minimal needed width to show the [`GridGUI.Cell`](../Cell/)s

> **type**: number

####RemoveCell
**desc**: Removes a [`GridGUI.Cell`](../Cell/) from the grid by removing it from the rows and columns it was in, as well as removing it from the [`GridGUI.Grid.arbitrator`](../Grid/#arbitrator).

**args**:

> **name**: c

> **desc**: The [`GridGUI.Cell`](../Cell/) to remove from the grid.

> **type**: [GridGUI.Cell](../Cell/)

####ResetConstants
**desc**: Resets the cached constants of the members.

