#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


#include Gdip.ahk
#include Gdip_ImageSearch.ahk


	Loop
{
	CoordMode, pixel, screen
	coordmode, mouse, screen
	
	ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img\network_error.png
	if (ErrorLevel = 0)
	{
		ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img\network_ok.png
		if (ErrorLevel = 0)
		{
			randomize_click(FoundX, FoundY)
			sleep, 1000
		}
	}
	
	ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img\error.png
	if (ErrorLevel = 0)
	{
		ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img\error_ok.png
		if (ErrorLevel = 0)
		{
			randomize_click(FoundX, FoundY)
			sleep, 1000
		}
	}
	
	
	ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img\not_ready.png
	if (ErrorLevel = 0)
	{
		random_delay()
		ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img\not_ready.png
		if (ErrorLevel = 0)
		{
			Random,px, 105,135
			Random,py, 92,96
			mouseclick, left, px,py


			Random,px, 455,468
			Random,py, 92,96
			mouseclick, left, px,py

			Random,px, 800,830
			Random,py, 92,96
			mouseclick, left, px,py
		}
	}
	
	ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img\ready_big.png
	if (ErrorLevel = 0)
	{
		random_delay()
		ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img\ready_big.png
		if (ErrorLevel = 0)
		{
			Random,px, 105,135
			Random,py, 92,96
			mouseclick, left, px,py


			Random,px, 455,468
			Random,py, 92,96
			mouseclick, left, px,py

			Random,px, 800,830
			Random,py, 92,96
			mouseclick, left, px,py
		}
	}
	
	
	
	ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img\bot_detect.png
	if (ErrorLevel = 0)
	{
		soundbeep, 1000, 3000
	}
	
	
	/*
	ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img\time_over.png
	if (ErrorLevel = 0)
	{
		soundbeep, 1000, 3000
	}
	*/
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

random_delay(){
	random, wait_time, 7000, 8000
	sleep,%wait_time%

}