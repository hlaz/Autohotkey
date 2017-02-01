For now, it farms all hard raids with yodal.

it uses yodal's 3rd skill once ougi reaches 100 percent, then attack until battle ends.


-- How it works --

- "randomized delay" and "randomized click" are implemented
- "randomized delay" function lets program to wait 0.1 - 3 seconds between each actions.
- "randomized click" function searches for the next action (image, pixel, or anything), and get the pixel sizes of it, then randomly click on it (for example, 50x50 image can be clicked from 0x0 to 50x50 on the image)
- these features are implemented in order to avoid bans. These aren't for the best performance at all. My goal here is just to let the program farms raids while I'm doing something else.


-- Things to fix --

- it only works on foreground, not sure why. ControlSend and PostMessage didn't work on chrome. need to figure out a way around.


-- Things to add --

- Add other options to farm raids (Zoey, etc)
- Magna farming
- preset all skills in advance, and use them each turns
- network error handling
- drink potions whenever it runs out of ap / bp
- other minor issues


-- Requirements --

- Chrome with viramate (selects summons from favorite option that viramate provides)
- smallest size that gbf provides
- disable "request help at beginning of battle" option
