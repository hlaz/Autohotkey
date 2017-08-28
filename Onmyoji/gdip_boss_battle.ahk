#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


#include Gdip.ahk
#include Gdip_ImageSearch.ahk

Loop
{
	Loop
	{
		CoordMode, pixel, screen
		coordmode, mouse, screen
		If(IsImagePlus(ClickX, ClickY, "boss_mark2.png",60,0))
		{
			randomize_click(ClickX, ClickY)
			random_delay_boss()
			break
		}
	}
	
	Loop
	{
		CoordMode, pixel, screen
		coordmode, mouse, screen
		If(IsImagePlus(ClickX, ClickY, "move_back.png",60,0))
		{
			random_delay_long()
			randomize_click(ClickX, ClickY)
			break
		}
	}
	
	;진입확인 - 오른쪽으로 이동 - 끝까지 이동
	
	;이제 선택 & 전투 시작 (다루마 먼저 - 없으면 골드 - 없으면 경치, 보스 등장하면 무조건 보스)
	
	;보스 잡고나서, 보상있으면 클릭 - 보상화면 한번 클릭 - 10초 대기 - 보물상자 있나 확인, 잇으면 클릭, 없으면 처음으로
	
	
	
}
return



F6::
Start_macro := false
ExitApp
return

	

random_delay(){
	random, wait_time, 1000, 2000
	sleep,%wait_time%

}


random_delay_boss(){
	random, wait_time, 60000, 70000
	sleep,%wait_time%

}

random_delay_wait(){
	random, wait_time, 2000, 3000
	sleep,%wait_time%

}

random_delay_long(){
	random, wait_time, 8000, 9000
	sleep,%wait_time%

}

randomize_move(FoundX, FoundY)
{
	random,xr,1,15
	random,yr,1,15
	FoundX:=FoundX+xr
	FoundY:=FoundY+yr
	mousemove, left, %FoundX%, %FoundY%
}

randomize_click(x, y)
{
	NewX := x + 5
	NewY := y + 24
	
	random,xr,1,5
	random,yr,1,5
	NewX:=NewX+xr
	NewY:=NewY+yr
	
	ControlClick, x%NewX% y%NewY%, changrygsiphone - TightVNC Viewer
}

reward_click(x, y)
{
	NewX := x + 5
	NewY := y + 24
	
	random,xr,1,35
	random,yr,1,30
	NewX:=NewX+xr
	NewY:=NewY+yr
	
	ControlClick, x%NewX% y%NewY%, changrygsiphone - TightVNC Viewer
}

battle_click(x, y)
{
	NewX := x + 5
	NewY := y + 24
	
	random,xr,1,3
	random,yr,1,3
	NewX:=NewX+xr
	NewY:=NewY+yr
	
	ControlClick, x%NewX% y%NewY%, changrygsiphone - TightVNC Viewer
}


IsImagePlus(ByRef clickX, ByRef clickY, ImageName, errorRange, trans, sX = 0, sY = 0, eX = 0, eY = 0)
{
WinGet, Title , ID, changrygsiphone - TightVNC Viewer
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