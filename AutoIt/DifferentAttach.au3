#include <IE.au3>
#include <MsgBoxConstants.au3>

Local $oIE2 = Run("C:\Program Files\Internet Explorer\iexplore.exe")

Sleep(10000)
#$hwnd = WinGetHandle("[CLASS:IEFrame]")
#$oIE = _IEAttach($hwnd, "HWND")


#Local $hWnd = WinWait("[CLASS:IEFrame]", "", 10)
#Local $oIE =_IEAttach(String($hWnd))

Local $oIE =_IEAttach("Google")

If @error Then
	MsgBox(0,'_IEAttach error', @error)
	Exit
Else
	#MsgBox(0,"aa", $oIE)
	#MsgBox(0,"aa", _IEGetObjByName($oIE, "btnK").value)
	Local $oInput = _IEGetObjById($oIE, "lst-ib")
	_IEFormElementSetValue($oInput,"Adi Arbili")
	Local $oSubmit = _IEGetObjByName($oIE, "btnK")
	_IEAction($oSubmit, "focus")
	_IEAction($oSubmit, "click")
	_IELoadWait($oIE)
EndIf


