#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

Gui, Add, Text, x30 y5 w110 h20, 소환_반복 매크로
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

		
		;일반금서 매크로 : 금서소환 - 일반금서 - 소환하기 - 소환 확인 - 전투시작 - 스킬키 입력 - ?
		
		;소환하기
		If(IsImagePlus(ClickX, ClickY, "summon.png",60,0))
		{
			클릭(ClickX, ClickY)
			Sleep, 1000
		}
		
		;소환 확인버튼
		If(IsImagePlus(ClickX, ClickY, "summon_confirm.png",60,0)) 
		{
			클릭(ClickX, ClickY)
			Sleep, 1000
		}
		
		;전투시작
		If(IsImagePlus(ClickX, ClickY, "start_fight.png",60,0)) 
		{
			클릭(ClickX, ClickY)
			Sleep, 1000
			
			;스킬사용
			If(IsImagePlus(ClickX, ClickY, "skill_1.png",60,0)) 
			{
				클릭(ClickX, ClickY)
				Sleep, 1000
			}
			
			If(IsImagePlus(ClickX, ClickY, "skill_2.png",60,0)) 
			{
				클릭(ClickX, ClickY)
				Sleep, 1000
			}
			
			If(IsImagePlus(ClickX, ClickY, "skill_3.png",60,0)) 
			{
				클릭(ClickX, ClickY)
				Sleep, 1000
			}
			
			If(IsImagePlus(ClickX, ClickY, "skill_4.png",60,0)) 
			{
				클릭(ClickX, ClickY)
				Sleep, 1000
			}
		}
		
		;전투 후 경치창 클릭
		If(IsImagePlus(ClickX, ClickY, "end_battle.png",60,0)) 
		{
			클릭(ClickX, ClickY)
			Sleep, 1000
			클리어횟수 := 클리어횟수 + 1
			Gui,Submit,nohide
			GuiControl, , B, %클리어횟수% 회
		}
		
		;마도서 받기
		If(IsImagePlus(ClickX, ClickY, "new_card.png",60,0)) 
		{
			클릭(ClickX, ClickY)
			Sleep, 1000
		}
		
		;황금유차 열릴경우
		If(IsImagePlus(ClickX, ClickY, "world_map.png",60,0)) 
		{
			클릭(ClickX, ClickY)
			Sleep, 1000
			
			;금서소환
			If(IsImagePlus(ClickX, ClickY, "summon_raid.png",60,0)) 
			{
				클릭(ClickX, ClickY)
				Sleep, 1000
				
				;일반금서
				If(IsImagePlus(ClickX, ClickY, "regular_raid.png",60,0)) 
				{
					클릭(ClickX, ClickY)
					Sleep, 1000
				}
			}
		}
		
		;서버요청중 오류발생
		If(IsImagePlus(ClickX, ClickY, "server_error.png",60,0)) 
		{
			클릭(ClickX, ClickY)
			Sleep, 1000
		}
		
		;네트워크 오류일시, 5분 휴식
		If(IsImagePlus(ClickX, ClickY, "network_error.png",60,0))
		{
			클릭(ClickX, ClickY)
			Sleep, 300000
			
			If(IsImagePlus(ClickX, ClickY, "summon_raid.png",60,0)) 
			{
				클릭(ClickX, ClickY)
				Sleep, 1000
				
				;일반금서
				If(IsImagePlus(ClickX, ClickY, "regular_raid.png",60,0)) 
				{
					클릭(ClickX, ClickY)
					Sleep, 1000
				}
			}
		}
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
