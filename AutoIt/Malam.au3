#include <IE.au3>
#include <MsgBoxConstants.au3>

Global $IE

Func openMalamWeb()
	Const $URL = "https://payroll.malam.com/Salprd5Root/faces/login.jspx?_adf.ctrl-state=nxf3jytz6_3&_afrRedirect=1420473524336962"
	Const $TIME_TO_EXIT = 30000
	Local $time = 0

	Run("C:\Program Files\Internet Explorer\iexplore.exe")

	Do
		Sleep(1000)
		$IE =_IEAttach("Google")
		$time = $time + 1000
	Until  ((NOT @error) Or ($time > $TIME_TO_EXIT))

	#ConsoleWrite("time = " & $time & @CRLF)
	#ConsoleWrite("error = " & @error  & " error = " & Not @error & @CRLF)

	If (@error Or $time >= $TIME_TO_EXIT) Then
		MsgBox(0,'_IEAttach error', @error)
		Exit
	Else
		_IENavigate($IE, $URL)
		Login()
	EndIf
EndFunc

Func login()
	#MsgBox(0,"aa", $oIE)
	#MsgBox(0,"aa", _IEGetObjByName($oIE, "btnK").value)
	Local $inputComp, $inputEmpID, $inputPass, $loginBtn

	$inputComp = _IEGetObjById($IE, "indexNumInput::content")
	_IEFormElementSetValue($inputComp,"35")

	$inputEmpID = _IEGetObjById($IE, "useridInput::content")
	_IEFormElementSetValue($inputEmpID,"XXX")

	$inputPass = _IEGetObjById($IE, "it2::content")
	_IEFormElementSetValue($inputPass,"XXX")

	$loginBtn = _IEGetObjByID($IE, "loginButtonText")
	_IEAction($loginBtn, "focus")
	_IEAction($loginBtn, "click")
	_IELoadWait($IE)

	clickPresenceTab()
EndFunc

Func clickPresenceTab()
	Local $presenceTab, $presenceBtn
#cs
	Local $sMyString = "נוכחות"
	Local $oLinks = _IELinkGetCollection($IE)
	For $oLink In $oLinks
		Local $sLinkText = _IEPropertyGet($oLink, "innerText")
		If StringInStr($sLinkText, $sMyString) Then
			_IEAction($oLink, "click")
			ExitLoop
		EndIf
	Next
	#ce
	$presenceTab = _IEGetObjByID($IE, "pt1:j_id7")
	_IEAction($presenceTab, "focus")
	#ControlSend($IE, "", $presenceBtn, "{Enter}")
	#ControlSend("","",$presenceBtn,"{ENTER}")
	Send("{ENTER}")

	$presenceBtn = _IEGetObjByID($IE, "pt1:timesheet__31410110")
	_IEAction($presenceBtn, "focus")

	Send("{ENTER}")
	_IELoadWait($IE)

	#cs
	$presenceBtn = _IEGetObjByID($IE, "pt1:j_id7")
		_iEget
	_IEAction($presenceBtn, "focus")
	_IEAction($presenceBtn, "click")
	#ce
EndFunc

openMalamWeb()




