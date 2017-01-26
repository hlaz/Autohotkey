#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


#include Gdip.ahk
#include Gdip_ImageSearch.ahk


Gui, Add, Text, x30 y5 w110 h20, 매크로 프로그램
Gui, Add, Text, x60 y25 w50 h20 vA, 준비
Gui, Add, Text, x60 y50 w50 h20 vB, 0 회
Gui, Add, Button, x20 y80 w110 h20, 시작
Gui, Add, Button, x20 y110 w110 h20, 종료
Gui, Show

return

F9::
mousegetpos, xx, yy
msgbox X%xx% Y%yy%
return

Button시작:
{
	Gui,Submit,NoHide
	GuiControl, , A, 시작
	
	매크로시작 := true
	클리어횟수 := 0
	
	Loop
	{
		CoordMode, Pixel, Screen
		CoordMode, Mouse, Screen
				
		;새로고침 - 5bp 입장 - 인사 - 전투 - 종료 - 경치 - 카드 - 로비 or 유차
		
		;인사
		If(IsImagePlus(ClickX, ClickY, "battle_waiting.png",60,0) || IsImagePlus(ClickX, ClickY, "battle_waiting_1.png",60,0) || IsImagePlus(ClickX, ClickY, "battle_waiting_2.png",60,0))
		{
			클릭(ClickX, ClickY)
			Sleep, 500
			
			If(IsImagePlus(ClickX, ClickY, "emote.png",60,0))
			{
				클릭(ClickX, ClickY)
				Sleep, 500
				
				If(IsImagePlus(ClickX, ClickY, "emote_no.png",60,0))
				{
					클릭(ClickX, ClickY)
					Sleep, 500
				}
			}
		} ;인사, 작동됨
		
		;스킬사용
		If(IsImagePlus(ClickX, ClickY, "lucky_1.png",60,0))
		{
			클릭(ClickX, ClickY)
			Sleep, 500
		}
		

		If(IsImagePlus(ClickX, ClickY, "lucky_2.png",60,0))
		{
			클릭(ClickX, ClickY)
			Sleep, 500
		}

		
		If(IsImagePlus(ClickX, ClickY, "lucky_3.png",60,0))
		{
			클릭(ClickX, ClickY)
			Sleep, 500
		}
		
		If(IsImagePlus(ClickX, ClickY, "lucky_4.png",60,0))
		{
			클릭(ClickX, ClickY)
			Sleep, 500
		}
		
		;전투종료
		If(IsImagePlus(ClickX, ClickY, "done_battle",60,0) || IsImagePlus(ClickX, ClickY, "thanks_msg_1",60,0) || IsImagePlus(ClickX, ClickY, "thanks_msg_2",60,0) || IsImagePlus(ClickX, ClickY, "thanks_msg_3",60,0) || IsImagePlus(ClickX, ClickY, "thanks_msg_4",60,0) || IsImagePlus(ClickX, ClickY, "thanks_msg_5",60,0))
		{
			If(IsImagePlus(ClickX, ClickY, "emote.png",60,0))
			{
				클릭(ClickX, ClickY)
				Sleep, 300
				
				If(IsImagePlus(ClickX, ClickY, "emote_thanks.png",60,0))
				{
					클릭(ClickX, ClickY)
					Sleep, 500
				}
			}
		} ;전투종료
		
		
	}
}
return


Button종료:
{
	매크로시작 := false
	ExitApp
}
return

클릭(x, y)
{
	
	WinGet, ActiveID, ID, BlueStacks App Player

	lparam := x|y<<16
	PostMessage, 0x201, 1, %lparam%,, ahk_id %ActiveID%
	PostMessage, 0x202, 0, %lparam%,, ahk_id %ActiveID%
	Sleep, 1000
}

IsImagePlus(ByRef clickX, ByRef clickY, ImageName, errorRange, trans, sX = 0, sY = 0, eX = 0, eY = 0)
{
WinGet, Title , ID, BlueStacks App Player
if(Gdip_ImageSearchWithHwnd(Title, clickX, clickY,ImageName,errorRange,trans, sX, sY, eX, eY))
{
return true
}
else
return false
}


Gdip_ImageSearchWithHwnd(Hwnd,Byref X,Byref Y,Image,Variation=0,Trans="",sX = 0,sY = 0,eX = 0,eY = 0)
{
SysGet, wFrame, 7
SysGet, wCaption, 4
gdipToken := Gdip_Startup()
bmpHaystack := Gdip_BitmapFromHwnd(Hwnd)
bmpNeedle := Gdip_CreateBitmapFromFile(Image)
if( sX!= 0 || sY!= 0 || eX!= 0 || eY != 0)
{
sX := sX + wFrame
sY := sY + wCaption + wFrame
eX := eX + wFrame
eY := eY + wCaption + wFrame
}
RET := Gdip_ImageSearch(bmpHaystack,bmpNeedle,LIST,sX,sY,eX,eY,Variation,Trans,1,1)
Gdip_DisposeImage(bmpHaystack)
Gdip_DisposeImage(bmpNeedle)
Gdip_Shutdown(gdipToken)
StringSplit, LISTArray, LIST, `,
X := LISTArray1 - wFrame
Y := LISTArray2 - wCaption - wFrame

if(RET = 1)
{
return true
}
else
{
return false
}
}