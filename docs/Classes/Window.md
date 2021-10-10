#Window
<figure markdown="1">
A class representing a window.
</figure>
---
##Members

####callbacks

> **desc**: The array of `GridGUI.GuiCallback`s that the class instance was created with.

> **type**: array|false

####hwnd

> **desc**: The hwnd of the associated window.

> **type**: hwnd

##Methods

####__DetectHidden
**desc**: Enables the detection of hidden windows using other ahk commands.

**returns**:

> **desc**: The previous detect hidden windows state. Either `"On"` or `"Off"`.

> **type**: string

####__New
**desc**: Constructor.

**args**:

> **name**: hwnd

> **desc**: The hwnd of the window that the class instance should work on.

> **type**: hwnd

> **name**: callbacks

> **desc**: An array of `GridGUI.GuiCallback`s to set up.

> **type**: array|false

**returns**:

> **desc**: A new `GridGUI.Window` instance.

> **type**: GridGUI.Window

####__Setup
**desc**: Sets up the `GridGUI.GuiCallback`s that where passed to the constructor. They are set up using `OnMessage`

####ControlGetFocus
**desc**: Retrieves the hwnd of the control with input focus in the window if any.

**returns**:

> **desc**: The hwnd of the control with input focus or an empty string if non where found.

> **type**: hwnd|""

####ToStr
**desc**: Converts the object to a string.

**args**:

> **name**: indent

> **desc**: The amount of indentation to add on each line.

> **type**: string

**returns**:

> **desc**: A string representing this window.

> **type**: string

####WinActivate
**desc**: A thin method wrapper for `WinActivate`.

####WinActive
**desc**: A thin method wrapper for `WinActive`.

**returns**:

> **desc**: The hwnd of the window associated with this class instance if it is the active window otherwise `false`.

> **type**: hwnd|false

####WinExist
**desc**: A thin method wrapper for `WinExist`.

**returns**:

> **desc**: The hwnd of the window associated with this class instance if it exists otherwise `false`.

> **type**: hwnd|false

####WinGet
**desc**: A thin method wrapper for `WinGet`.

**args**:

> **name**: SubCommand

> **desc**: The subcommand to retrive from the window. See the link for available subcommands.

> **type**: string

**returns**:

> **desc**: The retrieved value.

> **type**: any

####WinGetPos
**desc**: A thin method wrapper for `WinGetPos`, except that it returns a `GridGUI.Position` instance.

**returns**:

> **desc**: The position and size of the window.

> **type**: GridGUI.Position

####WinHide
**desc**: A thin method wrapper for `WinHide`.

####WinMove
**desc**: A thin method wrapper for `WinMove`.

**args**:

> **name**: x

> **desc**: The x coordinate that the top left corner of the window will be moved to. If left empty the x coordinate of the top left corner won't change.

> **type**: string

> **name**: y

> **desc**: The y coordinate that the top left corner of the window will be moved to. If left empty the y coordinate of the top left corner won't change.

> **type**: string

> **name**: w

> **desc**: The width the window should be resized to. If left empty the width won't change.

> **type**: string

> **name**: h

> **desc**: The height the window should be resized to. If left empty the height won't change.

> **type**: string

####WinSet
**desc**: A thin method wrapper for `WinSet`, except it works even if the window is hidden.

**args**:

> **name**: SubCommand

> **desc**: The subCommand to set for the window. See link for available subcommands.

> **type**: string

> **name**: value

> **desc**: The value to apply to the subcommand. See link for values used in the subcommands.

> **type**: string|number

####WinShow
**desc**: A thin method wrapper for `WinShow`.

