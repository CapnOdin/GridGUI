#StatusBarControl
<figure markdown="1">

</figure>
---
##Members

!!! info ""

    ####gui
    !!! info ""

        **desc**: The parent `GUI` of the `StatusBar`.

        **type**: [GridGUI.GUI](../GUI/)

        **meta**: [object]

##Methods

!!! note ""
    ####__New
    !!! tip ""

        ```AutoHotKey
        __New(guiHwnd, options := "", text := "")
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Constructor.



    ??? example "parameters"

        !!! info ""

            **name**: guiHwnd

            **desc**: The hwnd of the `GUI` that the `StatusBar` should be added to.

            **type**: hwnd

        !!! info ""

            **name**: options

            **desc**: The options that the `StatusBar` will be created with. Does not accept vVars.

            **type**: string

            **default**: ""

            **link**: [link](https://www.autohotkey.com/docs/commands/Gui.htm#OtherOptions)

        !!! info ""

            **name**: text

            **desc**: The text that the `StatusBar` will be created with.

            **type**: string

            **default**: ""

    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: A new [`GridGUI.StatusBarControl`](../StatusBarControl/) instance.

            **type**: [GridGUI.StatusBarControl](../StatusBarControl/)

!!! note ""
    ####__ResetDefaultGui
    !!! tip ""

        ```AutoHotKey
        __ResetDefaultGui(previous)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Sets the default `GUI`. Used to restore the old default `GUI`, so that using the methods of the class won't have any side effects.



    ??? example "parameters"

        !!! info ""

            **name**: previous

            **desc**: The hwnd that should be set as the default `GUI`

            **type**: string|number|object

!!! note ""
    ####__SetDefaultGui
    !!! tip ""

        ```AutoHotKey
        __SetDefaultGui()
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Sets the default `GUI` to [`GridGUI.StatusBarControl.gui`](../StatusBarControl/#gui) so that the [SB_Functions](https://www.autohotkey.com/docs/commands/GuiControls.htm#StatusBar_Functions) work on the right `StatusBar`.



    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: The hwnd of the previous default `GUI`

            **type**: hwnd

!!! note ""
    ####SetIcon
    !!! tip ""

        ```AutoHotKey
        SetIcon(Filename, IconNumber := 1, PartNumber := 1)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Displays a small icon to the left of the text in the specified part. See link for details.



    ??? example "parameters"

        !!! info ""

            **name**: Filename

            **desc**: The path to an icon resource, can be any of the following formats `ico`, `cur`, `ani`, `exe`, `dll`, `cpl` and `scr`. See link for details.

            **type**: string|Image-Handle

        !!! info ""

            **name**: IconNumber

            **desc**: The icon index in the file pointed to by `Filename`. See link for details.

            **type**: number

            **default**: 1

        !!! info ""

            **name**: PartNumber

            **desc**: The part of the `StatusBar` to put the icon in.

            **type**: number

            **default**: 1

    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: The handle to the icon that was added or **0** on failure.

            **type**: HICON

    **link**: [link](https://www.autohotkey.com/docs/commands/GuiControls.htm#SB_SetIcon)

!!! note ""
    ####SetParts
    !!! tip ""

        ```AutoHotKey
        SetParts(Widths*)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Divides the bar into multiple sections according to the specified widths (in pixels).



    ??? example "parameters"

        !!! info ""

            **name**: Widths

            **desc**: The widths of the parts of the `StatusBar` except for the last part as it will fill the remaining width of the `GUI`. If no widths are provided then the `StatusBar` will have only one part that has the width of the `GUI`.

            **type**: number

            **meta**: [variadic]

    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: The hwnd of the `StatusBar` or **0** upon failure.

            **type**: hwnd

    **link**: [link](https://www.autohotkey.com/docs/commands/GuiControls.htm#SB_SetParts)

!!! note ""
    ####SetText
    !!! tip ""

        ```AutoHotKey
        SetText(NewText, PartNumber := 1, Style := 0)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Sets the text in the specified part of the `StatusBar`.



    ??? example "parameters"

        !!! info ""

            **name**: NewText

            **desc**: The text to change a part of the `StatusBar` to.

            **type**: string

        !!! info ""

            **name**: PartNumber

            **desc**: The number of the part of the `StatusBar` to change the text of.

            **type**: number

            **default**: 1

        !!! info ""

            **name**: Style

            **desc**: Specify **0** for a traditional border that makes that part of the bar look sunken. Specify **1** to have no border or **2** to have border that makes that part of the bar look raised.

            **type**: number

            **default**: 0

    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: Returns **1** upon success or **0** upon failure.

            **type**: bool

    **link**: [link](https://www.autohotkey.com/docs/commands/GuiControls.htm#SB_SetText)

