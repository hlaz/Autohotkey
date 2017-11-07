#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


#include Gdip.ahk
#include Gdip_ImageSearch.ahk

Loop
{
	
	
	ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img\boss_mark.png
	if (ErrorLevel = 0)
	{
		randomize_click(FoundX, FoundY)
		random_delay_boss()
		ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img\move_back.png
		if (ErrorLevel = 0)
		{
			random_delay()
			battle_click(FoundX, FoundY)
		}
	}
	
	ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img\boss_mark_old.png
	if (ErrorLevel = 0)
	{
		randomize_click(FoundX, FoundY)
		random_delay_boss()
		ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img\move_back.png
		if (ErrorLevel = 0)
		{
			random_delay()
			battle_click(FoundX, FoundY)
		}
	}
	
	ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img\boss_mark2.png
	if (ErrorLevel = 0)
	{
		randomize_click(FoundX, FoundY)
		random_delay_boss()
		ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img\move_back.png
		if (ErrorLevel = 0)
		{
			random_delay()
			battle_click(FoundX, FoundY)
		}
	}
	
	ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img\23_done.png
	if (ErrorLevel = 0)
	{
		ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img\move_back.png
		if (ErrorLevel = 0)
		{
			random_delay()
			battle_click(FoundX, FoundY)
		}
	}
	

	
	
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
	random, wait_time, 80000, 85000
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

randomize_move(FoundX, FoundY)
{
	random,xr,1,15
	random,yr,1,15
	FoundX:=FoundX+xr
	FoundY:=FoundY+yr
	mousemove, left, %FoundX%, %FoundY%
}

randomize_click(FoundX, FoundY)
{
	random,xr,1,5
	random,yr,1,5
	FoundX:=FoundX+xr
	FoundY:=FoundY+yr
	Click, left, %FoundX%, %FoundY%
}

reward_click(FoundX, FoundY)
{
	random,xr,1,35
	random,yr,1,30
	FoundX:=FoundX+xr
	FoundY:=FoundY+yr
	Click, left, %FoundX%, %FoundY%
}

battle_click(FoundX, FoundY)
{
	random,xr,1,3
	random,yr,1,3
	FoundX:=FoundX+xr
	FoundY:=FoundY+yr
	Click, left, %FoundX%, %FoundY%
}