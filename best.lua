local frames = 0
local seconds = 0
local minutes = 0
local bestSec = 420
local bestMin = 69
local bestHundreths = 999
local start = false
local after = -1
local hundreths = 0 

savestate.registerload(function ()
  if (seconds == 0 and minutes == 0) then
  
  else
    if (bestMin >= minutes) then
      bestMin = minutes
	  if (bestSec >= seconds) then
	    bestSec = seconds
	    if (bestHundreths > hundreths) then
	      bestHundreths = hundreths
	    end
	  end
    end
  end
  start = false
  frames = 0
  seconds = 0
  minutes = 0
  
end) 

while true do
  gui.text(0,0,"Lua enabled")
  table = joypad.get(1)
  if (table.L) then
    start = true
  end 
  if (start) then
    frames = frames + 1
	if (frames == 60) then
	  seconds = seconds + 1
	  frames = 0
	  if (seconds == 60) then
	    minutes = minutes + 1
		seconds = 0
	  end
	end
	if(table.R) then
	  start = false
	end
  end
  hundreths = math.floor(frames/60*100)
  gui.text(0,15,"Current: "..minutes..":"..seconds.."."..hundreths)
  gui.text(0,30,"Best Time: "..bestMin..":"..bestSec.."."..bestHundreths)
  emu.frameadvance()
end