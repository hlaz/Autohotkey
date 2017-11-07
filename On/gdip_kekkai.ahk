#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


#include Gdip.ahk
#include Gdip_ImageSearch.ahk

Loop
{
	

	If(IsImagePlus(ClickX, ClickY, "ticket_empty.png",60,0))
	{
		random_delay()
		randomize_click(ClickX, ClickY)
		random_delay_wait()
	}
	
	If(IsImagePlus(ClickX, ClickY, "ticket_empty_2.png",60,0))
	{
		random_delay()
		randomize_click(ClickX, ClickY)
		random_delay_wait()
	}
	
	
	If(IsImagePlus(ClickX, ClickY, "start_fight_3.png",60,0))
	{
		start_click(ClickX, ClickY)
		random_delay()
	}
	
	
	
	If(IsImagePlus(ClickX, ClickY, "victory.png",60,0))
	{
		reward_click(ClickX, ClickY)
		random_delay()
	}
	
	If(IsImagePlus(ClickX, ClickY, "lose.png",60,0))
	{
		reward_click(ClickX, ClickY)
		random_delay()
	}
	
	If(IsImagePlus(ClickX, ClickY, "reward.png",60,0))
	{
		reward_click(ClickX, ClickY)
		random_delay()
	}

	If(IsImagePlus(ClickX, ClickY, "reward_open_2.png",60,0))
	{
		reward_click(ClickX, ClickY)
		random_delay()
	}
	
	If(IsImagePlus(ClickX, ClickY, "ticket_refresh.png",60,0))
	{
		
		random_delay_long()
		battle_click(ClickX, ClickY)
	}
	
	If(IsImagePlus(ClickX, ClickY, "ticket_refresh_2.png",60,0))
	{
		battle_click(ClickX, ClickY)
		random_delay()
	}
	
	
	If(IsImagePlus(ClickX, ClickY, "click_no_2.png",60,0))
	{
		random_delay()
		randomize_click(ClickX, ClickY)
	}
	
	

	
	
}
return



F7::
Start_macro := false
ExitApp
return

	

random_delay(){
	random, wait_time, 2000, 3000
	sleep,%wait_time%

}

random_delay_wait(){
	random, wait_time, 5000, 6000
	sleep,%wait_time%

}

random_delay_long(){
	random, wait_time, 30000, 35000
	sleep,%wait_time%

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

start_click(x, y)
{
	NewX := x + 5
	NewY := y + 24
	
	random,xr,31,40
	random,yr,1,15
	NewX:=NewX+xr
	NewY:=NewY+yr
	
	ControlClick, x%NewX% y%NewY%, changrygsiphone - TightVNC Viewer
}

ticket_click(x, y)
{
	NewX := x + 5
	NewY := y + 24
	
	random,xr,1,5
	random,yr,50,78
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