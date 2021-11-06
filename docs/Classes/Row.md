#Row
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

    ####cells
    !!! info ""

        **desc**: A collection of arrays of [`GridGUI.Cell`](../Cell/)s indexed by the index of the columns they are placed on.

        **type**: Associative Array

        **default**: {}

!!! info ""

    ####confligtingExpanders
    !!! info ""

        **desc**: A collection of cells that have vertical expansion conflicts.

        **type**: Associative Array

        **default**: {}

!!! info ""

    ####expanderMaxValue
    !!! info ""

        **desc**: The largest vertical expansion weight in this row.

        **type**: number

        **default**: 0

!!! info ""

    ####expanders
    !!! info ""

        **desc**: The sum of all the vertical expansion weights of cells that are in this row.

        **type**: number

        **default**: 0

!!! info ""

    ####fixedWidth
    !!! info ""

        **desc**: The sum of the maximal fixed heights for each column, that is the sum of the largest fixed height for each array of overlapping cells in [`GridGUI.Column.cells`](../Column/#cells).

        **type**: number

        **default**: 0

!!! info ""

    ####index
    !!! info ""

        **desc**: The index of the row in the grid.

        **type**: number

        **default**: 0

!!! info ""

    ####minWidth
    !!! info ""

        **desc**: The sum of the maximal minimal heights for each column, that is the sum of the largest minimal height for each array of overlapping cells in [`GridGUI.Column.cells`](../Column/#cells).

        **type**: number

        **default**: 0

!!! info ""

    ####nonExpanders
    !!! info ""

        **desc**: The amount of cells with fixed size in this row.

        **type**: number

        **default**: 0

##Methods

!!! note ""
    ####__CalculateConfligtingExpanders
    !!! tip ""

        ```AutoHotKey
        __CalculateConfligtingExpanders(c)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Updates [`GridGUI.Row.confligtingExpanders`](../Row/#confligtingexpanders) with the [`GridGUI.Cell`](../Cell/) for a cell if it has vertical conflicts.



    ??? example "parameters"

        !!! info ""

            **name**: c

            **desc**: The [`GridGUI.Cell`](../Cell/) to retrieve the value from.

            **type**: [GridGUI.Cell](../Cell/)

!!! note ""
    ####__CalculateExpanders
    !!! tip ""

        ```AutoHotKey
        __CalculateExpanders(c)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Updates [`GridGUI.Row.expanders`](../Row/#expanders) with the result of [`GridGUI.Cell.GetExpansionHeightValue`](../Cell/#getexpansionheightvalue) for a cell.



    ??? example "parameters"

        !!! info ""

            **name**: c

            **desc**: The [`GridGUI.Cell`](../Cell/) to retrieve the value from.

            **type**: [GridGUI.Cell](../Cell/)

!!! note ""
    ####__CalculateFixedHeight
    !!! tip ""

        ```AutoHotKey
        __CalculateFixedHeight(c)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Updates [`GridGUI.Row.fixedHeight`](../Row/#fixedheight) with the result of [`GridGUI.Cell.GetFixedHeight`](../Cell/#getfixedheight) for a cell if it is larger than the previous value.



    ??? example "parameters"

        !!! info ""

            **name**: c

            **desc**: The [`GridGUI.Cell`](../Cell/) to retrieve the value from.

            **type**: [GridGUI.Cell](../Cell/)

!!! note ""
    ####__CalculateMinHeight
    !!! tip ""

        ```AutoHotKey
        __CalculateMinHeight(c)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Updates [`GridGUI.Row.minHeight`](../Row/#minheight) with the result of [`GridGUI.Cell.GetNeededHeight`](../Cell/#getneededheight) for a cell if it is larger than the previous value.



    ??? example "parameters"

        !!! info ""

            **name**: c

            **desc**: The [`GridGUI.Cell`](../Cell/) to retrieve the value from.

            **type**: [GridGUI.Cell](../Cell/)

!!! note ""
    ####__CalculateNonExpanders
    !!! tip ""

        ```AutoHotKey
        __CalculateNonExpanders(c)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Increments [`GridGUI.Row.nonExpanders`](../Row/#nonexpanders) if the [`GridGUI.Cell`](../Cell/) does not expand vertically.



    ??? example "parameters"

        !!! info ""

            **name**: c

            **desc**: The [`GridGUI.Cell`](../Cell/) to retrieve the value from.

            **type**: [GridGUI.Cell](../Cell/)

!!! note ""
    ####__New
    !!! tip ""

        ```AutoHotKey
        __New(index)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Constructor.



    ??? example "parameters"

        !!! info ""

            **name**: index

            **desc**: The index of the row in the grid.

            **type**: number

    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: A new [`GridGUI.Row`](../Row/) instance.

            **type**: [GridGUI.Row](../Row/)

!!! note ""
    ####__ResetConstants
    !!! tip ""

        ```AutoHotKey
        __ResetConstants()
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Resets the cached [`GridGUI.Row`](../Row/) members to their default values.



!!! note ""
    ####Add
    !!! tip ""

        ```AutoHotKey
        Add(c)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Adds a [`GridGUI.Cell`](../Cell/) to the row.



    ??? example "parameters"

        !!! info ""

            **name**: c

            **desc**: The [`GridGUI.Cell`](../Cell/) to added to the row.

            **type**: [GridGUI.Cell](../Cell/)

!!! note ""
    ####CalculateConstants
    !!! tip ""

        ```AutoHotKey
        CalculateConstants()
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Calculates the values for the [`GridGUI.Row`](../Row/) members that are cached.



!!! note ""
    ####CalculateHeight
    !!! tip ""

        ```AutoHotKey
        CalculateHeight(height, expandersH, nonExpandersH, width, expandersW, nonExpandersW)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Calculates the height of the row.



    ??? example "parameters"

        !!! info ""

            **name**: height

            **desc**: The unclaimed height of the grid, that is the height of the grid or subgrid left after removing the height of the fixed cells.

            **type**: number

        !!! info ""

            **name**: expandersH

            **desc**: An array of the sum of vertical expansion weights for each row.

            **type**: associative array

        !!! info ""

            **name**: nonExpandersH

            **desc**: An array of the amount of fixed size cells in each row.

            **type**: associative array

        !!! info ""

            **name**: width

            **desc**: The unclaimed width of the grid, that is the width of the GUI or subgrid left after removing the width of the fixed cells.

            **type**: number

        !!! info ""

            **name**: expandersW

            **desc**: An array of the sum of horisontal expansion weights for each column.

            **type**: associative array

        !!! info ""

            **name**: nonExpandersW

            **desc**: An array of the amount of fixed size cells in each column.

            **type**: associative array

    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: The height of the row.

            **type**: number

!!! note ""
    ####GetExpanderMaxValue
    !!! tip ""

        ```AutoHotKey
        GetExpanderMaxValue()
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Getter for [`GridGUI.Row.expanderMaxValue`](../Row/#expandermaxvalue).



    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: The largest vertical expansion weight of a cell in the row.

            **type**: number

!!! note ""
    ####GetExpanders
    !!! tip ""

        ```AutoHotKey
        GetExpanders()
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Getter for [`GridGUI.Row.expanders`](../Row/#expanders).



    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: The sum of vertical expansion weight of cells in the row.

            **type**: number

!!! note ""
    ####GetFixedHeight
    !!! tip ""

        ```AutoHotKey
        GetFixedHeight()
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Getter for [`GridGUI.Row.fixedHeight`](../Row/#fixedheight).



    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: The largest fixed height of a cell in the row.

            **type**: number

!!! note ""
    ####GetMinHeight
    !!! tip ""

        ```AutoHotKey
        GetMinHeight()
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Getter for [`GridGUI.Row.minHeight`](../Row/#minheight).



    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: The largest minimal height of a cell in the row.

            **type**: number

!!! note ""
    ####GetNonExpanders
    !!! tip ""

        ```AutoHotKey
        GetNonExpanders()
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Getter for [`GridGUI.Row.nonExpanders`](../Row/#nonexpanders).



    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: The amount of cells with fixed height in the row.

            **type**: number

!!! note ""
    ####Remove
    !!! tip ""

        ```AutoHotKey
        Remove(c)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Removes a [`GridGUI.Cell`](../Cell/) from the row.



    ??? example "parameters"

        !!! info ""

            **name**: c

            **desc**: The [`GridGUI.Cell`](../Cell/) to remove from the row.

            **type**: [GridGUI.Cell](../Cell/)

