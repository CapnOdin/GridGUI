#GuiControlClass
<figure markdown="1">

</figure>
---
##Members

!!! info ""

    ####callback
    !!! info ""

        **desc**: A callback that will be called whenever a glabel would be called. If set to `false` the callback will be ignored.

        **type**: Func|BoundFunc|false

        **default**: false

        **meta**: [object]

        **link**: [link](https://www.autohotkey.com/docs/commands/Gui.htm#Events)

!!! info ""

    ####DPIScale
    !!! info ""

        **desc**: Whether or not to scale unscaled values by DPI/96.

        **type**: bool

        **default**: false

!!! info ""

    ####guiHwnd
    !!! info ""

        **desc**: The hwnd of the parent GUI.

        **type**: hwnd

!!! info ""

    ####logfont
    !!! info ""

        **desc**: An instance of [`GridGUI.LOGFONT`](../LOGFONT/) which hold information on the font and colour of the control.

        **type**: [GridGUI.LOGFONT](../LOGFONT/)

        **meta**: [object]

!!! info ""

    ####type
    !!! info ""

        **desc**: The type of the control e.g. `Button`, `Edit` etc.

        **type**: string

!!! info ""

    ####vVar
    !!! info ""

        **desc**: A variable containing the value of the control as returned by [`GridGUI.GuiControlClass.GuiControlGet`](../GuiControlClass/#guicontrolget) when called with no arguments, it is updated when the glabel is fired.

        **type**: any

        **default**: The initial value of the control.

##Methods

!!! note ""
    ####__glabel
    !!! tip ""

        ```AutoHotKey
        __glabel(label)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } An internal method used to allow a function callback to a label.



    ??? example "parameters"

        !!! info ""

            **name**: label

            **desc**: The name of a label that will be `GoSub`ed to.

            **type**: string

            **link**: [link](https://www.autohotkey.com/docs/commands/Gui.htm#Events)

!!! note ""
    ####__New
    !!! tip ""

        ```AutoHotKey
        __New(hwnd, type, options := "", callback := false, DPIScale := true)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Constructor.



    ??? example "parameters"

        !!! info ""

            **name**: hwnd

            **desc**: The hwnd of the control.

            **type**: hwnd

        !!! info ""

            **name**: type

            **desc**: The type of the control.

            **type**: string

        !!! info ""

            **name**: options

            **desc**: The ahk options string that the control was created with, used to set up min-size and glabel callback.

            **type**: string

            **default**: ""

        !!! info ""

            **name**: callback

            **desc**: The callback to call whenever the glabel of the control would be called.

            **type**: Func|BoundFunc|false

            **default**: false

        !!! info ""

            **name**: DPIScale

            **desc**: Whether or not to scale unscaled values by DPI/96.

            **type**: bool

            **default**: true

    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: A new [`GridGUI.GuiControlClass`](../GuiControlClass/) instance.

            **type**: [GridGUI.GuiControlClass](../GuiControlClass/)

!!! note ""
    ####__ParseOptions
    !!! tip ""

        ```AutoHotKey
        __ParseOptions(options)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Parses option strings for values that are used by the class and updated the instance based on the values.



    ??? example "parameters"

        !!! info ""

            **name**: options

            **desc**: The options that will be parsed, values handled by the lib will be acted on and removed.

            **type**: string

    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: The option string without the parts that the class handles.

            **type**: string

!!! note ""
    ####Draw
    !!! tip ""

        ```AutoHotKey
        Draw(pos)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Draws the control using `MoveDraw`.



    ??? example "parameters"

        !!! info ""

            **name**: pos

            **desc**: The position and size to draw the control with.

            **type**: [GridGUI.Position](../Position/)

!!! note ""
    ####Font
    !!! tip ""

        ```AutoHotKey
        Font(Options := "", FontName := "", updateMinSize := true)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Changes the font, style and colour of the control, without impacting other controls. After the font and style has been applied the min-size of the control is changed so that the text fits.



    ??? example "parameters"

        !!! info ""

            **name**: Options

            **desc**: Styling option string, see link for detail of what options are available.

            **type**: string

            **default**: ""

            **link**: [link](https://www.autohotkey.com/docs/commands/Gui.htm#Font)

        !!! info ""

            **name**: FontName

            **desc**: The name of the font to apply.

            **type**: string

            **default**: ""

            **link**: [link](https://www.autohotkey.com/docs/misc/FontsStandard.htm)

        !!! info ""

            **name**: updateMinSize

            **desc**: Whether or not to update the min size of the control so that the text will be visible using the new font.

            **type**: bool

            **default**: true

            **link**: [link](https://www.autohotkey.com/docs/misc/FontsStandard.htm)

!!! note ""
    ####GetPos
    !!! tip ""

        ```AutoHotKey
        GetPos()
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Implements the method [`GridGUI.CellControl.GetPos`](../CellControl/#getpos) of the [`GridGUI.Cell`](../Cell/) interface [`GridGUI.CellControl`](../CellControl/).



    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: The position and size of the control.

            **type**: [GridGUI.Position](../Position/)

!!! note ""
    ####GuiControl
    !!! tip ""

        ```AutoHotKey
        GuiControl(subCommand, value)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } A thin function wrapper for `GuiControl`.



    ??? example "parameters"

        !!! info ""

            **name**: subCommand

            **desc**: The subcommand to set for the control. See link for available subcommands.

            **type**: string

            **link**: [link](https://www.autohotkey.com/docs/commands/GuiControl.htm#SubCommands)

        !!! info ""

            **name**: value

            **desc**: The value to apply to the subcommand. See link for values used in the subcommands.

            **type**: string|number|object

            **link**: [link](https://www.autohotkey.com/docs/commands/GuiControl.htm#SubCommands)

    **link**: [link](https://www.autohotkey.com/docs/commands/GuiControl.htm)

!!! note ""
    ####GuiControlGet
    !!! tip ""

        ```AutoHotKey
        GuiControlGet(subCommand := "", value := "")
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } A thin function wrapper for `GuiControlGet`.



    ??? example "parameters"

        !!! info ""

            **name**: subCommand

            **desc**: The subcommand to retrieve from the control. See link for available subcommands.

            **type**: string

            **default**: ""

            **link**: [link](https://www.autohotkey.com/docs/commands/GuiControlGet.htm#SubCommands)

        !!! info ""

            **name**: value

            **desc**: Used to specify what to retrieve when the subcommand is not specific enough.

            **type**: string

            **default**: ""

            **link**: [link](https://www.autohotkey.com/docs/commands/GuiControlGet.htm#SubCommands)

    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: The retrieved value.

            **type**: any

    **link**: [link](https://www.autohotkey.com/docs/commands/GuiControlGet.htm)

!!! note ""
    ####Options
    !!! tip ""

        ```AutoHotKey
        Options(options)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Applies options to the control using `GuiControl`.



    ??? example "parameters"

        !!! info ""

            **name**: options

            **desc**: The ahk option string to apply. See link for available options.

            **type**: string

            **link**: [link](https://www.autohotkey.com/docs/commands/Gui.htm#OtherOptions)

    **link**: [link](https://www.autohotkey.com/docs/commands/GuiControl.htm#options)

!!! note ""
    ####ReDraw
    !!! tip ""

        ```AutoHotKey
        ReDraw()
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Draws the control again, using options that work when drawing the control ontop of other controls.



!!! note ""
    ####ToStr
    !!! tip ""

        ```AutoHotKey
        ToStr(indent := "")
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Converts the object to a string.



    ??? example "parameters"

        !!! info ""

            **name**: indent

            **desc**: The amount of indentation to add on each line.

            **type**: string

            **default**: ""

    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: A string representing this [`GridGUI.GuiControlClass`](../GuiControlClass/).

            **type**: string

!!! note ""
    ####ZOrder
    !!! tip ""

        ```AutoHotKey
        ZOrder(top := true, topmost := false)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Changes the z-order of the control to either `bottom`, `top` or `topmost`.



    ??? example "parameters"

        !!! info ""

            **name**: top

            **desc**: If true moved the control to the top of the z-order. If false moves the control to the bottom of the z-order.

            **type**: bool

            **default**: true

        !!! info ""

            **name**: topmost

            **desc**: If `true` moves the control to be above all other controls. If false sets the z-order based on [`GridGUI.GuiControlClass.top`](../GuiControlClass/#top).

            **type**: bool

            **default**: false

    **link**: [link](https://docs.microsoft.com/en-us/windows/win32/api/winuser/nf-winuser-setwindowpos)

