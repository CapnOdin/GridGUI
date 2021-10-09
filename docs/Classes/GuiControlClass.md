#GuiControlClass
<figure markdown="1">
A class representing a control that is part of an ahk GUI.
</figure>
---
##Members

####callback

> **desc**: A callback that will be called whenever a glabel would be called.

> **type**: Func|BoundFunc|false

####DPIScale

> **desc**: Whether or not to scale unscaled values by DPI/96.

> **type**: bool

####guiHwnd

> **desc**: The hwnd of the parent GUI.

> **type**: hwnd

####logfont

> **desc**: An instance of `GridGUI.LOGFONT` which hold information on the font and colour of the control.

> **type**: GridGUI.LOGFONT

####type

> **desc**: The type of the control e.g. `Button`, `Edit` etc.

> **type**: string

####vVar

> **desc**: A variable containing the value of the control as returned by `GridGUI.GuiControlClass.GuiControlGet` when called with no arguments, it is updated when the glabel is fired.

> **type**: any

> **default**: The initial value of the control.

##Methods

####__glabel
**desc**: An internal method used to allow a function callback to a label.

**args**:

> **name**: label

> **desc**: The name of a label that will be `GoSub`ed to.

> **type**: string

####__New
**desc**: Constructor.

**args**:

> **name**: hwnd

> **desc**: The hwnd of the control.

> **type**: hwnd

> **name**: type

> **desc**: The type of the control.

> **type**: string

> **name**: options

> **desc**: The ahk options string that the control was created with, used to set up min-size and glabel callback.

> **type**: string

> **name**: callback

> **desc**: The callback to call whenever the glabel of the control would be called.

> **type**: Func|BoundFunc|false

> **name**: DPIScale

> **desc**: Whether or not to scale unscaled values by DPI/96.

> **type**: bool

**returns**:

> **desc**: A new `GridGUI.GuiControlClass` instance.

> **type**: GridGUI.GuiControlClass

####__ParseOptions
**desc**: Parses option strings for values that are used by the class and updated the instance based on the values.

**args**:

> **name**: options

> **desc**: The options that will be parsed, values handled by the lib will be acted on and removed.

> **type**: string

**returns**:

> **desc**: The option string without the parts that the class handles.

> **type**: string

####Draw
**desc**: Draws the control using `MoveDraw`.

**args**:

> **name**: pos

> **desc**: The position and size to draw the control with.

> **type**: GridGUI.Position

####Font
**desc**: Changes the font, style and colour of the control, without impacting other controls. After the font and style has been applied the min-size of the control is changed so that the text fits.

**args**:

> **name**: Options

> **desc**: Styling option string, see link for detail of what options are available.

> **type**: string

> **name**: FontName

> **desc**: The name of the font to apply.

> **type**: string

####GuiControl
**desc**: A thin function wrapper for `GuiControl`.

**args**:

> **name**: subCommand

> **desc**: The subcommand to set for the control. See link for available subcommands.

> **type**: string

> **name**: value

> **desc**: The value to apply to the subcommand. See link for values used in the subcommands.

> **type**: string|number|object

####GuiControlGet
**desc**: A thin function wrapper for `GuiControlGet`.

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

####Options
**desc**: Applies options to the control using `GuiControl`.

**args**:

> **name**: options

> **desc**: The ahk option string to apply. See link for available options.

> **type**: string

####ReDraw
**desc**: Draws the control again, using options that work when drawing the control ontop of other controls.

####ToStr
**desc**: Converts the object to a string.

**args**:

> **name**: indent

> **desc**: The amount of indentation to add on each line.

> **type**: string

**returns**:

> **desc**: A string representing this `GridGUI.GuiControlClass`.

> **type**: string

####ZOrder
**desc**: Changes the z-order of the control to either `bottom`, `top` or `topmost`.

**args**:

> **name**: top

> **desc**: If true moved the control to the top of the z-order. If false moves the control to the bottom of the z-order.

> **type**: bool

> **name**: topmost

> **desc**: If `true` moves the control to be above all other controls. If false sets the z-order based on `GridGUI.GuiControlClass.top`.

> **type**: bool

