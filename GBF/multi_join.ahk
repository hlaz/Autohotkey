#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


#include Gdip.ahk
#include Gdip_ImageSearch.ahk


Gui, Add, Text, x45 y5 w110 h20, GBF Raids
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
	}
}
return


ButtonStop:
{
	Start_macro := false
	ExitApp
}
return

F7::
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
			randomize_click(FoundX, FoundY)
			random_delay_wait()
		}
	}
	
}


/*
copy_number(){
	ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img\enter_id_selected.png
	if (ErrorLevel = 0)
	{
		copy_number_2()
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
			randomize_click(FoundX, FoundY)
			random_delay()
		}
	}
	
}
*/



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
			random_delay()
		}
	}
	
	
	
	ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img\summon_ok.png
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
	
	ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img\next.png
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

copy_number_2() {
	WinActivate,Granblue Raid Finder - Chrome
	ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img\raid_number_2.png
	if (ErrorLevel = 0)
	{
		randomize_click(FoundX, FoundY)
	}
	WinActivate,Granblue Fantasy - Chrome
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

