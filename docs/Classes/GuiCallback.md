#GuiCallback
<figure markdown="1">

</figure>
---
##Members

!!! info ""

    ####function
    !!! info ""

        **desc**: The function that should be called when the window message is received.

        **type**: Func|BoundFunc

        **meta**: [object]

!!! info ""

    ####msgNum
    !!! info ""

        **desc**: The window message number. See link for available window messages.

        **type**: number

        **link**: [link](https://www.autohotkey.com/docs/misc/SendMessageList.htm)

##Methods

!!! note ""
    ####__New
    !!! tip ""

        ```AutoHotKey
        __New(msgNum, function)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Constructor.



    ??? example "parameters"

        !!! info ""

            **name**: msgNum

            **desc**: The window message number. See link for available window messages.

            **type**: number

            **link**: [link](https://www.autohotkey.com/docs/misc/SendMessageList.htm)

        !!! info ""

            **name**: function

            **desc**: The function to call when the window message is received.

            **type**: Func|BoundFunc|string

    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: A new [`GridGUI.GuiCallback`](../GuiCallback/) instance.

            **type**: [GridGUI.GuiCallback](../GuiCallback/)

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

            **desc**: A string representing this callback.

            **type**: string

