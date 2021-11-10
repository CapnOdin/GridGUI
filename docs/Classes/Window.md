#Window
<figure markdown="1">

</figure>
---
##Members

!!! info ""

    ####callbacks
    !!! info ""

        **desc**: The array of [`GridGUI.GuiCallback`](../GuiCallback/)s that the class instance was created with.

        **type**: array|false

        **default**: false

        **meta**: [object]

!!! info ""

    ####hwnd
    !!! info ""

        **desc**: The hwnd of the associated window.

        **type**: hwnd

##Methods

!!! note ""
    ####__DetectHidden
    !!! tip ""

        ```AutoHotKey
        __DetectHidden()
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Enables the detection of hidden windows using other ahk commands.



    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: The previous detect hidden windows state. Either `"On"` or `"Off"`.

            **type**: string

!!! note ""
    ####__New
    !!! tip ""

        ```AutoHotKey
        __New(hwnd, callbacks := false)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Constructor.



    ??? example "parameters"

        !!! info ""

            **name**: hwnd

            **desc**: The hwnd of the window that the class instance should work on.

            **type**: hwnd

        !!! info ""

            **name**: callbacks

            **desc**: An array of [`GridGUI.GuiCallback`](../GuiCallback/)s to set up.

            **type**: array|false

            **default**: false

    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: A new [`GridGUI.Window`](../Window/) instance.

            **type**: [GridGUI.Window](../Window/)

!!! note ""
    ####__Setup
    !!! tip ""

        ```AutoHotKey
        __Setup()
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Sets up the [`GridGUI.GuiCallback`](../GuiCallback/)s that where passed to the constructor. They are set up using `OnMessage`



!!! note ""
    ####ControlGetFocus
    !!! tip ""

        ```AutoHotKey
        ControlGetFocus()
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Retrieves the hwnd of the control with input focus in the window if any.



    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: The hwnd of the control with input focus or an empty string if non where found.

            **type**: hwnd|""

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

            **desc**: A string representing this window.

            **type**: string

!!! note ""
    ####WinActivate
    !!! tip ""

        ```AutoHotKey
        WinActivate()
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } A thin method wrapper for `WinActivate`.



    **link**: [link](https://www.autohotkey.com/docs/commands/WinActivate.htm)

!!! note ""
    ####WinActive
    !!! tip ""

        ```AutoHotKey
        WinActive()
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } A thin method wrapper for `WinActive`.



    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: The hwnd of the window associated with this class instance if it is the active window otherwise `false`.

            **type**: hwnd|false

    **link**: [link](https://www.autohotkey.com/docs/commands/WinActive.htm)

!!! note ""
    ####WinExist
    !!! tip ""

        ```AutoHotKey
        WinExist()
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } A thin method wrapper for `WinExist`.



    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: The hwnd of the window associated with this class instance if it exists otherwise `false`.

            **type**: hwnd|false

    **link**: [link](https://www.autohotkey.com/docs/commands/WinExist.htm)

!!! note ""
    ####WinGet
    !!! tip ""

        ```AutoHotKey
        WinGet(SubCommand)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } A thin method wrapper for `WinGet`.



    ??? example "parameters"

        !!! info ""

            **name**: SubCommand

            **desc**: The subcommand to retrive from the window. See the link for available subcommands.

            **type**: string

            **link**: [link](https://www.autohotkey.com/docs/commands/WinGet.htm#SubCommands)

    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: The retrieved value.

            **type**: any

    **link**: [link](https://www.autohotkey.com/docs/commands/WinGet.htm)

!!! note ""
    ####WinGetPos
    !!! tip ""

        ```AutoHotKey
        WinGetPos()
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } A thin method wrapper for `WinGetPos`, except that it returns a [`GridGUI.Position`](../Position/) instance.



    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: The position and size of the window.

            **type**: [GridGUI.Position](../Position/)

    **link**: [link](https://www.autohotkey.com/docs/commands/WinGetPos.htm)

!!! note ""
    ####WinHide
    !!! tip ""

        ```AutoHotKey
        WinHide()
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } A thin method wrapper for `WinHide`.



    **link**: [link](https://www.autohotkey.com/docs/commands/WinHide.htm)

!!! note ""
    ####WinMove
    !!! tip ""

        ```AutoHotKey
        WinMove(x := "", y := "", w := "", h := "")
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } A thin method wrapper for `WinMove`.



    ??? example "parameters"

        !!! info ""

            **name**: x

            **desc**: The x coordinate that the top left corner of the window will be moved to. If left empty the x coordinate of the top left corner won't change.

            **type**: string

            **default**: ""

        !!! info ""

            **name**: y

            **desc**: The y coordinate that the top left corner of the window will be moved to. If left empty the y coordinate of the top left corner won't change.

            **type**: string

            **default**: ""

        !!! info ""

            **name**: w

            **desc**: The width the window should be resized to. If left empty the width won't change.

            **type**: string

            **default**: ""

        !!! info ""

            **name**: h

            **desc**: The height the window should be resized to. If left empty the height won't change.

            **type**: string

            **default**: ""

    **link**: [link](https://www.autohotkey.com/docs/commands/WinMove.htm)

!!! note ""
    ####WinSet
    !!! tip ""

        ```AutoHotKey
        WinSet(SubCommand, value)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } A thin method wrapper for `WinSet`, except it works even if the window is hidden.



    ??? example "parameters"

        !!! info ""

            **name**: SubCommand

            **desc**: The subCommand to set for the window. See link for available subcommands.

            **type**: string

            **link**: [link](https://www.autohotkey.com/docs/commands/Control.htm#SubCommands)

        !!! info ""

            **name**: value

            **desc**: The value to apply to the subcommand. See link for values used in the subcommands.

            **type**: string|number

            **link**: [link](https://www.autohotkey.com/docs/commands/Control.htm#SubCommands)

    **link**: [link](https://www.autohotkey.com/docs/commands/WinSet.htm)

!!! note ""
    ####WinShow
    !!! tip ""

        ```AutoHotKey
        WinShow()
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } A thin method wrapper for `WinShow`.



    **link**: [link](https://www.autohotkey.com/docs/commands/WinShow.htm)

