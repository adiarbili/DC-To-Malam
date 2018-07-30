#include <IE.au3>
#include <MsgBoxConstants.au3>

Global $IE


Const $URL = "https://payroll.malam.com/Salprd5Root/faces/login.jspx?_adf.ctrl-state=nxf3jytz6_3&_afrRedirect=1420473524336962"




#Local $hwnd = WinGetHandle("[CLASS:IEFrame]")
#$IE = _IEAttach($hwnd, "HWND")
$IE = _IEAttach("", "instance")
payroll.malam.com - ?????? ?????? - Internet Explorer



	If @error Then
		MsgBox(0,'_IEAttach error', @error)
		Exit
	Else
		local $presenceTab = _IEGetObjByID($IE, "pt1:j_id7")
		_IEAction($presenceTab, "focus")

		MsgBox(0,"aa", _IEGetObjById($IE, "pt1:j_id7").value)
#cs
		#ControlSend($IE, "", $presenceTab, "{Enter}")
		ControlSend("","",$presenceTab,"{ENTER}")
		#Send("{ENTER}")

		local $presenceBtn = _IEGetObjByID($IE, "pt1:timesheet__31410110")
		_IEAction($presenceBtn, "focus")

		Send("{ENTER}")
		_IELoadWait($IE)
#ce
	EndIf