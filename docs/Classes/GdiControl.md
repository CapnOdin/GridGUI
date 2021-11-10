#GdiControl
<figure markdown="1">

</figure>
---
##Members

!!! info ""

    ####G
    !!! info ""

        **desc**: A pointer to the graphics object that is associated with the drawing buffer ([`GridGUI.GdiControl.hbm`](../GdiControl/#hbm)). Updated each timer the control is drawn with a new size.

        **type**: GpGraphics*

        **meta**: [pointer]

        **link**: [link](https://docs.microsoft.com/en-us/windows/win32/gdiplus/-gdiplus-graphics-flat)

!!! info ""

    ####graphic
    !!! info ""

        **desc**: Callback that is called each time the underlying control is drawn, but before the [`GridGUI.GdiControl.hbm`](../GdiControl/#hbm) has been drawn on the underlying control. Bind the instance of [`GridGUI.GdiControl`](../GdiControl/) to the callback and draw what you want the [`GridGUI.GdiControl`](../GdiControl/) to show using the [`GridGUI.GdiControl.G`](../GdiControl/#g).

        **type**: Func|BoundFunc|false

        **default**: false

        **meta**: [object]

!!! info ""

    ####hbm
    !!! info ""

        **desc**: A handle to bitmap with the same size as the underlying control. Updated each timer the control is drawn with a new size.

        **type**: HBITMAP

        **meta**: [pointer]

        **link**: [link](https://docs.microsoft.com/en-us/windows/win32/api/Wingdi/ns-wingdi-bitmap)

!!! info ""

    ####hdc
    !!! info ""

        **desc**: The device context allowing drawing on the [`GridGUI.GdiControl.hbm`](../GdiControl/#hbm) by means of [`GridGUI.GdiControl.G`](../GdiControl/#g).

        **type**: HDC

        **meta**: [pointer]

!!! info ""

    ####pos
    !!! info ""

        **desc**: The last position that this control was drawn at.

        **type**: [GridGUI.Position](../Position/)

        **default**: new GridGUI.Position(0, 0)

        **meta**: [object]

##Methods

!!! note ""
    ####__CleanUp
    !!! tip ""

        ```AutoHotKey
        __CleanUp()
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Deletes or releases the GDI objects that the members point to.



!!! note ""
    ####__CreateCompatibleDC
    !!! tip ""

        ```AutoHotKey
        __CreateCompatibleDC(hdc := 0)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } This function creates a memory device context (DC) compatible with the specified device.



    ??? example "parameters"

        !!! info ""

            **name**: hdc

            **desc**: Handle to an existing device context. If this handle is 0 (by default), the function creates a memory device context compatible with the application's current screen

            **type**: HDC|number

            **default**: 0

    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: returns the handle to a device context or 0 on failure.

            **type**: HDC

    **meta**: [description and code taken from Gdip_All.ahk]

    **link**: [link](https://docs.microsoft.com/en-us/windows/win32/api/wingdi/nf-wingdi-createcompatibledc)

!!! note ""
    ####__CreateDIBSection
    !!! tip ""

        ```AutoHotKey
        __CreateDIBSection(w, h, bpp := 32, ByRef ppvBits := 0)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } The CreateDIBSection function creates a DIB (Device Independent Bitmap) that applications can write to directly.



    ??? example "parameters"

        !!! info ""

            **name**: w

            **desc**: width of the bitmap to create.

            **type**: number

        !!! info ""

            **name**: h

            **desc**: height of the bitmap to create.

            **type**: number

        !!! info ""

            **name**: bpp

            **desc**: bits per pixel (32 = ARGB).

            **type**: number

            **default**: 32

        !!! info ""

            **name**: ppvBits

            **desc**: A pointer to a variable that receives a pointer to the location of the DIB bit values.

            **type**: pointer

            **default**: 0

            **meta**: [ByRef, pointer]

    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: A handle to a bitmap with width `w` and height `h`.

            **type**: HBITMAP

    **meta**: [description and code taken from Gdip_All.ahk]

    **link**: [link](https://docs.microsoft.com/en-us/windows/win32/api/wingdi/nf-wingdi-createdibsection)

!!! note ""
    ####__CreateRect
    !!! tip ""

        ```AutoHotKey
        __CreateRect(ByRef Rect, x, y, w, h)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Creates a Rect object, containing a the coordinates and dimensions of a rectangle.



    ??? example "parameters"

        !!! info ""

            **name**: Rect

            **desc**: Name to call the Rect object.

            **type**: HRECT

            **meta**: [ByRef]

        !!! info ""

            **name**: x

            **desc**: x-coordinate of the upper left corner of the rectangle.

            **type**: number

        !!! info ""

            **name**: y

            **desc**: y-coordinate of the upper left corner of the rectangle.

            **type**: number

        !!! info ""

            **name**: w

            **desc**: Width of the rectangle.

            **type**: number

        !!! info ""

            **name**: h

            **desc**: Height of the rectangle.

            **type**: number

    **meta**: [description and code taken from Gdip_All.ahk]

!!! note ""
    ####__DeleteDC
    !!! tip ""

        ```AutoHotKey
        __DeleteDC(hDC)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } The DeleteDC function deletes the specified device context (DC).



    ??? example "parameters"

        !!! info ""

            **name**: hDC

            **desc**: A handle to the device context. An application must not delete a DC whose handle was obtained by calling the GetDC function. Instead, it must call the ReleaseDC function to free the DC

            **type**: HDC

    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: If the function succeeds, the return value is nonzero.

            **type**: number

    **meta**: [description and code taken from Gdip_All.ahk]

!!! note ""
    ####__DeleteGraphics
    !!! tip ""

        ```AutoHotKey
        __DeleteGraphics(pGraphics)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Deletes the graphics object pointed to by a pointer.



    ??? example "parameters"

        !!! info ""

            **name**: pGraphics

            **desc**: The pointer to the graphics object that should be deleted.

            **type**: GpGraphics*

    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: Probably nonzero on success.

            **type**: number

    **meta**: [code taken from Gdip_All.ahk]

!!! note ""
    ####__DeleteObject
    !!! tip ""

        ```AutoHotKey
        __DeleteObject(hObject)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } This function deletes a logical pen, brush, font, bitmap, region, or palette, freeing all system resources associated with the object. After the object is deleted, the specified handle is no longer valid



    ??? example "parameters"

        !!! info ""

            **name**: hObject

            **desc**: Handle to a logical pen, brush, font, bitmap, region, or palette to delete.

            **type**: HGDIOBJ

    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: Nonzero indicates success. Zero indicates that the specified handle is not valid or that the handle is currently selected into a device context.

            **type**: number

    **meta**: [description and code taken from Gdip_All.ahk]

!!! note ""
    ####__GraphicsFromHDC
    !!! tip ""

        ```AutoHotKey
        __GraphicsFromHDC(hdc)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } This function gets the graphics from the handle to a device context.



    ??? example "parameters"

        !!! info ""

            **name**: hdc

            **desc**: A handle to the device context.

            **type**: HDC

    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: Returns a pointer to the graphics of a bitmap.

            **type**: GpGraphics*

    **meta**: [description and code taken from Gdip_All.ahk]

!!! note ""
    ####__New
    !!! tip ""

        ```AutoHotKey
        __New(guiHwnd, options := "", graphic := false)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Constructor.



    ??? example "parameters"

        !!! info ""

            **name**: guiHwnd

            **desc**: The hwnd of the gui that the GuiControl should be added to.

            **type**: hwnd

        !!! info ""

            **name**: options

            **desc**: The options that the GuiControl will be created with. Does not accept vVars.

            **type**: string

            **default**: ""

            **link**: [link](https://www.autohotkey.com/docs/commands/Gui.htm#OtherOptions)

        !!! info ""

            **name**: graphic

            **desc**: Callback that will be called each time the underlying control is drawn, but before the [`GridGUI.GdiControl.hbm`](../GdiControl/#hbm) has been drawn on the underlying control. Bind the instance of [`GridGUI.GdiControl`](../GdiControl/) to the callback and draw what you want the [`GridGUI.GdiControl`](../GdiControl/) to show using the [`GridGUI.GdiControl.G`](../GdiControl/#g).

            **type**: Func|BoundFunc|false

            **default**: false

    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: A new [`GridGUI.GdiControl`](../GdiControl/) instance.

            **type**: [GridGUI.GdiControl](../GdiControl/)

!!! note ""
    ####__Prepare
    !!! tip ""

        ```AutoHotKey
        __Prepare(area)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Checks if the controls position or size has changed and if it has then recreated the gdi members.



    ??? example "parameters"

        !!! info ""

            **name**: area

            **desc**: The new position to check.

            **type**: [GridGUI.Position](../Position/)

!!! note ""
    ####__SelectObject
    !!! tip ""

        ```AutoHotKey
        __SelectObject(hdc, hgdiobj)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } The SelectObject function selects an object into the specified device context (DC). The new object replaces the previous object of the same type. See link for additional details.



    ??? example "parameters"

        !!! info ""

            **name**: hdc

            **desc**: Handle to a DC

            **type**: HDC

        !!! info ""

            **name**: hgdiobj

            **desc**: A handle to the object to be selected into the DC.

            **type**: HGDIOBJ

    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: If the selected object is not a region and the function succeeds, the return value is a handle to the object being replaced.

            **type**: HGDIOBJ|number

    **meta**: [description and code taken from Gdip_All.ahk]

    **link**: [link](https://docs.microsoft.com/en-us/windows/win32/api/wingdi/nf-wingdi-selectobject)

!!! note ""
    ####__UpdateLayeredWindow
    !!! tip ""

        ```AutoHotKey
        __UpdateLayeredWindow(hwnd, hdc, x := "", y := "", w := "", h := "", Alpha := 255)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Updates a layered window with the handle to the DC of a gdi bitmap.



    ??? example "parameters"

        !!! info ""

            **name**: hwnd

            **desc**: Handle of the layered window to update.

            **type**: hwnd

        !!! info ""

            **name**: hdc

            **desc**: Handle to the DC of the GDI bitmap to update the window with.

            **type**: HDC

        !!! info ""

            **name**: x

            **desc**: X position to place the window. If omitted then the layered window will use its current x coordinate.

            **type**: number|""

            **default**: ""

        !!! info ""

            **name**: y

            **desc**: Y position to place the window. If omitted then the layered window will use its current y coordinate.

            **type**: number|""

            **default**: ""

        !!! info ""

            **name**: w

            **desc**: Width of the window. If omitted then the layered window will use its current width.

            **type**: number|""

            **default**: ""

            **link**: [link]()

        !!! info ""

            **name**: h

            **desc**: Height of the window. If omitted then the layered window will use its current height.

            **type**: number|""

            **default**: ""

            **link**: [link]()

        !!! info ""

            **name**: Alpha

            **desc**: The value in the range (0-255) to set the window transparency.

            **type**: number

            **default**: 255

    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: If the function succeeds, the return value is nonzero.

            **type**: number

    **meta**: [description and code taken from Gdip_All.ahk]

!!! note ""
    ####Draw
    !!! tip ""

        ```AutoHotKey
        Draw(pos)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Draws the underlying control at the new position and size. As well as calling [`GridGUI.GdiControl.UpdateGraphic`](../GdiControl/#updategraphic).



    ??? example "parameters"

        !!! info ""

            **name**: pos

            **desc**: The position and size to draw the control with.

            **type**: [GridGUI.Position](../Position/)

!!! note ""
    ####GDIDraw
    !!! tip ""

        ```AutoHotKey
        GDIDraw()
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Draws the [`GridGUI.GdiControl.hbm`](../GdiControl/#hbm) (bitmap) on the underlying control, and updates the position and size of the control to the one in [`GridGUI.GdiControl.pos`](../GdiControl/#pos).



!!! note ""
    ####UpdateGraphic
    !!! tip ""

        ```AutoHotKey
        UpdateGraphic()
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Calls the user callback [`GridGUI.GdiControl.graphic`](../GdiControl/#graphic) if defined, before calling [`GridGUI.GdiControl.GDIDraw`](../GdiControl/#gdidraw).



