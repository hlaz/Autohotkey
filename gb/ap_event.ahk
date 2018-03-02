#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


#include Gdip.ahk
#include Gdip_ImageSearch.ahk


	Loop
{
	
	ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img\use.png
	if (ErrorLevel = 0)
	{
		
		Random,rx,273,333
		Random,ry,630,635
		mouseclick, left, rx, ry
		sleep, 1000
		
		Random,rx,275,324
		Random,ry,530,570
		mouseclick, left, rx, ry
		sleep, 1000
		
		Random,rx,279,328
		Random,ry,665,675
		mouseclick, left, rx, ry
		sleep, 2000
		
		
	}
		
		
	ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img\use_item_result.png
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

f3::ExitApp

randomize_click(FoundX, FoundY)
{
	random,xr,1,10
	random,yr,1,5
	FoundX:=FoundX+xr
	FoundY:=FoundY+yr
	mouseclick, left, %FoundX%, %FoundY%
}