
#Include %A_ScriptDir%\..\GridGUI.ahk
SetBatchLines, -1

WM_DEVICECHANGE := 0x0219

if(!FileExist("plink.exe")) {
	UrlDownloadToFile, https://the.earth.li/~sgtatham/putty/latest/w64/plink.exe, plink.exe
}

Global plinkprocess := 0

ports := GetCOMports()

myGui := new GridGUI("Serial Terminal", "resize")
console := new ConsoleControl(myGui.hwnd) ; "/q /k echo off" ;  & powershell -NoExit
console.Run("filter timestamp {""$(Get-Date -Format o): $_""}")
;console.Run("filter timestamp {""$([DateTimeOffset]::UtcNow.ToUnixTimeMilliseconds()),$(Get-Date -Format o): $_""}")
Sleep, 100
console.Run("clear")

cmdline :=		myGui.add("1-16", 1, "Edit", , , 1)
				myGui.AddControl("1-16", 2, console, 1, 1)

bt_connect :=	myGui.add(1, 3, "Button", "w100", "Connect")

chb_log :=		myGui.add(3, 3, "CheckBox", "checked", "log", , , , , "EC")
chb_time :=		myGui.add(4, 3, "CheckBox", "checked", "timestamp", , , , , "EC")
				myGui.add(5, 3, "Text", , "Port:", , , , , "EC")
port :=			myGui.add(6, 3, "DropDownList", "w60", StrReplace(JoinKey("|", ports), "|", "||", 1), , , , , "WC")

				myGui.add(7, 3, "Text", , "flow control:", , , , , "EC")
flowcontrol :=	myGui.add(8, 3, "DropDownList", "w35", "N|X||R|D", , , , , "WC")

				myGui.add(9, 3, "Text", , "parity:", , , , , "EC")
parity :=		myGui.add(10, 3, "DropDownList", "w35", "n||o|e|m|s", , , , , "WC")

				myGui.add(11, 3, "Text", , "stop bits:", , , , , "EC")
stopbits :=		myGui.add(12, 3, "DropDownList", "w40", "1||1.5|2", , , , , "WC")

				myGui.add(13, 3, "Text", , "data bits:", , , , , "EC")
databits :=		myGui.add(14, 3, "DropDownList", "w35", "5|6|7|8||9", , , , , "WC")

				myGui.add(15, 3, "Text", , "Baud:", , , , , "EC")
baudrate :=		myGui.add(16, 3, "DropDownList", "w70", "300|1200|2400|4800|9600|19200|38400|57600|74880|115200||230400|250000|500000|1000000|2000000", , , , , "WC")

bt_connect.Callback := Func("ConnectPressed").Bind(console, port, baudrate, flowcontrol, parity, stopbits, databits, chb_time, chb_log)

myGui.AutoSize()
myGui.MinSize(myGui.pos.w, myGui.pos.h)
myGui.Show("h800")

OnMessage(WM_DEVICECHANGE, Func("WM_DEVICECHANGE"))
return

#If WinActive("ahk_id " myGui.hwnd)
	Enter::
		hwnd := myGui.ControlGetFocus()
		if(hwnd = cmdline.Hwnd) {
			SendCommand(cmdline, console)
		}
	return
#If

GuiClose:
OnExit:
	Process, Close, % plinkprocess
	Process, Close, % console.pid ; May be a bit forceful? No effect if it already closed.
	ExitApp

SendCommand(cmdline, console) {
	;console.GuiControl(StrReplace(cmdline.vVar, "`n") "`n")
	console.run(cmdline.vVar)
	cmdline.GuiControl("", "")
}

ConnectPressed(console, port, baudrate, flowcontrol, parity, stopbits, databits, timestamp, log) {
	if(plinkprocess) {
		Process, Close, % plinkprocess
	}
	
	command := "& """ A_ScriptDir "\plink.exe"" -serial \\.\" port.vVar " -sercfg " baudrate.vVar "," flowcontrol.vVar "," parity.vVar "," stopbits.vVar "," databits.vVar
	if(timestamp.vVar) {
		command .= " | timestamp"
	}
	if(log.vVar) {
		command .= " | tee " A_Now ".log"
	}
	
	console.run(command)
	
	start := A_TickCount
	While(!(plinkprocess := getProcess("plink.exe"))) {
		if(A_TickCount - start > 1000) {
			Break
		}
	}
}

getProcess(name) {
	Process, Exist, % name
	return ErrorLevel
}

/*
GetRunningPlink() {
	map := {}
	for proc in ComObjGet("winmgmts:").ExecQuery("Select * from Win32_Process") {
		if(proc.Name = "plink") {
			lst[proc.ProcessId] = ""
			MsgBox, % proc.ProcessId
		}
	}
	return map
}
*/

GetCOMports() {
	portmap := {}
	Loop, Reg, HKEY_LOCAL_MACHINE\HARDWARE\DEVICEMAP\SERIALCOMM
	{
		RegRead, serial
		if(serial ~= "COM\d+") {
			portmap[serial] := A_LoopRegName
		}
	}
	return portmap
}

UpdateCOMports() {
	Global port
	port.GuiControl("", "|" SelectString(JoinKey("|", ports), port.vVar))
}

Class ConsoleControl Extends WindowControl {
	__New(guiHwnd, options := "", text := "") {
		Base.__New(guiHwnd, this.__StrartConsole(options), options)
	}
	
	__StrartConsole(options) {
		; Launch hidden cmd.exe and store process ID in pid.
		Run, % "powershell", , Hide, pid

		; Wait for console window to be created, store its ID.
		DetectHiddenWindows, On
		WinWait, % "ahk_pid " pid
		WinGet, hwnd, ID, % "ahk_pid " pid
		this.pid := pid
		return hwnd
	}
	
	PressEnter() {
		ControlSend, , {Enter}, % "ahk_id " this.hwnd
	}
	
	Run(cmd) {
		if(this.GuiControl(cmd)) {
			this.PressEnter()
		}
	}
	
	GuiControl(value) {
		ConsoleSend(value, "ahk_id " this.hwnd)
		if(ErrorLevel) {
			MsgBox, % ErrorLevel
			return false
		}
		return true
	}
	
	GuiControlGet(subCommand := "", value := "") {
		;GuiControlGet, OutputVar, % SubCommand, % this.hwnd, % value
		;return OutputVar
	}
	
	Control(subCommand, value) {
		
	}
}

; Sends text to a console's input stream. WinTitle may specify any window in
; the target process. Since each process may be attached to only one console,
; ConsoleSend fails if the script is already attached to a console.
ConsoleSend(text, WinTitle="", WinText="", ExcludeTitle="", ExcludeText="") {
	DetectHiddenWindows, On
    WinGet, pid, PID, %WinTitle%, %WinText%, %ExcludeTitle%, %ExcludeText%
    if !pid
        return false, ErrorLevel:="window"
    ; Attach to the console belonging to %WinTitle%'s process.
    if !DllCall("AttachConsole", "uint", pid)
        return false, ErrorLevel:="AttachConsole"
    hConIn := DllCall("CreateFile", "str", "CONIN$", "uint", 0xC0000000
                , "uint", 0x3, "uint", 0, "uint", 0x3, "uint", 0, "uint", 0)
    if hConIn = -1
        return false, ErrorLevel:="CreateFile"
    
    VarSetCapacity(ir, 24, 0)       ; ir := new INPUT_RECORD
    NumPut(1, ir, 0, "UShort")      ; ir.EventType := KEY_EVENT
    NumPut(1, ir, 8, "UShort")      ; ir.KeyEvent.wRepeatCount := 1
    ; wVirtualKeyCode, wVirtualScanCode and dwControlKeyState are not needed,
    ; so are left at the default value of zero.
    
    Loop, Parse, text ; for each character in text
    {
        NumPut(Asc(A_LoopField), ir, 14, "UShort")
        
        NumPut(true, ir, 4, "Int")  ; ir.KeyEvent.bKeyDown := true
        gosub ConsoleSendWrite
        
        NumPut(false, ir, 4, "Int") ; ir.KeyEvent.bKeyDown := false
        gosub ConsoleSendWrite
    }
    gosub ConsoleSendCleanup
    return true
    
    ConsoleSendWrite:
        if ! DllCall("WriteConsoleInput", "uint", hconin, "uint", &ir, "uint", 1, "uint*", 0)
        {
            gosub ConsoleSendCleanup
            return false, ErrorLevel:="WriteConsoleInput"
        }
    return
    
    ConsoleSendCleanup:
        if (hConIn!="" && hConIn!=-1)
            DllCall("CloseHandle", "uint", hConIn)
        ; Detach from %WinTitle%'s console.
        DllCall("FreeConsole")
    return
}

WM_DEVICECHANGE(wParam, lParam) {										; http://msdn.com/library/aa363480(vs.85,en-us)    WM_DEVICECHANGE message
	static DBT_DEVICEARRIVAL		:= 0x8000							; A device or piece of media has been inserted and is now available.
	static DBT_DEVICEREMOVECOMPLETE	:= 0x8004							; A device or piece of media has been removed.
	static DBT_DEVTYP_VOLUME		:= 0x00000002						; Logical volume. This structure is a DEV_BROADCAST_VOLUME structure.
	static DBT_DEVTYP_PORT			:= 0x00000003

	if(wParam = DBT_DEVICEARRIVAL) {
		if(NumGet(lParam+0, 4, "UInt") = DBT_DEVTYP_PORT) {				; http://msdn.com/library/aa363246(vs.85,en-us)    DEV_BROADCAST_HDR structure
			fun := Func("UpdateCOMports")
			SetTimer, % fun, -100
			;FirstDriveFromMask(NumGet(lParam+0, 12, "UInt"), 1)		; http://msdn.com/library/aa363249(vs.85,en-us)    DEV_BROADCAST_VOLUME structure
		}
	}
	if(wparam = DBT_DEVICEREMOVECOMPLETE) {
		if(NumGet(lParam+0, 4, "UInt") = DBT_DEVTYP_PORT)	{			; http://msdn.com/library/aa363246(vs.85,en-us)    DEV_BROADCAST_HDR structure
			fun := Func("UpdateCOMports")
			SetTimer, % fun, -100
			;FirstDriveFromMask(NumGet(lParam+0, 12, "UInt"), 0)		; http://msdn.com/library/aa363249(vs.85,en-us)    DEV_BROADCAST_VOLUME structure
		}
	}
}

SelectString(Haystack, Needle) {
	return RegExReplace(Haystack, Needle "|?", Needle "||")
}

JoinKey(sep, obj) {
	res := ""
	for key in obj {
		res .= key sep
	}
	return SubStr(res, 1, -StrLen(sep))
}
