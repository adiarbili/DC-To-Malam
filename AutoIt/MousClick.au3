#include <IE.au3>
#include <MsgBoxConstants.au3>

Local $IE = _IEAttach("", "instance")
#??????
If @error Then
	MsgBox(0,'_IEAttach error', @error)
	Exit
Else
	Local $parent =  _IEGetObjByID($IE, "pt1:j_id7")
	_IEAction ($parent, "focus")

	$w = _IEPropertyGet ($parent, "width")/2
	$h = _IEPropertyGet ($parent, "height")/2
	$x = _IEPropertyGet ($parent, "screenx")
	$y = _IEPropertyGet ($parent, "screeny")
	_IEAction ($parent, "click")
	ConsoleWrite($x & @CRLF)
	ConsoleWrite($y & @CRLF)
	MouseClick($parent, $x + $w, $y + $h)
EndIf




