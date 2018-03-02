#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


#include Gdip.ahk
#include Gdip_ImageSearch.ahk

Loop

{
	WinActivate,Granblue Fantasy - Chrome
	
	

	;3번창 레디
	
	
	Loop
	{
		CoordMode, pixel, screen
		coordmode, mouse, screen
		ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img\skill_1_mc.png
		if (ErrorLevel = 0)
		{
			random_delay_wait()
			randomize_click_skill(FoundX, FoundY)
			Random,t,5,9
			sleep, %t%00
			break
		}
	}
	
	
	Loop
	{
		CoordMode, pixel, screen
		coordmode, mouse, screen
		ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img\skill_2_mc.png
		if (ErrorLevel = 0)
		{
			randomize_click_skill(FoundX, FoundY)
			Random,t,5,9
			sleep, %t%00
			break
		}
	}
	
	
	Loop
	{
		CoordMode, pixel, screen
		coordmode, mouse, screen
		ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img\skill_12.png
		if (ErrorLevel = 0)
		{
			randomize_click_skill(FoundX, FoundY)
			Random,t,5,9
			sleep, %t%00
			break
		}
	}
	
	Loop
	{
		CoordMode, pixel, screen
		coordmode, mouse, screen
		ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img\summon_baha.png
		if (ErrorLevel = 0)
		{
			randomize_click_skill(FoundX, FoundY)
			Random,t,5,9
			sleep, %t%00
			break
		}
	}
	
	Loop
	{
		CoordMode, pixel, screen
		coordmode, mouse, screen
		ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img\back_multi.png
		if (ErrorLevel = 0)
		{
			randomize_click_skill(FoundX, FoundY)
			Random,t,5,9
			sleep, %t%00
			break
		}
	}
	
	
	Loop
	{
		CoordMode, pixel, screen
		coordmode, mouse, screen
		ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img\skill_9_mc.png
		if (ErrorLevel = 0)
		{
			randomize_click_skill(FoundX, FoundY)
			Random,t,5,9
			sleep, %t%00
			break
		}
	}
	
	Loop
	{
		CoordMode, pixel, screen
		coordmode, mouse, screen
		ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img\skill_11_mc.png
		if (ErrorLevel = 0)
		{
			randomize_click_skill(FoundX, FoundY)
			Random,t,5,9
			sleep, %t%00
			break
		}
	}
	
	
	Loop
	{
		CoordMode, pixel, screen
		coordmode, mouse, screen
		ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img\skill_11.png
		if (ErrorLevel = 0)
		{
			randomize_click_skill(FoundX, FoundY)
			Random,t,5,9
			sleep, %t%00
			break
		}
	}
	
	Loop
	{
		CoordMode, pixel, screen
		coordmode, mouse, screen
		ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img\skill_4_mc.png
		if (ErrorLevel = 0)
		{
			randomize_click_skill(FoundX, FoundY)
			Random,t,5,9
			sleep, %t%00
			break
		}
	}
	
	Loop
	{
		CoordMode, pixel, screen
		coordmode, mouse, screen
		ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img\summon_shiva.png
		if (ErrorLevel = 0)
		{
			randomize_click_skill(FoundX, FoundY)
			Random,t,5,9
			sleep, %t%00
			break
		}
	}
	
	
	Loop
	{
		CoordMode, pixel, screen
		coordmode, mouse, screen
		ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img\attack.png
		if (ErrorLevel = 0)
		{
			randomize_click(FoundX, FoundY)
			Random,t,5,9
			sleep, %t%00
		}
		
		ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *50 %A_ScriptDir%\img\next.png
		if (ErrorLevel = 0)
		{
			randomize_click(FoundX, FoundY)
			Random,t,5,9
			sleep, %t%00
			break
		}
		
		
		
	}
	
}
return




F5::ExitApp





random_delay(){
	random, wait_time, 400, 1500
	sleep,%wait_time%

}

random_delay_wait(){
	random, wait_time, 5000, 6000
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

randomize_click_skill(FoundX, FoundY)
{
	random,xr,1,3
	random,yr,1,4
	FoundX:=FoundX+xr
	FoundY:=FoundY+yr
	mouseclick, left, %FoundX%, %FoundY%
}

randomize_click_enter(FoundX, FoundY)
{
	random,xr,1,7
	random,yr,1,7
	FoundX:=FoundX+xr
	FoundY:=FoundY+yr
	mouseclick, left, %FoundX%, %FoundY%
}

randomize_click(FoundX, FoundY)
{
	random,xr,1,15
	random,yr,1,15
	FoundX:=FoundX+xr
	FoundY:=FoundY+yr
	mouseclick, left, %FoundX%, %FoundY%
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