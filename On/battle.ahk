#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


#include Gdip.ahk
#include Gdip_ImageSearch.ahk

Loop
{
	
	
	
	ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img\battle_mark3.png
	if (ErrorLevel = 0)
	{
		random_delay()
		battle_click(FoundX, FoundY)
		random_delay_wait()
	}
	
	
	
	ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img\battle_mark.png
	if (ErrorLevel = 0)
	{
		random_delay()
		battle_click(FoundX, FoundY)
		random_delay()
	}
	
	
	ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img\battle_mark4.png
	if (ErrorLevel = 0)
	{
		random_delay()
		battle_click(FoundX, FoundY)
		random_delay_wait()
	}
	


	
	ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img\battle_mark2.png
	if (ErrorLevel = 0)
	{
		random_delay()
		battle_click(FoundX, FoundY)
		random_delay_wait()
	}
	
	ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img\battle_mark5.png
	if (ErrorLevel = 0)
	{
		random_delay()
		battle_click(FoundX, FoundY)
		random_delay_wait()
	}
	
	ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img\battle_mark6.png
	if (ErrorLevel = 0)
	{
		random_delay()
		battle_click(FoundX, FoundY)
		random_delay_wait()
	}
	
	
	
	
	
	
	
	;진입확인 - 오른쪽으로 이동 - 끝까지 이동
	
	;이제 선택 & 전투 시작 (다루마 먼저 - 없으면 골드 - 없으면 경치, 보스 등장하면 무조건 보스)
	
	;보스 잡고나서, 보상있으면 클릭 - 보상화면 한번 클릭 - 10초 대기 - 보물상자 있나 확인, 잇으면 클릭, 없으면 처음으로
	
	
	
}
return



F9::
Start_macro := false
ExitApp
return

	

random_delay(){
	random, wait_time, 1000, 1500
	sleep,%wait_time%

}


random_delay_boss(){
	random, wait_time, 75000, 95000
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