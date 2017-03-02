local invinc = false

while true do
  gui.text(0,0,"Lua enabled")
  table = joypad.get(1)
  if (table.L) then
    invinc = true
  end
  if (table.R) then
    invinc = false
  end
  if (invinc) then
    memory.writebyte(0x7E16D7, 40)
    memory.writebyte(0x7E16D5, 40)
	gui.text(0,10,"Invincibility On")
  end
  emu.frameadvance()
end