﻿#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


#include Gdip.ahk
#include Gdip_ImageSearch.ahk


Gui, Add, Text, x30 y5 w110 h20, Lineage Test
Gui, Add, Text, x60 y25 w50 h20 vA, Ready
Gui, Add, Text, x60 y50 w50 h20 vB, 0 runs
Gui, Add, Button, x20 y80 w110 h20, Start
Gui, Add, Button, x20 y110 w110 h20, Stop
Gui, Show

return

F9::
mousegetpos, xx, yy
msgbox X%xx% Y%yy%
return

ButtonStart:
{
	Gui,Submit,NoHide
	GuiControl, , A, Start!
	
	Start_macro := true
	num_clear := 0
	
	Loop
	{
		CoordMode, Pixel, Screen
		CoordMode, Mouse, Screen
				
		;refresh - enter 5 bp raid - say hello while waiting - use skills - get exp - root - (special dungeon)
		
		;refresh 
		If(IsImagePlus(ClickX, ClickY, "red_pot.png",60,0))
		{
			click_it(ClickX, ClickY)
			Sleep, 500
			
			
		}
	}
		
}
return


ButtonStop:
{
	Start_macro := false
	ExitApp
}
return


click_it(x, y)
{
	
	WinGet, ActiveID, ID, MEmu 2.9.6 - MEmu

	lparam := x|y<<16
	PostMessage, 0x201, 1, %lparam%,, ahk_id %ActiveID%
	PostMessage, 0x202, 0, %lparam%,, ahk_id %ActiveID%
	Sleep, 1000
}

IsImagePlus(ByRef clickX, ByRef clickY, ImageName, errorRange, trans, sX = 0, sY = 0, eX = 0, eY = 0)
{
WinGet, Title , ID, MEmu 2.9.6 - MEmu
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
