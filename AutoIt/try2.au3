#include <IE.au3>
#include <MsgBoxConstants.au3>

#Local $oIE = _IE_Example("basic")
#Local $oIE = Run("C:\Program Files\Internet Explorer\iexplore.exe")
Local $oIE = _IECreate()
#Local $hWnd = WinWait("[CLASS:Notepad]", "", 10)
#Local $oIE =_IEAttach("aaa","embedded")
#Local $oIE =_IEAttach("Google - Internet Explorer","embedded")

#Sleep(10000)
#MsgBox(0,"aa", $oIE)
_IENavigate($oIE,"https://www.google.com/?gws_rd=ssl")

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
MsgBox(0,"aa", _IEGetObjByName($oIE, "btnK").value)
#MsgBox(0,"aa", $oIE.document.getElementById("lst-ib"))
