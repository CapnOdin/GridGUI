#ControlClass
<figure markdown="1">
A class representing a control that is part of a window.
</figure>
---
##Members

####hwnd

> **desc**: The hwnd of the associated control.

> **type**: hwnd

####initialHeight

> **desc**: Whether or not the control has had its height set using `GridGUI.ControlClass.__ParseOptions`.

> **type**: bool

####initialHeightVal

> **desc**: The height value set using `GridGUI.ControlClass.__ParseOptions`.

> **type**: number|false

####initialWidth

> **desc**: Whether or not the control has had its width set using `GridGUI.ControlClass.__ParseOptions`.

> **type**: bool

####initialWidthVal

> **desc**: The width value set using `GridGUI.ControlClass.__ParseOptions`.

> **type**: number|false

##Methods

####__Init
**desc**: Initialises the `GridGUI.ControlClass` members.

####__New
**desc**: Constructor.

**args**:

> **name**: hwnd

> **desc**: The hwnd of the control.

> **type**: hwnd

**returns**:

> **desc**: A new `GridGUI.ControlClass` instance.

> **type**: GridGUI.ControlClass

####__ParseOptions
**desc**: Parses option strings for values that are used by the class and updated the instance based on the values.

**args**:

> **name**: options

> **desc**: The options that will be parsed, values handled by the lib will be acted on and removed.

> **type**: string

**returns**:

> **desc**: The option string without the parts that the class handles.

> **type**: string

####Control
**desc**: A thin function wrapper for `Control`.

**args**:

> **name**: subCommand

> **desc**: The subcommand to set for the control. See link for available subcommands.

> **type**: string

> **name**: value

> **desc**: The value to apply to the subcommand. See link for values used in the subcommands.

> **type**: string|number

####ControlClick
**desc**: A thin function wrapper for `ControlClick`.

**args**:

> **name**: pos

> **desc**: The position to click at in the control, see link for the coordinate format.

> **type**: string

> **name**: WhichButton

> **desc**: Which mouse button to click, see link for supported values.

> **type**: string

> **default**: LEFT

> **name**: ClickCount

> **desc**: The number of click to perform.

> **type**: number

> **default**: 1

> **name**: Options

> **desc**: A option string to change how the click are performed, see link for supported options.

> **type**: string

####ControlFocus
**desc**: A thin function wrapper for `ControlFocus`.

####ControlGet
**desc**: A thin function wrapper for `ControlGet`.

**args**:

> **name**: subCommand

> **desc**: The subcommand to retrieve from the control. See link for available subcommands.

> **type**: string

> **name**: value

> **desc**: Used to specify what to retrieve when the subcommand is not specific enough.

> **type**: string

**returns**:

> **desc**: The retrieved value.

> **type**: any

####ControlGetPos
**desc**: A thin function wrapper for `ControlGetPos`, except that it returns a `GridGUI.Position` instance.

**returns**:

> **desc**: The position and size of the control.

> **type**: GridGUI.Position

####ControlGetText
**desc**: A thin function wrapper for `ControlGetText`.

**returns**:

> **desc**: The text of the control.

> **type**: string

####ControlMove
**desc**: A thin function wrapper for `ControlMove`, except that it takes a `GridGUI.Position` instance as argument.

**args**:

> **name**: pos

> **desc**: The position and size that the control should be moved and resized to.

> **type**: GridGUI.Position

####ControlSend
**desc**: A thin function wrapper for `ControlSend`.

**args**:

> **name**: keys

> **desc**: The sequence of keys to send, use `{keyname}` for non printable keys.

> **type**: string

####ControlSetText
**desc**: A thin function wrapper for `ControlSetText`.

**args**:

> **name**: NewText

> **desc**: The text to set the text of the control to.

> **type**: string

####Options
**desc**: Applies styles to the control using `Control, Style`.

**args**:

> **name**: options

> **desc**: The style number string to apply. See link for available styles.

> **type**: string

####ToStr
**desc**: Converts the object to a string.

**args**:

> **name**: indent

> **desc**: The amount of indentation to add on each line.

> **type**: string

**returns**:

> **desc**: A string representing this `GridGUI.ControlClass`.

> **type**: string

