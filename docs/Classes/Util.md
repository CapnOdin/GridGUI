#Util
<figure markdown="1">

</figure>
---
##Methods

!!! note ""
    ####AddZeros
    !!! tip ""

        ```AutoHotKey
        AddZeros(z)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } 



    ??? example "parameters"

        !!! info ""

            **name**: z

            **desc**: 

            **type**: string|number|object

    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: 

            **type**: 

!!! note ""
    ####BGRtoRGB
    !!! tip ""

        ```AutoHotKey
        BGRtoRGB(oldValue)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } 



    ??? example "parameters"

        !!! info ""

            **name**: oldValue

            **desc**: 

            **type**: string|number|object

    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: 

            **type**: 

!!! note ""
    ####ByExH
    !!! tip ""

        ```AutoHotKey
        ByExH(c)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } 



    ??? example "parameters"

        !!! info ""

            **name**: c

            **desc**: 

            **type**: [GridGUI.Cell](../Cell/)

    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: 

            **type**: 

!!! note ""
    ####ByExW
    !!! tip ""

        ```AutoHotKey
        ByExW(c)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } 



    ??? example "parameters"

        !!! info ""

            **name**: c

            **desc**: 

            **type**: [GridGUI.Cell](../Cell/)

    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: 

            **type**: 

!!! note ""
    ####BySecoundValue
    !!! tip ""

        ```AutoHotKey
        BySecoundValue(lst)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } 



    ??? example "parameters"

        !!! info ""

            **name**: lst

            **desc**: 

            **type**: string|number|object

    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: 

            **type**: 

!!! note ""
    ####BySize
    !!! tip ""

        ```AutoHotKey
        BySize(pos)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } 



    ??? example "parameters"

        !!! info ""

            **name**: pos

            **desc**: 

            **type**: [GridGUI.Position](../Position/)

    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: 

            **type**: 

!!! note ""
    ####ConvertStObjToObjOfStr
    !!! tip ""

        ```AutoHotKey
        ConvertStObjToObjOfStr(obj)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } 



    ??? example "parameters"

        !!! info ""

            **name**: obj

            **desc**: 

            **type**: string|number|object

    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: 

            **type**: 

!!! note ""
    ####DPIScale
    !!! tip ""

        ```AutoHotKey
        DPIScale(pos, enlarge := true)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } 



    ??? example "parameters"

        !!! info ""

            **name**: pos

            **desc**: 

            **type**: [GridGUI.Position](../Position/)

        !!! info ""

            **name**: enlarge

            **desc**: 

            **type**: bool

            **default**: true

    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: 

            **type**: 

!!! note ""
    ####FindIndex
    !!! tip ""

        ```AutoHotKey
        FindIndex(lst, val, fun := false)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } 



    ??? example "parameters"

        !!! info ""

            **name**: lst

            **desc**: 

            **type**: string|number|object

        !!! info ""

            **name**: val

            **desc**: 

            **type**: string|number|object

        !!! info ""

            **name**: fun

            **desc**: 

            **type**: Func|BoundFunc|false

            **default**: false

    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: 

            **type**: 

!!! note ""
    ####GetSizeByLimitingSide
    !!! tip ""

        ```AutoHotKey
        GetSizeByLimitingSide(pos, ratio)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } 



    ??? example "parameters"

        !!! info ""

            **name**: pos

            **desc**: 

            **type**: [GridGUI.Position](../Position/)

        !!! info ""

            **name**: ratio

            **desc**: 

            **type**: number

    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: 

            **type**: [GridGUI.Position](../Position/)

!!! note ""
    ####Join
    !!! tip ""

        ```AutoHotKey
        Join(sep, params)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } 



    ??? example "parameters"

        !!! info ""

            **name**: sep

            **desc**: 

            **type**: string

        !!! info ""

            **name**: params

            **desc**: 

            **type**: array

    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: 

            **type**: string

!!! note ""
    ####Justify
    !!! tip ""

        ```AutoHotKey
        Justify(justifyOptions, area, pos, border)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } 



    ??? example "parameters"

        !!! info ""

            **name**: justifyOptions

            **desc**: 

            **type**: string

        !!! info ""

            **name**: area

            **desc**: 

            **type**: [GridGUI.Position](../Position/)

        !!! info ""

            **name**: pos

            **desc**: 

            **type**: [GridGUI.Position](../Position/)

        !!! info ""

            **name**: border

            **desc**: 

            **type**: [GridGUI.Position](../Position/)

    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: 

            **type**: [GridGUI.Position](../Position/)

!!! note ""
    ####JustifyCenter
    !!! tip ""

        ```AutoHotKey
        JustifyCenter(area, pos)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } 



    ??? example "parameters"

        !!! info ""

            **name**: area

            **desc**: 

            **type**: [GridGUI.Position](../Position/)

        !!! info ""

            **name**: pos

            **desc**: 

            **type**: [GridGUI.Position](../Position/)

    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: 

            **type**: [GridGUI.Position](../Position/)

!!! note ""
    ####prettyPrint
    !!! tip ""

        ```AutoHotKey
        prettyPrint(str)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } 



    ??? example "parameters"

        !!! info ""

            **name**: str

            **desc**: 

            **type**: string|number|object

    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: 

            **type**: 

!!! note ""
    ####RemoveValue
    !!! tip ""

        ```AutoHotKey
        RemoveValue(lst, val, fun := false)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } 



    ??? example "parameters"

        !!! info ""

            **name**: lst

            **desc**: 

            **type**: string|number|object

        !!! info ""

            **name**: val

            **desc**: 

            **type**: string|number|object

        !!! info ""

            **name**: fun

            **desc**: 

            **type**: Func|BoundFunc|false

            **default**: false

    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: 

            **type**: 

!!! note ""
    ####RGBtoBGR
    !!! tip ""

        ```AutoHotKey
        RGBtoBGR(oldValue)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } 



    ??? example "parameters"

        !!! info ""

            **name**: oldValue

            **desc**: 

            **type**: string|number|object

    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: 

            **type**: 

!!! note ""
    ####Sort
    !!! tip ""

        ```AutoHotKey
        Sort(obj, fun)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } 



    ??? example "parameters"

        !!! info ""

            **name**: obj

            **desc**: 

            **type**: string|number|object

        !!! info ""

            **name**: fun

            **desc**: 

            **type**: Func|BoundFunc

    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: 

            **type**: 

!!! note ""
    ####Sum
    !!! tip ""

        ```AutoHotKey
        Sum(obj)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } 



    ??? example "parameters"

        !!! info ""

            **name**: obj

            **desc**: 

            **type**: string|number|object

    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: 

            **type**: 

