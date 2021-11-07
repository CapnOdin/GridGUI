#ArbitraryControl
<figure markdown="1">

</figure>
---
##Methods

!!! note ""
    ####__New
    !!! tip ""

        ```AutoHotKey
        __New(guiHwnd, type, options := "", text := "", DPIScale := true)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Constructor.



    ??? example "parameters"

        !!! info ""

            **name**: guiHwnd

            **desc**: The hwnd of the gui that the GuiControl should be added to.

            **type**: hwnd

        !!! info ""

            **name**: type

            **desc**: The type of the control. Can be `Text, Edit, UpDown, Picture, Button, Checkbox, DropDownList, ComboBox, ListBox, Link, Hotkey, DateTime, MonthCal, Slider, Progress, GroupBox and ActiveX`. For `Radio, ListView, TreeView, Tab3 and StatusBar` see [AdditionalControls](AdditionalControls).

            **type**: string

        !!! info ""

            **name**: options

            **desc**: The options that the GuiControl will be created with. Does not accept vVars.

            **type**: string

            **default**: ""

            **link**: [link](https://www.autohotkey.com/docs/commands/Gui.htm#OtherOptions)

        !!! info ""

            **name**: text

            **desc**: The text that the GuiControl will be created with.

            **type**: string

            **default**: ""

        !!! info ""

            **name**: DPIScale

            **desc**: Whether or not to correct for non standard dpi.

            **type**: bool

            **default**: true

    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: A new [`GridGUI.ArbitraryControl`](../ArbitraryControl/) instance.

            **type**: [GridGUI.ArbitraryControl](../ArbitraryControl/)

