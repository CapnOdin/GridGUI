#GuiCallback
<figure markdown="1">
A class that holds the information needed to set up a window message callback.
</figure>
---
##Members

####function

> **desc**: The function that should be called when the window message is received.

> **type**: Func|BoundFunc

####msgNum

> **desc**: The window message number. See link for available window messages.

> **type**: number

##Methods

####__New
**desc**: Constructor.

**args**:

> **name**: msgNum

> **desc**: The window message number. See link for available window messages.

> **type**: number

> **name**: function

> **desc**: The function to call when the window message is received.

> **type**: Func|BoundFunc|string

**returns**:

> **desc**: A new `GridGUI.GuiCallback` instance.

> **type**: GridGUI.GuiCallback

####ToStr
**desc**: Converts the object to a string.

**args**:

> **name**: indent

> **desc**: The amount of indentation to add on each line.

> **type**: string

**returns**:

> **desc**: A string representing this callback.

> **type**: string
