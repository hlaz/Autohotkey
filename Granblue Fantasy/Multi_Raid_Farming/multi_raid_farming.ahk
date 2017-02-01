#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


#include Gdip.ahk
#include Gdip_ImageSearch.ahk


Gui, Add, Text, x45 y5 w110 h20, Raid Farming
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
		copy_number()
		select_summon()
		battle()
		error_condition()
		back_to_lobby()
		pick_up_roots()
			
		
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

copy_number(){
	ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img\enter_id_selected.png
	if (ErrorLevel = 0)
	{
		ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img\raid_number.png
		if (ErrorLevel = 0)
		{
			randomize_click(FoundX, FoundY)
		}
	}
	
	ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img\search_bar.png
	if (ErrorLevel = 0)
	{
		random_delay_battle()
		randomize_click(FoundX, FoundY)
		Send, ^v
		
		ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img\join_room.png
		if (ErrorLevel = 0)
		{
			random_delay()
			randomize_click(FoundX, FoundY)
			random_delay_wait()
		}
	}
	
}


select_map_vira(){
	
	ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img\vira.png
	if (ErrorLevel = 0)
	{
		random_delay()
		randomize_click(FoundX, FoundY)
	}
	
	ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img\hard_raids.png
	if (ErrorLevel = 0)
	{
		random_delay()
		randomize_click(FoundX, FoundY)
	}
	
	ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img\chevalier.png
	if (ErrorLevel = 0)
	{
		random_delay()
		randomize_click(FoundX, FoundY)
		
		
		sleep, 10000
	}
	
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
			random_delay()
			randomize_click_summon(FoundX, FoundY)
			random_delay_battle()
		}
	}
	
	
	
	ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img\click_ok.png
	if (ErrorLevel = 0)
	{
		randomize_click(FoundX, FoundY)
	}
	
	ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img\skip.png
	if (ErrorLevel = 0)
	{
		random_delay()
		randomize_click(FoundX, FoundY)
	}
}

battle() {
	
	ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img\attack.png
	if (ErrorLevel = 0)
	{
		randomize_click(FoundX, FoundY)
		
		random_delay_battle()
		ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img\my_page.png
		if (ErrorLevel = 0)
		{
			random_delay()
			randomize_click(FoundX, FoundY)
		}
	}
}

back_to_lobby() {
	
	ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img\quest_chrome.png
	if (ErrorLevel = 0)
	{
		randomize_click(FoundX, FoundY)
		random_delay_wait()
	}
	
	ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img\quest_red.png
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
		
		ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img\my_page.png
		if (ErrorLevel = 0)
		{
			sleep,5000
			randomize_click(FoundX, FoundY)
		}
	}
		
}


error_condition() {
	ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img\wrong_id.png
	if (ErrorLevel = 0)
	{
		random_delay()
		
		ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img\wrong_id_ok.png
		if (ErrorLevel = 0)
		{
			randomize_click(FoundX, FoundY)
			random_delay_wait()
		}
		
		ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img\my_page.png
		if (ErrorLevel = 0)
		{
			randomize_click(FoundX, FoundY)
			random_delay_wait()
		}
		
	}
	
	ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img\end_battle.png
	if (ErrorLevel = 0)
	{
		random_delay()
		
		ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img\end_ok.png
		if (ErrorLevel = 0)
		{
			randomize_click(FoundX, FoundY)
			random_delay_wait()
		}
		
		ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img\my_page.png
		if (ErrorLevel = 0)
		{
			randomize_click(FoundX, FoundY)
			random_delay_wait()
		}
		
	}
	
	ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img\full_pending.png
	if (ErrorLevel = 0)
	{
		random_delay()
		
		ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img\wrong_id_ok.png
		if (ErrorLevel = 0)
		{
			randomize_click(FoundX, FoundY)
			random_delay_wait()
		}
	}
	
}



	

random_delay(){
	random, wait_time, 400, 1000
	sleep,%wait_time%

}

random_delay_wait(){
	random, wait_time, 4000, 6000
	sleep,%wait_time%
}

random_delay_battle(){
	random, wait_time, 1500, 3000
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
	random,yr,1,20
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
