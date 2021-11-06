#TreeviewControl
<figure markdown="1">

</figure>
---
##Methods

!!! note ""
    ####__New
    !!! tip ""

        ```AutoHotKey
        __New(guiHwnd, options := "")
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } 



    ??? example "parameters"

        !!! info ""

            **name**: guiHwnd

            **desc**: 

            **type**: string|number|object

        !!! info ""

            **name**: options

            **desc**: 

            **type**: string

            **default**: ""

    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: 

            **type**: 

!!! note ""
    ####__ResetCurrentTV
    !!! tip ""

        ```AutoHotKey
        __ResetCurrentTV(previous)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } 



    ??? example "parameters"

        !!! info ""

            **name**: previous

            **desc**: 

            **type**: string|number|object

    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: 

            **type**: 

!!! note ""
    ####__SetCurrentTV
    !!! tip ""

        ```AutoHotKey
        __SetCurrentTV()
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } 



    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: 

            **type**: 

!!! note ""
    ####Add
    !!! tip ""

        ```AutoHotKey
        Add(Name, ParentItemID := "", Options := "")
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } 



    ??? example "parameters"

        !!! info ""

            **name**: Name

            **desc**: 

            **type**: string|number|object

        !!! info ""

            **name**: ParentItemID

            **desc**: 

            **type**: string

            **default**: ""

        !!! info ""

            **name**: Options

            **desc**: 

            **type**: string

            **default**: ""

    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: 

            **type**: 

!!! note ""
    ####Delete
    !!! tip ""

        ```AutoHotKey
        Delete(ItemID := "")
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } 



    ??? example "parameters"

        !!! info ""

            **name**: ItemID

            **desc**: 

            **type**: string

            **default**: ""

    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: 

            **type**: 

!!! note ""
    ####Get
    !!! tip ""

        ```AutoHotKey
        Get(ItemID, Attribute)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } 



    ??? example "parameters"

        !!! info ""

            **name**: ItemID

            **desc**: 

            **type**: string|number|object

        !!! info ""

            **name**: Attribute

            **desc**: 

            **type**: string|number|object

    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: 

            **type**: 

!!! note ""
    ####GetChild
    !!! tip ""

        ```AutoHotKey
        GetChild(ParentItemID)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } 



    ??? example "parameters"

        !!! info ""

            **name**: ParentItemID

            **desc**: 

            **type**: string|number|object

    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: 

            **type**: 

!!! note ""
    ####GetCount
    !!! tip ""

        ```AutoHotKey
        GetCount()
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } 



    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: 

            **type**: 

!!! note ""
    ####GetNext
    !!! tip ""

        ```AutoHotKey
        GetNext(ItemID := "", ItemType := "")
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } 



    ??? example "parameters"

        !!! info ""

            **name**: ItemID

            **desc**: 

            **type**: string

            **default**: ""

        !!! info ""

            **name**: ItemType

            **desc**: 

            **type**: string

            **default**: ""

    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: 

            **type**: 

!!! note ""
    ####GetParent
    !!! tip ""

        ```AutoHotKey
        GetParent(ItemID)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } 



    ??? example "parameters"

        !!! info ""

            **name**: ItemID

            **desc**: 

            **type**: string|number|object

    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: 

            **type**: 

!!! note ""
    ####GetPrev
    !!! tip ""

        ```AutoHotKey
        GetPrev(ItemID)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } 



    ??? example "parameters"

        !!! info ""

            **name**: ItemID

            **desc**: 

            **type**: string|number|object

    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: 

            **type**: 

!!! note ""
    ####GetSelection
    !!! tip ""

        ```AutoHotKey
        GetSelection()
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } 



    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: 

            **type**: 

!!! note ""
    ####GetText
    !!! tip ""

        ```AutoHotKey
        GetText(ByRef := OutputVar, ItemID)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } 



    ??? example "parameters"

        !!! info ""

            **name**: ByRef

            **desc**: 

            **type**: string

            **default**: OutputVar

        !!! info ""

            **name**: ItemID

            **desc**: 

            **type**: string|number|object

    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: 

            **type**: 

!!! note ""
    ####Redraw
    !!! tip ""

        ```AutoHotKey
        Redraw(bool)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } 



    ??? example "parameters"

        !!! info ""

            **name**: bool

            **desc**: 

            **type**: string|number|object

    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: 

            **type**: 

!!! note ""
    ####SetImageList
    !!! tip ""

        ```AutoHotKey
        SetImageList(ImageListID, IconType := "")
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } 



    ??? example "parameters"

        !!! info ""

            **name**: ImageListID

            **desc**: 

            **type**: string|number|object

        !!! info ""

            **name**: IconType

            **desc**: 

            **type**: string

            **default**: ""

    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: 

            **type**: 

