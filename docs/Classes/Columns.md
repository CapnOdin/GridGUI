#Columns
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

    ####columns
    !!! info ""

        **desc**: A collection of the [`GridGUI.Column`](../Column/)s where one or more [`GridGUI.Cell`](../Cell/)s have been placed. That is only used columns are generated.

        **type**: associative array

        **default**: {}

!!! info ""

    ####expanders
    !!! info ""

        **desc**: A collection of the sum of horizontal [`GridGUI.Cell`](../Cell/) expansion weights of each [`GridGUI.Column`](../Column/) in [`GridGUI.Columns.columns`](../Columns/#columns).

        **type**: associative array

        **default**: {}

!!! info ""

    ####expandersMaxValue
    !!! info ""

        **desc**: A collection of the maximum horizontal [`GridGUI.Cell`](../Cell/) expansion weight of each [`GridGUI.Column`](../Column/) in [`GridGUI.Columns.columns`](../Columns/#columns).

        **type**: associative array

        **default**: {}

!!! info ""

    ####fixedWidths
    !!! info ""

        **desc**: A collection of the fixed width of each [`GridGUI.Column`](../Column/) in [`GridGUI.Columns.columns`](../Columns/#columns).

        **type**: associative array

        **default**: {}

!!! info ""

    ####minWidths
    !!! info ""

        **desc**: A collection of the min width of each [`GridGUI.Column`](../Column/) in [`GridGUI.Columns.columns`](../Columns/#columns).

        **type**: associative array

        **default**: {}

!!! info ""

    ####nonExpanders
    !!! info ""

        **desc**: A collection of the amount of horizontally fixed [`GridGUI.Cell`](../Cell/)s in each [`GridGUI.Column`](../Column/) in [`GridGUI.Columns.columns`](../Columns/#columns).

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

            **desc**: A new [`GridGUI.Columns`](../Columns/) instance.

            **type**: [GridGUI.Columns](../Columns/)

!!! note ""
    ####__ResetConstants
    !!! tip ""

        ```AutoHotKey
        __ResetConstants()
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Resets the cached [`GridGUI.Columns`](../Columns/) members to their default values.



!!! note ""
    ####Add
    !!! tip ""

        ```AutoHotKey
        Add(c)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Adds a [`GridGUI.Cell`](../Cell/) to the [`GridGUI.Column`](../Column/)s that it spans over. If the [`GridGUI.Column`](../Column/)s are not already in [`GridGUI.Columns.columns`](../Columns/#columns) they are added before adding the cell.



    ??? example "parameters"

        !!! info ""

            **name**: c

            **desc**: The [`GridGUI.Cell`](../Cell/) to add to the [`GridGUI.Column`](../Column/)s.

            **type**: [GridGUI.Cell](../Cell/)

!!! note ""
    ####CalculateConstants
    !!! tip ""

        ```AutoHotKey
        CalculateConstants()
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Calculates the values for the [`GridGUI.Columns`](../Columns/) members that are cached.



!!! note ""
    ####CalculateWidths
    !!! tip ""

        ```AutoHotKey
        CalculateWidths(width, expandersW,, nonExpandersW,, height, expandersH, nonExpandersH)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Calculates the part of the available width that each [`GridGUI.Column`](../Column/) in [`GridGUI.Columns.columns`](../Columns/#columns) will get.



    ??? example "parameters"

        !!! info ""

            **name**: width

            **desc**: The width of the grid. That is the width that the grid should fill.

            **type**: number

        !!! info ""

            **name**: expandersW,

            **desc**: The member [`GridGUI.Columns.expanders`](../Columns/#expanders)

            **type**: associative array

        !!! info ""

            **name**: nonExpandersW,

            **desc**: The member [`GridGUI.Columns.nonExpanders`](../Columns/#nonexpanders)

            **type**: associative array

        !!! info ""

            **name**: height

            **desc**: The unclaimed height of the grid. That is the height of the grid that is left after removing the height of the fixed cells.

            **type**: number

        !!! info ""

            **name**: expandersH

            **desc**: The member [`GridGUI.Rows.expanders`](../Rows/#expanders)

            **type**: associative array

        !!! info ""

            **name**: nonExpandersH

            **desc**: The member [`GridGUI.Rows.nonExpanders`](../Rows/#nonexpanders)

            **type**: associative array

    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: The calculated widths of the [`GridGUI.Column`](../Column/)s in [`GridGUI.Columns.columns`](../Columns/#columns).

            **type**: associative array

!!! note ""
    ####GetFixedWidth
    !!! tip ""

        ```AutoHotKey
        GetFixedWidth()
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Returns the sum of the fixed widths of the [`GridGUI.Column`](../Column/)s in [`GridGUI.Columns.columns`](../Columns/#columns).



    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: The sum of the fixed widths of the [`GridGUI.Column`](../Column/)s in [`GridGUI.Columns.columns`](../Columns/#columns).

            **type**: number

!!! note ""
    ####GetMinWidth
    !!! tip ""

        ```AutoHotKey
        GetMinWidth()
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Returns the sum of the minimal widths of the [`GridGUI.Column`](../Column/)s in [`GridGUI.Columns.columns`](../Columns/#columns).



    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: The sum of the minimal widths of the [`GridGUI.Column`](../Column/)s in [`GridGUI.Columns.columns`](../Columns/#columns).

            **type**: number

!!! note ""
    ####ReduceToGuiSize
    !!! tip ""

        ```AutoHotKey
        ReduceToGuiSize(widths, expandedWidths, sumExpandedWidths, excessWidth)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Fixes miscalculations in the width of expanding [`GridGUI.Cell`](../Cell/)s by reducing their width down until they all fit in the available width or all have reach their min width. The reduction is done starting with the widest [`GridGUI.Column`](../Column/) to the thinnest.



    ??? example "parameters"

        !!! info ""

            **name**: widths

            **desc**: The calculated widths for the [`GridGUI.Column`](../Column/)s in [`GridGUI.Columns.columns`](../Columns/#columns).

            **type**: associative array

        !!! info ""

            **name**: expandedWidths

            **desc**: An array of the widths of [`GridGUI.Column`](../Column/)s with one or more horizontally expanding [`GridGUI.Cell`](../Cell/) if the current width in `widths` corresponding to the column is larger than the minimum of the column otherwise it wont be included in the `expandedWidths`

            **type**: array

        !!! info ""

            **name**: sumExpandedWidths

            **desc**: The sum of the widths in `expandedWidths`.

            **type**: number

        !!! info ""

            **name**: excessWidth

            **desc**: The amount of width that the sum of `widths` would exceed the width of the grid/gui.

            **type**: number

!!! note ""
    ####Remove
    !!! tip ""

        ```AutoHotKey
        Remove(c)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Removes a [`GridGUI.Cell`](../Cell/) from the [`GridGUI.Column`](../Column/)s that it spans over. If the [`GridGUI.Column`](../Column/)s are empty after removing the cell the column will be removed as well.



    ??? example "parameters"

        !!! info ""

            **name**: c

            **desc**: The [`GridGUI.Cell`](../Cell/) to remove from the [`GridGUI.Column`](../Column/)s.

            **type**: [GridGUI.Cell](../Cell/)

