#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


#include Gdip.ahk
#include Gdip_ImageSearch.ahk


	Loop
{
	
	ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img\verify_detect.png
	if (ErrorLevel = 0)
	{
		
		Send, {F4}
		Send, {F5}
		random_delay_battle()
		
		ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img\verify_click.png
		if (ErrorLevel = 0)
		{
			randomize_click(FoundX, FoundY)
			random_delay_battle()
		}
		
		
	}
	
	ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img\verify_complete.png
	if (ErrorLevel = 0)
	{
		ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img\verify_ok.png
		if (ErrorLevel = 0)
		{
			random_delay_battle()
			randomize_click(FoundX, FoundY)
			random_delay()
		}
	}
		
}
return

f6::ExitApp

random_delay(){
	random, wait_time, 1000, 1500
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

random_endbattle(){
	random, wait_time, 9000, 11000
	sleep,%wait_time%

}

random_next_delay(){
	random, wait_time, 5000, 7000
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
	random,xr,1,10
	random,yr,1,5
	FoundX:=FoundX+xr
	FoundY:=FoundY+yr
	mouseclick, left, %FoundX%, %FoundY%, 2
}


randomize_click_summon(FoundX, FoundY)
{
	random,yr,1,20
	FoundY:=FoundY+yr
	mouseclick, left, %FoundX%, %FoundY%
}