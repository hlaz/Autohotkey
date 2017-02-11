#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


#include Gdip.ahk
#include Gdip_ImageSearch.ahk


	Loop
{
	WinActivate,Granblue Fantasy - Chrome
	CoordMode, pixel, screen
	coordmode, mouse, screen
		ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img_sasin\pot_ok.png
		if (ErrorLevel = 1)
		{
			continue
		}
		if (ErrorLevel = 0)
		{
			Random,rx,370,430
			Random,ry,682,698
			mouseclick, left, rx, ry
			sleep, 1000
			
			Random,rx,390,420
			Random,ry,586,610
			mouseclick, left, rx, ry
			sleep, 1000
			
			Random,rx,380,430
			Random,ry,732,750
			mouseclick, left, rx, ry
			sleep, 2000
			
			
		}
		
		
		ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img_sasin\pot_ok.png
		if (ErrorLevel = 0)
		{
			randomize_click(FoundX, FoundY)
			sleep, 1000
		}
}
return
f4::
pause

f3::ExitApp

randomize_click(FoundX, FoundY)
{
	random,xr,1,10
	random,yr,1,5
	FoundX:=FoundX+xr
	FoundY:=FoundY+yr
	mouseclick, left, %FoundX%, %FoundY%
}