#GUI
<figure markdown="1">
A class representing a GUI.
</figure>
---
##Members

####BackgroundCtrls

> **desc**: An array of controls that should be lowered below all newly added controls and which have the style `WS_CLIPSIBLINGS` applied. To register a background control see `GridGUI.GUI.RegisterBackground`.

> **type**: array

> **default**: []

####DPIScale

> **desc**: Whether or not to correct for non standard dpi.

> **type**: bool

####DropTarges

> **desc**: An object of hwnds mapping to callbacks that will be call on `WM_DROPFILES` if the event was on a control with the corresponding hwnd. To register a callback see `GridGUI.GUI.RegisterDropTarget`.

> **type**: object

> **default**: {}

####ForegroundCtrls

> **desc**: An array of controls that should be raised above all newly added controls and which are redrawn after other controls have been drawn. To register a foreground control see `GridGUI.GUI.RegisterForeground`.

> **type**: array

> **default**: []

####GuiActivate

> **desc**: The callback that will be called on `WM_ACTIVATE`.

> **type**: Func|BoundFunc|false

####GuiClose

> **desc**: The callback that will be called on `WM_SYSCOMMAND` if `wParam` equals `SC_CLOSE`.

> **type**: Func|BoundFunc|false

####GuiContextMenu

> **desc**: The callback that will be called on `WM_CONTEXTMENU`.

> **type**: Func|BoundFunc|false

####GuiMoved

> **desc**: The callback that will be called on `WM_MOVE`.

> **type**: Func|BoundFunc|false

####GuiSize

> **desc**: The callback that will be called on `WM_SIZE`.

> **type**: Func|BoundFunc|false

####pos

> **desc**: The position of this GUI.

> **type**: GridGUI.Position

> **default**: GridGUI.Position(0, 0)

##Methods

####__CheckOptions
**desc**: Parses option strings for values that are used by the class and updated the instance based on the values.

**args**:

> **name**: options

> **desc**: An ahk GUI option string.

> **type**: string

**returns**:

> **desc**: The `options` argument minus anything that class handles, currently only `gLabels` are removed.

> **type**: string

####__DPIScale
**desc**: Scale a position by the dpi ratio, that is `A_ScreenDPI / 96`.

**args**:

> **name**: pos

> **desc**: The `GridGUI.Position` instance to scale.

> **type**: GridGUI.Position

> **name**: enlarge

> **desc**: Whether to increase or decrease the size of `pos`.

> **type**: bool

**returns**:

> **desc**: The scaled position.

> **type**: GridGUI.Position

####__GuiActivate
**desc**: The internal callback on `WM_ACTIVATE` that calls the user defined `GridGUI.GUI.GuiActivate` if it evaluates to true. The callback is called with the low-order word of `wParam`.

**args**:

> **name**: wParam

> **desc**: Low-order word is the active state of the changed window, the high-order word is whether the window was minimised. If the low-order word is **1** the window was activated, if it is **2** the window was activated by a mouse click and if it is **0** the window is deactivated.

> **type**: number

> **name**: lParam

> **desc**: The hwnd of the window where the active state of the window changed.

> **type**: number

> **name**: msg

> **desc**: WM_ACTIVATE (0x0006).

> **type**: number

> **name**: hwnd

> **desc**: The hwnd of the window or control that recieved the message.

> **type**: hwnd

####__GuiContextMenu
**desc**: The internal callback on `WM_CONTEXTMENU` that calls the user defined `GridGUI.GUI.GuiContextMenu` if it evaluates to true. The callback is called with the clicked coordinate as a `GridGUI.Position` and with the hwnd of the windows that was right-clicked.

**args**:

> **name**: wParam

> **desc**: The hwnd of the windows that was right-clicked.

> **type**: hwnd

> **name**: lParam

> **desc**: The clicked coordinate. The low-order word is the x coordinate. The high-order word is the y coordinate.

> **type**: number

> **name**: msg

> **desc**: WM_CONTEXTMENU (0x007B).

> **type**: number

> **name**: hwnd

> **desc**: The hwnd of the window or control that recieved the message.

> **type**: hwnd

####__GuiDropFiles
**desc**: The internal callback on `WM_DROPFILES` that calls the user defined `GridGUI.GUI.DropTarges` if the callback associated array has the `hwnd` argument as one of its key. The callback is called with an array of the dropped files.

**args**:

> **name**: hDrop

> **desc**: A handle to an internal structure describing the dropped files.

> **type**: number

> **name**: lParam

> **desc**: Always zero.

> **type**: number

> **name**: msg

> **desc**: WM_DROPFILES (0x0233).

> **type**: number

> **name**: hwnd

> **desc**: The hwnd of the window or control that recieved the message.

> **type**: hwnd

####__GuiInit
**desc**: Initialises all the members of the GUI class.

####__GuiMoved
**desc**: The internal callback on `WM_MOVE` that calls `GridGUI.GUI._GuiMoved` with the new location as a `GridGUI.Position`.

**args**:

> **name**: wParam

> **desc**: Unused.

> **type**: number

> **name**: lParam

> **desc**: The coordinate of the top left corner of the window. The low-order word is the x coordinate and the high-order word is the y coordinate.

> **type**: number

> **name**: msg

> **desc**: WM_MOVE (0x0003).

> **type**: number

> **name**: hwnd

> **desc**: The hwnd of the window or control that recieved the message.

> **type**: hwnd

####__GuiSize
**desc**: The internal callback on `WM_SIZE` that calls `GridGUI.GUI._GuiSize` with the new area as a `GridGUI.Position` where x and y are both zero and with the `wParam` argument.

**args**:

> **name**: wParam

> **desc**: The type of resizing that have occurred. **0** is normal resizing, **1** means that the window was minimised and **2** means that it was maximised.

> **type**: number

> **name**: lParam

> **desc**: The new area of the window. The low-order word is the width and the high-order word is the height.

> **type**: number

> **name**: msg

> **desc**: WM_SIZE (0x0005).

> **type**: number

> **name**: hwnd

> **desc**: The hwnd of the window or control that recieved the message.

> **type**: hwnd

####__LowerBackgoundCtrls
**desc**: Lowers the z-order of all registered controls in `GridGUI.GUI.BackgroundCtrls`. To register controls as background controls see `GridGUI.GUI.RegisterBackground`.

####__New
**desc**: Constructor.

**args**:

> **name**: title

> **desc**: The title of the newly created GUI.

> **type**: string

> **name**: options

> **desc**: The gui option string that the GUI will be created with.

> **type**: string

> **name**: hwnd

> **desc**: If specified then no new GUI will be created and no `OnMessage` callbacks will be set up. Instead the `GridGUI.GUI` instance will work like a wrapper for the GUI that can be used to interact with it.

> **type**: string

**returns**:

> **desc**: A new `GridGUI.GUI` instance.

> **type**: GridGUI.GUI

####__OnAdd
**desc**: Updates the z-order of registered controls. Called when a control is added to the GUI.

####__OnPaint
**desc**: The internal callback on `WM_PAINT` that calls `GridGUI.GUI.__ReDrawForgoundCtrls` to fix issues with overlapping controls for controls registered in `GridGUI.GUI.ForegroundCtrls`.

**args**:

> **name**: wParam

> **desc**: Unused.

> **type**: number

> **name**: lParam

> **desc**: Unused.

> **type**: number

> **name**: msg

> **desc**: WM_PAINT (0x000F).

> **type**: number

> **name**: hwnd

> **desc**: The hwnd of the window or control that recieved the message.

> **type**: hwnd

####__RaiseForgoundCtrls
**desc**: Raises the z-order of all registered controls in `GridGUI.GUI.ForegroundCtrls`. To register controls as background controls see `GridGUI.GUI.RegisterForeground`.

####__ReDrawForgoundCtrls
**desc**: Redraws the controls registered with `GridGUI.GUI.RegisterForeground`. Called on `WM_PAINT`.

####__SysCommand
**desc**: The internal callback on `WM_SYSCOMMAND` that calls the user defined `GridGUI.GUI.GuiClose` callback on `SC_CLOSE` if the callback variable evaluates to true.

**args**:

> **name**: wParam

> **desc**: The type of system command requested, see link for a list of values.

> **type**: number

> **name**: lParam

> **desc**: The coordinate of the mouse, if this message was triggered by a menu selection, otherwise the argument is unused. The low-order word is the x coordinate and the high-order word is the y coordinate.

> **type**: number

> **name**: msg

> **desc**: WM_SYSCOMMAND (0x0112).

> **type**: number

> **name**: hwnd

> **desc**: The hwnd of the window or control that recieved the message.

> **type**: hwnd

####_GuiMoved
**desc**: An internal callback used to update the x and y coordinate of `GridGUI.GUI.pos` and to call the user defined `GridGUI.GUI.GuiMoved` callback

**args**:

> **name**: pos

> **desc**: The new coordinate of the top left corner of the GUI. The width and height are both zero.

> **type**: GridGUI.Position

####_GuiSize
**desc**: An internal callback used to update the width and height of `GridGUI.GUI.pos` and to call the user defined `GridGUI.GUI.GuiSize` callback

**args**:

> **name**: pos

> **desc**: The new area of the GUI. The x and y coordinate are both zero.

> **type**: GridGUI.Position

> **name**: resizeEvent

> **desc**: A number indicating whether the GUI was maximised, minimised or neither that is passed on to the user defined `GridGUI.GUI.GuiSize` callback. See the link for what the numbers mean.

> **type**: number

####Add
**desc**: Adds most standard ahk controls to the GUI.

**args**:

> **name**: controlType

> **desc**: The type of the control. Can be `Text, Edit, UpDown, Picture, Button, Checkbox, DropDownList, ComboBox, ListBox, Link, Hotkey, DateTime, MonthCal, Slider, Progress, GroupBox and ActiveX`. For `Radio, ListView, TreeView, Tab3 and StatusBar` see [AdditionalControls](AdditionalControls)

> **type**: string

> **name**: options

> **desc**: The options that the GuiControl will be created with. Does not accept vVars. Can be an object with keys the same names as the optional arguments that this method takes.

> **type**: string

> **name**: text

> **desc**: The text that the control will be created with.

> **type**: string

**returns**:

> **desc**: The added control instance.

> **type**: GridGUI.ArbitraryControl

####Color
**desc**: A thin function wrapper for `Gui, Color`

**args**:

> **name**: WindowColor

> **desc**: 

> **type**: string

> **name**: ControlColor

> **desc**: 

> **type**: string

####ControlGetFocus
**desc**: 

**returns**:

> **desc**: 

> **type**: 

####Default
**desc**: 

**returns**:

> **desc**: 

> **type**: 

####Destroy
**desc**: A thin function wrapper for `Gui, Destroy`

**returns**:

> **desc**: 

> **type**: 

####Flash
**desc**: A thin function wrapper for `Gui, Flash`

**args**:

> **name**: Off

> **desc**: 

> **type**: bool

**returns**:

> **desc**: 

> **type**: 

####Font
**desc**: A thin function wrapper for `Gui, Font`

**args**:

> **name**: Options

> **desc**: 

> **type**: string

> **name**: FontName

> **desc**: 

> **type**: string

**returns**:

> **desc**: 

> **type**: 

####Hide
**desc**: A thin function wrapper for `Gui, Hide`

**returns**:

> **desc**: 

> **type**: 

####ListView
**desc**: 

**args**:

> **name**: hwnd

> **desc**: 

> **type**: string|number|object

**returns**:

> **desc**: 

> **type**: 

####Margin
**desc**: A thin function wrapper for `Gui, Margin`

**args**:

> **name**: x

> **desc**: 

> **type**: string

> **name**: y

> **desc**: 

> **type**: string

**returns**:

> **desc**: 

> **type**: 

####Maximize
**desc**: A thin function wrapper for `Gui, Maximize`

**returns**:

> **desc**: 

> **type**: 

####Menu
**desc**: A thin function wrapper for `Gui, Menu`

**args**:

> **name**: MenuName

> **desc**: 

> **type**: string

**returns**:

> **desc**: 

> **type**: 

####Minimize
**desc**: A thin function wrapper for `Gui, Minimize`

**returns**:

> **desc**: 

> **type**: 

####MinSize
**desc**: A thin function wrapper for `Gui, MinSize`

**args**:

> **name**: x

> **desc**: 

> **type**: string

> **name**: y

> **desc**: 

> **type**: string

**returns**:

> **desc**: 

> **type**: 

####Options
**desc**: 

**args**:

> **name**: options

> **desc**: 

> **type**: string|number|object

**returns**:

> **desc**: 

> **type**: 

####RegisterBackground
**desc**: 

**args**:

> **name**: ctrl

> **desc**: 

> **type**: string|number|object

**returns**:

> **desc**: 

> **type**: 

####RegisterDropTarget
**desc**: 

**args**:

> **name**: ctrl

> **desc**: 

> **type**: string|number|object

> **name**: Callback

> **desc**: 

> **type**: string|number|object

**returns**:

> **desc**: 

> **type**: 

####RegisterForeground
**desc**: 

**args**:

> **name**: ctrl

> **desc**: 

> **type**: string|number|object

**returns**:

> **desc**: 

> **type**: 

####Restore
**desc**: A thin function wrapper for `Gui, Restore`

**returns**:

> **desc**: 

> **type**: 

####Show
**desc**: A thin function wrapper for `Gui, Show`

**args**:

> **name**: options

> **desc**: 

> **type**: string

> **default**: AutoSize

**returns**:

> **desc**: 

> **type**: 

####Submit
**desc**: 

**args**:

> **name**: NoHide

> **desc**: 

> **type**: bool

**returns**:

> **desc**: 

> **type**: 

####TreeView
**desc**: 

**args**:

> **name**: hwnd

> **desc**: 

> **type**: string|number|object

**returns**:

> **desc**: 

> **type**: 

