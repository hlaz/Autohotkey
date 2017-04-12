#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


#include Gdip.ahk
#include Gdip_ImageSearch.ahk


Loop
{
	WinActivate,Granblue Fantasy - Chrome
	ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img\no_ap.png
	if (ErrorLevel = 0)
	{
		Random,rx,276,324
		Random,ry,445,451
		mouseclick, left, rx, ry
		sleep, 1000
		
		Random,rx,274,324
		Random,ry,844,882
		mouseclick, left, rx, ry
		sleep, 1000
		
		Random,rx,274,324
		Random,ry,481,488
		mouseclick, left, rx, ry
		sleep, 2000
		
		
	}
	
	
	ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img\use_item.png
	if (ErrorLevel = 0)
	{
		ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img\pot_ok.png
		if (ErrorLevel = 0)
		{
			randomize_click(FoundX, FoundY)
			sleep, 1000
		}
	}
}
return
f4::
pause

f3::ExitApp

randomize_click(FoundX, FoundY)
{
	random,xr,1,5
	random,yr,1,5
	FoundX:=FoundX+xr
	FoundY:=FoundY+yr
	mouseclick, left, %FoundX%, %FoundY%
}