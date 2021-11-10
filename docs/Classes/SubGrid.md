#SubGrid
<figure markdown="1">

</figure>
---
##Members

!!! info ""

    ####DPIScale
    !!! info ""

        **desc**: Whether or not to change the size of controls based on DPI. Needed since a subgrid does not make its own gui to handle the gui options.

        **type**: bool

        **meta**: [const]

!!! info ""

    ####hwnd
    !!! info ""

        **desc**: The hwnd of the gui that the [`GridGUI.SubGrid`](../SubGrid/) adds controls to when calling [`GridGUI.GridGUIClass.Add`](../GridGUIClass/#add) and [`GridGUI.GridGUIClass.AddControl`](../GridGUIClass/#addcontrol). Needed since a subgrid does not make its own gui.

        **type**: hwnd

!!! info ""

    ####minHeight
    !!! info ""

        **desc**: Whether or not to restrict the min height of the subgrid to [`GridGUI.SubGrid.minHeightVal`](../SubGrid/#minheightval). Needed in providing the interface required to be managed by a [`GridGUI.Cell`](../Cell/) instance.

        **type**: bool

        **default**: false

!!! info ""

    ####minHeightVal
    !!! info ""

        **desc**: The min height of the [`GridGUI.SubGrid`](../SubGrid/). Needed in providing the interface required to be managed by a [`GridGUI.Cell`](../Cell/) instance.

        **type**: number

        **default**: 0

!!! info ""

    ####minWidth
    !!! info ""

        **desc**: Whether or not to restrict the min width of the subgrid to [`GridGUI.SubGrid.minWidthVal`](../SubGrid/#minwidthval). Needed in providing the interface required to be managed by a [`GridGUI.Cell`](../Cell/) instance.

        **type**: bool

        **default**: false

!!! info ""

    ####minWidthVal
    !!! info ""

        **desc**: The min width of the [`GridGUI.SubGrid`](../SubGrid/). Needed in providing the interface required to be managed by a [`GridGUI.Cell`](../Cell/) instance.

        **type**: number

        **default**: 0

!!! info ""

    ####pos
    !!! info ""

        **desc**: The position of the subgrid. Needed since a subgrid does not make its own gui and thus do not have the gui event callbacks.

        **type**: [GridGUI.Position](../Position/)

        **default**: GridGUI.Position(0, 0, 0, 0)

        **meta**: [object]

##Methods

!!! note ""
    ####__Init
    !!! tip ""

        ```AutoHotKey
        __Init(area)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Sets the min size of the subgrid and initialises the members that are required when managed by a [`GridGUI.Cell`](../Cell/) instance.



    ??? example "parameters"

        !!! info ""

            **name**: area

            **desc**: The minimum area that the subgrid will have.

            **type**: [GridGUI.Position](../Position/)

!!! note ""
    ####__New
    !!! tip ""

        ```AutoHotKey
        __New(guiHwnd, area := false, DPIScale := true, showGrid := false, justify := false)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Constructor.



    ??? example "parameters"

        !!! info ""

            **name**: guiHwnd

            **desc**: The hwnd of the gui that the [`GridGUI.SubGrid`](../SubGrid/) adds controls to when calling [`GridGUI.GridGUIClass.Add`](../GridGUIClass/#add) and [`GridGUI.GridGUIClass.AddControl`](../GridGUIClass/#addcontrol). Needed since a subgrid does not make its own gui.

            **type**: hwnd

        !!! info ""

            **name**: area

            **desc**: The minimum area that the subgrid will have.

            **type**: [GridGUI.Position](../Position/)|bool

            **default**: false

        !!! info ""

            **name**: DPIScale

            **desc**: Whether or not to change the size of controls based on DPI. Needed since a subgrid does not make its own gui to handle the gui options.

            **type**: bool

            **default**: true

        !!! info ""

            **name**: showGrid

            **desc**: Whether or not to show a debug grid for the [`GridGUI.Cell`](../Cell/)s that where placed in the [GridGUI.SubGrid.grid`](../SubGrid/#grid) before [`GridGUI.SubGrid.Draw`](../SubGrid/#draw) was called the first time.

            **type**: bool

            **default**: false

        !!! info ""

            **name**: justify

            **desc**: The position of the controls with in the grid, can be any combination of `C` (Center), `N` (North), `S` (South), `W` (West) and `E` (East).

            **type**: string|false

            **default**: false

    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: Returns a new instance of [`GridGUI.SubGrid`](../SubGrid/).

            **type**: [GridGUI.SubGrid](../SubGrid/)

!!! note ""
    ####Draw
    !!! tip ""

        ```AutoHotKey
        Draw(area)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Stores the area in [`GridGUI.SubGrid.pos`](../SubGrid/#pos) and calculates the new positions of the controls in the subgrid based on the settings of their [`GridGUI.Cell`](../Cell/) and moved them to their new positions.



    ??? example "parameters"

        !!! info ""

            **name**: area

            **desc**: The area that the controls in the grid will be sized to fit into if possible.

            **type**: [GridGUI.Position](../Position/)

!!! note ""
    ####GetPos
    !!! tip ""

        ```AutoHotKey
        GetPos()
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Retrieves the position of the subgrid. Needed in providing the interface required to be managed by a [`GridGUI.Cell`](../Cell/) instance.



    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: The last position that [`GridGUI.SubGrid.Draw`](../SubGrid/#draw) was called with.

            **type**: [GridGUI.Position](../Position/)

!!! note ""
    ####MinSize
    !!! tip ""

        ```AutoHotKey
        MinSize(w, h)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Sets the minimum size of the subgrid. The min size is used by a [`GridGUI.Cell`](../Cell/) to determin the cells size.



    ??? example "parameters"

        !!! info ""

            **name**: w

            **desc**: The minimal width of the subgrid, if left empty the current min width won't be changed unless both parameters are left empty in which case the min width will be set to the current width of the subgrid.

            **type**: number|""

        !!! info ""

            **name**: h

            **desc**: The minimal height of the subgrid, if left empty the current min height won't be changed unless both parameters are left empty in which case the min height will be set to the current height of the subgrid.

            **type**: number|""

