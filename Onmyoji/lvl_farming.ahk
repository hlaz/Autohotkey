#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


#include Gdip.ahk
#include Gdip_ImageSearch.ahk


Gui, Add, Text, x145 y5 w110 h20, 음양사 레벨링
Gui, Add, Text, x160 y25 w70 h20 vA, Ready
Gui, Add, Text, x160 y45 w70 h20 vB, 0 runs
Gui, Add, Text, x55 y65 w100 h40 vC, 진행상황
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
	
	
	Loop
	{
		;탐색맵 - 23장 클릭 - 진입
		ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img\탐색맵.png
		if (ErrorLevel = 0)
		{
			GuiControl, , C, 탐색맵 확인
			
			;결계돌파 티켓 숫자를 확인, 30/30이면 결계돌파로 이동
			ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img\결계티켓.png
			if (ErrorLevel = 0)
			{
				GuiControl, , C, 결계카드 꽉참
				결계돌파()
			}
			
			;결계티켓 꽉 안찻으면 탐색 시작
			탐색()
		}
		
		;진입확인 - 오른쪽으로 이동 - 끝까지 이동
		
		;이제 선택 & 전투 시작 (다루마 먼저 - 없으면 골드 - 없으면 경치, 보스 등장하면 무조건 보스)
		
		;보스 잡고나서, 보상있으면 클릭 - 보상화면 한번 클릭 - 10초 대기 - 보물상자 있나 확인, 잇으면 클릭, 없으면 처음으로
		
		
		
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


탐색() {
	GuiControl, , C, 탐색 시작
	
	ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img\23장.png
	if (ErrorLevel = 0)
	{
		GuiControl, , C, 23장 확인
		random_delay()
		randomize_click(FoundX, FoundY)
		
		ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img\23장_진입.png
		if (ErrorLevel = 0)
		{
			GuiControl, , C, 23장 진입
			random_delay()
			randomize_click(FoundX, FoundY)
		}
	}
	
	;23장 클릭하고, 진입된거 확인되면 이제 화면 오른쪽으로 이동
	ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img\23장_배경1.png
	if (ErrorLevel = 0)
	{
		GuiControl, , C, 23장 진입 확인
		탐색_이동()
	}

}

탐색_이동() {
	GuiControl, , C, 이동시작
	
	;마우스 드래그 오른쪽으로, 끝까지 이동햇을경우 스탑
	
	
	ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img\23장_배경2.png
	if (ErrorLevel = 0)
	{
		GuiControl, , C, 오른쪽으로 이동 완료
		적_선택()
	}

}

적_선택() {
	GuiControl, , C, 적 선택 시작


}


전투() {
	;특정 범위에 만렙표시가 있다
	ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img\쫄_만렙.png
	if (ErrorLevel = 0)
	{
		;발견된 좌표에서 y축 마이너스 쫙 하고 거길 클릭
		max_level_click(FoundX, FoundY)
	}
	
	ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img\쫄_레어도.png
	if (ErrorLevel = 0)
	{
		;쫄 변경화면
		randomize_click(FoundX, FoundY)
		ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img\쫄_노말.png
		if (ErrorLevel = 0)
		{
			;오른쪽으로 쭉 드래그
			
			;그리고 끝에서 쫄 두개 변경
			max_level_click(FoundX, FoundY)
		}
	}

}

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


error_condition() {
	ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img\battle_error.png
	if (ErrorLevel = 0)
	{
		random_delay()
		
		ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img\network_ok.png
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
	
	ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img\raid_error.png
	if (ErrorLevel = 0)
	{
		random_delay()
		
		ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img\network_ok.png
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
	
	ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img\network_error.png
	if (ErrorLevel = 0)
	{
		random_delay()
		
		ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img\network_ok.png
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
