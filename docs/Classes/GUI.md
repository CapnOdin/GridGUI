#GUI
<figure markdown="1">

</figure>
---
##Members

!!! info ""

    ####BackgroundCtrls
    !!! info ""

        **desc**: An array of controls that should be lowered below all newly added controls and which have the style `WS_CLIPSIBLINGS` applied. To register a background control see [`GridGUI.GUI.RegisterBackground`](../GUI/#registerbackground).

        **type**: array

        **default**: []

        **meta**: [object]

        **link**: [link](https://docs.microsoft.com/en-us/windows/win32/winmsg/window-styles)

!!! info ""

    ####DPIScale
    !!! info ""

        **desc**: Whether or not to correct for non standard dpi.

        **type**: bool

        **default**: true

        **link**: [link](https://www.autohotkey.com/docs/commands/Gui.htm#DPIScale)

!!! info ""

    ####DropTarges
    !!! info ""

        **desc**: An object of hwnds mapping to callbacks that will be call on `WM_DROPFILES` if the event was on a control with the corresponding hwnd. To register a callback see [`GridGUI.GUI.RegisterDropTarget`](../GUI/#registerdroptarget).

        **type**: object

        **default**: {}

        **meta**: [object]

!!! info ""

    ####ForegroundCtrls
    !!! info ""

        **desc**: An array of controls that should be raised above all newly added controls and which are redrawn after other controls have been drawn. To register a foreground control see [`GridGUI.GUI.RegisterForeground`](../GUI/#registerforeground).

        **type**: array

        **default**: []

        **meta**: [object]

!!! info ""

    ####GuiActivate
    !!! info ""

        **desc**: The callback that will be called on `WM_ACTIVATE`.

        **type**: Func|BoundFunc|false

        **default**: false

        **meta**: [object]

        **link**: [link](https://docs.microsoft.com/en-us/windows/win32/inputdev/wm-activate)

!!! info ""

    ####GuiClose
    !!! info ""

        **desc**: The callback that will be called on `WM_SYSCOMMAND` if `wParam` equals `SC_CLOSE`.

        **type**: Func|BoundFunc|false

        **default**: false

        **meta**: [object]

        **link**: [link](https://www.autohotkey.com/docs/commands/Gui.htm#GuiClose)

!!! info ""

    ####GuiContextMenu
    !!! info ""

        **desc**: The callback that will be called on `WM_CONTEXTMENU`.

        **type**: Func|BoundFunc|false

        **default**: false

        **meta**: [object]

        **link**: [link](https://www.autohotkey.com/docs/commands/Gui.htm#GuiContextMenu)

!!! info ""

    ####GuiMoved
    !!! info ""

        **desc**: The callback that will be called on `WM_MOVE`.

        **type**: Func|BoundFunc|false

        **default**: false

        **meta**: [object]

        **link**: [link](https://docs.microsoft.com/en-us/windows/win32/winmsg/wm-move)

!!! info ""

    ####GuiMovedDelay
    !!! info ""

        **desc**: The delay to wait before the user defined callback [`GridGUI.GUI.GuiMoved`](../GUI/#guimoved) will be called. A delay of **0** will make the callback be called directly in the OnMessage callback function and a delay above 0 will be triggered using a timer.

        **type**: number

        **default**: 50

!!! info ""

    ####GuiSize
    !!! info ""

        **desc**: The callback that will be called on `WM_SIZE`.

        **type**: Func|BoundFunc|false

        **default**: false

        **meta**: [object]

        **link**: [link](https://www.autohotkey.com/docs/commands/Gui.htm#GuiSize)

!!! info ""

    ####GuiSizeDelay
    !!! info ""

        **desc**: The delay to wait before the user defined callback [`GridGUI.GUI.GuiSize`](../GUI/#guisize) will be called. A delay of **0** will make the callback be called directly in the OnMessage callback function and a delay above 0 will be triggered using a timer.

        **type**: number

        **default**: 50

!!! info ""

    ####OnPaintDelay
    !!! info ""

        **desc**: The delay to wait before the callback that redraws the controls in [`GridGUI.GUI.ForegroundCtrls`](../GUI/#foregroundctrls) will be called. A delay of **0** will make the callback be called directly in the OnMessage callback function and a delay above 0 will be triggered using a timer.

        **type**: number

        **default**: 10

!!! info ""

    ####pos
    !!! info ""

        **desc**: The position of this GUI.

        **type**: [GridGUI.Position](../Position/)

        **default**: GridGUI.Position(0, 0)

        **meta**: [object]

##Methods

!!! note ""
    ####__CheckOptions
    !!! tip ""

        ```AutoHotKey
        __CheckOptions(options)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Parses option strings for values that are used by the class and updated the instance based on the values.



    ??? example "parameters"

        !!! info ""

            **name**: options

            **desc**: An ahk GUI option string.

            **type**: string

            **link**: [link](https://www.autohotkey.com/docs/commands/Gui.htm#Options)

    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: The `options` argument minus anything that class handles, currently only `gLabels` are removed.

            **type**: string

!!! note ""
    ####__DPIScale
    !!! tip ""

        ```AutoHotKey
        __DPIScale(pos, enlarge := true)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Scale a position by the dpi ratio, that is `A_ScreenDPI / 96`.



    ??? example "parameters"

        !!! info ""

            **name**: pos

            **desc**: The [`GridGUI.Position`](../Position/) instance to scale.

            **type**: [GridGUI.Position](../Position/)

        !!! info ""

            **name**: enlarge

            **desc**: Whether to increase or decrease the size of `pos`.

            **type**: bool

            **default**: true

    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: The scaled position.

            **type**: [GridGUI.Position](../Position/)

!!! note ""
    ####__GuiActivate
    !!! tip ""

        ```AutoHotKey
        __GuiActivate(wParam, lParam, msg, hwnd)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } The internal callback on `WM_ACTIVATE` that calls the user defined [`GridGUI.GUI.GuiActivate`](../GUI/#guiactivate) if it evaluates to true. The callback is called with the low-order word of `wParam`.



    ??? example "parameters"

        !!! info ""

            **name**: wParam

            **desc**: Low-order word is the active state of the changed window, the high-order word is whether the window was minimised. If the low-order word is **1** the window was activated, if it is **2** the window was activated by a mouse click and if it is **0** the window is deactivated.

            **type**: number

            **link**: [link](https://docs.microsoft.com/en-us/windows/win32/inputdev/wm-activate)

        !!! info ""

            **name**: lParam

            **desc**: The hwnd of the window where the active state of the window changed.

            **type**: number

            **link**: [link](https://docs.microsoft.com/en-us/windows/win32/inputdev/wm-activate)

        !!! info ""

            **name**: msg

            **desc**: WM_ACTIVATE (0x0006).

            **type**: number

        !!! info ""

            **name**: hwnd

            **desc**: The hwnd of the window or control that recieved the message.

            **type**: hwnd

!!! note ""
    ####__GuiContextMenu
    !!! tip ""

        ```AutoHotKey
        __GuiContextMenu(wParam, lParam, msg, hwnd)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } The internal callback on `WM_CONTEXTMENU` that calls the user defined [`GridGUI.GUI.GuiContextMenu`](../GUI/#guicontextmenu) if it evaluates to true. The callback is called with the clicked coordinate as a [`GridGUI.Position`](../Position/) and with the hwnd of the windows that was right-clicked.



    ??? example "parameters"

        !!! info ""

            **name**: wParam

            **desc**: The hwnd of the windows that was right-clicked.

            **type**: hwnd

            **link**: [link](https://docs.microsoft.com/en-us/windows/win32/menurc/wm-contextmenu)

        !!! info ""

            **name**: lParam

            **desc**: The clicked coordinate. The low-order word is the x coordinate. The high-order word is the y coordinate.

            **type**: number

            **link**: [link](https://docs.microsoft.com/en-us/windows/win32/menurc/wm-contextmenu)

        !!! info ""

            **name**: msg

            **desc**: WM_CONTEXTMENU (0x007B).

            **type**: number

        !!! info ""

            **name**: hwnd

            **desc**: The hwnd of the window or control that recieved the message.

            **type**: hwnd

!!! note ""
    ####__GuiDropFiles
    !!! tip ""

        ```AutoHotKey
        __GuiDropFiles(hDrop, lParam, msg, hwnd)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } The internal callback on `WM_DROPFILES` that calls the user defined [`GridGUI.GUI.DropTarges`](../GUI/#droptarges) if the callback associated array has the `hwnd` argument as one of its key. The callback is called with an array of the dropped files.



    ??? example "parameters"

        !!! info ""

            **name**: hDrop

            **desc**: A handle to an internal structure describing the dropped files.

            **type**: number

            **link**: [link](https://docs.microsoft.com/en-us/windows/win32/shell/wm-dropfiles)

        !!! info ""

            **name**: lParam

            **desc**: Always zero.

            **type**: number

            **link**: [link](https://docs.microsoft.com/en-us/windows/win32/shell/wm-dropfiles)

        !!! info ""

            **name**: msg

            **desc**: WM_DROPFILES (0x0233).

            **type**: number

        !!! info ""

            **name**: hwnd

            **desc**: The hwnd of the window or control that recieved the message.

            **type**: hwnd

!!! note ""
    ####__GuiInit
    !!! tip ""

        ```AutoHotKey
        __GuiInit()
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Initialises all the members of the GUI class.



!!! note ""
    ####__GuiMoved
    !!! tip ""

        ```AutoHotKey
        __GuiMoved(wParam, lParam, msg, hwnd)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } The internal callback on `WM_MOVE` that calls [`GridGUI.GUI._GuiMoved`](../GUI/#_guimoved) with the new location as a [`GridGUI.Position`](../Position/).



    ??? example "parameters"

        !!! info ""

            **name**: wParam

            **desc**: Unused.

            **type**: number

            **link**: [link](https://docs.microsoft.com/en-us/windows/win32/winmsg/wm-move)

        !!! info ""

            **name**: lParam

            **desc**: The coordinate of the top left corner of the window. The low-order word is the x coordinate and the high-order word is the y coordinate.

            **type**: number

            **link**: [link](https://docs.microsoft.com/en-us/windows/win32/winmsg/wm-move)

        !!! info ""

            **name**: msg

            **desc**: WM_MOVE (0x0003).

            **type**: number

        !!! info ""

            **name**: hwnd

            **desc**: The hwnd of the window or control that recieved the message.

            **type**: hwnd

!!! note ""
    ####__GuiSize
    !!! tip ""

        ```AutoHotKey
        __GuiSize(wParam, lParam, msg, hwnd)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } The internal callback on `WM_SIZE` that calls [`GridGUI.GUI._GuiSize`](../GUI/#_guisize) with the new area as a [`GridGUI.Position`](../Position/) where x and y are both zero and with the `wParam` argument.



    ??? example "parameters"

        !!! info ""

            **name**: wParam

            **desc**: The type of resizing that have occurred. **0** is normal resizing, **1** means that the window was minimised and **2** means that it was maximised.

            **type**: number

            **link**: [link](https://docs.microsoft.com/en-us/windows/win32/winmsg/wm-size)

        !!! info ""

            **name**: lParam

            **desc**: The new area of the window. The low-order word is the width and the high-order word is the height.

            **type**: number

            **link**: [link](https://docs.microsoft.com/en-us/windows/win32/winmsg/wm-size)

        !!! info ""

            **name**: msg

            **desc**: WM_SIZE (0x0005).

            **type**: number

        !!! info ""

            **name**: hwnd

            **desc**: The hwnd of the window or control that recieved the message.

            **type**: hwnd

!!! note ""
    ####__LowerBackgoundCtrls
    !!! tip ""

        ```AutoHotKey
        __LowerBackgoundCtrls()
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Lowers the z-order of all registered controls in [`GridGUI.GUI.BackgroundCtrls`](../GUI/#backgroundctrls). To register controls as background controls see [`GridGUI.GUI.RegisterBackground`](../GUI/#registerbackground).



!!! note ""
    ####__New
    !!! tip ""

        ```AutoHotKey
        __New(title := "", options := "", hwnd := "")
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Constructor.



    ??? example "parameters"

        !!! info ""

            **name**: title

            **desc**: The title of the newly created GUI.

            **type**: string

            **default**: ""

        !!! info ""

            **name**: options

            **desc**: The gui option string that the GUI will be created with.

            **type**: string

            **default**: ""

            **link**: [link](https://www.autohotkey.com/docs/commands/Gui.htm#Options)

        !!! info ""

            **name**: hwnd

            **desc**: If specified then no new GUI will be created and no `OnMessage` callbacks will be set up. Instead the [`GridGUI.GUI`](../GUI/) instance will work like a wrapper for the GUI that can be used to interact with it.

            **type**: string

            **default**: ""

    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: A new [`GridGUI.GUI`](../GUI/) instance.

            **type**: [GridGUI.GUI](../GUI/)

!!! note ""
    ####__OnAdd
    !!! tip ""

        ```AutoHotKey
        __OnAdd()
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Updates the z-order of registered controls. Called when a control is added to the GUI.



!!! note ""
    ####__OnPaint
    !!! tip ""

        ```AutoHotKey
        __OnPaint(wParam, lParam, msg, hwnd)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } The internal callback on `WM_PAINT` that calls [`GridGUI.GUI.__ReDrawForgoundCtrls`](../GUI/#__redrawforgoundctrls) to fix issues with overlapping controls for controls registered in [`GridGUI.GUI.ForegroundCtrls`](../GUI/#foregroundctrls).



    ??? example "parameters"

        !!! info ""

            **name**: wParam

            **desc**: Unused.

            **type**: number

            **link**: [link](https://docs.microsoft.com/en-us/windows/win32/gdi/wm-paint)

        !!! info ""

            **name**: lParam

            **desc**: Unused.

            **type**: number

            **link**: [link](https://docs.microsoft.com/en-us/windows/win32/gdi/wm-paint)

        !!! info ""

            **name**: msg

            **desc**: WM_PAINT (0x000F).

            **type**: number

        !!! info ""

            **name**: hwnd

            **desc**: The hwnd of the window or control that recieved the message.

            **type**: hwnd

!!! note ""
    ####__RaiseForgoundCtrls
    !!! tip ""

        ```AutoHotKey
        __RaiseForgoundCtrls()
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Raises the z-order of all registered controls in [`GridGUI.GUI.ForegroundCtrls`](../GUI/#foregroundctrls). To register controls as background controls see [`GridGUI.GUI.RegisterForeground`](../GUI/#registerforeground).



!!! note ""
    ####__ReDrawForgoundCtrls
    !!! tip ""

        ```AutoHotKey
        __ReDrawForgoundCtrls()
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Redraws the controls registered with [`GridGUI.GUI.RegisterForeground`](../GUI/#registerforeground). Called on `WM_PAINT`.



!!! note ""
    ####__SysCommand
    !!! tip ""

        ```AutoHotKey
        __SysCommand(wParam, lParam, msg, hwnd)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } The internal callback on `WM_SYSCOMMAND` that calls the user defined [`GridGUI.GUI.GuiClose`](../GUI/#guiclose) callback on `SC_CLOSE` if the callback variable evaluates to true.



    ??? example "parameters"

        !!! info ""

            **name**: wParam

            **desc**: The type of system command requested, see link for a list of values.

            **type**: number

            **link**: [link](https://docs.microsoft.com/en-us/windows/win32/menurc/wm-syscommand)

        !!! info ""

            **name**: lParam

            **desc**: The coordinate of the mouse, if this message was triggered by a menu selection, otherwise the argument is unused. The low-order word is the x coordinate and the high-order word is the y coordinate.

            **type**: number

            **link**: [link](https://docs.microsoft.com/en-us/windows/win32/menurc/wm-syscommand)

        !!! info ""

            **name**: msg

            **desc**: WM_SYSCOMMAND (0x0112).

            **type**: number

        !!! info ""

            **name**: hwnd

            **desc**: The hwnd of the window or control that recieved the message.

            **type**: hwnd

!!! note ""
    ####_GuiMoved
    !!! tip ""

        ```AutoHotKey
        _GuiMoved(pos)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } An internal callback used to update the x and y coordinate of [`GridGUI.GUI.pos`](../GUI/#pos) and to call the user defined [`GridGUI.GUI.GuiMoved`](../GUI/#guimoved) callback



    ??? example "parameters"

        !!! info ""

            **name**: pos

            **desc**: The new coordinate of the top left corner of the GUI. The width and height are both zero.

            **type**: [GridGUI.Position](../Position/)

!!! note ""
    ####_GuiSize
    !!! tip ""

        ```AutoHotKey
        _GuiSize(pos, resizeEvent)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } An internal callback used to update the width and height of [`GridGUI.GUI.pos`](../GUI/#pos) and to call the user defined [`GridGUI.GUI.GuiSize`](../GUI/#guisize) callback



    ??? example "parameters"

        !!! info ""

            **name**: pos

            **desc**: The new area of the GUI. The x and y coordinate are both zero.

            **type**: [GridGUI.Position](../Position/)

        !!! info ""

            **name**: resizeEvent

            **desc**: A number indicating whether the GUI was maximised, minimised or neither that is passed on to the user defined [`GridGUI.GUI.GuiSize`](../GUI/#guisize) callback. See the link for what the numbers mean.

            **type**: number

            **link**: [link](https://docs.microsoft.com/en-us/windows/win32/winmsg/wm-size)

!!! note ""
    ####Add
    !!! tip ""

        ```AutoHotKey
        Add(controlType, options := "", text := "")
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Adds most standard ahk controls to the GUI.



    ??? example "parameters"

        !!! info ""

            **name**: controlType

            **desc**: The type of the control. Can be `Text, Edit, UpDown, Picture, Button, Checkbox, DropDownList, ComboBox, ListBox, Link, Hotkey, DateTime, MonthCal, Slider, Progress, GroupBox and ActiveX`. For `Radio, ListView, TreeView, Tab3 and StatusBar` see [AdditionalControls](AdditionalControls)

            **type**: string

        !!! info ""

            **name**: options

            **desc**: The options that the GuiControl will be created with. Does not accept vVars. Can be an object with keys the same names as the optional arguments that this method takes.

            **type**: string

            **default**: ""

            **link**: [link](https://www.autohotkey.com/docs/commands/Gui.htm#OtherOptions)

        !!! info ""

            **name**: text

            **desc**: The text that the control will be created with.

            **type**: string

            **default**: ""

    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: The added control instance.

            **type**: [GridGUI.ArbitraryControl](../ArbitraryControl/)

!!! note ""
    ####Color
    !!! tip ""

        ```AutoHotKey
        Color(WindowColor := "", ControlColor := "")
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } A thin method wrapper for `Gui, Color`.



    ??? example "parameters"

        !!! info ""

            **name**: WindowColor

            **desc**: The colour of the background of the GUI. See link for the supported format.

            **type**: string

            **default**: ""

            **link**: [link](https://www.autohotkey.com/docs/commands/Gui.htm#Color)

        !!! info ""

            **name**: ControlColor

            **desc**: The colour of the background of controls that are added to the GUI in the future. See link for the supported format.

            **type**: string

            **default**: ""

            **link**: [link](https://www.autohotkey.com/docs/commands/Gui.htm#Color)

    **link**: [link](https://www.autohotkey.com/docs/commands/Gui.htm#Color)

!!! note ""
    ####ControlGetFocus
    !!! tip ""

        ```AutoHotKey
        ControlGetFocus()
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Retrives the hwnd of the control with input focus.



    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: The hwnd of the focused control.

            **type**: hwnd

!!! note ""
    ####Default
    !!! tip ""

        ```AutoHotKey
        Default()
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } A thin method wrapper for `Gui, Default`.



    **link**: [link](https://www.autohotkey.com/docs/commands/Gui.htm#Default)

!!! note ""
    ####Destroy
    !!! tip ""

        ```AutoHotKey
        Destroy()
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } A thin method wrapper for `Gui, Destroy`.



    **link**: [link](https://www.autohotkey.com/docs/commands/Gui.htm#Destroy)

!!! note ""
    ####Flash
    !!! tip ""

        ```AutoHotKey
        Flash(Off := false)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } A thin method wrapper for `Gui, Flash`, except that it used a bool instead of a string to indicate that the colour should be restored.



    ??? example "parameters"

        !!! info ""

            **name**: Off

            **desc**: If `false` the GUI flashes. If `true` the colour of the GUI is restored.

            **type**: bool

            **default**: false

    **link**: [link](https://www.autohotkey.com/docs/commands/Gui.htm#Flash)

!!! note ""
    ####Font
    !!! tip ""

        ```AutoHotKey
        Font(Options, FontName)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } A thin method wrapper for `Gui, Font`



    ??? example "parameters"

        !!! info ""

            **name**: Options

            **desc**: Styling option string, see link for detail of what options are available.

            **type**: string

            **link**: [link](https://www.autohotkey.com/docs/commands/Gui.htm#Font)

        !!! info ""

            **name**: FontName

            **desc**: The name of the font to apply.

            **type**: string

            **link**: [link](https://www.autohotkey.com/docs/misc/FontsStandard.htm)

    **link**: [link](https://www.autohotkey.com/docs/commands/Gui.htm#Font)

!!! note ""
    ####Hide
    !!! tip ""

        ```AutoHotKey
        Hide()
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } A thin method wrapper for `Gui, Hide`



    **link**: [link](https://www.autohotkey.com/docs/commands/Gui.htm#Hide)

!!! note ""
    ####ListView
    !!! tip ""

        ```AutoHotKey
        ListView(hwnd)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Changes the default `ListView` to the specified hwnd. See the link for what changing the default `ListView` does.



    ??? example "parameters"

        !!! info ""

            **name**: hwnd

            **desc**: The hwnd of the `ListView` to set as the default.

            **type**: hwnd

    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: The hwnd of the `ListView` that was previously the default.

            **type**: hwnd

    **link**: [link](https://www.autohotkey.com/docs/commands/ListView.htm#BuiltIn)

!!! note ""
    ####Margin
    !!! tip ""

        ```AutoHotKey
        Margin(x := "", y := "")
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } A thin method wrapper for `Gui, Margin`



    ??? example "parameters"

        !!! info ""

            **name**: x

            **desc**: The horizontal margin of controls that are added to the GUI.

            **type**: string

            **default**: ""

        !!! info ""

            **name**: y

            **desc**: The vertical margin of controls that are added to the GUI.

            **type**: string

            **default**: ""

    **link**: [link](https://www.autohotkey.com/docs/commands/Gui.htm#Margin)

!!! note ""
    ####Maximize
    !!! tip ""

        ```AutoHotKey
        Maximize()
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } A thin method wrapper for `Gui, Maximize`



    **link**: [link](https://www.autohotkey.com/docs/commands/Gui.htm#Minimize)

!!! note ""
    ####Menu
    !!! tip ""

        ```AutoHotKey
        Menu(MenuName := "")
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } A thin method wrapper for `Gui, Menu`



    ??? example "parameters"

        !!! info ""

            **name**: MenuName

            **desc**: The name of the menu to attach to the GUI menu bar. Menues are made using the `Menu` command, see link for details.

            **type**: string

            **default**: ""

            **link**: [link](https://www.autohotkey.com/docs/commands/Menu.htm)

    **link**: [link](https://www.autohotkey.com/docs/commands/Gui.htm#Menu)

!!! note ""
    ####Minimize
    !!! tip ""

        ```AutoHotKey
        Minimize()
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } A thin method wrapper for `Gui, Minimize`



    **link**: [link](https://www.autohotkey.com/docs/commands/Gui.htm#Minimize)

!!! note ""
    ####MinSize
    !!! tip ""

        ```AutoHotKey
        MinSize(x := "", y := "")
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Sets the minsize of the GUI, that is the size that the GUI can't be reduced beyond by drag resizing.



    ??? example "parameters"

        !!! info ""

            **name**: x

            **desc**: The minimal width of the GUI. If `""` the min width is left unchanged.

            **type**: string

            **default**: ""

        !!! info ""

            **name**: y

            **desc**: The minimal height of the GUI. If `""` the min height is left unchanged.

            **type**: string

            **default**: ""

!!! note ""
    ####Options
    !!! tip ""

        ```AutoHotKey
        Options(options)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Applies styles and options to the GUI.



    ??? example "parameters"

        !!! info ""

            **name**: options

            **desc**: The ahk GUI style and option string to apply to the GUI. See link for supported styles and options.

            **type**: string

            **link**: [link](https://www.autohotkey.com/docs/commands/Gui.htm#Options)

    **link**: [link](https://www.autohotkey.com/docs/commands/Gui.htm#Options)

!!! note ""
    ####RegisterBackground
    !!! tip ""

        ```AutoHotKey
        RegisterBackground(ctrl)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Registers a control as a background control, that is their z-order is lowered below any current and future controls.



    ??? example "parameters"

        !!! info ""

            **name**: ctrl

            **desc**: The [`GridGUI.GuiControlClass`](../GuiControlClass/) instance that will be registered.

            **type**: [GridGUI.GuiControlClass](../GuiControlClass/)

!!! note ""
    ####RegisterDropTarget
    !!! tip ""

        ```AutoHotKey
        RegisterDropTarget(ctrl, Callback)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Registers a control as a file drag and drop target. Any registered control will have its callback called whenever files are dropped on the control.



    ??? example "parameters"

        !!! info ""

            **name**: ctrl

            **desc**: The [`GridGUI.ControlClass`](../ControlClass/) instance that will be registered.

            **type**: [GridGUI.ControlClass](../ControlClass/)

        !!! info ""

            **name**: Callback

            **desc**: The callback to call when files are dropped on the control.

            **type**: Func|BoundFunc

!!! note ""
    ####RegisterForeground
    !!! tip ""

        ```AutoHotKey
        RegisterForeground(ctrl)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Registers a control to be redrawn after all other controls as well as their z-order is raised above any current and future controls.



    ??? example "parameters"

        !!! info ""

            **name**: ctrl

            **desc**: The [`GridGUI.GuiControlClass`](../GuiControlClass/) instance that will be registered.

            **type**: [GridGUI.GuiControlClass](../GuiControlClass/)

!!! note ""
    ####Restore
    !!! tip ""

        ```AutoHotKey
        Restore()
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } A thin method wrapper for `Gui, Restore`



    **link**: [link](https://www.autohotkey.com/docs/commands/Gui.htm#Minimize)

!!! note ""
    ####Show
    !!! tip ""

        ```AutoHotKey
        Show(options := AutoSize)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } A thin method wrapper for `Gui, Show`



    ??? example "parameters"

        !!! info ""

            **name**: options

            **desc**: The options string describing how to show the GUI. See link for available options.

            **type**: string

            **default**: AutoSize

            **link**: [link](https://www.autohotkey.com/docs/commands/Gui.htm#Show)

    **link**: [link](https://www.autohotkey.com/docs/commands/Gui.htm#Show)

!!! note ""
    ####Submit
    !!! tip ""

        ```AutoHotKey
        Submit(NoHide := false)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } A thin method wrapper for `Gui, Submit`



    ??? example "parameters"

        !!! info ""

            **name**: NoHide

            **desc**: Whether or not to hide the GUI after submitting it.

            **type**: bool

            **default**: false

    **link**: [link](https://www.autohotkey.com/docs/commands/Gui.htm#Submit)

!!! note ""
    ####TreeView
    !!! tip ""

        ```AutoHotKey
        TreeView(hwnd)
        ```


    !!! abstract ""

        :material-clipboard-text:{ .desc } Changes the default `TreeView` to the specified hwnd. See the link for what changing the default `TreeView` does.



    ??? example "parameters"

        !!! info ""

            **name**: hwnd

            **desc**: The hwnd of the `TreeView` to set as the default.

            **type**: hwnd

    !!! question ""

        :material-arrow-u-left-bottom-bold:{ .return } **return value**
        !!! question ""

            **desc**: The hwnd of the `TreeView` that was previously the default.

            **type**: hwnd

    **link**: [link](https://www.autohotkey.com/docs/commands/TreeView.htm#BuiltIn)

