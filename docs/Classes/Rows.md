#Rows
<figure markdown="1">

</figure>
---
##Members

!!! info ""

    ####catched
    !!! info ""

        **desc**: Whether or not the members have already been calculate.

        **type**: bool

        **default**: false

!!! info ""

    ####expanders
    !!! info ""

        **desc**: A collection of the sum of vertical [`GridGUI.Cell`](../Cell/) expansion weights of each [`GridGUI.Row`](../Row/) in [`GridGUI.Rows.rows`](../Rows/#rows).

        **type**: associative array

        **default**: {}

!!! info ""

    ####expandersMaxValue
    !!! info ""

        **desc**: A collection of the maximum vertical [`GridGUI.Cell`](../Cell/) expansion weight of each [`GridGUI.Row`](../Row/) in [`GridGUI.Rows.rows`](../Rows/#rows).

        **type**: associative array

        **default**: {}

!!! info ""

    ####fixedHeights
    !!! info ""

        **desc**: A collection of the fixed height of each [`GridGUI.Row`](../Row/) in [`GridGUI.Rows.rows`](../Rows/#rows).

        **type**: associative array

        **default**: {}

!!! info ""

    ####minHeights
    !!! info ""

        **desc**: A collection of the min height of each [`GridGUI.Row`](../Row/) in [`GridGUI.Rows.rows`](../Rows/#rows).

        **type**: associative array

        **default**: {}

!!! info ""

    ####nonExpanders
    !!! info ""

        **desc**: A collection of the amount of vertically fixed [`GridGUI.Cell`](../Cell/)s in each [`GridGUI.Row`](../Row/) in [`GridGUI.Rows.rows`](../Rows/#rows).

        **type**: associative array

        **default**: {}

!!! info ""

    ####rows
    !!! info ""

        **desc**: A collection of the [`GridGUI.Row`](../Row/)s where one or more [`GridGUI.Cell`](../Cell/)s have been placed. That is only used rows are generated.

        **type**: associative array

        **default**: {}

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

            **desc**: A new [`GridGUI.Rows`](../Rows/) instance.

            **type**: [GridGUI.Rows](../Rows/)

!!! note ""
    ####__ResetConstants
    !!! tip ""

        ```AutoHotKey
        __ResetConstants()
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Resets the cached [`GridGUI.Rows`](../Rows/) members to their default values.



!!! note ""
    ####Add
    !!! tip ""

        ```AutoHotKey
        Add(c)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Adds a [`GridGUI.Cell`](../Cell/) to the [`GridGUI.Row`](../Row/)s that it spans over. If the [`GridGUI.Row`](../Row/)s are not already in [`GridGUI.Rows.rows`](../Rows/#rows) they are added before adding the cell.



    ??? example "parameters"

        !!! info ""

            **name**: c

            **desc**: The [`GridGUI.Cell`](../Cell/) to add to the [`GridGUI.Row`](../Row/)s.

            **type**: [GridGUI.Cell](../Cell/)

!!! note ""
    ####CalculateConstants
    !!! tip ""

        ```AutoHotKey
        CalculateConstants()
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Calculates the values for the [`GridGUI.Rows`](../Rows/) members that are cached.



!!! note ""
    ####CalculateHeights
    !!! tip ""

        ```AutoHotKey
        CalculateHeights(height, expandersH, nonExpandersH, width, expandersW, nonExpandersW)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Calculates the part of the available height that each [`GridGUI.Row`](../Row/) in [`GridGUI.Rows.rows`](../Rows/#rows) will get.



    ??? example "parameters"

        !!! info ""

            **name**: height

            **desc**: The height of the grid. That is the height that the grid should fill.

            **type**: number

        !!! info ""

            **name**: expandersH

            **desc**: The member [`GridGUI.Rows.expanders`](../Rows/#expanders)

            **type**: associative array

        !!! info ""

            **name**: nonExpandersH

            **desc**: The member [`GridGUI.Rows.nonExpanders`](../Rows/#nonexpanders)

            **type**: associative array

        !!! info ""

            **name**: width

            **desc**: The unclaimed width of the grid. That is the width of the grid that is left after removing the width of the fixed cells.

            **type**: number

        !!! info ""

            **name**: expandersW

            **desc**: The member [`GridGUI.Columns.expanders`](../Columns/#expanders)

            **type**: associative array

        !!! info ""

            **name**: nonExpandersW

            **desc**: The member [`GridGUI.Columns.nonExpanders`](../Columns/#nonexpanders)

            **type**: associative array

    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: The calculated heights of the [`GridGUI.Row`](../Row/)s in [`GridGUI.Rows.rows`](../Rows/#rows).

            **type**: associative array

!!! note ""
    ####GetFixedHeight
    !!! tip ""

        ```AutoHotKey
        GetFixedHeight()
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Returns the sum of the fixed heights of the [`GridGUI.Row`](../Row/)s in [`GridGUI.Rows.rows`](../Rows/#rows).



    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: The sum of the fixed heights of the [`GridGUI.Row`](../Row/)s in [`GridGUI.Rows.rows`](../Rows/#rows).

            **type**: number

!!! note ""
    ####GetMinHeight
    !!! tip ""

        ```AutoHotKey
        GetMinHeight()
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Returns the sum of the minimal heights of the [`GridGUI.Row`](../Row/)s in [`GridGUI.Rows.rows`](../Rows/#rows).



    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: The sum of the minimal heights of the [`GridGUI.Row`](../Row/)s in [`GridGUI.Rows.rows`](../Rows/#rows).

            **type**: number

!!! note ""
    ####ReduceToGuiSize
    !!! tip ""

        ```AutoHotKey
        ReduceToGuiSize(heights, expandedHeights, sumExpandedHeights, excessHeight)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Fixes miscalculations in the height of expanding [`GridGUI.Cell`](../Cell/)s by reducing their height down until they all fit in the available height or all have reach their min height. The reduction is done starting with the tallest [`GridGUI.Row`](../Row/) to the shortest.



    ??? example "parameters"

        !!! info ""

            **name**: heights

            **desc**: The calculated heights for the [`GridGUI.Row`](../Row/)s in [`GridGUI.Rows.rows`](../Rows/#rows).

            **type**: associative array

        !!! info ""

            **name**: expandedHeights

            **desc**: An array of the heights of [`GridGUI.Row`](../Row/)s with one or more vertically expanding [`GridGUI.Cell`](../Cell/) if the current height in `heights` corresponding to the row is larger than the minimum of the row otherwise it wont be included in the `expandedHeights`

            **type**: array

        !!! info ""

            **name**: sumExpandedHeights

            **desc**: The sum of the heights in `expandedHeights`.

            **type**: number

        !!! info ""

            **name**: excessHeight

            **desc**: The amount of height that the sum of `heights` would exceed the height of the grid/gui.

            **type**: number

!!! note ""
    ####Remove
    !!! tip ""

        ```AutoHotKey
        Remove(c)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Removes a [`GridGUI.Cell`](../Cell/) from the [`GridGUI.Row`](../Row/)s that it spans over. If the [`GridGUI.Row`](../Row/)s are empty after removing the cell the row will be removed as well.



    ??? example "parameters"

        !!! info ""

            **name**: c

            **desc**: The [`GridGUI.Cell`](../Cell/) to remove from the [`GridGUI.Row`](../Row/)s.

            **type**: [GridGUI.Cell](../Cell/)

