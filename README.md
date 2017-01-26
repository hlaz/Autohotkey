# Scripts

I'm using AutoHotKey to create mobile games bot scripts to automate farming, leveling, etc.

Basic functions from AutoHotkey allows me to automate stuffs when the window is in the foreground or background, but it's not working when the window is minimized or hidden by other windows. (ControlSend works, but I haven't touched it yet, https://www.autohotkey.com/docs/commands/ControlSend.htm)

In order to make everything fully-automated even when the window is in background or minimized, I used gdi+ library for image search on background.

I'm planning to use Android Debug Bridge (adb) along with AHK as well.

# Autohotkey
AutoHotkey is a free, open source macro-creation and automation software utility that allows users to automate repetitive tasks. It is driven by a custom scripting language that is aimed specifically at providing keyboard shortcuts, otherwise known as hotkeys.  AutoHotkey_L started as a fork of AutoHotkey but has been the main branch for some time.  https://autohotkey.com/

# GDI+ library

https://autohotkey.com/board/topic/29449-gdi-standard-library-145-by-tic/
