#SubGrid
<figure markdown="1">
A class that allows a `GridGUI.GridGUIClass` to be added to the `GridGUI.GridGUIClass.grid` the same way that controls are added, by not creating a new gui and by providing the required methods.
</figure>
---
##Members

####DPIScale

> **desc**: Whether or not to change the size of controls based on DPI. Needed since a subgrid does not make its own gui to handle the gui options.

> **type**: bool

####hwnd

> **desc**: The hwnd of the gui that the `GridGUI.SubGrid` adds controls to when calling `GridGUI.GridGUIClass.Add` and `GridGUI.GridGUIClass.AddControl`. Needed since a subgrid does not make its own gui.

> **type**: hwnd

####initialHeight

> **desc**: Whether or not to restrict the min height of the subgrid to `GridGUI.SubGrid.initialHeightVal`. Needed in providing the interface required to be managed by a `GridGUI.Cell` instance.

> **type**: bool

####initialHeightVal

> **desc**: The min height of the `GridGUI.SubGrid`. Needed in providing the interface required to be managed by a `GridGUI.Cell` instance.

> **type**: number

####initialWidth

> **desc**: Whether or not to restrict the min width of the subgrid to `GridGUI.SubGrid.initialWidthVal`. Needed in providing the interface required to be managed by a `GridGUI.Cell` instance.

> **type**: bool

####initialWidthVal

> **desc**: The min width of the `GridGUI.SubGrid`. Needed in providing the interface required to be managed by a `GridGUI.Cell` instance.

> **type**: number

####pos

> **desc**: The position of the subgrid. Needed since a subgrid does not make its own gui and thus do not have the gui event callbacks.

> **type**: GridGUI.Position

> **default**: GridGUI.Position(0, 0, 0, 0)

##Methods

####__Init
**desc**: Sets the min size of the subgrid and initialises the members that are required when managed by a `GridGUI.Cell` instance.

**args**:

> **name**: area

> **desc**: The minimum area that the subgrid will have.

> **type**: GridGUI.Position

####__New
**desc**: 

**args**:

> **name**: guiHwnd

> **desc**: The hwnd of the gui that the `GridGUI.SubGrid` adds controls to when calling `GridGUI.GridGUIClass.Add` and `GridGUI.GridGUIClass.AddControl`. Needed since a subgrid does not make its own gui.

> **type**: hwnd

> **name**: area

> **desc**: The minimum area that the subgrid will have.

> **type**: GridGUI.Position|bool

> **name**: DPIScale

> **desc**: Whether or not to change the size of controls based on DPI. Needed since a subgrid does not make its own gui to handle the gui options.

> **type**: bool

> **name**: showGrid

> **desc**: Whether or not to show a debug grid for the `GridGUI.Cell`s that where placed in the GridGUI.SubGrid.grid` before `GridGUI.SubGrid.Draw` was called the first time.

> **type**: bool

**returns**:

> **desc**: Returns a new instance of `GridGUI.SubGrid`.

> **type**: GridGUI.SubGrid

####ControlGetPos
**desc**: Retrieves the position of the subgrid. Needed in providing the interface required to be managed by a `GridGUI.Cell` instance.

**returns**:

> **desc**: The last position that `GridGUI.SubGrid.Draw` was called with.

> **type**: GridGUI.Position

####Draw
**desc**: Stores the area in `GridGUI.SubGrid.pos` and calculates the new positions of the controls in the subgrid based on the settings of their `GridGUI.Cell` and moved them to their new positions.

**args**:

> **name**: area

> **desc**: The area that the controls in the grid will be sized to fit into if possible.

> **type**: GridGUI.Position

