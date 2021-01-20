--   Dank Extream Reactor 2 Turbine Program by Dankbudbaker--
--  Version 1.0 --
-- Options menu --

--Loads the touchpoint and input APIs
shell.run("cp /Dank-Extream-Reactor-2-Turbine-Program/config/touchpoint.lua /touchpoint")
os.loadAPI("touchpoint")
shell.run("rm touchpoint")

shell.run("cp /Dank-Extream-Reactor-2-Turbine-Program/config/input.lua /input")
os.loadAPI("input")
shell.run("rm input")

menuOn = true

--Some variables
local mode
local mode2
local continue = true
local touch1 = touchpoint.new(touchpointLocation)
local touch2 = touchpoint.new(touchpointLocation)
local touch3 = touchpoint.new(touchpointLocation)
local touch4 = touchpoint.new(touchpointLocation)
local currPage =  touchpoint.new(touchpointLocation)
local currFunct = backToMainMenu

--Save the changes and reopen the options menu
function saveConfigFile()
  saveOptionFile()
  shell.run("/Dank-Extream-Reactor-2-Turbine-Program/program/editOptions.lua")
  shell.completeProgram("/Dank-Extream-Reactor-2-Turbine-Program/program/editOptions.lua")
end

--Go back to the program -- deprecated
function exit()
  mon.clear()
  continue = false
  if program == "turbine" then
    shell.run("/Dank-Extream-Reactor-2-Turbine-Program/program/turbineControl.lua")
  elseif program == "reactor" then
    shell.run("/Dank-Extream-Reactor-2-Turbine-Program/program/reactorControl.lua")
  end
  shell.completeProgram("/Dank-Extream-Reactor-2-Turbine-Program/program/editOptions.lua")
end

--Go back to the main menu
function displayMenu()
  loadOptionFile()
  mon.clear()
  shell.run("/Dank-Extream-Reactor-2-Turbine-Program/start/menu.lua")
  shell.completeProgram("/Dank-Extream-Reactor-2-Turbine-Program/program/editOptions.lua")
end

--Creates all buttons
function createAllButtons()
  --German buttons
  if lang == "de" then

    --Overview buttons
    touch1:add("Hintergrund",setBackground,3,4,19,4)
    touch1:add("Text",setText,3,6,19,6)
    touch1:add("Reaktor Aus",setOffAt,3,8,19,8)
    touch1:add("Reaktor An",setOnAt,3,10,19,10)
    touch1:add("Turbinen Speed",setTurbineSpeed,3,12,19,12)
    touch1:add("Steam Input",setTurbineSteamRate,3,14,19,14)
    touch1:add("Turbine an/aus",changeTurbineBehaviour,3,16,19,16)
    touch1:add("Config loeschen",resetConfig,3,18,19,18)
    touch1:add("Speichern",saveConfigFile,3,21,19,21)
    --touch1:add("Programm starten",exit,3,21,19,21) --removed
    touch1:add("Hauptmenue",displayMenu,3,23,19,23)

    --Color buttons
    touch2:add("Weiss",function() setColor(1) end,35,5,48,5)
    touch2:add("Orange",function() setColor(2) end,50,5,63,5)
    touch2:add("Magenta",function() setColor(4) end,35,7,48,7)
    touch2:add("Hellblau",function() setColor(8) end,50,7,63,7)
    touch2:add("Gelb",function() setColor(16) end,35,9,48,9)
    touch2:add("Hellgruen",function() setColor(32) end,50,9,63,9)
    touch2:add("Pink",function() setColor(64) end,35,11,48,11)
    touch2:add("Grau",function() setColor(128) end,50,11,63,11)
    touch2:add("Hellgrau",function() setColor(256) end,35,13,48,13)
    touch2:add("Cyan",function() setColor(512) end,50,13,63,13)
    touch2:add("Lila",function() setColor(1024) end,35,15,48,15)
    touch2:add("Blau",function() setColor(2048) end,50,15,63,15)
    touch2:add("Braun",function() setColor(4096) end,35,17,48,17)
    touch2:add("Gruen",function() setColor(8192) end,50,17,63,17)
    touch2:add("Rot",function() setColor(16384) end,35,19,48,19)
    touch2:add("Schwarz",function() setColor(32768) end,50,19,63,19)
    touch2:add("Zurueck",backToMainMenu,3,8,19,8)

    --+/- buttons (1-100)
    touch3:add("-1",function() setOnOffAt("-",1) end,3,8,6,8)
    touch3:add("-10",function() setOnOffAt("-",10) end,8,8,12,8)
    touch3:add("-100",function() setOnOffAt("-",100) end,14,8,19,8)
    touch3:add("+1", function() setOnOffAt("+",1) end,3,10,6,10)
    touch3:add("+10",function() setOnOffAt("+",10) end,8,10,12,10)
    touch3:add("+100",function() setOnOffAt("+",100) end,14,10,19,10)
    touch3:add("Zurueck",backToMainMenu,3,13,19,13)

    --+/- buttons (1-1000)
    touch4:add("-1",function() setOnOffAt("-",1) end,3,8,6,8)
    touch4:add("-10",function() setOnOffAt("-",10) end,8,8,12,8)
    touch4:add("-100",function() setOnOffAt("-",100) end,14,8,19,8)
    touch4:add("-1000",function() setOnOffAt("-",1000) end,21,8,28,8)
    touch4:add("+1", function() setOnOffAt("+",1) end,3,10,6,10)
    touch4:add("+10",function() setOnOffAt("+",10) end,8,10,12,10)
    touch4:add("+100",function() setOnOffAt("+",100) end,14,10,19,10)
    touch4:add("+1000",function() setOnOffAt("+",1000) end,21,10,28,10)
    touch4:add("Zurueck",backToMainMenu,3,13,19,13)

  --English buttons
  elseif lang == "en" then
    --Overwiev buttons
    touch1:add("Background",setBackground,3,4,19,4)
    touch1:add("Text",setText,3,6,19,6)
    touch1:add("Reactor Off",setOffAt,3,8,19,8)
    touch1:add("Reactor On",setOnAt,3,10,19,10)
    touch1:add("Turbine Speed",setTurbineSpeed,3,12,19,12)
    touch1:add("Steam Input",setTurbineSteamRate,3,14,19,14)
    touch1:add("Turbine On/Off",changeTurbineBehaviour,3,16,19,16)
    touch1:add("Delete Config",resetConfig,3,18,19,18)
    touch1:add("Save",saveConfigFile,3,21,19,21)
    --touch1:add("Start program",exit,3,21,19,21) --removed
    touch1:add("Main menu",displayMenu,3,23,19,23)

    --Color buttons
    touch2:add("White",function() setColor(1) end,35,5,48,5)
    touch2:add("Orange",function() setColor(2) end,50,5,63,5)
    touch2:add("Magenta",function() setColor(4) end,35,7,48,7)
    touch2:add("Lightblue",function() setColor(8) end,50,7,63,7)
    touch2:add("Yellow",function() setColor(16) end,35,9,48,9)
    touch2:add("Lime",function() setColor(32) end,50,9,63,9)
    touch2:add("Pink",function() setColor(64) end,35,11,48,11)
    touch2:add("Gray",function() setColor(128) end,50,11,63,11)
    touch2:add("Lightgray",function() setColor(256) end,35,13,48,13)
    touch2:add("Cyan",function() setColor(512) end,50,13,63,13)
    touch2:add("Purple",function() setColor(1024) end,35,15,48,15)
    touch2:add("Blue",function() setColor(2048) end,50,15,63,15)
    touch2:add("Brown",function() setColor(4096) end,35,17,48,17)
    touch2:add("Green",function() setColor(8192) end,50,17,63,17)
    touch2:add("Red",function() setColor(16384) end,35,19,48,19)
    touch2:add("Black",function() setColor(32768) end,50,19,63,19)
    touch2:add("Back",backToMainMenu,3,8,19,8)

    --+/- buttons (1-100)
    touch3:add("-1",function() setOnOffAt("-",1) end,3,8,6,8)
    touch3:add("-10",function() setOnOffAt("-",10) end,8,8,12,8)
    touch3:add("-100",function() setOnOffAt("-",100) end,14,8,19,8)
    touch3:add("+1", function() setOnOffAt("+",1) end,3,10,6,10)
    touch3:add("+10",function() setOnOffAt("+",10) end,8,10,12,10)
    touch3:add("+100",function() setOnOffAt("+",100) end,14,10,19,10)
    touch3:add("Back",backToMainMenu,3,13,19,13)

    --+/- buttons (1-1000)
    touch4:add("-1",function() setOnOffAt("-",1) end,3,8,6,8)
    touch4:add("-10",function() setOnOffAt("-",10) end,8,8,12,8)
    touch4:add("-100",function() setOnOffAt("-",100) end,14,8,19,8)
    touch4:add("-1000",function() setOnOffAt("-",1000) end,21,8,28,8)
    touch4:add("+1", function() setOnOffAt("+",1) end,3,10,6,10)
    touch4:add("+10",function() setOnOffAt("+",10) end,8,10,12,10)
    touch4:add("+100",function() setOnOffAt("+",100) end,14,10,19,10)
    touch4:add("+1000",function() setOnOffAt("+",1000) end,21,10,28,10)
    touch4:add("Back",backToMainMenu,3,13,19,13)
  end
end

--Display the overwiew
function backToMainMenu()
  mon.clear()
  currPage=touch1
  currPage:draw()
  mon.setCursorPos(2,2)
  mon.setTextColor(tonumber(optionList["textColor"]))
  mon.setBackgroundColor(tonumber(optionList["backgroundColor"]))
  mon.setCursorPos(4,2)

  if lang == "de" then
    mon.write("-- Optionen --")
  elseif lang == "en" then
    mon.write("-- Options --")
  end

  --Set text of all the options
  mon.setCursorPos(24,4)
  local col = printColor(tonumber(optionList["backgroundColor"]))
  local col2 = printColor(backgroundColor)
  if tonumber(optionList["backgroundColor"]) ~= backgroundColor then
    if lang == "de" then
      mon.write("Hintergrundfarbe: "..col.." -> "..col2.."   ")
    elseif lang == "en" then
      mon.write("BackgroundColor: "..col.." -> "..col2.."   ")
    end
  else
    if lang == "de" then
      mon.write("Hintergrundfarbe: "..col2.."    ")
    elseif lang == "en" then
      mon.write("BackgroundColor: "..col2.."    ")
    end
  end

  mon.setCursorPos(24,6)
  local col3 = printColor(tonumber(optionList["textColor"]))
  local col4 = printColor(textColor)
  if tonumber(optionList["textColor"]) ~= textColor then
    if lang == "de" then
      mon.write("Textfarbe: "..col3.." -> "..col4.."   ")
    elseif lang == "en" then
      mon.write("TextColor: "..col3.." -> "..col4.."   ")
    end
  else
    if lang == "de" then
      mon.write("Textfarbe: "..col4.."   ")
    elseif lang == "en" then
      mon.write("TextColor: "..col4.."   ")
    end
  end

  mon.setCursorPos(24,8)
  if math.floor(tonumber(optionList["reactorOffAt"])) ~= math.floor(reactorOffAt) then
    if lang == "de" then
      mon.write("Reaktor aus bei ueber "..math.floor(tonumber(optionList["reactorOffAt"])).."% -> "..math.floor(reactorOffAt).."%   ")
    elseif lang == "en" then
      mon.write("Reactor off above "..math.floor(tonumber(optionList["reactorOffAt"])).."% -> "..math.floor(reactorOffAt).."%   ")
    end
  else
    if lang == "de" then
      mon.write("Reaktor aus bei ueber "..math.floor(reactorOffAt).."%   ")
    elseif lang == "en" then
      mon.write("Reactor off above "..math.floor(reactorOffAt).."%   ")
    end
  end

  mon.setCursorPos(24,10)
  if math.floor(tonumber(optionList["reactorOnAt"])) ~= math.floor(reactorOnAt) then
    if lang == "de" then
      mon.write("Reaktor an bei unter "..math.floor(tonumber(optionList["reactorOnAt"])).."% -> "..math.floor(reactorOnAt).."%   ")
    elseif lang == "en" then
      mon.write("Reactor on below "..math.floor(tonumber(optionList["reactorOnAt"])).."% -> "..math.floor(reactorOnAt).."%   ")
    end

  else
    if lang == "de" then
      mon.write("Reaktor an bei unter "..math.floor(reactorOnAt).."%   ")
    elseif lang == "en" then
      mon.write("Reactor on below "..math.floor(reactorOnAt).."%   ")
    end
  end

  mon.setCursorPos(24,12)
  if tonumber(optionList["turbineTargetSpeed"]) ~= turbineTargetSpeed then
    if lang == "de" then
      mon.write("Turbinen Max. Speed: "..(input.formatNumber(math.floor(tonumber(optionList["turbineTargetSpeed"])))).." -> "..(input.formatNumber(turbineTargetSpeed)).."RPM      ")
    elseif lang == "en" then
      mon.write("Turbines Max. Speed: "..(input.formatNumberComma(math.floor(tonumber(optionList["turbineTargetSpeed"])))).." -> "..(input.formatNumberComma(turbineTargetSpeed)).."RPM      ")
    end

  else
    if lang == "de" then
      mon.write("Turbinen Max. Speed: "..(input.formatNumber(turbineTargetSpeed)).."RPM     ")
    elseif lang == "en" then
      mon.write("Turbines Max. Speed: "..(input.formatNumberComma(turbineTargetSpeed)).."RPM     ")
    end
  end

  mon.setCursorPos(24,14)
  if tonumber(optionList["targetSteam"]) ~= targetSteam then
    if lang == "de" then
      mon.write("Turbinen Steam-Input: "..(input.formatNumber(math.floor(tonumber(optionList["targetSteam"])))).." -> "..(input.formatNumber(targetSteam)).."mb/t      ")
    elseif lang == "en" then
      mon.write("Turbines Steam Input: "..(input.formatNumberComma(math.floor(tonumber(optionList["targetSteam"])))).." -> "..(input.formatNumberComma(targetSteam)).."mb/t      ")
    end

  else
    if lang == "de" then
      mon.write("Turbinen Steam-Input: "..(input.formatNumber(targetSteam)).."mb/t     ")
    elseif lang == "en" then
      mon.write("Turbines Steam Input: "..(input.formatNumberComma(targetSteam)).."mb/t     ")
    end
  end

  mon.setCursorPos(24,16)
  local turbineOnOffString1 = ""
  local turbineOnOffString2 = ""
  if optionList["turbineOnOff"] ~= turbineOnOff then
    if lang == "de" then
      if optionList["turbineOnOff"] == "off" then
        turbineOnOffString1 = "nein   "
        turbineOnOffString2 = "ja"
      elseif optionList["turbineOnOff"] == "on" then
        turbineOnOffString1 = "ja   "
        turbineOnOffString2 = "nein"
      end
      mon.write("Turbine bei "..reactorOffAt.."% ausschalten: "..turbineOnOffString2.." -> "..turbineOnOffString1)
    elseif lang == "en" then
      if optionList["turbineOnOff"] == "off" then
        turbineOnOffString1 = "no   "
        turbineOnOffString2 = "yes"
      elseif optionList["turbineOnOff"] == "on" then
        turbineOnOffString1 = "yes   "
        turbineOnOffString2 = "no"
      end
      mon.write("Disable turbine at "..reactorOffAt.."%: "..turbineOnOffString2.." -> "..turbineOnOffString1)
    end

  else
    if lang == "de" then
      if optionList["turbineOnOff"] == "off" then turbineOnOffString2 = "ja"
      elseif optionList["turbineOnOff"] == "on" then turbineOnOffString2 = "nein" end
      mon.write("Turbine bei "..reactorOffAt.."% ausschalten: "..turbineOnOffString2.."   ")
    elseif lang == "en" then
      if optionList["turbineOnOff"] == "off" then turbineOnOffString2 = "yes"
      elseif optionList["turbineOnOff"] == "on" then turbineOnOffString2 = "no" end
      mon.write("Disable turbine at "..reactorOffAt.."%: "..turbineOnOffString2.."   ")
    end
  end

  mon.setCursorPos(24,18)
  if lang == "de" then
    mon.write("Config vorhanden: ")
  elseif lang == "en" then
    mon.write("Config available: ")
  end
  if math.floor(tonumber(optionList["rodLevel"])) ~= math.floor(rodLevel) then
    if lang == "de" then
      mon.write("ja -> nein")
    elseif lang == "en" then
      mon.write("yes -> no")
    end
  else
    if math.floor(rodLevel) == 0 then
      if lang == "de" then
        mon.write("nein   ")
      elseif lang == "en" then
        mon.write("no     ")
      end
    else
      if lang == "de" then
        mon.write("ja   ")
      elseif lang == "en" then
        mon.write("yes   ")
      end
    end
  end
  getClick(backToMainMenu)
end

--Function for setting the background color
function setBackground()
  mode = "background"
  mon.clear()
  currPage = touch2
  currPage:draw()
  mon.setBackgroundColor(backgroundColor)
  mon.setTextColor(textColor)
  mon.setCursorPos(3,2)
  if lang == "de" then
    mon.write("-- Hintergrundfarbe aendern --")
    mon.setCursorPos(3,5)
    mon.write("Hintergrundfarbe: ")
  elseif lang == "en" then
    mon.write("-- Change BackgroundColor --")
    mon.setCursorPos(3,5)
    mon.write("BackgroundColor: ")
  end
  local col = printColor(backgroundColor)
  mon.write(col)
  --refreshOptionList()
  getClick(setBackground)
end

--Function for setting the text color
function setText()
  mode = "text"
  mon.clear()
  currPage = touch2
  currPage:draw()
  mon.setBackgroundColor(backgroundColor)
  mon.setTextColor(textColor)
  mon.setCursorPos(3,2)
  if lang == "de" then
    mon.write("-- Textfarbe aendern --")
    mon.setCursorPos(3,5)
    mon.write("Textfarbe: ")
  elseif lang == "en" then
    mon.write("-- Change TextColor --")
    mon.setCursorPos(3,5)
    mon.write("TextColor: ")
  end
  local col = printColor(textColor)
  mon.write(col)
  --refreshOptionList()
  getClick(setText)
end

--Function for setting the shutdown level (high)
function setOffAt()
  mode2 = "off"
  mon.clear()
  currPage = touch3
  currPage:draw()
  mon.setBackgroundColor(backgroundColor)
  mon.setTextColor(textColor)
  mon.setCursorPos(3,2)
  if lang == "de"	then
    mon.write("-- Reaktor aus --")
    mon.setCursorPos(3,5)
    mon.write("Reaktor aus bei ueber "..math.floor(reactorOffAt).."%  ")
  elseif lang == "en" then
    mon.write("-- Reactor off --")
    mon.setCursorPos(3,5)
    mon.write("Reactor off above "..math.floor(reactorOffAt).."%  ")
  end
  --refreshOptionList()
  getClick(setOffAt)
end

--Function for setting the shutdown level (low)
function setOnAt()
  mode2 = "on"
  mon.clear()
  currPage = touch3
  currPage:draw()
  mon.setBackgroundColor(backgroundColor)
  mon.setTextColor(textColor)
  mon.setCursorPos(3,2)
  if lang == "de" then
    mon.write("-- Reaktor an --")
    mon.setCursorPos(3,5)
    mon.write("Reaktor an bei unter "..math.floor(reactorOnAt).."%  ")
  elseif lang == "en" then
    mon.write("-- Reactor on --")
    mon.setCursorPos(3,5)
    mon.write("Reactor on below "..math.floor(reactorOnAt).."%  ")
  end
  --refreshOptionList()
  getClick(setOnAt)
end

function setColor(id)
  if mode == "background" then
    backgroundColor = id
    setBackground()
  elseif mode == "text" then
    textColor = id
    setText()
  end
end

--Resolve color codes to text
function printColor(which)
  --	local which
  --	if mode == "background" then which = backgroundColor
  --	elseif mode == "text" then which = textColor end
  if lang == "en" then
    if which == 1 then return "White"
    elseif which == 2 then return "Orange"
    elseif which == 4 then return "Magenta"
    elseif which == 8 then return "Lightblue"
    elseif which == 16 then return "Yellow"
    elseif which == 32 then return "Lime"
    elseif which == 64 then return "Pink"
    elseif which == 128 then return "Gray"
    elseif which == 256 then return "Lightgray"
    elseif which == 512 then return "Cyan"
    elseif which == 1024 then return "Purple"
    elseif which == 2048 then return "Blue"
    elseif which == 4096 then return "Brown"
    elseif which == 8192 then return "Green"
    elseif which == 16384 then return "Red"
    elseif which == 32768 then return "Black"
    end
  elseif lang == "de" then
    if which == 1 then return "Weiss"
    elseif which == 2 then return "Orange"
    elseif which == 4 then return "Magenta"
    elseif which == 8 then return "Hellblau"
    elseif which == 16 then return "Gelb"
    elseif which == 32 then return "Hellgruen"
    elseif which == 64 then return "Pink"
    elseif which == 128 then return "Grau"
    elseif which == 256 then return "Hellgrau"
    elseif which == 512 then return "Cyan"
    elseif which == 1024 then return "Lila"
    elseif which == 2048 then return "Blau"
    elseif which == 4096 then return "Braun"
    elseif which == 8192 then return "Gruen"
    elseif which == 16384 then return "Rot"
    elseif which == 32768 then return "Schwarz"
    end
  end
end

--Increase/decrease reactorOff/reactorOn setting
function setOnOffAt(vorz,anz)
  if vorz == "-" then
    if mode2 == "off" then
      reactorOffAt = reactorOffAt - anz
      if reactorOffAt < 0 then reactorOffAt = 0 end
    elseif mode2 == "on" then
      reactorOnAt = reactorOnAt - anz
      if reactorOnAt < 0 then reactorOnAt = 0 end
    elseif mode2 == "speed" then
      turbineTargetSpeed = turbineTargetSpeed - anz
      if turbineTargetSpeed < 0 then turbineTargetSpeed = 0 end
    elseif mode2 == "steam" then
      targetSteam = targetSteam - anz
      if targetSteam < 0 then targetSteam = 0 end
    end
  elseif vorz == "+" then
    if mode2 == "off" then
      reactorOffAt = reactorOffAt + anz
      if reactorOffAt >100 then reactorOffAt = 100 end
    elseif mode2 == "on" then
      reactorOnAt = reactorOnAt + anz
      if reactorOnAt >100 then reactorOnAt = 100 end
    elseif mode2 == "speed" then
      turbineTargetSpeed = turbineTargetSpeed + anz
    elseif mode2 == "steam" then
      targetSteam = targetSteam + anz
      if targetSteam >2000 then targetSteam = 2000 end
    end
  end
  if mode2 == "off" then setOffAt()
  elseif mode2 == "on" then setOnAt() end
end

--Sets the max. turbine speed
function setTurbineSpeed()
mode2 = "speed"
  mon.clear()
  currPage = touch4
  currPage:draw()
  mon.setBackgroundColor(backgroundColor)
  mon.setTextColor(textColor)
  mon.setCursorPos(3,2)
  if lang == "de" then
    mon.write("-- Turbinen Speed --")
    mon.setCursorPos(3,5)
    mon.write("Maximale Turbinengeschwindigkeit: "..(input.formatNumber(turbineTargetSpeed)).."RPM      ")
  elseif lang == "en" then
    mon.write("-- Turbine Speed --")
    mon.setCursorPos(3,5)
    mon.write("Maximum Turbine speed: "..(input.formatNumberComma(turbineTargetSpeed)).."RPM      ")
  end
  --refreshOptionList()
  getClick(setTurbineSpeed)
  setTurbineSpeed()
end

--Sets the max. turbine steam input
function setTurbineSteamRate()
  mode2 = "steam"
  mon.clear()
  currPage = touch4
  currPage:draw()
  mon.setBackgroundColor(backgroundColor)
  mon.setTextColor(textColor)
  mon.setCursorPos(3,2)
  if lang == "de" then
    mon.write("-- Turbinen Steam Input --")
    mon.setCursorPos(3,5)
    mon.write("Turbinen Steam Input-Rate: "..(input.formatNumber(targetSteam)).."mb/t      ")
  elseif lang == "en" then
    mon.write("-- Turbine Steam Input --")
    mon.setCursorPos(3,5)
    mon.write("Turbine Steam Input-Rate: "..(input.formatNumberComma(targetSteam)).."mb/t      ")
  end
  --refreshOptionList()
  getClick(setTurbineSteamRate)
  setTurbineSteamRate()
end

--Enable/Disable turbine at targetSpeed?
function changeTurbineBehaviour()
  if turbineOnOff == "off" then turbineOnOff = "on"
  elseif turbineOnOff == "on" then turbineOnOff = "off" end
  backToMainMenu()
end

--Reset the config file
function resetConfig()
  rodLevel = 0
  targetSteam = 2000
  backToMainMenu()
end

--Check for click events
function getClick(funct)
  local event,but = currPage:handleEvents(os.pullEvent())
  if event == "button_click" then
    currPage:flash(but)
    currPage.buttonList[but].func()
  else
    sleep(1)
    funct()
  end
end

--Run
mon.clear()
createAllButtons()
backToMainMenu()
