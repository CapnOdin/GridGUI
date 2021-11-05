#GridGUI
<figure markdown="1">

</figure>
---
##Members

####Background

> **desc**: Used in the handling of controls that have been registered as background

> **type**: string

> **default**: +WS_CLIPSIBLINGS

> **link**: [link](https://docs.microsoft.com/en-us/windows/win32/winmsg/window-styles)

####ExitApp

> **desc**: Allows quick access to set up a callback that terminates the script

> **type**: bound function

> **default**: GridGUI.__ExitApp

##Methods

####__ExitApp
**desc**: A convenience function wrapper for the command.

####__New
**desc**: A convenience constructor that maps to the [GridGUI](../GridGUI/)Class.

**args**:

> **name**: title

> **desc**: The title that the new gui window will have

> **type**: string

> **name**: options

> **desc**: The ahk gui options that the window will be created with.

> **type**: string

> **name**: showGrid

> **desc**: Whether or not to show a debug grid for the [`GridGUI.Cell`](../Cell/)s that where placed in the [`GridGUI.GridGUIClass.grid`](../GridGUIClass/#grid) before [`GridGUI.GridGUIClass.Draw`](../GridGUIClass/#draw) was called the first time.

> **type**: bool

> **name**: justify

> **desc**: The position of the controls with in the grid, can be any combination of `C` (Center), `N` (North), `S` (South), `W` (West) and `E` (East).

> **type**: string|false

**returns**:

> **desc**: Returns a new instance of [`GridGUI.GridGUIClass`](../GridGUIClass/).

> **type**: GridGUI.GridGUIClass

####Area
**desc**: A convenience function for making a Position that is used as an area.

**args**:

> **name**: w

> **desc**: The width of the area.

> **type**: number

> **name**: h

> **desc**: The height of the area.

> **type**: number

> **name**: x

> **desc**: The x coordinate of the top left corner of the area.

> **type**: number

> **name**: y

> **desc**: The y coordinate of the top left corner of the area.

> **type**: number

**returns**:

> **desc**: A new Position instance.

> **type**: GridGUI.Position

####Pos
**desc**: A convenience function for making a Position, saves writting "new".

**args**:

> **name**: x

> **desc**: The x coordinate of the position.

> **type**: number

> **name**: y

> **desc**: The y coordinate of the position.

> **type**: number

> **name**: w

> **desc**: The width of the area spanning from the top left corner at (x, y) to the bottom right corner.

> **type**: number

> **name**: h

> **desc**: The height of the area spanning from the top left corner at (x, y) to the bottom right corner.

> **type**: number

**returns**:

> **desc**: A new Position instance.

> **type**: GridGUI.Position

##Classes

[GridGUIClass](../GridGUIClass/)

[SubGrid](../SubGrid/)

