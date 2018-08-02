#include <IE.au3>
#include <MsgBoxConstants.au3>

Local $IE = _IEAttach("", "instance")
#נוכחות
If @error Then
	MsgBox(0,'_IEAttach error', @error)
	Exit
Else

	#Local $divs = $IE.document.GetElementsByTagName("a")
	#Local $divs =  $IE.document.GetElementsById("pt1:j_id7").childNodes.length
	#Local $divs =  _IEGetObjByID($IE, "pt1:j_id7").childNodes.length

	#_IEAction("[CLASS:a; TEXT:'נוכחות';]", "focus")
	#_IEAction("[CLASS:a; TEXT:'נוכחות';]", "click")

	Local $divs1 =  _IEGetObjByID($IE, "pt1:j_id7").childNodes
	Local $parent =  _IEGetObjByID($IE, "pt1:j_id7")
	search($parent,"a")
	#cs
	Local $divs = $divs1
	#_IEGetObjByID($IE, "pt1:j_id7")
	#MsgBox(0,"aa", $divs)
	For $presenceTab in $divs
		ConsoleWrite($presenceTab & @CRLF)

		If($classValue = "-1") Then
			_IEAction($presenceTab, "focus")
			_IEAction($presenceTab, "click")
			sleep(3000)
		EndIf

		#Local $classValue = $presenceTab.GetAttribute("class")


		#If($classValue = "x10i xdu") Then
			_IEAction($presenceTab, "focus")
			_IEAction($presenceTab, "click")
			sleep(3000)
		#EndIf
		Next
	#ce
EndIf

Func search($parent, $inputTag)

	Local $children =  $parent.childNodes
	Local $tagName

	ConsoleWrite("parent.childNodes.length = " & $parent.childNodes.length & @CRLF)

	if($parent.childNodes.length = 0) Then return



	ConsoleWrite("Parent is " & $parent.tagName & " and has " & $children.length   & @CRLF)
	ConsoleWrite("children are: "& @CRLF)
	For $child in $children
		if($child.attributes.length = Null) Then return
		#ConsoleWrite("attributes length " & $child.attributes.length & @CRLF)
		Local $tagName = $child.tagName

		ConsoleWrite("tag name " & $child.tagName & @CRLF)

		Local $classValue = $child.GetAttribute("tabIndex")
		If($classValue = "-1") Then
		#If($tagName = $inputTag) Then

			_IEAction($child, "focus")
			_IEAction($child, "click")

			$child.focus
			$child.click
			sleep(3000)
			ConsoleWrite("class " & $child.GetAttribute("class") & " onclick " & $child.GetAttribute("onclick") & @CRLF)
			ExitLoop
			#sleep(3000)
		#Else
			#search($child, $inputTag)
		EndIf

	#if(($child.childNodes.length > 0)) Then
		search($child, $inputTag)
	#EndIf
	Next
EndFunc


