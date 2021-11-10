#ControlClass
<figure markdown="1">

</figure>
---
##Members

!!! info ""

    ####hwnd
    !!! info ""

        **desc**: The hwnd of the associated control.

        **type**: hwnd

!!! info ""

    ####minHeight
    !!! info ""

        **desc**: Whether or not the control has had its height set using [`GridGUI.ControlClass.__ParseOptions`](../ControlClass/#__parseoptions).

        **type**: bool

        **default**: false

!!! info ""

    ####minHeightVal
    !!! info ""

        **desc**: The height value set using [`GridGUI.ControlClass.__ParseOptions`](../ControlClass/#__parseoptions).

        **type**: number|false

        **default**: false

!!! info ""

    ####minWidth
    !!! info ""

        **desc**: Whether or not the control has had its width set using [`GridGUI.ControlClass.__ParseOptions`](../ControlClass/#__parseoptions).

        **type**: bool

        **default**: false

!!! info ""

    ####minWidthVal
    !!! info ""

        **desc**: The width value set using [`GridGUI.ControlClass.__ParseOptions`](../ControlClass/#__parseoptions).

        **type**: number|false

        **default**: false

##Methods

!!! note ""
    ####__Init
    !!! tip ""

        ```AutoHotKey
        __Init()
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Initialises the [`GridGUI.ControlClass`](../ControlClass/) members.



!!! note ""
    ####__New
    !!! tip ""

        ```AutoHotKey
        __New(hwnd)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Constructor.



    ??? example "parameters"

        !!! info ""

            **name**: hwnd

            **desc**: The hwnd of the control.

            **type**: hwnd

    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: A new [`GridGUI.ControlClass`](../ControlClass/) instance.

            **type**: [GridGUI.ControlClass](../ControlClass/)

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
    ####Control
    !!! tip ""

        ```AutoHotKey
        Control(subCommand, value)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } A thin function wrapper for `Control`.



    ??? example "parameters"

        !!! info ""

            **name**: subCommand

            **desc**: The subcommand to set for the control. See link for available subcommands.

            **type**: string

            **link**: [link](https://www.autohotkey.com/docs/commands/Control.htm#SubCommands)

        !!! info ""

            **name**: value

            **desc**: The value to apply to the subcommand. See link for values used in the subcommands.

            **type**: string|number

            **link**: [link](https://www.autohotkey.com/docs/commands/Control.htm#SubCommands)

    **link**: [link](https://www.autohotkey.com/docs/commands/Control.htm)

!!! note ""
    ####ControlClick
    !!! tip ""

        ```AutoHotKey
        ControlClick(pos := "", WhichButton := LEFT, ClickCount := 1, Options := "")
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } A thin function wrapper for `ControlClick`.



    ??? example "parameters"

        !!! info ""

            **name**: pos

            **desc**: The position to click at in the control, see link for the coordinate format.

            **type**: string

            **default**: ""

            **link**: [link](https://www.autohotkey.com/docs/commands/ControlClick.htm#Parameters)

        !!! info ""

            **name**: WhichButton

            **desc**: Which mouse button to click, see link for supported values.

            **type**: string

            **default**: LEFT

            **link**: [link](https://www.autohotkey.com/docs/commands/ControlClick.htm#Parameters)

        !!! info ""

            **name**: ClickCount

            **desc**: The number of click to perform.

            **type**: number

            **default**: 1

        !!! info ""

            **name**: Options

            **desc**: A option string to change how the click are performed, see link for supported options.

            **type**: string

            **default**: ""

            **link**: [link](https://www.autohotkey.com/docs/commands/ControlClick.htm#Parameters)

    **link**: [link](https://www.autohotkey.com/docs/commands/ControlClick.htm)

!!! note ""
    ####ControlFocus
    !!! tip ""

        ```AutoHotKey
        ControlFocus()
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } A thin function wrapper for `ControlFocus`.



    **link**: [link](https://www.autohotkey.com/docs/commands/ControlFocus.htm)

!!! note ""
    ####ControlGet
    !!! tip ""

        ```AutoHotKey
        ControlGet(subCommand := "", value := "")
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } A thin function wrapper for `ControlGet`.



    ??? example "parameters"

        !!! info ""

            **name**: subCommand

            **desc**: The subcommand to retrieve from the control. See link for available subcommands.

            **type**: string

            **default**: ""

            **link**: [link](https://www.autohotkey.com/docs/commands/ControlGet.htm#SubCommands)

        !!! info ""

            **name**: value

            **desc**: Used to specify what to retrieve when the subcommand is not specific enough.

            **type**: string

            **default**: ""

            **link**: [link](https://www.autohotkey.com/docs/commands/ControlGet.htm#SubCommands)

    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: The retrieved value.

            **type**: any

    **link**: [link](https://www.autohotkey.com/docs/commands/ControlGet.htm)

!!! note ""
    ####ControlGetPos
    !!! tip ""

        ```AutoHotKey
        ControlGetPos()
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } A thin function wrapper for `ControlGetPos`, except that it returns a [`GridGUI.Position`](../Position/) instance.



    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: The position and size of the control.

            **type**: [GridGUI.Position](../Position/)

    **link**: [link](https://www.autohotkey.com/docs/commands/ControlGetPos.htm)

!!! note ""
    ####ControlGetText
    !!! tip ""

        ```AutoHotKey
        ControlGetText()
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } A thin function wrapper for `ControlGetText`.



    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: The text of the control.

            **type**: string

    **link**: [link](https://www.autohotkey.com/docs/commands/ControlGetText.htm)

!!! note ""
    ####ControlMove
    !!! tip ""

        ```AutoHotKey
        ControlMove(pos)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } A thin function wrapper for `ControlMove`, except that it takes a [`GridGUI.Position`](../Position/) instance as argument.



    ??? example "parameters"

        !!! info ""

            **name**: pos

            **desc**: The position and size that the control should be moved and resized to.

            **type**: [GridGUI.Position](../Position/)

    **link**: [link](https://www.autohotkey.com/docs/commands/ControlMove.htm)

!!! note ""
    ####ControlSend
    !!! tip ""

        ```AutoHotKey
        ControlSend(keys)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } A thin function wrapper for `ControlSend`.



    ??? example "parameters"

        !!! info ""

            **name**: keys

            **desc**: The sequence of keys to send, use `{keyname}` for non printable keys.

            **type**: string

            **link**: [link](https://www.autohotkey.com/docs/commands/ControlSend.htm#Parameters)

    **link**: [link](https://www.autohotkey.com/docs/commands/ControlSend.htm)

!!! note ""
    ####ControlSetText
    !!! tip ""

        ```AutoHotKey
        ControlSetText(NewText)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } A thin function wrapper for `ControlSetText`.



    ??? example "parameters"

        !!! info ""

            **name**: NewText

            **desc**: The text to set the text of the control to.

            **type**: string

            **link**: [link](https://www.autohotkey.com/docs/commands/ControlSetText.htm#Parameters)

    **link**: [link](https://www.autohotkey.com/docs/commands/ControlSetText.htm)

!!! note ""
    ####Options
    !!! tip ""

        ```AutoHotKey
        Options(options)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Applies styles to the control using `Control, Style`.



    ??? example "parameters"

        !!! info ""

            **name**: options

            **desc**: The style number string to apply. See link for available styles.

            **type**: string

            **link**: [link](https://www.autohotkey.com/docs/misc/Styles.htm)

    **link**: [link](https://www.autohotkey.com/docs/commands/Control.htm#Style)

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

            **desc**: A string representing this [`GridGUI.ControlClass`](../ControlClass/).

            **type**: string

