#BoundFunc
<figure markdown="1">

</figure>
---
##Members

!!! info ""

    ####arguments
    !!! info ""

        **desc**: The array of arguments bound to this function.

        **type**: array

        **default**: empty array

!!! info ""

    ####function
    !!! info ""

        **desc**: The function that has arguments bound to it.

        **type**: Func|BoundFunc

##Methods

!!! note ""
    ####__Get
    !!! tip ""

        ```AutoHotKey
        __Get(key)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Meta function allowing access to the underlying bound function as thought it was this function except if the arguments member is retrieved.



    ??? example "parameters"

        !!! info ""

            **name**: key

            **desc**: The key to look up in the object.

            **type**: any

    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: The looked up value.

            **type**: any

!!! note ""
    ####__GetInstanceType
    !!! tip ""

        ```AutoHotKey
        __GetInstanceType(object)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Constructs the class path of a class instance.



    ??? example "parameters"

        !!! info ""

            **name**: object

            **desc**: The object to retrieve the class path from.

            **type**: object

    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: Class path.

            **type**: string

!!! note ""
    ####__IsInstanceOf
    !!! tip ""

        ```AutoHotKey
        __IsInstanceOf(object, class)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Checks if a class is in the class path of an object.



    ??? example "parameters"

        !!! info ""

            **name**: object

            **desc**: The class instance to search.

            **type**: string|number|object

        !!! info ""

            **name**: class

            **desc**: The class name to search for.

            **type**: string|number|object

    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: Whether or not the class path of `object` contains `class`.

            **type**: bool

!!! note ""
    ####__New
    !!! tip ""

        ```AutoHotKey
        __New(fun, arguments)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Constructor.



    ??? example "parameters"

        !!! info ""

            **name**: fun

            **desc**: The function or method that arguments are bound to.

            **type**: Func|BoundFunc|string

        !!! info ""

            **name**: arguments

            **desc**: The arguments that will be passed to the [`GridGUI.BoundFunc.function`](../BoundFunc/#function) when it is called. If the function is a method then the class instance is passed as the first variadic arg.

            **type**: any

    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: A new [`GridGUI.BoundFunc`](../BoundFunc/) instance.

            **type**: [GridGUI.BoundFunc](../BoundFunc/)

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

            **desc**: A string representing the bound function.

            **type**: string

