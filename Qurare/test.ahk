#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

Gui, Add, Text, x30 y5 w110 h20, 매크로 프로그램
Gui, Add, Text, x60 y25 w50 h20 vA, 준비
Gui, Add, Text, x60 y50 w50 h20, 0 회
Gui, Add, Button, x20 y80 w110 h20, 시작
Gui, Add, Button, x20 y110 w110 h20, 종료
Gui, Show

return

F9::
mousegetpos, xx, yy
msgbox X%xx% Y%yy%
return

Button시작:
{
	매크로시작 := true
	Loop
	{
		CoordMode, Pixel, Screen
		CoordMode, Mouse, Screen
		WinGetPos, pos_x, pos_y, width, height, BlueStacks App Player
		x_right := width + pos_x
		y_bottom := height + pos_y
		
		;던전 재도전
		ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 replay.png
		if (ErrorLevel = 0)
		{
			비활성왼쪽클릭(FoundX, FoundY)
			Sleep, 1000
		}

		;만약 sp 모자르다고 뜨면, 포션먹기
		ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 msg_nosp.png
		if (ErrorLevel = 0)
		{
			비활성왼쪽클릭(FoundX, FoundY)
			Sleep, 1000
			
			ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 re_ok.png
			if (ErrorLevel = 0)
			{
				비활성왼쪽클릭(FoundX, FoundY)
				Sleep, 1000
			}
		}
		
		;대화 스킵
		ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 skip.png
		if (ErrorLevel = 0)
		{
			비활성왼쪽클릭(FoundX, FoundY)
			Sleep, 5000
		}
		
		;자동진행
		ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 auto_run.bmp
		if (ErrorLevel = 0)
		{
			ControlClick, x631 y82, BlueStacks App Player,,left
			Sleep, 10000
		}
		
		; 경험치 루트
		ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 exp_msg.png
		if (ErrorLevel = 0)
		{
			ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 select_route.png
			if (ErrorLevel = 0)
			{
				비활성왼쪽클릭(FoundX, FoundY)
				Sleep, 1000
				
				ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 exp_nosp.png
				if (ErrorLevel = 0)
				{
					비활성왼쪽클릭(FoundX, FoundY)
					Sleep, 1000
					
					ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 diff_route.png
					if (ErrorLevel = 0)
					{
						비활성왼쪽클릭(FoundX, FoundY)
						Sleep, 1000
					}					
				}
			}
		}
		if (ErrorLevel = 1)
		{
			ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 diff_route.png
			if (ErrorLevel = 0)
			{
				비활성왼쪽클릭(FoundX, FoundY)
				Sleep, 1000
			}
		}
		
		;카드 맥스 오버일때
		ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 max_card.png
		if (ErrorLevel = 0)
		{
			비활성왼쪽클릭(FoundX, FoundY)
			Sleep, 1000
			
			;마도서
			ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 card_menu.png
			if (ErrorLevel = 0)
			{
				비활성왼쪽클릭(FoundX, FoundY)
				Sleep, 1000
				
				;카드판매 탭
				ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 sell_card.png
				if (ErrorLevel = 0)
				{
					비활성왼쪽클릭(FoundX, FoundY)
					Sleep, 1000
					
					;자동 판매 선택
					ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 auto_select.png
					if (ErrorLevel = 0)
					{
						비활성왼쪽클릭(FoundX, FoundY)
						Sleep, 1000
						
						;판매 클릭
						ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 sell_card_confirm.png
						if (ErrorLevel = 0)
						{
							비활성왼쪽클릭(FoundX, FoundY)
							Sleep, 1000
							
							;메뉴 클릭
							ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 main_menu.png
							if (ErrorLevel = 0)
							{
								비활성왼쪽클릭(FoundX, FoundY)
								Sleep, 1000
								
								;탐색 클릭
								ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 adventure.png
								if (ErrorLevel = 0)
								{
									비활성왼쪽클릭(FoundX, FoundY)
									Sleep, 1000
									
									;현재 진행중인 던전
									ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 current_dungeon.png
									if (ErrorLevel = 0)
									{
										비활성왼쪽클릭(FoundX, FoundY)
										Sleep, 1000
										
										;화면 클릭
										ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 touch_screen.png
										if (ErrorLevel = 0)
										{
											비활성왼쪽클릭(FoundX, FoundY)
											Sleep, 1000						
										}									
									} ;현재진행중
								}									
							}
						}						
					}					
				}				
			}
		}
		
		;네트워크 에러
		ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 network_error.png
		if (ErrorLevel = 0)
		{
			비활성왼쪽클릭(FoundX, FoundY)
			Sleep, 1000
			
			;메뉴 클릭
			ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 main_menu.png
			if (ErrorLevel = 0)
			{
				비활성왼쪽클릭(FoundX, FoundY)
				Sleep, 1000
				
				;현재 진행중인 던전
				ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 current_dungeon.png
				if (ErrorLevel = 0)
				{
					비활성왼쪽클릭(FoundX, FoundY)
					Sleep, 1000
					
					;화면 클릭
					ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 touch_screen.png
					if (ErrorLevel = 0)
					{
						비활성왼쪽클릭(FoundX, FoundY)
						Sleep, 1000
						
						;자동진행
						ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 auto_run.bmp
						if (ErrorLevel = 0)
						{
							ControlClick, x631 y82, BlueStacks App Player,,left
							Sleep, 10000
						}										
					}									
				}								
			}
			
		}
		
	}
}
return


비활성왼쪽클릭(x좌표, y좌표)
{
	WinGetPos, w_x, w_y, w_w, w_h, BlueStacks App Player
	
	내부좌표x := x좌표 - w_x
	내부좌표y := y좌표 - w_y
	
	lparam := 내부좌표x|내부좌표y<<16
	PostMessage, 0x201, 1, %lparam%, ,BlueStacks App Player
	PostMessage, 0x202, 0, %lparam%, ,BlueStacks App Player
	Sleep, 1000
}
	
	
Button종료:
{
	매크로시작 := false
	ExitApp
}
return