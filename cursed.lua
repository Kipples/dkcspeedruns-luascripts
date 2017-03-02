while true do
  memory.writeword(0x7E0575,69) --Lives
  memory.writeword(0x7E0577,69) --Lives
  gui.text(0,0,"Lua enabled")
  table = joypad.get(1)
  if (table.X) then
    memory.writeword(0x7E0EF5, 1000)
    local reads = memory.readword(0x7E0EF5)
    local curse = reads + 4
    memory.writeword(0x7E0EF5,curse)
  end
  emu.frameadvance()
end