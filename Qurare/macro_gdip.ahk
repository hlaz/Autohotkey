#include Gdip.ahk
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.



ImageSearch_Inactive(Title, ImgFileName)
{
	If !pToken := Gdip_Startup()
	{
		MsgBox, 48, gdiplus error!, Gdiplus failed to start. Please ensure you have gdiplus on your system
		ExitApp
	}

	pBitmapHayStack := Gdip_BitmapFromHWND(hwnd := WinExist(Title)) 
	pBitmapNeedle := Gdip_CreateBitmapFromFile(ImgFileName)

	Width1 := Gdip_GetImageWidth(pBitmapHayStack), Height1 := Gdip_GetImageHeight(pBitmapHayStack)
	Width2 := Gdip_GetImageWidth(pBitmapNeedle), Height2 := Gdip_GetImageHeight(pBitmapNeedle)
	E1 := Gdip_LockBits(pBitmapHayStack, 0, 0, Width1, Height1, Stride1, Scan01,BitmapData1)
	E2 := Gdip_LockBits(pBitmapNeedle, 0, 0, Width2, Height2, Stride2, Scan02,BitmapData2)

	MCode(Gdip_ImageSearch, "83EC148B4424309983E20303C28BC88B442434995383E2035503C2C1F80256C1F902837C24"
	. "30005789442420C7442410000000000F8EBE0000008B5C24288B7C24388D048D00000000894424188B442430895C241CE"
	. "B098DA424000000008BFFC74424440000000085C07E6D895C24148B6C242CC7442440000000008D6424008B4C24403B4C"
	. "243C0F8D8600000033C985FF7E158BD58BF38B063B02751F4183C20483C6043BCF7CEF8B442420035C2418FF44244003C"
	. "003C003E8EBC38B4C24448B5C24148B4424304183C3043BC8894C2444895C24147C978B4C24108B5C241C035C2418413B"
	. "4C2434894C2410895C241C0F8C68FFFFFF8B5424488B44244C5F5E5DC702FFFFFFFFC700FFFFFFFF5B83C414C38B4C244"
	. "48B5424488B44244C5F495E890A8B4C24085D89085B83C414C3")

	Time1 := A_TickCount
	VarSetCapacity(x, 8, 0), VarSetCapacity(y, 8, 0)
	Loop, 100
		DllCall(&Gdip_ImageSearch, "uint", Scan01, "uint", Scan02, "int", Width1, "int", Height1, "int", Width2, "int", Height2, "int", Stride1, "int", Stride2, "int*", x, "int*", y)
	MsgBox, % "Time for 100 searches: " A_TickCount-Time1 "ms`nx: " x "`ny: " y ;%
	
	Gdip_UnlockBits(pBitmapHayStack,BitmapData1), Gdip_UnlockBits(pBitmapNeedle,BitmapData2)
	Gdip_DisposeImage(pBitmapHayStack), Gdip_DisposeImage(pBitmapNeedle)
	return
}

MCode(ByRef code, hex)
{
	VarSetCapacity(code, StrLen(hex)//2)
	Loop % StrLen(hex)//2 ;%
		NumPut("0x" SubStr(hex, 2*A_Index-1, 2), code, A_Index-1, "char")
}



F9::
	ImageSearch_Inactive("BlueStacks App Player","replay.png")
	return



Gui, Add, Text, x30 y5 w110 h20, 매크로 프로그램
Gui, Add, Text, x60 y25 w50 h20 vA, 준비
Gui, Add, Text, x60 y50 w50 h20, 0 회
Gui, Add, Button, x20 y80 w110 h20, 시작
Gui, Add, Button, x20 y110 w110 h20, 종료
Gui, Show

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
		
		ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 replay.png
		if (ErrorLevel = 0)
		{
			비활성왼쪽클릭(FoundX, FoundY)
			Sleep, 1000
		}

		;만약 sp 모자르다고 뜨면
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
		
		ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 skip.png
		if (ErrorLevel = 0)
		{
			비활성왼쪽클릭(FoundX, FoundY)
			Sleep, 5000
		}
		
		ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 auto_run.bmp
		if (ErrorLevel = 0)
		{
			ControlClick, x631 y82, BlueStacks App Player,,left
			Sleep, 10000
		}
		
		
		ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 exp_msg.png
		if (ErrorLevel = 0)
		{
			ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 select_route.png
			if (ErrorLevel = 0)
			{
				비활성왼쪽클릭(FoundX, FoundY)
				Sleep, 1000
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