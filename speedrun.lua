local frames = 0
local seconds = 0
local minutes = 0
local hours = 0
local hundreths = 0
local start = false
local ttlframes = 0

savestate.registerload(function ()
  frames = 0
  seconds = 0
  minutes = 0
  hours = 0
  hundreths = 0
end) 

while true do
  table = joypad.get(1)
  if (table.L) then
    start = true
  end
  if ((start == true) and (table.R)) then
    start = false
  end
  if (start == true) then
    frames = frames + 1
	ttlframes = ttlframes + 1
  end
  if (frames == 60) then
    seconds = seconds + 1
	frames = 0
  end
  if (seconds == 60) then
    minutes = minutes + 1
	seconds = 0
  end
  if (minutes == 60) then
    hours = hours + 1
	minutes = 0
  end
  hundreths = (frames / 60 * 100)
  hundreths = math.floor(hundreths)
  gui.text(0,0, hours..":"..minutes..":"..seconds.."."..hundreths.."  frames:"..frames.."   Total frames: "..ttlframes)
  emu.frameadvance()
end