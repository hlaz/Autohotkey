#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


#include Gdip.ahk
#include Gdip_ImageSearch.ahk


Gui, Add, Text, x30 y5 w110 h20, Raid Farming
Gui, Add, Text, x60 y25 w50 h20 vA, Ready
Gui, Add, Text, x60 y50 w50 h20 vB, 0 runs
Gui, Add, Button, x20 y80 w110 h20, Start
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
		CoordMode, Pixel, Screen
		CoordMode, Mouse, Screen
				
		;refresh - enter 5 bp raid - say hello while waiting - use skills - get exp - root - (special dungeon)
		
		;refresh 
		If(IsImagePlus(ClickX, ClickY, "lobby_refresh.png",60,0))
		{
			click_it(ClickX, ClickY)
			Sleep, 500
			
			;5bp - enter
			If(IsImagePlus(ClickX, ClickY, "five_bp.png",60,0)||IsImagePlus(ClickX, ClickY, "four_bp.png",60,0))
			{
				click_it(ClickX, ClickY)
				Sleep, 500
			}
			
		}
		
		;when the raid is already full, refresh screen
		If(IsImagePlus(ClickX, ClickY, "full_raid.png",60,0))
		{
			;5bp - enter
			If(IsImagePlus(ClickX, ClickY, "touch_screen.png",60,0))
			{
				click_it(ClickX, ClickY)
				Sleep, 500
			}
		}
		
		;when the raid is already over, refresh screen
		If(IsImagePlus(ClickX, ClickY, "finished_lobby.png",60,0))
		{
			;5bp - enter
			If(IsImagePlus(ClickX, ClickY, "touch_screen.png",60,0))
			{
				click_it(ClickX, ClickY)
				Sleep, 500
			}
		}
		
		
		;entered dungeon
		
		;emote while waiting - works
		If(IsImagePlus(ClickX, ClickY, "battle_waiting.png",60,0) || IsImagePlus(ClickX, ClickY, "battle_waiting_1.png",60,0) || IsImagePlus(ClickX, ClickY, "battle_waiting_2.png",60,0))
		{
			click_it(ClickX, ClickY)
			Sleep, 500
			
			If(IsImagePlus(ClickX, ClickY, "emote.png",60,0))
			{
				click_it(ClickX, ClickY)
				Sleep, 500
				
				If(IsImagePlus(ClickX, ClickY, "emote_no.png",60,0))
				{
					click_it(ClickX, ClickY)
					Sleep, 500
				}
			}
		} ;emote, works
		
		;skills in order
		If(IsImagePlus(ClickX, ClickY, "lucky_1.png",60,0))
		{
			click_it(ClickX, ClickY)
			Sleep, 500
		}
		

		If(IsImagePlus(ClickX, ClickY, "lucky_2.png",60,0))
		{
			click_it(ClickX, ClickY)
			Sleep, 500
		}

		
		If(IsImagePlus(ClickX, ClickY, "lucky_3.png",60,0))
		{
			click_it(ClickX, ClickY)
			Sleep, 500
		}
		
		If(IsImagePlus(ClickX, ClickY, "lucky_4.png",60,0))
		{
			click_it(ClickX, ClickY)
			Sleep, 500
		}
		
		If(IsImagePlus(ClickX, ClickY, "lucky_main.png",60,0))
		{
			click_it(ClickX, ClickY)
			Sleep, 500
		}
		
		If(IsImagePlus(ClickX, ClickY, "anti_heal.png",60,0))
		{
			click_it(ClickX, ClickY)
			Sleep, 500
		}
		
		If(IsImagePlus(ClickX, ClickY, "cancel_this.png",60,0))
		{
			click_it(ClickX, ClickY)
			Sleep, 500
			
			If(IsImagePlus(ClickX, ClickY, "cancel_skill.png",60,0))
			{
				click_it(ClickX, ClickY)
				Sleep, 500
			}
		}
		
		;end battle - emote
		If(IsImagePlus(ClickX, ClickY, "done_battle",60,0) || IsImagePlus(ClickX, ClickY, "thanks_msg_1",60,0) || IsImagePlus(ClickX, ClickY, "thanks_msg_2",60,0) || IsImagePlus(ClickX, ClickY, "thanks_msg_3",60,0) || IsImagePlus(ClickX, ClickY, "thanks_msg_4",60,0) || IsImagePlus(ClickX, ClickY, "thanks_msg_5",60,0))
		{
			If(IsImagePlus(ClickX, ClickY, "emote.png",60,0))
			{
				click_it(ClickX, ClickY)
				Sleep, 300
				
				If(IsImagePlus(ClickX, ClickY, "emote_thanks.png",60,0))
				{
					click_it(ClickX, ClickY)
					Sleep, 500
				}
			}
		} ;emote-battle
		
		
		;exp screen, click it
		If(IsImagePlus(ClickX, ClickY, "end_battle.png",60,0)) 
		{
			click_it(ClickX, ClickY)
			Sleep, 1000
			num_clear := num_clear + 1
			Gui,Submit,nohide
			GuiControl, , B, %num_clear% runs
		}
		
		;root card
		If(IsImagePlus(ClickX, ClickY, "new_card.png",60,0)) 
		{
			click_it(ClickX, ClickY)
			Sleep, 1000
		}
		
		;when special dungeon is up
		If(IsImagePlus(ClickX, ClickY, "world_map.png",60,0)) 
		{
			click_it(ClickX, ClickY)
			Sleep, 1000
			
			
			If(IsImagePlus(ClickX, ClickY, "special_dungeon.png",60,0)) 
			{
				click_it(ClickX, ClickY)
				Sleep, 500
				
				;go to lobby
				If(IsImagePlus(ClickX, ClickY, "opened_special_dungeon.png",60,0)) 
				{
					click_it(ClickX, ClickY)
					Sleep, 500
					
					If(IsImagePlus(ClickX, ClickY, "run_dungeon.png",60,0)) 
					{
						click_it(ClickX, ClickY)
						Sleep, 500
					}
				}
			}
			
			;go to raid menu
			If(IsImagePlus(ClickX, ClickY, "summon_raid.png",60,0)) 
			{
				click_it(ClickX, ClickY)
				Sleep, 2000
				
				;go to lobby
				If(IsImagePlus(ClickX, ClickY, "lobby.png",60,0)) 
				{
					click_it(ClickX, ClickY)
					Sleep, 2000
				}
			}
		}
		
		If(IsImagePlus(ClickX, ClickY, "home_main.png",60,0)) 
		{
			If(IsImagePlus(ClickX, ClickY, "summon_raid.png",60,0)) 
			{
				click_it(ClickX, ClickY)
				Sleep, 1000
				
				;lobby
				If(IsImagePlus(ClickX, ClickY, "lobby.png",60,0)) 
				{
					click_it(ClickX, ClickY)
					Sleep, 1000
				}
			}
		}
		
		;server_error msg ''
		If(IsImagePlus(ClickX, ClickY, "server_error.png",60,0)) 
		{
			click_it(ClickX, ClickY)
			Sleep, 1000
		}
		
		;take 5 minutes break when disconnected from network
		If(IsImagePlus(ClickX, ClickY, "network_error.png",60,0))
		{
			click_it(ClickX, ClickY)
			Sleep, 300000
			
			If(IsImagePlus(ClickX, ClickY, "summon_raid.png",60,0)) 
			{
				click_it(ClickX, ClickY)
				Sleep, 1000
				
				;lobby
				If(IsImagePlus(ClickX, ClickY, "lobby.png",60,0)) 
				{
					click_it(ClickX, ClickY)
					Sleep, 1000
				}
			}
		}
		
		If(IsImagePlus(ClickX, ClickY, "defeated.png",60,0)) 
		{
			click_it(ClickX, ClickY)
			Sleep, 1000
			
			If(IsImagePlus(ClickX, ClickY, "touch_screen.png",60,0)) 
			{
				ControlClick, x390 y279, BlueStacks App Player,,left
				Sleep, 500
				
				If(IsImagePlus(ClickX, ClickY, "summon_raid.png",60,0)) 
				{
					click_it(ClickX, ClickY)
					Sleep, 300
					
					If(IsImagePlus(ClickX, ClickY, "lobby.png",60,0)) 
					{
						click_it(ClickX, ClickY)
						Sleep, 500
					}
				}
			}
		}
		
		If(IsImagePlus(ClickX, ClickY, "re_ok.png",60,0)) 
		{
			click_it(ClickX, ClickY)
			Sleep, 1000
		}
		
		If(IsImagePlus(ClickX, ClickY, "skip.png",60,0)) 
		{
			click_it(ClickX, ClickY)
			Sleep, 1000
		}
		
		If(IsImagePlus(ClickX, ClickY, "finished_dungeon.png",60,0)) 
		{
			
			click_it(ClickX, ClickY)
			Sleep, 1000
		}
		
		
		If(IsImagePlus(ClickX, ClickY, "auto_dungeon.png",60,0))
		{
			
			ControlClick, x632 y75, BlueStacks App Player,,left
			Sleep, 10000
		}
		
		
		;max card while running special_dungeon
		If(IsImagePlus(ClickX, ClickY, "max_card.png",60,0))
		{
			click_it(ClickX, ClickY)
			Sleep, 1000
			
			;card
			If(IsImagePlus(ClickX, ClickY, "card_menu.png",60,0))
			{
				click_it(ClickX, ClickY)
				Sleep, 1000
				
				;sell cards
				If(IsImagePlus(ClickX, ClickY, "sell_card.png",60,0))
				{
					click_it(ClickX, ClickY)
					Sleep, 1000
					
					;select all cards
					If(IsImagePlus(ClickX, ClickY, "auto_select.png",60,0))
					{
						click_it(ClickX, ClickY)
						Sleep, 1000
						
						;click sell
						If(IsImagePlus(ClickX, ClickY, "sell_card_confirm.png",60,0))
						{
							click_it(ClickX, ClickY)
							Sleep, 1000
							
							;click menu
							If(IsImagePlus(ClickX, ClickY, "main_menu.png",60,0))
							{
								click_it(ClickX, ClickY)
								Sleep, 1000
								
								;adventure
								If(IsImagePlus(ClickX, ClickY, "adventure.png",60,0))
								{
									click_it(ClickX, ClickY)
									Sleep, 1000
									
									;current dungeon
									If(IsImagePlus(ClickX, ClickY, "current_dungeon.png",60,0))
									{
										click_it(ClickX, ClickY)
										Sleep, 1000
										
										;touch screen
										If(IsImagePlus(ClickX, ClickY, "touch_screen.png",60,0))
										{
											click_it(ClickX, ClickY)
											Sleep, 1000						
										}									
									} ;current dungeon
								}									
							}
						}						
					}					
				}				
			}
		}
		
		
		If(IsImagePlus(ClickX, ClickY, "no_more_bp.png",60,0))
		{
			If(IsImagePlus(ClickX, ClickY, "charge_bp.png",60,0)) 
			{
				click_it(ClickX, ClickY)
				Sleep, 1000
				
				If(IsImagePlus(ClickX, ClickY, "re_ok.png",60,0)) 
				{
					click_it(ClickX, ClickY)
					Sleep, 1000
				}
			}
			
		}
	}
}
return


ButtonStop:
{
	Start_macro := false
	ExitApp
}
return


click_it(x, y)
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