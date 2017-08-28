﻿#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


#include Gdip.ahk
#include Gdip_ImageSearch.ahk




Loop
{
	
	If(IsImagePlus(ClickX, ClickY, "ch_23.png",60,0))
	{
		random_delay_wait()
		randomize_click(ClickX, ClickY)
		random_delay()
	}
	
	If(IsImagePlus(ClickX, ClickY, "enter.png",60,0))
	{
		random_delay()
		randomize_click(ClickX, ClickY)
		random_delay()
	}
	
	If(IsImagePlus(ClickX, ClickY, "click_yes.png",60,0))
	{
		random_delay()
		randomize_click(ClickX, ClickY)
		random_delay()
	}
	
	If(IsImagePlus(ClickX, ClickY, "reward_2.png",60,0))
	{
		random_delay()
		randomize_click(ClickX, ClickY)
		random_delay()
	}


	If(IsImagePlus(ClickX, ClickY, "click_no.png",60,0))
	{
		random_delay()
		randomize_click(ClickX, ClickY)
		random_delay()
	}
	
	If(IsImagePlus(ClickX, ClickY, "ch_msg.png",60,0))
	{
		random_delay_long()
		randomize_click(ClickX, ClickY)
	}
	
	If(IsImagePlus(ClickX, ClickY, "test1.png",60,0))
	{
		random_delay_long()
		farming_click(ClickX, ClickY)
	}
	
	If(IsImagePlus(ClickX, ClickY, "map_reward.png",60,0))
	{
		randomize_click(ClickX, ClickY)
		random_delay()
	}
	
	If(IsImagePlus(ClickX, ClickY, "no_stamina.png",60,0))
	{
		stamina_delay()
		If(IsImagePlus(ClickX, ClickY, "click_close.png",60,0))
		{
			battle_click(ClickX, ClickY)
			random_delay()
		}
		random_delay()
	}
	
	
	
}
return



F7::
Start_macro := false
ExitApp
return


	

random_delay(){
	random, wait_time, 1000, 2000
	sleep,%wait_time%

}

random_delay_wait(){
	random, wait_time, 3000, 4000
	sleep,%wait_time%
}

random_delay_battle(){
	random, wait_time, 1500, 3000
	sleep,%wait_time%

}

stamina_delay(){
	random, wait_time, 900000, 1050000
	sleep,%wait_time%

}


random_delay_long(){
	random, wait_time, 9000, 10000
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
	random,yr,1,15
	NewX:=NewX+xr
	NewY:=NewY+yr
	
	ControlClick, x%NewX% y%NewY%, changrygsiphone - TightVNC Viewer
}


farming_click(x, y)
{
	NewX := x + 65
	
	random,xr,1,15
	random,yr,1,5
	NewX:=NewX+xr
	NewY:=y+yr
	
	ControlClick, x%NewX% y%NewY%, changrygsiphone - TightVNC Viewer
}

map_click(FoundX, FoundY)
{
	random,xr,1,10
	random,yr,20,40
	FoundX:=FoundX+xr
	FoundY:=FoundY+yr
	mouseclick, left, %FoundX%, %FoundY%
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