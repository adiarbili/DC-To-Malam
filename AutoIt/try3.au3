#include <IE.au3>
#include <MsgBoxConstants.au3>

#Local $oIE = _IE_Example("basic")
Local $oIE2 = Run("C:\Program Files\Internet Explorer\iexplore.exe")

sleep(10000)
$hwnd = WinGetHandle("[CLASS:IEFrame]")
$oIE = _IEAttach($hwnd, "HWND")


#Local $hWnd = WinWait("[CLASS:IEFrame]", "", 10)
#Local $oIE =_IEAttach(String($hWnd))
#Local $oIE =_IEAttach("Google - Internet Explorer","embedded")
#Local $oIE =_IEAttach("Google")
If @error Then
	MsgBox(0,'_IEAttach error', @error)
	Exit

Else
	MsgBox(0,"aa", $oIE)
	MsgBox(0,"aa", _IEGetObjByName($oIE, "btnK").value)

EndIf

#Local $oIE =_IEAttach("google","url")

#Sleep(30000)

#Sleep(50000)
#MsgBox(0,"aa", $oIE)
##CE

#cs
#_IENavigate($oIE,"https://www.google.com/?gws_rd=ssl")
#_IELoadWait($oIE)

Local $oInput = _IEGetObjById($oIE, "lst-ib")
_IEFormElementSetValue($oInput,"Adi Arbili")


Local $oSubmit = _IEGetObjByName($oIE, "btnK")

_IEAction($oSubmit, "focus")
#Local $hWnd = _IEPropertyGet($oIE, "hwnd")

#ControlSend($hWnd, "", "[CLASS:Internet Explorer_Server; INSTANCE:1]", "{Enter}")
#ControlSend($oIE, "", "[CLASS:Input; TEXT: חיפוש ב-Google]", "{Enter}")
#ControlSend($oIE, "", $oSubmit, "{Enter}")

_IEAction($oSubmit, "click")
_IELoadWait($oIE)
#MsgBox(0,"aa", _IEGetObjByName($oIE, "btnK").value)
#MsgBox(0,"aa", $oIE.document.getElementById("lst-ib"))
#ce

