#LOGFONT
<figure markdown="1">

</figure>
---
##Members

!!! info ""

    ####_Colour
    !!! info ""

        **desc**: The colour of the controls text in BGR format.

        **type**: number

        **default**: 0

!!! info ""

    ####CharSet
    !!! info ""

        **desc**: The char set of the font. See the link for details.

        **type**: number

        **default**: 0

        **link**: [link](https://docs.microsoft.com/en-us/windows/win32/api/wingdi/ns-wingdi-logfonta#members)

!!! info ""

    ####ClipPrecision
    !!! info ""

        **desc**: How characters that are partially outside the bounds of the font are handled. See link for details.

        **type**: number

        **default**: 0

        **link**: [link](https://docs.microsoft.com/en-us/windows/win32/api/wingdi/ns-wingdi-logfonta#members)

!!! info ""

    ####Colour
    !!! info ""

        **desc**: The colour of the controls text in RGB format as a hex string.

        **type**: string

        **default**: ""

!!! info ""

    ####Escapement
    !!! info ""

        **desc**: The angle between the text direction and the x-axis of the screen in 1/10 degree. See link for details.

        **type**: number

        **default**: 0

        **link**: [link](https://docs.microsoft.com/en-us/windows/win32/api/wingdi/ns-wingdi-logfonta#members)

!!! info ""

    ####FaceName
    !!! info ""

        **desc**: The name of the font that was applied to the control. See the link for common fonts.

        **type**: string

        **link**: [link](https://www.autohotkey.com/docs/misc/FontsStandard.htm)

!!! info ""

    ####guiHwnd
    !!! info ""

        **desc**: The hwnd of the parent window of the control associated with this instance.

        **type**: hwnd|false

        **default**: false

!!! info ""

    ####Height
    !!! info ""

        **desc**: The height of the characters in the font. See link for details.

        **type**: number

        **default**: 0

        **link**: [link](https://docs.microsoft.com/en-us/windows/win32/api/wingdi/ns-wingdi-logfonta#members)

!!! info ""

    ####HFONT
    !!! info ""

        **desc**: The handle to the font associated with the control.

        **type**: HFONT

        **default**: 0

!!! info ""

    ####Hwnd
    !!! info ""

        **desc**: The hwnd of the control that is associated with this instance.

        **type**: hwnd

!!! info ""

    ####Italic
    !!! info ""

        **desc**: Whether or not the font is italic.

        **type**: bool

        **default**: false

!!! info ""

    ####Orientation
    !!! info ""

        **desc**: The angle between the bottom of the charats and the x-axis of the screen in 1/10 degree.

        **type**: number

        **default**: 0

!!! info ""

    ####OutPrecision
    !!! info ""

        **desc**: How precisely the drawn characters most match the set font characteristics. See link for details.

        **type**: number

        **default**: 0

        **link**: [link](https://docs.microsoft.com/en-us/windows/win32/api/wingdi/ns-wingdi-logfonta#members)

!!! info ""

    ####PitchAndFamily
    !!! info ""

        **desc**: The two low-order bits specify the pitch of the font and the last four bits specify the family. See link for details.

        **type**: number

        **default**: 0

        **link**: [link](https://docs.microsoft.com/en-us/windows/win32/api/wingdi/ns-wingdi-logfonta#members)

!!! info ""

    ####Quality
    !!! info ""

        **desc**: The quality of the font. See link for details.

        **type**: number

        **default**: 0

        **link**: [link](https://www.autohotkey.com/docs/commands/Gui.htm#Font)

!!! info ""

    ####StrikeOut
    !!! info ""

        **desc**: Whether or not the font is drawn with a line through it.

        **type**: bool

        **default**: false

!!! info ""

    ####Underline
    !!! info ""

        **desc**: Whether or not the font is drawn with a line underneath it.

        **type**: bool

        **default**: false

!!! info ""

    ####Weight
    !!! info ""

        **desc**: How bold the text is. See link for details.

        **type**: number

        **default**: 0

        **link**: [link](https://www.autohotkey.com/docs/commands/Gui.htm#Font)

!!! info ""

    ####Width
    !!! info ""

        **desc**: The average width of characters in the font. See link for details.

        **type**: number

        **default**: 0

        **link**: [link](https://docs.microsoft.com/en-us/windows/win32/api/wingdi/ns-wingdi-logfonta#members)

##Methods

!!! note ""
    ####__GetColour
    !!! tip ""

        ```AutoHotKey
        __GetColour()
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Retrives the colour that the parent window would paint the text as returned by `WM_CTLCOLORSTATIC`.



!!! note ""
    ####__GetDC
    !!! tip ""

        ```AutoHotKey
        __GetDC()
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Retrives the DC handle of the associated control.



    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: The DC handle of the associated control.

            **type**: HDC

!!! note ""
    ####__New
    !!! tip ""

        ```AutoHotKey
        __New(Hwnd, guiHwnd := false)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Constructor.



    ??? example "parameters"

        !!! info ""

            **name**: Hwnd

            **desc**: The hwnd of the control that will be associated with this instance.

            **type**: hwnd

        !!! info ""

            **name**: guiHwnd

            **desc**: The hwnd of the parent window.

            **type**: hwnd|false

            **default**: false

    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: A new [`GridGUI.LOGFONT`](../LOGFONT/) instance.

            **type**: [GridGUI.LOGFONT](../LOGFONT/)

!!! note ""
    ####__ReleaseDC
    !!! tip ""

        ```AutoHotKey
        __ReleaseDC(hDC)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Releases a device context.



    ??? example "parameters"

        !!! info ""

            **name**: hDC

            **desc**: The handle to the device context that will be released.

            **type**: HDC

!!! note ""
    ####GetData
    !!! tip ""

        ```AutoHotKey
        GetData(buff)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Retrieves the font characteristics from the LOGFONT structure.



    ??? example "parameters"

        !!! info ""

            **name**: buff

            **desc**: A buffer holding a LOGFONT struct.

            **type**: pointer

            **link**: [link](https://docs.microsoft.com/en-us/windows/win32/api/wingdi/ns-wingdi-logfonta)

!!! note ""
    ####GetDimensionsInPixels
    !!! tip ""

        ```AutoHotKey
        GetDimensionsInPixels(str)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Returns the bounding box of a string when written using the current font and style.



    ??? example "parameters"

        !!! info ""

            **name**: str

            **desc**: The string to calculate the bounding box of.

            **type**: string

    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: The bounding box of `str`.

            **type**: [GridGUI.Position](../Position/)

!!! note ""
    ####PixelHeight
    !!! tip ""

        ```AutoHotKey
        PixelHeight(str)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Returns the needed height in pixels of a string using the current font and style.



    ??? example "parameters"

        !!! info ""

            **name**: str

            **desc**: The string to calculate the height of.

            **type**: string

    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: The needed height of `str`.

            **type**: number

!!! note ""
    ####PixelWidth
    !!! tip ""

        ```AutoHotKey
        PixelWidth(str)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Returns the needed width in pixels of a string using the current font and style.



    ??? example "parameters"

        !!! info ""

            **name**: str

            **desc**: The string to calculate the width of.

            **type**: string

    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: The needed width of `str`.

            **type**: number

!!! note ""
    ####ToOptions
    !!! tip ""

        ```AutoHotKey
        ToOptions()
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Converts the font characteristics to a string that can be used in `Gui, Font`.



    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: The font characteristics as an ahk font option string.

            **type**: string

!!! note ""
    ####ToStr
    !!! tip ""

        ```AutoHotKey
        ToStr()
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Converts the object to a string.



    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: A string representing this [`GridGUI.LOGFONT`](../LOGFONT/).

            **type**: string

!!! note ""
    ####UpdateFont
    !!! tip ""

        ```AutoHotKey
        UpdateFont()
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Retrieves the font from the control and the colour for the parent window.



