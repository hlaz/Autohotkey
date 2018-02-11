#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


#include Gdip.ahk
#include Gdip_ImageSearch.ahk


Gui, Add, Text, x45 y5 w110 h20, Coop
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
	
	Loop

	{
		
		
		
		{



		;;2번 창 ready (좌측 첫번쨰가 1번)
		Loop
		{
			CoordMode, pixel, screen
			coordmode, mouse, screen
			ImageSearch, rx, ry, 680, 480, 760, 550, *50 %A_ScriptDir%\img\ready.png

			IF Errorlevel=1
			{
				continue
			}
			IF Errorlevel=0
			{
				Random,rx, 711,738
				Random,ry, 512,523
				mouseclick, left, rx,ry
				Random,t,2,4
				sleep, %t%00
				break
			}
		}
		
		;3번창 레디
		Loop
		{
			CoordMode, pixel, screen
			coordmode, mouse, screen
			ImageSearch, rx, ry, 1070, 480, 1150, 550, *50 %A_ScriptDir%\img\ready.png

			IF Errorlevel=1
			{
				continue
			}
			IF Errorlevel=0
			{
				Random,rx, 1100,1120
				Random,ry, 510,522
				mouseclick, left, rx,ry
				Random,t,2,4
				sleep, %t%00
				break
			}
		}

		;;1번 창 GO (좌측 첫번쨰가 1번)
		Loop
		{
			ImageSearch, rx, ry, 300, 493, 375, 541, *50 %A_ScriptDir%\img\start.png
			IF Errorlevel=1
			{
				continue
				}
			IF Errorlevel=0
			{
				Random,rx, 330,350
				Random,ry, 511,523
				mouseclick, left, rx,ry

				break	
			}
		}


		
		;;3번 창 공격 (좌측 첫번쨰가 1번)
		Loop
		{
			CoordMode, pixel, screen
			coordmode, mouse, screen
			
			ImageSearch, rx, ry, 1000, 352, 1200, 392, *50 %A_ScriptDir%\img\attack.png
			
			IF ErrorLevel=1 
				{ 
				continue 
				}
			IF ErrorLevel=0
					{
				Random, rx, 1055,1100
				Random, ry, 363,377
				mouseclick, left, rx, ry
				Random,t,200,500
				sleep, t
				break
				}	
		}

		;;1번 창 공격 (좌측 첫번쨰가 1번)
				Loop
		{
		CoordMode, pixel, screen
		coordmode, mouse, screen
		ImageSearch, rx, ry, 230, 342, 372, 392, *50 %A_ScriptDir%\img\attack.png
		IF ErrorLevel=1
			{
			continue
			}
		IF ErrorLevel=0
			{
			Random, rx, 285,335
			Random, ry, 363,377
			mouseclick, left, rx, ry
			Random,t,200,500
			sleep, t
			break
			}
		}
		
		
		;;2번 창 공격 (좌측 첫번쨰가 1번)
		Loop
		{
			CoordMode, pixel, screen
			coordmode, mouse, screen
			
			ImageSearch, rx, ry, 608, 349, 760, 392, *50 %A_ScriptDir%\img\attack.png
			
			IF ErrorLevel=1 
				{ 
				continue 
				}
			IF ErrorLevel=0
					{
				Random, rx, 660,720
				Random, ry, 363,377
				mouseclick, left, rx, ry
				Random,t,100,500
				sleep, t
				break
				}	
		}


			




		

	}

	;; 공격 후 새로고침(0.5~0.9초 텀)
	Random, sleep1, 800, 1200
	sleep, sleep1
	
		Random,px, 273,300
		Random,py, 90,93
		mouseclick, left, px,py


		Random,px, 460,468
		Random,py, 90,93
		mouseclick, left, px,py

		Random,px, 1049,1070
		Random,py, 90,93
		mouseclick, left, px,py

	Random, sleep2, 3500, 4000
	sleep, sleep2



		Random,px, 273,300
		Random,py, 90,93
		mouseclick, left, px,py


		Random,px, 460,468
		Random,py, 90,93
		mouseclick, left, px,py

		Random,px, 1049,1070
		Random,py, 90,93
		mouseclick, left, px,py
		
		num_clear := num_clear + 1
		Gui,Submit,NoHide
		GuiControl, , B, %num_clear% runs
		
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

F7::pause


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
	random,yr,1,20
	FoundX:=FoundX+xr
	FoundY:=FoundY+yr
	mouseclick, left, %FoundX%, %FoundY%
}

