#RadioGroupControl
<figure markdown="1">

</figure>
---
##Members

!!! info ""

    ####callback
    !!! info ""

        **desc**: A callback that will be called whenever a `RadioButton` in this RadioGroup is pressed, it is called with [`GridGUI.RadioGroupControl.Checked`](../RadioGroupControl/#checked) as an argument. If set to `false` the callback will be ignored.

        **type**: Func|BoundFunc|false

        **default**: false

        **meta**: [object]

!!! info ""

    ####Checked
    !!! info ""

        **desc**: An object containing information on the most recently checked `RadioButton`. The object contains the index under the key `"index"`, the [`GridGUI.ArbitraryControl`](../ArbitraryControl/) object under the key `"ctrl"` and the text of the `RadioButton` under the key `"text"`.

        **type**: object

        **default**: {}

        **meta**: [object]

!!! info ""

    ####guiHwnd
    !!! info ""

        **desc**: The hwnd of the GUI that new `RadioButton`s will be added to if the `guiHwnd` parameter is not set when calling [`GridGUI.RadioGroupControl.New`](../RadioGroupControl/#new).

        **type**: hwnd

!!! info ""

    ####RadioButtons
    !!! info ""

        **desc**: An array of the `RadioButton`s that are associated with this RadioGroup.

        **type**: array

        **default**: []

        **meta**: [object]

##Methods

!!! note ""
    ####__Callback
    !!! tip ""

        ```AutoHotKey
        __Callback(ctrl)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } An internal callback that is registered to all the `RadioButton`s of this RadioGroup. The callback is used to uncheck the `RadioButton`s what where not clicked, to update the [`GridGUI.RadioGroupControl.Checked`](../RadioGroupControl/#checked) member and to call the user defined callback [`GridGUI.RadioGroupControl.callback`](../RadioGroupControl/#callback).



    ??? example "parameters"

        !!! info ""

            **name**: ctrl

            **desc**: The control object of the `RadioButton` that was clicked.

            **type**: [GridGUI.ArbitraryControl](../ArbitraryControl/)

!!! note ""
    ####__New
    !!! tip ""

        ```AutoHotKey
        __New(guiHwnd, callback := false)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Constructor.



    ??? example "parameters"

        !!! info ""

            **name**: guiHwnd

            **desc**: The hwnd of the GUI that the `RadioButton`s that are added to this RadioGroup should be added to by default.

            **type**: hwnd

        !!! info ""

            **name**: callback

            **desc**: The callback that should be called whenever a `RadioButton` in this RadioGroup is pressed, it is called with [`GridGUI.RadioGroupControl.Checked`](../RadioGroupControl/#checked) as an argument. If set to `false` the callback will be ignored.

            **type**: Func|BoundFunc|false

            **default**: false

            **meta**: [object]

    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: A new [`GridGUI.RadioGroupControl`](../RadioGroupControl/) instance.

            **type**: [GridGUI.RadioGroupControl](../RadioGroupControl/)

!!! note ""
    ####Check
    !!! tip ""

        ```AutoHotKey
        Check(index)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Checks a `RadioButton` in [`GridGUI.RadioGroupControl.RadioButtons`](../RadioGroupControl/#radiobuttons) by its index.



    ??? example "parameters"

        !!! info ""

            **name**: index

            **desc**: The index of the `RadioButton` to check.

            **type**: number

!!! note ""
    ####New
    !!! tip ""

        ```AutoHotKey
        New(options := "", text := "", guiHwnd := false)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Adds a new `RadioButton` to this RadioGroup and to a GUI.



    ??? example "parameters"

        !!! info ""

            **name**: options

            **desc**: The options that the `RadioButton` will be created with. Does not accept vVars and gLabels.

            **type**: string

            **default**: ""

            **link**: [link](https://www.autohotkey.com/docs/commands/Gui.htm#OtherOptions)

        !!! info ""

            **name**: text

            **desc**: The text that will be displayed next to the new `RadioButton`.

            **type**: string

            **default**: ""

        !!! info ""

            **name**: guiHwnd

            **desc**: The hwnd of the GUI that the new `RadioButton` will be added to. If left unset then the `RadioButton` will be added to [`GridGUI.RadioGroupControl.guiHwnd`](../RadioGroupControl/#guihwnd).

            **type**: bool

            **default**: false

    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: The control object for the newly added `RadioButton`.

            **type**: [GridGUI.ArbitraryControl](../ArbitraryControl/)

