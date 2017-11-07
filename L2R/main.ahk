#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


#include Gdip.ahk
#include Gdip_ImageSearch.ahk


Gui, Add, Text, x45 y5 w110 h20, Raid Farming
Gui, Add, Text, x60 y25 w50 h20 vA, Ready
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
	
	WinActivate,Nox-Copy
	
	Loop
	{
		CoordMode, Pixel, Screen
		CoordMode, Mouse, Screen
				
		;퀘시작 - 확인없 - 54,161
		;보상 323 340
		;refresh 
		
		WinGetActiveTitle, tmp1
		
		
		ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img\conv.png
		if (ErrorLevel = 0)
		{
			MouseClick, left, 1856, 301
			Sleep, 1000
		}
		
		ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img\quest_arrow.png
		if (ErrorLevel = 0)
		{
			MouseClick, left, 1304, 173
			Sleep, 1000
		}
		
		
		ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img\receive_quest_2.png
		if (ErrorLevel = 0)
		{
			Send {Click %FoundX% %FoundY%}
			Sleep, 1000
		}
		
		ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img\receive_quest_3.png
		if (ErrorLevel = 0)
		{
			MouseClick, left, 1304, 173
			Sleep, 1000
		}
		
		ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img\receive_quest_4.png
		if (ErrorLevel = 0)
		{
			MouseClick, left, 1304, 173
			Sleep, 1000
		}
		
		
		ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img\take_reward.png
		if (ErrorLevel = 0)
		{
			Send {Click %FoundX% %FoundY%}
			Sleep, 1000
		}
		
		ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img\episode_clear.png
		if (ErrorLevel = 0)
		{
			Send {Click %FoundX% %FoundY%}
			Sleep, 1000
		}
		
		ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img\end_tutorial.png
		if (ErrorLevel = 0)
		{
			Send {Click %FoundX% %FoundY%}
			Sleep, 1000
			
			ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img\click_yes.png
			if (ErrorLevel = 0)
			{
				Send {Click %FoundX% %FoundY%}
				Sleep, 1000
			}
		}
		
		ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img\equip_better.png
		if (ErrorLevel = 0)
		{
			Send {Click %FoundX% %FoundY%}
			Sleep, 1000
		}
		
		ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img\skip_movie.png
		if (ErrorLevel = 0)
		{
			Send {Click %FoundX% %FoundY%}
			Sleep, 1000
		}
		
		ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img\full_bag.png
		if (ErrorLevel = 0)
		{
			Click, left, 493, 51
			Sleep, 1000
		}
	
		;1852 74 튜토스킵
	}
}
	
return


ButtonStop:
{
	Start_macro := false
	ExitApp
}
return

F5::
ExitApp
return

비활성왼쪽클릭(x좌표, y좌표)
{
	WinGetPos, w_x, w_y, w_w, w_h, Nox2
	Msgbox, 펑션안
	
	내부좌표x := x좌표 - w_x
	내부좌표y := y좌표 - w_y
	
	lparam := 내부좌표x|내부좌표y<<16
	PostMessage, 0x201, 1, %lparam%, ,Nox2
	PostMessage, 0x202, 0, %lparam%, ,Nox2
	Sleep, 1000
}
	
	
Button종료:
{
	매크로시작 := false
	ExitApp
}
return