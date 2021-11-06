#ListviewControl
<figure markdown="1">

</figure>
---
##Methods

!!! note ""
    ####__GetRow
    !!! tip ""

        ```AutoHotKey
        __GetRow(index)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } 



    ??? example "parameters"

        !!! info ""

            **name**: index

            **desc**: 

            **type**: string|number|object

    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: 

            **type**: 

!!! note ""
    ####__New
    !!! tip ""

        ```AutoHotKey
        __New(guiHwnd, options := "", text := "")
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

        !!! info ""

            **name**: text

            **desc**: 

            **type**: string

            **default**: ""

    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: 

            **type**: 

!!! note ""
    ####__ResetCurrentLV
    !!! tip ""

        ```AutoHotKey
        __ResetCurrentLV(previous)
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
    ####__SetCurrentLV
    !!! tip ""

        ```AutoHotKey
        __SetCurrentLV()
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } 



    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: 

            **type**: 

!!! note ""
    ####AddArray
    !!! tip ""

        ```AutoHotKey
        AddArray(lst)
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
    ####DeleteCol
    !!! tip ""

        ```AutoHotKey
        DeleteCol(ColumnNumber)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } 



    ??? example "parameters"

        !!! info ""

            **name**: ColumnNumber

            **desc**: 

            **type**: string|number|object

    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: 

            **type**: 

!!! note ""
    ####DeleteHeaders
    !!! tip ""

        ```AutoHotKey
        DeleteHeaders()
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } 



    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: 

            **type**: 

!!! note ""
    ####FindItem
    !!! tip ""

        ```AutoHotKey
        FindItem(text, index := 0, partial := false)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } 



    ??? example "parameters"

        !!! info ""

            **name**: text

            **desc**: 

            **type**: string|number|object

        !!! info ""

            **name**: index

            **desc**: 

            **type**: number

            **default**: 0

        !!! info ""

            **name**: partial

            **desc**: 

            **type**: bool

            **default**: false

    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: 

            **type**: 

!!! note ""
    ####GetCount
    !!! tip ""

        ```AutoHotKey
        GetCount(Mode := "")
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } 



    ??? example "parameters"

        !!! info ""

            **name**: Mode

            **desc**: 

            **type**: string

            **default**: ""

    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: 

            **type**: 

!!! note ""
    ####GetHeaders
    !!! tip ""

        ```AutoHotKey
        GetHeaders()
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
        GetNext(StartingRowNumber := "", RowType := "")
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } 



    ??? example "parameters"

        !!! info ""

            **name**: StartingRowNumber

            **desc**: 

            **type**: string

            **default**: ""

        !!! info ""

            **name**: RowType

            **desc**: 

            **type**: string

            **default**: ""

    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: 

            **type**: 

!!! note ""
    ####GetRow
    !!! tip ""

        ```AutoHotKey
        GetRow(index)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } 



    ??? example "parameters"

        !!! info ""

            **name**: index

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
        GetText(ByRef := OutputVar, RowNumber, ColumnNumber := "")
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

            **name**: RowNumber

            **desc**: 

            **type**: string|number|object

        !!! info ""

            **name**: ColumnNumber

            **desc**: 

            **type**: string

            **default**: ""

    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: 

            **type**: 

!!! note ""
    ####InsertCol
    !!! tip ""

        ```AutoHotKey
        InsertCol(ColumnNumber, Options := "", ColumnTitle := "")
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } 



    ??? example "parameters"

        !!! info ""

            **name**: ColumnNumber

            **desc**: 

            **type**: string|number|object

        !!! info ""

            **name**: Options

            **desc**: 

            **type**: string

            **default**: ""

        !!! info ""

            **name**: ColumnTitle

            **desc**: 

            **type**: string

            **default**: ""

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
    ####ScrollTo
    !!! tip ""

        ```AutoHotKey
        ScrollTo(index := 0, text := "", partial := false)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } 



    ??? example "parameters"

        !!! info ""

            **name**: index

            **desc**: 

            **type**: number

            **default**: 0

        !!! info ""

            **name**: text

            **desc**: 

            **type**: string

            **default**: ""

        !!! info ""

            **name**: partial

            **desc**: 

            **type**: bool

            **default**: false

    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: 

            **type**: 

!!! note ""
    ####SetHeaders
    !!! tip ""

        ```AutoHotKey
        SetHeaders(headers)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } 



    ??? example "parameters"

        !!! info ""

            **name**: headers

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

