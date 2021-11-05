#SubGrid
<figure markdown="1">

</figure>
---
##Members

####DPIScale

> **desc**: Whether or not to change the size of controls based on DPI. Needed since a subgrid does not make its own gui to handle the gui options.

> **type**: bool

####hwnd

> **desc**: The hwnd of the gui that the [`GridGUI.SubGrid`](../SubGrid/) adds controls to when calling [`GridGUI.GridGUIClass.Add`](../GridGUIClass/#add) and [`GridGUI.GridGUIClass.AddControl`](../GridGUIClass/#addcontrol). Needed since a subgrid does not make its own gui.

> **type**: hwnd

####minHeight

> **desc**: Whether or not to restrict the min height of the subgrid to [`GridGUI.SubGrid.minHeightVal`](../SubGrid/#minheightval). Needed in providing the interface required to be managed by a [`GridGUI.Cell`](../Cell/) instance.

> **type**: bool

####minHeightVal

> **desc**: The min height of the [`GridGUI.SubGrid`](../SubGrid/). Needed in providing the interface required to be managed by a [`GridGUI.Cell`](../Cell/) instance.

> **type**: number

####minWidth

> **desc**: Whether or not to restrict the min width of the subgrid to [`GridGUI.SubGrid.minWidthVal`](../SubGrid/#minwidthval). Needed in providing the interface required to be managed by a [`GridGUI.Cell`](../Cell/) instance.

> **type**: bool

####minWidthVal

> **desc**: The min width of the [`GridGUI.SubGrid`](../SubGrid/). Needed in providing the interface required to be managed by a [`GridGUI.Cell`](../Cell/) instance.

> **type**: number

####pos

> **desc**: The position of the subgrid. Needed since a subgrid does not make its own gui and thus do not have the gui event callbacks.

> **type**: [GridGUI.Position](../Position/)

> **default**: GridGUI.Position(0, 0, 0, 0)

##Methods

####__Init
**desc**: Sets the min size of the subgrid and initialises the members that are required when managed by a [`GridGUI.Cell`](../Cell/) instance.

**args**:

> **name**: area

> **desc**: The minimum area that the subgrid will have.

> **type**: [GridGUI.Position](../Position/)

####__New
**desc**: 

**args**:

> **name**: guiHwnd

> **desc**: The hwnd of the gui that the [`GridGUI.SubGrid`](../SubGrid/) adds controls to when calling [`GridGUI.GridGUIClass.Add`](../GridGUIClass/#add) and [`GridGUI.GridGUIClass.AddControl`](../GridGUIClass/#addcontrol). Needed since a subgrid does not make its own gui.

> **type**: hwnd

> **name**: area

> **desc**: The minimum area that the subgrid will have.

> **type**: [GridGUI.Position](../Position/)|bool

> **name**: DPIScale

> **desc**: Whether or not to change the size of controls based on DPI. Needed since a subgrid does not make its own gui to handle the gui options.

> **type**: bool

> **name**: showGrid

> **desc**: Whether or not to show a debug grid for the [`GridGUI.Cell`](../Cell/)s that where placed in the [GridGUI.SubGrid.grid`](../SubGrid/#grid) before [`GridGUI.SubGrid.Draw`](../SubGrid/#draw) was called the first time.

> **type**: bool

> **name**: justify

> **desc**: The position of the controls with in the grid, can be any combination of `C` (Center), `N` (North), `S` (South), `W` (West) and `E` (East).

> **type**: string|false

**returns**:

> **desc**: Returns a new instance of [`GridGUI.SubGrid`](../SubGrid/).

> **type**: GridGUI.SubGrid

####Draw
**desc**: Stores the area in [`GridGUI.SubGrid.pos`](../SubGrid/#pos) and calculates the new positions of the controls in the subgrid based on the settings of their [`GridGUI.Cell`](../Cell/) and moved them to their new positions.

**args**:

> **name**: area

> **desc**: The area that the controls in the grid will be sized to fit into if possible.

> **type**: [GridGUI.Position](../Position/)

####GetPos
**desc**: Retrieves the position of the subgrid. Needed in providing the interface required to be managed by a [`GridGUI.Cell`](../Cell/) instance.

**returns**:

> **desc**: The last position that [`GridGUI.SubGrid.Draw`](../SubGrid/#draw) was called with.

> **type**: GridGUI.Position

####MinSize
**desc**: Sets the minimum size of the subgrid. The min size is used by a [`GridGUI.Cell`](../Cell/) to determin the cells size.

**args**:

> **name**: w

> **desc**: The minimal width of the subgrid, if left empty the current min width won't be changed unless both parameters are left empty in which case the min width will be set to the current width of the subgrid.

> **type**: number|""

> **name**: h

> **desc**: The minimal height of the subgrid, if left empty the current min height won't be changed unless both parameters are left empty in which case the min height will be set to the current height of the subgrid.

> **type**: number|""

