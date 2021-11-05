#LOGFONT
<figure markdown="1">

</figure>
---
##Members

####_Colour

> **desc**: The colour of the controls text in BGR format.

> **type**: number

####CharSet

> **desc**: The char set of the font. See the link for details.

> **type**: number

> **link**: [link](https://docs.microsoft.com/en-us/windows/win32/api/wingdi/ns-wingdi-logfonta#members)

####ClipPrecision

> **desc**: How characters that are partially outside the bounds of the font are handled. See link for details.

> **type**: number

> **link**: [link](https://docs.microsoft.com/en-us/windows/win32/api/wingdi/ns-wingdi-logfonta#members)

####Colour

> **desc**: The colour of the controls text in RGB format as a hex string.

> **type**: string

####Escapement

> **desc**: The angle between the text direction and the x-axis of the screen in 1/10 degree. See link for details.

> **type**: number

> **link**: [link](https://docs.microsoft.com/en-us/windows/win32/api/wingdi/ns-wingdi-logfonta#members)

####FaceName

> **desc**: The name of the font that was applied to the control. See the link for common fonts.

> **type**: string

> **link**: [link](https://www.autohotkey.com/docs/misc/FontsStandard.htm)

####guiHwnd

> **desc**: The hwnd of the parent window of the control associated with this instance.

> **type**: hwnd|false

####Height

> **desc**: The height of the characters in the font. See link for details.

> **type**: number

> **link**: [link](https://docs.microsoft.com/en-us/windows/win32/api/wingdi/ns-wingdi-logfonta#members)

####HFONT

> **desc**: The handle to the font associated with the control.

> **type**: HFONT

####Hwnd

> **desc**: The hwnd of the control that is associated with this instance.

> **type**: hwnd

####Italic

> **desc**: Whether or not the font is italic.

> **type**: bool

####Orientation

> **desc**: The angle between the bottom of the charats and the x-axis of the screen in 1/10 degree.

> **type**: number

####OutPrecision

> **desc**: How precisely the drawn characters most match the set font characteristics. See link for details.

> **type**: number

> **link**: [link](https://docs.microsoft.com/en-us/windows/win32/api/wingdi/ns-wingdi-logfonta#members)

####PitchAndFamily

> **desc**: The two low-order bits specify the pitch of the font and the last four bits specify the family. See link for details.

> **type**: number

> **link**: [link](https://docs.microsoft.com/en-us/windows/win32/api/wingdi/ns-wingdi-logfonta#members)

####Quality

> **desc**: The quality of the font. See link for details.

> **type**: number

> **link**: [link](https://www.autohotkey.com/docs/commands/Gui.htm#Font)

####StrikeOut

> **desc**: Whether or not the font is drawn with a line through it.

> **type**: bool

####Underline

> **desc**: Whether or not the font is drawn with a line underneath it.

> **type**: bool

####Weight

> **desc**: How bold the text is. See link for details.

> **type**: number

> **link**: [link](https://www.autohotkey.com/docs/commands/Gui.htm#Font)

####Width

> **desc**: The average width of characters in the font. See link for details.

> **type**: number

> **link**: [link](https://docs.microsoft.com/en-us/windows/win32/api/wingdi/ns-wingdi-logfonta#members)

##Methods

####__GetColour
**desc**: Retrives the colour that the parent window would paint the text as returned by `WM_CTLCOLORSTATIC`.

####__GetDC
**desc**: Retrives the DC handle of the associated control.

**returns**:

> **desc**: The DC handle of the associated control.

> **type**: HDC

####__New
**desc**: Constructor.

**args**:

> **name**: Hwnd

> **desc**: The hwnd of the control that will be associated with this instance.

> **type**: hwnd

> **name**: guiHwnd

> **desc**: The hwnd of the parent window.

> **type**: hwnd|false

**returns**:

> **desc**: A new [`GridGUI.LOGFONT`](../LOGFONT/) instance.

> **type**: GridGUI.LOGFONT

####__ReleaseDC
**desc**: Releases a device context.

**args**:

> **name**: hDC

> **desc**: The handle to the device context that will be released.

> **type**: HDC

####GetData
**desc**: Retrieves the font characteristics from the LOGFONT structure.

**args**:

> **name**: buff

> **desc**: A buffer holding a LOGFONT struct.

> **type**: pointer

####GetDimensionsInPixels
**desc**: Returns the bounding box of a string when written using the current font and style.

**args**:

> **name**: str

> **desc**: The string to calculate the bounding box of.

> **type**: string

**returns**:

> **desc**: The bounding box of `str`.

> **type**: GridGUI.Position

####PixelHeight
**desc**: Returns the needed height in pixels of a string using the current font and style.

**args**:

> **name**: str

> **desc**: The string to calculate the height of.

> **type**: string

**returns**:

> **desc**: The needed height of `str`.

> **type**: number

####PixelWidth
**desc**: Returns the needed width in pixels of a string using the current font and style.

**args**:

> **name**: str

> **desc**: The string to calculate the width of.

> **type**: string

**returns**:

> **desc**: The needed width of `str`.

> **type**: number

####ToOptions
**desc**: Converts the font characteristics to a string that can be used in `Gui, Font`.

**returns**:

> **desc**: The font characteristics as an ahk font option string.

> **type**: string

####ToStr
**desc**: Converts the object to a string.

**returns**:

> **desc**: A string representing this [`GridGUI.LOGFONT`](../LOGFONT/).

> **type**: string

####UpdateFont
**desc**: Retrieves the font from the control and the colour for the parent window.

