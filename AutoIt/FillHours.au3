#include <IE.au3>
#include <MsgBoxConstants.au3>

Local $IE = _IEAttach("", "instance")

If @error Then
	MsgBox(0,'_IEAttach error', @error)
	Exit
Else

	Local $inTime
	Local $outTime

	Local $i
	For $i = 0 To 31 Step 1
		$inTime =  _IEGetObjByID($IE, "pt1:dataTable:" & $i & ":clockInTime::content")
		$outTime =  _IEGetObjByID($IE, "pt1:dataTable:" & $i & ":clockOutTime::content")

		If (@error) Then
			ConsoleWrite("$i = " & $i & @CRLF)
			ExitLoop
		EndIf

		$inTime.value = "7:30"
		$outTime.value = "18:30"

	Next

EndIf




