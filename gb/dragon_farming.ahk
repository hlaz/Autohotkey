﻿#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


#include Gdip.ahk
#include Gdip_ImageSearch.ahk


Gui, Add, Text, x45 y5 w110 h20, Angel Halo
Gui, Add, Text, x60 y25 w50 h20 vA, Ready
Gui, Add, Text, x60 y45 w50 h20 vB, 0 runs
Gui, Add, Text, x55 y65 w100 h40 vC, 0 potions
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
	
	WinActivate,Granblue Fantasy - Chrome
	
	Loop
	{
		start_halo()
		select_summon()
		skip_event()
		battle()
		event_handler()
			
		
	}
}
return


ButtonStop:
{
	Start_macro := false
	ExitApp
}
return

F8::
Start_macro := false
ExitApp
return


start_halo(){
	
	ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img\dragon_img.png
	if (ErrorLevel = 0)
	{
		ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img\ap_20.png
		if (ErrorLevel = 0)
		{
			randomize_click(FoundX, FoundY)
				random_delay()
		}
	}
	
	;ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img\dragon_select.png
	;if (ErrorLevel = 0)
	;{
	;	ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img\play_quest.png
	;	if (ErrorLevel = 0)
	;	{
	;		randomize_click(FoundX, FoundY)
	;		random_delay()
	;	}
	;}
}


select_summon(){
	ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img\summon_fav.png
	if (ErrorLevel = 0)
	{
		randomize_click(FoundX, FoundY)
		random_delay()
		ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img\click_summon.png
		if (ErrorLevel = 0)
		{
			randomize_click_summon(FoundX, FoundY)
			random_delay_battle()
		}
	}
	
	ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img\summon_ok.png
	if (ErrorLevel = 0)
	{
		randomize_click(FoundX, FoundY)
	}
	
	ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img\click_ok.png
	if (ErrorLevel = 0)
	{
		randomize_click(FoundX, FoundY)
	}
	
}

skip_event() {
	
	ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img\skip_event.png
	if (ErrorLevel = 0)
	{
		randomize_click(FoundX, FoundY)
		random_delay()
	}
	
	ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img\skip.png
	if (ErrorLevel = 0)
	{
		randomize_click(FoundX, FoundY)
		random_delay()
	}
	
	ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img\skip_ok.png
	if (ErrorLevel = 0)
	{
		randomize_click(FoundX, FoundY)
		random_delay()
	}
	
}


battle() {
	
	
	ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img\attack.png
	if (ErrorLevel = 0)
	{
		randomize_click(FoundX, FoundY)
		random_delay()
	}
	
	ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img\auto_7.png
	if (ErrorLevel = 0)
	{
		
		randomize_click(FoundX, FoundY)
		random_delay_wait()
	}
	
	ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img\next.png
	if (ErrorLevel = 0)
	{
		
		randomize_click(FoundX, FoundY)
		random_delay_wait()
	}
	
	
	
}

event_handler() {
	
	ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img\exp_gained.png
	if (ErrorLevel = 0)
	{
		randomize_click(FoundX, FoundY)
		
		ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img\exp_ok.png
		if (ErrorLevel = 0)
		{
			randomize_click(FoundX, FoundY)
			random_delay()
			
			num_clear := num_clear + 1
			Gui,Submit,nohide
			GuiControl, , B, %num_clear% runs
		}
		
	}
	
	ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img\back_quest.png
	if (ErrorLevel = 0)
	{
		randomize_click(FoundX, FoundY)
		random_delay()
	}
	
	ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img\friend_request.png
	if (ErrorLevel = 0)
	{
		ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img\click_cancel.png
		if (ErrorLevel = 0)
		{
			randomize_click(FoundX, FoundY)
			random_delay()
		}
	}
	
	
	ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img\lb_up.png
	if (ErrorLevel = 0)
	{
		randomize_click(FoundX, FoundY)
		random_delay()
	}
	
	ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img\lb_up_2.png
	if (ErrorLevel = 0)
	{
		randomize_click(FoundX, FoundY)
		random_delay()
	}
	
	
	
	ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img\trophy.png
	if (ErrorLevel = 0)
	{
		ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img\trophy_close.png
		if (ErrorLevel = 0)
		{
			randomize_click(FoundX, FoundY)
			random_delay()
		}
	}
	
	ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img\extend_up.png
	if (ErrorLevel = 0)
	{
		randomize_click(FoundX, FoundY)
		random_delay()
	}
	
	ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img\verify_detect.png
	if (ErrorLevel = 0)
	{
		
		Send, {F8}
		random_delay_battle()
		
		
		
	}
}


random_delay(){
	random, wait_time, 400, 1500
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
	random,xr,1,15
	random,yr,1,5
	FoundX:=FoundX+xr
	FoundY:=FoundY+yr
	mouseclick, left, %FoundX%, %FoundY%
}


randomize_click_summon(FoundX, FoundY)
{
	random,yr,1,20
	FoundY:=FoundY+yr
	mouseclick, left, %FoundX%, %FoundY%
}