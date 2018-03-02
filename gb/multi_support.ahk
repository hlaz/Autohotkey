#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.



#include Gdip.ahk
#include Gdip_ImageSearch.ahk


Loop
{
	error_condition()
	back_to_lobby()
	pick_up_roots()
}
return



F8::
Start_macro := false
ExitApp
return


back_to_lobby() {
	
	ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img\quest_3.png
	if (ErrorLevel = 0)
	{
		randomize_click(FoundX, FoundY)
		random_delay_wait()
	}
	
	ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img\quest_red_3.png
	if (ErrorLevel = 0)
	{
		randomize_click(FoundX, FoundY)
		random_delay_wait()
	}
	
	ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img\special.png
	if (ErrorLevel = 0)
	{
		ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img\multi_bookmark.png
		if (ErrorLevel = 0)
		{
			randomize_click(FoundX, FoundY)
			random_delay_wait()
		}
	}
	
	ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img\enter_id.png
	if (ErrorLevel = 0)
	{
		randomize_click(FoundX, FoundY)
	}
}

pick_up_roots() {
	ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img\get_roots.png
	if (ErrorLevel = 0)
	{
		random_delay()
		ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img\pending_battles.png
		if (ErrorLevel = 0)
		{
			random_delay()
			randomize_click(FoundX, FoundY)
		}
	}
	
	ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img\select_root.png
	if (ErrorLevel = 0)
	{
		randomize_click(FoundX, FoundY)
		random_delay_wait()
		
		ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img\home.png
		if (ErrorLevel = 0)
		{
			sleep,5000
			randomize_click(FoundX, FoundY)
		}
	}
	
	ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img\exp_gained_2.png
	if (ErrorLevel = 0)
	{
		random_delay()
		ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img\pending_battles.png
		if (ErrorLevel = 0)
		{
			random_delay()
			randomize_click(FoundX, FoundY)
		}
	}
		
}


error_condition() {
	ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img\battle_error.png
	if (ErrorLevel = 0)
	{
		random_delay()
		
		
		
		ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img\home.png
		if (ErrorLevel = 0)
		{
			randomize_click(FoundX, FoundY)
			random_delay_wait()
		}
	}
	
	
	ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img\late_raid.png
	if (ErrorLevel = 0)
	{
		random_delay()
		
		
		
		ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img\home.png
		if (ErrorLevel = 0)
		{
			randomize_click(FoundX, FoundY)
			random_delay_wait()
		}
	}
	
	ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img\network_ok.png
	if (ErrorLevel = 0)
	{
		randomize_click(FoundX, FoundY)
		random_delay_wait()
	}
	
	ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img\raid_error.png
	if (ErrorLevel = 0)
	{
		random_delay()
		
		ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img\home.png
		if (ErrorLevel = 0)
		{
			randomize_click(FoundX, FoundY)
			random_delay_wait()
		}
	}
	
	ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img\network_error.png
	if (ErrorLevel = 0)
	{
		random_delay()
		
		ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img\home.png
		if (ErrorLevel = 0)
		{
			randomize_click(FoundX, FoundY)
			random_delay_wait()
		}
	}
	
	ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img\enter_id_selected.png
	if (ErrorLevel = 0)
	{
		random_delay_check()
		ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img\enter_id_selected.png
		if (ErrorLevel = 0)
		{
			ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img\home.png
			if (ErrorLevel = 0)
			{
				randomize_click(FoundX, FoundY)
				random_delay_wait()
			}
		}
	}
	
	
	ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img\no_ep.png
	if (ErrorLevel = 0)
	{
		random_delay_check()
		ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img\no_ep.png
		if (ErrorLevel = 0)
		{
			ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img\home.png
			if (ErrorLevel = 0)
			{
				randomize_click(FoundX, FoundY)
				random_delay_wait()
			}
		}
	}
	
}




	

random_delay(){
	random, wait_time, 400, 1000
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

random_delay_check(){
	random, wait_time, 10000, 15000
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

randomize_move_vira(FoundX, FoundY)
{
	random,xr,45,60
	random,yr,1,10
	FoundX:=FoundX-xr
	FoundY:=FoundY+yr
	mousemove, left, %FoundX%, %FoundY%
}

randomize_click(FoundX, FoundY)
{
	random,xr,1,15
	random,yr,1,10
	FoundX:=FoundX+xr
	FoundY:=FoundY+yr
	mouseclick, left, %FoundX%, %FoundY%
}

randomize_click_vira(FoundX, FoundY)
{
	random,xr,45,60
	random,yr,1,10
	FoundX:=FoundX-xr
	FoundY:=FoundY+yr
	mousemove, left, %FoundX%, %FoundY%
}

randomize_click_summon(FoundX, FoundY)
{
	random,yr,1,20
	FoundY:=FoundY+yr
	mouseclick, left, %FoundX%, %FoundY%
}
