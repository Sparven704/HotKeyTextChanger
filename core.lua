function updateHotkeyText()
	local ActionBars = {'Action','MultiBarBottomLeft','MultiBarBottomRight','MultiBarRight','MultiBarLeft'}
	--iterate the different actionbars
	for _, barName in pairs(ActionBars) do
		--iterate the individual actionbar buttons (12 each)
		for i = 1, 12 do
			local button = _G[barName .. 'Button' .. i]
			local hotkey = button['HotKey']
			local text = hotkey:GetText()
			if text ~= nil then
				---------------------
				--Modifiers
				---------------------
				--shift
				text = string.gsub(text, "(s%-)", "S")
				--alt
				text = string.gsub(text, "(a%-)", "A")
				--ctrl
				text = string.gsub(text, "(c%-)", "C")
				---------------------
				--Mouse-Buttons
				---------------------
				--Left Mouse Button
				text = string.gsub(text, KEY_BUTTON1, "LM")
				--Right Mouse Button
				text = string.gsub(text, KEY_BUTTON2, "RM")
				--Middle Mouse Button
				text = string.gsub(text, KEY_BUTTON3, "MM")
				--Mouse Extra Button 1
				text = string.gsub(text, KEY_BUTTON4, "M4")
				--Mouse Extra Button 2
				text = string.gsub(text, KEY_BUTTON5, "M5")
				text = string.gsub(text, KEY_MOUSEWHEELDOWN, "MWD")
				text = string.gsub(text, KEY_MOUSEWHEELUP, "MWU")
				---------------------
				--Special Keys
				---------------------
				text = string.gsub(text, KEY_PAGEUP, "PU")
				text = string.gsub(text, KEY_PAGEDOWN, "PD")
				text = string.gsub(text, KEY_SPACE, "SpB")
				text = string.gsub(text, KEY_INSERT, "Ins")
				text = string.gsub(text, KEY_HOME, "Hm")
				text = string.gsub(text, KEY_DELETE, "Del")
				---------------------
				--Numpad
				---------------------
				text = string.gsub(text, "Num Pad %.", "N.")
				text = string.gsub(text, "Num Pad %/", "N/")
				text = string.gsub(text, "Num Pad %-", "N-")
				text = string.gsub(text, "Num Pad %*", "N*")
				text = string.gsub(text, "Num Pad %+", "N+")
				text = string.gsub(text, KEY_NUMLOCK, "NL")
				text = string.gsub(text, KEY_NUMPAD0, "N0")
				text = string.gsub(text, KEY_NUMPAD1, "N1")
				text = string.gsub(text, KEY_NUMPAD2, "N2")
				text = string.gsub(text, KEY_NUMPAD3, "N3")
				text = string.gsub(text, KEY_NUMPAD4, "N4")
				text = string.gsub(text, KEY_NUMPAD5, "N5")
				text = string.gsub(text, KEY_NUMPAD6, "N6")
				text = string.gsub(text, KEY_NUMPAD7, "N7")
				text = string.gsub(text, KEY_NUMPAD8, "N8")
				text = string.gsub(text, KEY_NUMPAD9, "N9")
				---------------------
				 
				if hotkey:GetText() == RANGE_INDICATOR then
					hotkey:SetText('')
				else
					hotkey:SetText(text)
				end
			end
		end
	end
end

local function OnEvent(self, event, isInitialLogin, isReloadingUi)
	updateHotkeyText()
end

local f = CreateFrame("Frame")
f:RegisterEvent("PLAYER_LOGIN")
f:RegisterEvent("UPDATE_BINDINGS")
f:SetScript("OnEvent", OnEvent)