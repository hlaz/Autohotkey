#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.



#include Gdip.ahk
#include Gdip_ImageSearch.ahk


Gui, Add, Text, x30 y5 w110 h20, 던전 자동 주회
Gui, Add, Text, x60 y25 w50 h20 vA, 준비
Gui, Add, Text, x60 y50 w50 h20 vB, 0 회
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
	Gui,Submit,NoHide
	GuiControl, , A, 시작
	
	매크로시작 := true
	클리어횟수 := 0
	
	Loop
	{
		CoordMode, Pixel, Screen
		CoordMode, Mouse, Screen
		
		;던전 재도전
		If(IsImagePlus(ClickX, ClickY, "replay.png",60,0))
		{
			클릭(ClickX, ClickY)
			Sleep,1000
			클리어횟수 := 클리어횟수 + 1
			Gui,Submit,nohide
			GuiControl, , B, %클리어횟수% 회
		}

		;만약 sp 모자르다고 뜨면, 포션먹기
		If(IsImagePlus(ClickX, ClickY, "msg_nosp.png",60,0))
		{
			클릭(ClickX, ClickY)
			Sleep, 1000
			
			If(IsImagePlus(ClickX, ClickY, "re_ok.png",60,0))
			{
				클릭(ClickX, ClickY)
				Sleep, 1000
			}
		}
		
		;대화 스킵
		If(IsImagePlus(ClickX, ClickY, "skip.png",60,0))
		{
			클릭(ClickX, ClickY)
			Sleep, 5000
		}
		
		;자동진행
		If(IsImagePlus(ClickX, ClickY, "auto_run.png",60,0))
		{
			ControlClick, x631 y82, BlueStacks App Player,,left
			Sleep, 10000
		}
		
		; 경험치 루트
		If(IsImagePlus(ClickX, ClickY, "exp_msg.png",60,0))
		{
			If(IsImagePlus(ClickX, ClickY, "select_route.png",60,0))
			{
				클릭(ClickX, ClickY)
				Sleep, 1000
				
				If(IsImagePlus(ClickX, ClickY, "exp_nosp.png",60,0))
				{
					클릭(ClickX, ClickY)
					Sleep, 1000
					
					If(IsImagePlus(ClickX, ClickY, "diff_route.png",60,0))
					{
						클릭(ClickX, ClickY)
						Sleep, 1000
					}					
				}
			}
		}
		else if (IsImagePlus(ClickX, ClickY, "diff_route.png",60,0))
		{
			클릭(ClickX, ClickY)
			Sleep, 1000
		}
		
		;카드 맥스 오버일때
		If(IsImagePlus(ClickX, ClickY, "max_card.png",60,0))
		{
			클릭(ClickX, ClickY)
			Sleep, 1000
			
			;마도서
			If(IsImagePlus(ClickX, ClickY, "card_menu.png",60,0))
			{
				클릭(ClickX, ClickY)
				Sleep, 1000
				
				;카드판매 탭
				If(IsImagePlus(ClickX, ClickY, "sell_card.png",60,0))
				{
					클릭(ClickX, ClickY)
					Sleep, 1000
					
					;자동 판매 선택
					If(IsImagePlus(ClickX, ClickY, "auto_select.png",60,0))
					{
						클릭(ClickX, ClickY)
						Sleep, 1000
						
						;판매 클릭
						If(IsImagePlus(ClickX, ClickY, "sell_card_confirm.png",60,0))
						{
							클릭(ClickX, ClickY)
							Sleep, 1000
							
							;메뉴 클릭
							If(IsImagePlus(ClickX, ClickY, "main_menu.png",60,0))
							{
								클릭(ClickX, ClickY)
								Sleep, 1000
								
								;탐색 클릭
								If(IsImagePlus(ClickX, ClickY, "adventure.png",60,0))
								{
									클릭(ClickX, ClickY)
									Sleep, 1000
									
									;현재 진행중인 던전
									If(IsImagePlus(ClickX, ClickY, "current_dungeon.png",60,0))
									{
										클릭(ClickX, ClickY)
										Sleep, 1000
										
										;화면 클릭
										If(IsImagePlus(ClickX, ClickY, "touch_screen.png",60,0))
										{
											클릭(ClickX, ClickY)
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
		If(IsImagePlus(ClickX, ClickY, "network_error.png",60,0))
		{
			클릭(ClickX, ClickY)
			Sleep, 1000
			
			;메뉴 클릭
			If(IsImagePlus(ClickX, ClickY, "main_menu.png",60,0))
			{
				클릭(ClickX, ClickY)
				Sleep, 1000
				
				If(IsImagePlus(ClickX, ClickY, "adventure.png",60,0))
				{
					클릭(ClickX, ClickY)
					Sleep, 1000
					;현재 진행중인 던전
					If(IsImagePlus(ClickX, ClickY, "current_dungeon.png",60,0))
					{
						클릭(ClickX, ClickY)
						Sleep, 1000
						
						;화면 클릭
						If(IsImagePlus(ClickX, ClickY, "touch_screen.png",60,0))
						{
							클릭(ClickX, ClickY)
							Sleep, 1000
							
							
							;자동진행
							If(IsImagePlus(ClickX, ClickY, "auto_run.png",60,0))
							{
								ControlClick, x631 y82, BlueStacks App Player,,left
								Sleep, 10000
							}										
						}									
					}
				}					
			}
			
		}
		
		If(IsImagePlus(ClickX, ClickY, "server_error.png",60,0))
		{
			클릭(ClickX, ClickY)
			Sleep, 5000
		}
		
		
		;던전 싸움에 입장, 전투시작
		If(IsImagePlus(ClickX, ClickY, "dungeon_start_fight.png",60,0))
		{
			클릭(ClickX, ClickY)
			Sleep, 1000
		}
		
		;전투중 오토
		If(IsImagePlus(ClickX, ClickY, "auto_run_2.png",60,0))
		{
			ControlClick, x707 y82, BlueStacks App Player,,left
			Sleep, 1000
		}
								
								
		;레벨업
		If(IsImagePlus(ClickX, ClickY, "level_up.png",60,0))
		{
			클릭(ClickX, ClickY)
			Sleep, 5000
		}
		
		;일반금서 매크로 : 금서소환 - 일반금서 - 소환하기 - 소환 확인 - 전투시작 - 스킬키 입력 - ?
		
	}
	
}
return


Button종료:
{
	매크로시작 := false
	ExitApp
}
return




클릭(x, y)
{
	
	WinGet, ActiveID, ID, BlueStacks App Player

	lparam := x|y<<16
	PostMessage, 0x201, 1, %lparam%,, ahk_id %ActiveID%
	PostMessage, 0x202, 0, %lparam%,, ahk_id %ActiveID%
	Sleep, 1000
}

IsImagePlus(ByRef clickX, ByRef clickY, ImageName, errorRange, trans, sX = 0, sY = 0, eX = 0, eY = 0)
{
WinGet, Title , ID, BlueStacks App Player
if(Gdip_ImageSearchWithHwnd(Title, clickX, clickY,ImageName,errorRange,trans, sX, sY, eX, eY))
{
return true
}
else
return false
}


Gdip_ImageSearchWithHwnd(Hwnd,Byref X,Byref Y,Image,Variation=0,Trans="",sX = 0,sY = 0,eX = 0,eY = 0)
{
SysGet, wFrame, 7
SysGet, wCaption, 4
gdipToken := Gdip_Startup()
bmpHaystack := Gdip_BitmapFromHwnd(Hwnd)
bmpNeedle := Gdip_CreateBitmapFromFile(Image)
if( sX!= 0 || sY!= 0 || eX!= 0 || eY != 0)
{
sX := sX + wFrame
sY := sY + wCaption + wFrame
eX := eX + wFrame
eY := eY + wCaption + wFrame
}
RET := Gdip_ImageSearch(bmpHaystack,bmpNeedle,LIST,sX,sY,eX,eY,Variation,Trans,1,1)
Gdip_DisposeImage(bmpHaystack)
Gdip_DisposeImage(bmpNeedle)
Gdip_Shutdown(gdipToken)
StringSplit, LISTArray, LIST, `,
X := LISTArray1 - wFrame
Y := LISTArray2 - wCaption - wFrame

if(RET = 1)
{
return true
}
else
{
return false
}
}