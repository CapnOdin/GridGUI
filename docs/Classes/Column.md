#Column
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

        **desc**: A collection of arrays of [`GridGUI.Cell`](../Cell/)s indexed by the index of the rows they are placed on.

        **type**: Associative Array

        **default**: {}

        **meta**: [object]

!!! info ""

    ####confligtingExpanders
    !!! info ""

        **desc**: A collection of cells that have horizontal expansion conflicts.

        **type**: Associative Array

        **default**: {}

        **meta**: [object, cached]

!!! info ""

    ####expanderMaxValue
    !!! info ""

        **desc**: The largest horizontal expansion weight in this column.

        **type**: number

        **default**: 0

        **meta**: [cached]

!!! info ""

    ####expanders
    !!! info ""

        **desc**: The sum of all the horizontal expansion weights of cells that are in this column.

        **type**: number

        **default**: 0

        **meta**: [cached]

!!! info ""

    ####fixedWidth
    !!! info ""

        **desc**: The maximal fixed width of the cells, that is the largest fixed width for a cell in [`GridGUI.Column.cells`](../Column/#cells).

        **type**: number

        **default**: 0

        **meta**: [cached]

!!! info ""

    ####index
    !!! info ""

        **desc**: The index of the column in the grid.

        **type**: number

        **default**: 0

!!! info ""

    ####minWidth
    !!! info ""

        **desc**: The maximal minimal width for the cells, that is the largest minimal width for a cell in [`GridGUI.Column.cells`](../Column/#cells).

        **type**: number

        **default**: 0

        **meta**: [cached]

!!! info ""

    ####nonExpanders
    !!! info ""

        **desc**: The amount of cells with fixed size in this column.

        **type**: number

        **default**: 0

        **meta**: [cached]

##Methods

!!! note ""
    ####__CalculateConfligtingExpanders
    !!! tip ""

        ```AutoHotKey
        __CalculateConfligtingExpanders(c)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Updates [`GridGUI.Column.confligtingExpanders`](../Column/#confligtingexpanders) with the [`GridGUI.Cell`](../Cell/) for a cell if it has horizontal conflicts.



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

        :material-clipboard-text:{ .desc } Updates [`GridGUI.Column.expanders`](../Column/#expanders) with the result of [`GridGUI.Cell.GetExpansionWidthValue`](../Cell/#getexpansionwidthvalue) for a cell.



    ??? example "parameters"

        !!! info ""

            **name**: c

            **desc**: The [`GridGUI.Cell`](../Cell/) to retrieve the value from.

            **type**: [GridGUI.Cell](../Cell/)

!!! note ""
    ####__CalculateFixedWidth
    !!! tip ""

        ```AutoHotKey
        __CalculateFixedWidth(c)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Updates [`GridGUI.Column.fixedWidth`](../Column/#fixedwidth) with the result of [`GridGUI.Cell.GetFixedWidth`](../Cell/#getfixedwidth) for a cell if it is larger than the previous value.



    ??? example "parameters"

        !!! info ""

            **name**: c

            **desc**: The [`GridGUI.Cell`](../Cell/) to retrieve the value from.

            **type**: [GridGUI.Cell](../Cell/)

!!! note ""
    ####__CalculateMinWidth
    !!! tip ""

        ```AutoHotKey
        __CalculateMinWidth(c)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Updates [`GridGUI.Column.minWidth`](../Column/#minwidth) with the result of [`GridGUI.Cell.GetNeededWidth`](../Cell/#getneededwidth) for a cell if it is larger than the previous value.



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

        :material-clipboard-text:{ .desc } Increments [`GridGUI.Column.nonExpanders`](../Column/#nonexpanders) if the [`GridGUI.Cell`](../Cell/) does not expand horizontally.



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

            **desc**: The index of the column in the grid.

            **type**: number

    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: A new [`GridGUI.Column`](../Column/) instance.

            **type**: [GridGUI.Column](../Column/)

!!! note ""
    ####__ResetConstants
    !!! tip ""

        ```AutoHotKey
        __ResetConstants()
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Resets the cached [`GridGUI.Column`](../Column/) members to their default values.



!!! note ""
    ####Add
    !!! tip ""

        ```AutoHotKey
        Add(c)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Adds a [`GridGUI.Cell`](../Cell/) to the column.



    ??? example "parameters"

        !!! info ""

            **name**: c

            **desc**: The [`GridGUI.Cell`](../Cell/) to added to the column.

            **type**: [GridGUI.Cell](../Cell/)

!!! note ""
    ####CalculateConstants
    !!! tip ""

        ```AutoHotKey
        CalculateConstants()
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Calculates the values for the [`GridGUI.Column`](../Column/) members that are cached.



!!! note ""
    ####CalculateWidth
    !!! tip ""

        ```AutoHotKey
        CalculateWidth(width, expandersW, nonExpandersW, height, expandersH, nonExpandersH)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Calculates the width of the column.



    ??? example "parameters"

        !!! info ""

            **name**: width

            **desc**: The unclaimed width of the grid, that is the width of the GUI or subgrid left after removing the width of the fixed cells.

            **type**: number

        !!! info ""

            **name**: expandersW

            **desc**: An array of the sum of horizontal expansion weights for each column.

            **type**: associative array

        !!! info ""

            **name**: nonExpandersW

            **desc**: An array of the amount of fixed size cells in each column.

            **type**: associative array

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

    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: The width of the column.

            **type**: number

!!! note ""
    ####GetExpanderMaxValue
    !!! tip ""

        ```AutoHotKey
        GetExpanderMaxValue()
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Getter for [`GridGUI.Column.expanderMaxValue`](../Column/#expandermaxvalue).



    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: The largest horizontal expansion weight of a cell in the column.

            **type**: number

!!! note ""
    ####GetExpanders
    !!! tip ""

        ```AutoHotKey
        GetExpanders()
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Getter for [`GridGUI.Column.expanders`](../Column/#expanders).



    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: The sum of horizontal expansion weight of cells in the column.

            **type**: number

!!! note ""
    ####GetFixedWidth
    !!! tip ""

        ```AutoHotKey
        GetFixedWidth()
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Getter for [`GridGUI.Column.fixedWidth`](../Column/#fixedwidth).



    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: The largest fixed width of a cell in the column.

            **type**: number

!!! note ""
    ####GetMinWidth
    !!! tip ""

        ```AutoHotKey
        GetMinWidth()
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Getter for [`GridGUI.Column.minWidth`](../Column/#minwidth).



    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: The largest minimal width of a cell in the column.

            **type**: number

!!! note ""
    ####GetNonExpanders
    !!! tip ""

        ```AutoHotKey
        GetNonExpanders()
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Getter for [`GridGUI.Column.nonExpanders`](../Column/#nonexpanders).



    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: The amount of cells with fixed width in the column.

            **type**: number

!!! note ""
    ####Remove
    !!! tip ""

        ```AutoHotKey
        Remove(c)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Removes a [`GridGUI.Cell`](../Cell/) from the column.



    ??? example "parameters"

        !!! info ""

            **name**: c

            **desc**: The [`GridGUI.Cell`](../Cell/) to remove from the column.

            **type**: [GridGUI.Cell](../Cell/)

