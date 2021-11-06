#Grid
<figure markdown="1">

</figure>
---
##Members

!!! info ""

    ####arbitrator
    !!! info ""

        **desc**: An instance of [`GridGUI.ExpanderArbitrator`](../ExpanderArbitrator/) that keeps tack of the expanding [`GridGUI.Cell`](../Cell/)s in the grid.

        **type**: [GridGUI.ExpanderArbitrator](../ExpanderArbitrator/)

!!! info ""

    ####cells
    !!! info ""

        **desc**: An array of the [`GridGUI.Cell`](../Cell/)s that have been added to the grid.

        **type**: array

        **default**: []

!!! info ""

    ####columns
    !!! info ""

        **desc**: An instance of [`GridGUI.Columns`](../Columns/) that keeps tack of the [`GridGUI.Column`](../Column/)s comprising the grid.

        **type**: [GridGUI.Columns](../Columns/)

!!! info ""

    ####heights
    !!! info ""

        **desc**: The latest calculated row heights.

        **type**: array

        **default**: []

!!! info ""

    ####justify
    !!! info ""

        **desc**: How the [`GridGUI.Grid.cells`](../Grid/#cells) will be positioned in the grid when drawn. Can be any combination of `C` (Center), `N` (North), `S` (South), `W` (West) and `E` (East).

        **type**: string

        **default**: ""

!!! info ""

    ####rows
    !!! info ""

        **desc**: An instance of [`GridGUI.Rows`](../Rows/) that keeps tack of the [`GridGUI.Row`](../Row/)s comprising the grid.

        **type**: [GridGUI.Rows](../Rows/)

!!! info ""

    ####widths
    !!! info ""

        **desc**: The latest calculated column widths.

        **type**: array

        **default**: []

##Methods

!!! note ""
    ####__New
    !!! tip ""

        ```AutoHotKey
        __New()
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Constructor.



    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: A new [`GridGUI.Grid`](../Grid/) instance.

            **type**: [GridGUI.Grid](../Grid/)

!!! note ""
    ####AddCell
    !!! tip ""

        ```AutoHotKey
        AddCell(c)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Adds a [`GridGUI.Cell`](../Cell/) to the grid in the rows and columns indicated by the [`GridGUI.Cell.gridpos`](../Cell/#gridpos) member of the cell.



    ??? example "parameters"

        !!! info ""

            **name**: c

            **desc**: The [`GridGUI.Cell`](../Cell/) to add to the grid.

            **type**: [GridGUI.Cell](../Cell/)

!!! note ""
    ####CalculatePositions
    !!! tip ""

        ```AutoHotKey
        CalculatePositions(area)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Calculates the positions and sizes of the [`GridGUI.Cell`](../Cell/)s in the grid.



    ??? example "parameters"

        !!! info ""

            **name**: area

            **desc**: The position and size of the grid. This is needed to support [`GridGUI.SubGrid`](../SubGrid/)s.

            **type**: [GridGUI.Position](../Position/)

!!! note ""
    ####Draw
    !!! tip ""

        ```AutoHotKey
        Draw(area)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Draws the [`GridGUI.Cell`](../Cell/)s in the grid using the most recently calculated cell positions and sizes.



    ??? example "parameters"

        !!! info ""

            **name**: area

            **desc**: The position and size of the grid. This is needed to support [`GridGUI.SubGrid`](../SubGrid/)s.

            **type**: [GridGUI.Position](../Position/)

    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: Returns the justified area so that the debug grid lines of [`GridGUI.GridGUIClass`](../GridGUIClass/) can be moved accordingly.

            **type**: [GridGUI.Position](../Position/)

!!! note ""
    ####GetMinHeight
    !!! tip ""

        ```AutoHotKey
        GetMinHeight()
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Returns the minimal needed height to show the [`GridGUI.Cell`](../Cell/)s.



    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: The minimal needed height to show the [`GridGUI.Cell`](../Cell/)s

            **type**: number

!!! note ""
    ####GetMinWidth
    !!! tip ""

        ```AutoHotKey
        GetMinWidth()
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Returns the minimal needed width to show the [`GridGUI.Cell`](../Cell/)s.



    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: The minimal needed width to show the [`GridGUI.Cell`](../Cell/)s

            **type**: number

!!! note ""
    ####RemoveCell
    !!! tip ""

        ```AutoHotKey
        RemoveCell(c)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Removes a [`GridGUI.Cell`](../Cell/) from the grid by removing it from the rows and columns it was in, as well as removing it from the [`GridGUI.Grid.arbitrator`](../Grid/#arbitrator).



    ??? example "parameters"

        !!! info ""

            **name**: c

            **desc**: The [`GridGUI.Cell`](../Cell/) to remove from the grid.

            **type**: [GridGUI.Cell](../Cell/)

!!! note ""
    ####ResetConstants
    !!! tip ""

        ```AutoHotKey
        ResetConstants()
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Resets the cached constants of the members.



