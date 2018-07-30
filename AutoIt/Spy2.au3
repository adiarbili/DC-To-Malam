
Local $program = "C:\Users\Adi\Desktop\app\node_modules\electron\dist\electron.exe";
Local $iPID = Run($program,"" , @SW_MAXIMIZE)
Local $hWnd = WinWait("[CLASS:Chrome_WidgetWin_1]","",10)
sleep(10000)
#include <Array.au3>
Global $sTitle = "ArrayDisplay" ; <== Set the title of your window here
Global $iItemCount = ControlListView($sTitle, "", "[CLASS:Chrome_WidgetWin_1]", "GetItemCount")
Global $aHeadCode[$iItemCount]
Global $aDescription[$iItemCount]
Global $aDepart[$iItemCount]
For $i = 0 To $iItemCount - 1
    $aHeadCode[$i] = ControlListView("ArrayDisplay", "", "[CLASS:Chrome_RenderWidgetHostHWND]", "GetText", $i, 0)
    $aDescription[$i] = ControlListView("ArrayDisplay", "", "[CLASS:Chrome_WidgetWin_1]", "GetText", $i, 1)
    $aDepart[$i] = ControlListView("ArrayDisplay", "", "[CLASS:Chrome_WidgetWin_1]", "GetText", $i, 2)
Next
_ArrayDisplay($aHeadCode)
_ArrayDisplay($aDescription)
_ArrayDisplay($aDepart)