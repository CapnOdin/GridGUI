#GdiControl
<figure markdown="1">

</figure>
---
##Methods

!!! note ""
    ####__CleanUp
    !!! tip ""

        ```AutoHotKey
        __CleanUp()
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } 



    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: 

            **type**: 

!!! note ""
    ####__CreateCompatibleDC
    !!! tip ""

        ```AutoHotKey
        __CreateCompatibleDC(hdc := 0)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } 



    ??? example "parameters"

        !!! info ""

            **name**: hdc

            **desc**: 

            **type**: number

            **default**: 0

    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: 

            **type**: 

!!! note ""
    ####__CreateDIBSection
    !!! tip ""

        ```AutoHotKey
        __CreateDIBSection(w, h, bpp := 32, ByRef := ppvBits)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } 



    ??? example "parameters"

        !!! info ""

            **name**: w

            **desc**: 

            **type**: string|number|object

        !!! info ""

            **name**: h

            **desc**: 

            **type**: string|number|object

        !!! info ""

            **name**: bpp

            **desc**: 

            **type**: number

            **default**: 32

        !!! info ""

            **name**: ByRef

            **desc**: 

            **type**: string

            **default**: ppvBits

    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: 

            **type**: 

!!! note ""
    ####__CreateRect
    !!! tip ""

        ```AutoHotKey
        __CreateRect(ByRef := Rect, x, y, w, h)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } 



    ??? example "parameters"

        !!! info ""

            **name**: ByRef

            **desc**: 

            **type**: string

            **default**: Rect

        !!! info ""

            **name**: x

            **desc**: 

            **type**: string|number|object

        !!! info ""

            **name**: y

            **desc**: 

            **type**: string|number|object

        !!! info ""

            **name**: w

            **desc**: 

            **type**: string|number|object

        !!! info ""

            **name**: h

            **desc**: 

            **type**: string|number|object

    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: 

            **type**: 

!!! note ""
    ####__DeleteDC
    !!! tip ""

        ```AutoHotKey
        __DeleteDC(hDC)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } 



    ??? example "parameters"

        !!! info ""

            **name**: hDC

            **desc**: 

            **type**: string|number|object

    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: 

            **type**: 

!!! note ""
    ####__DeleteGraphics
    !!! tip ""

        ```AutoHotKey
        __DeleteGraphics(pGraphics)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } 



    ??? example "parameters"

        !!! info ""

            **name**: pGraphics

            **desc**: 

            **type**: string|number|object

    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: 

            **type**: 

!!! note ""
    ####__DeleteObject
    !!! tip ""

        ```AutoHotKey
        __DeleteObject(hObject)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } 



    ??? example "parameters"

        !!! info ""

            **name**: hObject

            **desc**: 

            **type**: string|number|object

    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: 

            **type**: 

!!! note ""
    ####__GraphicsFromHDC
    !!! tip ""

        ```AutoHotKey
        __GraphicsFromHDC(hdc)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } 



    ??? example "parameters"

        !!! info ""

            **name**: hdc

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
        __New(guiHwnd, options, graphic := false)
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

            **type**: string|number|object

        !!! info ""

            **name**: graphic

            **desc**: 

            **type**: bool

            **default**: false

    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: 

            **type**: 

!!! note ""
    ####__Prepare
    !!! tip ""

        ```AutoHotKey
        __Prepare(area)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } 



    ??? example "parameters"

        !!! info ""

            **name**: area

            **desc**: 

            **type**: string|number|object

    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: 

            **type**: 

!!! note ""
    ####__SelectObject
    !!! tip ""

        ```AutoHotKey
        __SelectObject(hdc, hgdiobj)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } 



    ??? example "parameters"

        !!! info ""

            **name**: hdc

            **desc**: 

            **type**: string|number|object

        !!! info ""

            **name**: hgdiobj

            **desc**: 

            **type**: string|number|object

    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: 

            **type**: 

!!! note ""
    ####__UpdateLayeredWindow
    !!! tip ""

        ```AutoHotKey
        __UpdateLayeredWindow(hwnd, hdc, x := "", y := "", w := "", h := "", Alpha := 255)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } 



    ??? example "parameters"

        !!! info ""

            **name**: hwnd

            **desc**: 

            **type**: string|number|object

        !!! info ""

            **name**: hdc

            **desc**: 

            **type**: string|number|object

        !!! info ""

            **name**: x

            **desc**: 

            **type**: string

            **default**: ""

        !!! info ""

            **name**: y

            **desc**: 

            **type**: string

            **default**: ""

        !!! info ""

            **name**: w

            **desc**: 

            **type**: string

            **default**: ""

        !!! info ""

            **name**: h

            **desc**: 

            **type**: string

            **default**: ""

        !!! info ""

            **name**: Alpha

            **desc**: 

            **type**: number

            **default**: 255

    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: 

            **type**: 

!!! note ""
    ####Draw
    !!! tip ""

        ```AutoHotKey
        Draw(pos)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } 



    ??? example "parameters"

        !!! info ""

            **name**: pos

            **desc**: 

            **type**: string|number|object

    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: 

            **type**: 

!!! note ""
    ####GDIDraw
    !!! tip ""

        ```AutoHotKey
        GDIDraw()
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } 



    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: 

            **type**: 

!!! note ""
    ####UpdateGraphic
    !!! tip ""

        ```AutoHotKey
        UpdateGraphic()
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } 



    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: 

            **type**: 

