#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


#include Gdip.ahk
#include Gdip_ImageSearch.ahk

Loop
{
	If(IsImagePlus(ClickX, ClickY, "battle_mark.png",60,0))
	{
		random_delay()
		battle_click(ClickX, ClickY)
		random_delay_wait()
	}
	
	If(IsImagePlus(ClickX, ClickY, "battle_mark2.png",60,0))
	{
		random_delay()
		battle_click(ClickX, ClickY)
		random_delay_wait()
	}
	
	If(IsImagePlus(ClickX, ClickY, "battle_mark3.png",60,0))
	{
		random_delay()
		battle_click(ClickX, ClickY)
		random_delay_wait()
	}
	
	If(IsImagePlus(ClickX, ClickY, "battle_mark4.png",60,0))
	{
		random_delay()
		battle_click(ClickX, ClickY)
		random_delay_wait()
	}
	
	If(IsImagePlus(ClickX, ClickY, "battle_mark5.png",60,0))
	{
		random_delay()
		battle_click(ClickX, ClickY)
		random_delay_wait()
	}
	
	If(IsImagePlus(ClickX, ClickY, "battle_mark6.png",60,0))
	{
		random_delay()
		battle_click(ClickX, ClickY)
		random_delay_wait()
	}
	
	
	
	;진입확인 - 오른쪽으로 이동 - 끝까지 이동
	
	;이제 선택 & 전투 시작 (다루마 먼저 - 없으면 골드 - 없으면 경치, 보스 등장하면 무조건 보스)
	
	;보스 잡고나서, 보상있으면 클릭 - 보상화면 한번 클릭 - 10초 대기 - 보물상자 있나 확인, 잇으면 클릭, 없으면 처음으로
	
	
	
}
return



F9::
Start_macro := false
ExitApp
return

	

random_delay(){
	random, wait_time, 1000, 1500
	sleep,%wait_time%

}


random_delay_boss(){
	random, wait_time, 75000, 95000
	sleep,%wait_time%

}

random_delay_wait(){
	random, wait_time, 2000, 3000
	sleep,%wait_time%

}

random_delay_long(){
	random, wait_time, 6000, 7000
	sleep,%wait_time%

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