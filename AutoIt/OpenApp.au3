#include <AutoItConstants.au3>

Local $program = "C:\Users\Adi\Desktop\app\node_modules\electron\dist\electron.exe";
Local $iPID = Run($program,"" , @SW_MAXIMIZE)
Local $hWnd = WinWait("[CLASS:Chrome_WidgetWin_1]","",10)
ControlSend("Hello World!", "Hello World!",170446904,"adi")
sleep(10000)
#ControlClick("asd","ads",168005448)
ControlClick("Hello World!", "", "[CLASS:Button; TEXT: ;]")
ControlClick('[CLASS:Button; INSTANCE:2]','',170446904)

MsgBox(0,"aaa","aaa")
#MouseClick($MOUSE_CLICK_LEFT,37,139)
