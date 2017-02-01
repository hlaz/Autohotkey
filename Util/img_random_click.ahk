#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


Gui, Add, Text, x45 y5 w110 h20, Image Search
Gui, Add, Text, x60 y25 w50 h20 vA, Ready
Gui, Add, Button, x20 y85 w110 h20, Start
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
	num_pots := 0
	
	Loop
	{
		CoordMode, Pixel, Screen
		CoordMode, Mouse, Screen
		
		WinActivate, 픽픽 - [이미지 17]
		WinGetTitle, CurrentWin, A
		Msgbox, %CurrentWin% 시작
				
		;refresh - enter 5 bp raid - say hello while waiting - use skills - get exp - root - (special dungeon)
	
	
		
		ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img\red.png
		if (ErrorLevel = 0)
		{
			random,xr,1,20
			random,yr,1,20
			FoundX:=FoundX+xr
			FoundY:=FoundY+yr
			mouseclick, left, %FoundX%, %FoundY%
		}
		
		ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img\orange.png
		if (ErrorLevel = 0)
		{
			random,xr,10,50
			random,yr,10,50
			FoundX:=FoundX+xr
			FoundY:=FoundY+yr
			mouseclick, left, %FoundX%, %FoundY%
		}
		
		
		ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img\purple.png
		if (ErrorLevel = 0)
		{
			random,xr,10,50
			random,yr,10,50
			FoundX:=FoundX+xr
			FoundY:=FoundY+yr
			mouseclick, left, %FoundX%, %FoundY%
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

