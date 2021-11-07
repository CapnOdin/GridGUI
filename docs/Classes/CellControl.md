#CellControl
<figure markdown="1">

</figure>
---
##Members

!!! info ""

    ####minHeight
    !!! info ""

        **desc**: Whether or not the control has a minimum height.

        **type**: bool

        **default**: false

!!! info ""

    ####minHeightVal
    !!! info ""

        **desc**: The minimum height of the control. Should be disregarded if [`GridGUI.CellControl.minHeight`](../CellControl/#minheight) is **false**.

        **type**: number

        **default**: 0

!!! info ""

    ####minWidth
    !!! info ""

        **desc**: Whether or not the control has a minimum width.

        **type**: bool

        **default**: false

!!! info ""

    ####minWidthVal
    !!! info ""

        **desc**: The minimum width of the control. Should be disregarded if [`GridGUI.CellControl.minWidth`](../CellControl/#minwidth) is **false**.

        **type**: number

        **default**: 0

##Methods

!!! note ""
    ####Draw
    !!! tip ""

        ```AutoHotKey
        Draw(area)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Implementations of this interface should move and draw the control on the GUI in this method.



    ??? example "parameters"

        !!! info ""

            **name**: area

            **desc**: The position to move the control to and size to draw the control at.

            **type**: [GridGUI.Position](../Position/)

!!! note ""
    ####GetPos
    !!! tip ""

        ```AutoHotKey
        GetPos()
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Implementations of this interface should return the position and size of the control.



    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: The position and size of the control.

            **type**: [GridGUI.Position](../Position/)

!!! note ""
    ####MinSize
    !!! tip ""

        ```AutoHotKey
        MinSize(w := "", h := "")
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Sets the minimum size of the control. If both `w` and `h` are left unset then the minimum size will be set to the current size of the control as returned by [`GridGUI.CellControl.GetPos`](../CellControl/#getpos)



    ??? example "parameters"

        !!! info ""

            **name**: w

            **desc**: The minimum width to set. If left unset then the minimum width won't be changed.

            **type**: number|""

            **default**: ""

        !!! info ""

            **name**: h

            **desc**: The minimum height to set. If left unset then the minimum height won't be changed.

            **type**: number|""

            **default**: ""

