#GridGUI
<figure markdown="1">
A class used as a namespace to protect the lib and a user's script from unintended name hijacking.
</figure>
---
##Members

####Background

> **desc**: Used in the handling of controls that have been registered as background

> **type**: string

> **default**: +WS_CLIPSIBLINGS

####ExitApp

> **desc**: Allows quick access to set up a callback that terminates the script

> **type**: bound function

> **default**: GridGUI.__ExitApp

##Methods

####__ExitApp
**desc**: A convenience function wrapper for the command.

####__New
**desc**: A convenience constructor that maps to the GridGUIClass.

**args**:

> **name**: title

> **desc**: The title that the new gui window will have

> **type**: string

> **name**: options

> **desc**: The ahk gui options that the window will be created with.

> **type**: string

> **name**: showGrid

> **desc**: Whether or not to show a debug grid for the `GridGUI.Cell`s that where placed in the `GridGUI.GridGUIClass.grid` before `GridGUI.GridGUIClass.Draw` was called the first time.

> **type**: bool

**returns**:

> **desc**: Returns a new instance of `GridGUI.GridGUIClass`.

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

[GridGUIClass](Classes/GridGUIClass.md)

[SubGrid](Classes/SubGrid.md)

