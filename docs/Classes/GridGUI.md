#GridGUI
<figure markdown="1">

</figure>
---
##Members

!!! info ""

    ####Background
    !!! info ""

        **desc**: Used in the handling of controls that have been registered as background

        **type**: string

        **default**: +WS_CLIPSIBLINGS

        **meta**: [static, const]

        **link**: [link](https://docs.microsoft.com/en-us/windows/win32/winmsg/window-styles)

!!! info ""

    ####ExitApp
    !!! info ""

        **desc**: Allows quick access to set up a callback that terminates the script

        **type**: bound function

        **default**: GridGUI.__ExitApp

        **meta**: [static, const]

##Methods

!!! note ""
    ####__ExitApp
    !!! tip ""

        ```AutoHotKey
        __ExitApp()
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } A convenience function wrapper for the command.



!!! note ""
    ####__New
    !!! tip ""

        ```AutoHotKey
        __New(title := "", options := "", showGrid := false, justify := false)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } A convenience constructor that maps to the [GridGUI.GridGUIClass](../GridGUIClass/).



    ??? example "parameters"

        !!! info ""

            **name**: title

            **desc**: The title that the new gui window will have

            **type**: string

            **default**: ""

        !!! info ""

            **name**: options

            **desc**: The ahk gui options that the window will be created with.

            **type**: string

            **default**: ""

            **link**: [link](https://www.autohotkey.com/docs/commands/Gui.htm#Options)

        !!! info ""

            **name**: showGrid

            **desc**: Whether or not to show a debug grid for the [`GridGUI.Cell`](../Cell/)s that where placed in the [`GridGUI.GridGUIClass.grid`](../GridGUIClass/#grid) before [`GridGUI.GridGUIClass.Draw`](../GridGUIClass/#draw) was called the first time.

            **type**: bool

            **default**: false

        !!! info ""

            **name**: justify

            **desc**: The position of the controls with in the grid, can be any combination of `C` (Center), `N` (North), `S` (South), `W` (West) and `E` (East).

            **type**: string|false

            **default**: false

    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: Returns a new instance of [`GridGUI.GridGUIClass`](../GridGUIClass/).

            **type**: [GridGUI.GridGUIClass](../GridGUIClass/)

!!! note ""
    ####Area
    !!! tip ""

        ```AutoHotKey
        Area(w, h, x := 0, y := 0)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } A convenience function for making a Position that is used as an area.



    ??? example "parameters"

        !!! info ""

            **name**: w

            **desc**: The width of the area.

            **type**: number

        !!! info ""

            **name**: h

            **desc**: The height of the area.

            **type**: number

        !!! info ""

            **name**: x

            **desc**: The x coordinate of the top left corner of the area.

            **type**: number

            **default**: 0

        !!! info ""

            **name**: y

            **desc**: The y coordinate of the top left corner of the area.

            **type**: number

            **default**: 0

    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: A new Position instance.

            **type**: [GridGUI.Position](../Position/)

!!! note ""
    ####Pos
    !!! tip ""

        ```AutoHotKey
        Pos(x, y, w := 0, h := 0)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } A convenience function for making a Position, saves writting "new".



    ??? example "parameters"

        !!! info ""

            **name**: x

            **desc**: The x coordinate of the position.

            **type**: number

        !!! info ""

            **name**: y

            **desc**: The y coordinate of the position.

            **type**: number

        !!! info ""

            **name**: w

            **desc**: The width of the area spanning from the top left corner at (x, y) to the bottom right corner.

            **type**: number

            **default**: 0

        !!! info ""

            **name**: h

            **desc**: The height of the area spanning from the top left corner at (x, y) to the bottom right corner.

            **type**: number

            **default**: 0

    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: A new Position instance.

            **type**: [GridGUI.Position](../Position/)

##Classes

[GridGUIClass](../GridGUIClass/)

[SubGrid](../SubGrid/)

