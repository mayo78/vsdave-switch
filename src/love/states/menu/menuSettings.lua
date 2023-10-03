
local settingStuff = {}
local settingIndex = 1
local titleBG
local curMenu = 'select'
local menuIndex = 1
local controlArray

local controlYs = {}
local menuStuff = {'General', 'Controls', 'Change Language'}
local settingControl = false
local controlIndex = 1
local descArray
local function updateDescArray()
	fonts('comic', 32)
	local desc = settingStuff[settingIndex].metadata[2]
	local w = curFont:getWidth(desc)
	if w > GAMESIZE.width then
		descArray = {}
		local ww = 0
		local spaceBuffer = ''
		local spaceWidth = 0
		local spaceArrayBuffer = {}
		local i = 0
		desc:gsub('.', function(c)
			i = i + 1
			ww = ww + curFont:getWidth(c)
			spaceWidth = spaceWidth + curFont:getWidth(c)
			spaceBuffer = spaceBuffer..c
			if c == ' ' or i == #desc then
				--print('adding word', spaceBuffer)
				table.insert(spaceArrayBuffer, spaceBuffer)
				spaceBuffer = ''
				spaceWidth = 0
			end
			if ww > (GAMESIZE.width - 115) or i == #desc then
				--print('new line :)', table.concat(spaceArrayBuffer, ''))
				table.insert(descArray, table.concat(spaceArrayBuffer, ''))
				ww = 0
				spaceArrayBuffer = {}
			end
		end)
		--print('this is the final thing', table.concat(descArray, '\n'))
	else
		descArray = {desc}
	end
end
return {
	enter = function(self, previous)
		controlArray = {
			{'Left Note', 'gameLeft'},
			{'Down Note', 'gameDown'},
			{'Up Note', 'gameUp'},
			{'Right Note', 'gameRight'},
			{'Game Five', 'gameFive'},
			{'Confirm', 'confirm'},
			{'Back', 'back'}
		}
		if save.save.foundMuko then
			for _,v in pairs{
				{'Close Door', 'mukoDoor'},
				{'Open Cameras', 'mukoCams'},
				{'Previous Camera', 'mukoPrev'},
				{'Next Camera', 'mukoNext'},
			} do
				table.insert(controlArray, v)
			end
		end
		menuYs = {}
		for i,menu in pairs(menuStuff) do
			menuYs[menu] = {-500, (64*i) - ((#menuStuff * 64)/2)}
		end
		confirm = paths.sounds'menu/confirm'
		titleBG = graphics.newImage(paths.image(funkin.randomBG()))
	end,

	update = function(self, dt)
		if curMenu == 'general' then
			for i,setting in pairs(settingStuff) do
				setting.targetY = -(100 * (-i + settingIndex)) - 100 + 50
				setting.y = lerp(setting.y, setting.targetY, dt * 15)
				setting.print = setting.metadata[1]..': <'..tostring(settings[setting.key])..'>'
			end
			local curSetting = settingStuff[settingIndex]
			local curValue = settings[curSetting.key]
			if controls.pressed.left then
				if type(curValue) == 'number' then
					curValue = curValue - curSetting.metadata[3].change
					if curValue < curSetting.metadata[3].min then curValue = curSetting.metadata[3].min end
				elseif type(curValue) == 'boolean' then
					curValue = not curValue
				end
			elseif controls.pressed.right then
				if type(curValue) == 'number' then
					curValue = curValue + curSetting.metadata[3].change
					if curValue > curSetting.metadata[3].max then curValue = curSetting.metadata[3].max end
				elseif type(curValue) == 'boolean' then
					curValue = not curValue
				end
			end
			if curValue ~= settings[curSetting.key] then
				settings[curSetting.key] = curValue
				if curSetting.metadata[3] and curSetting.metadata[3].onChange then curValue = curSetting.metadata[3].onChange(curValue) or curValue end
			end
			if controls.pressed.down then
				settingIndex = settingIndex + 1
				if settingIndex > #settingStuff then settingIndex = 1 end
				updateDescArray()
			elseif controls.pressed.up then
				settingIndex = settingIndex - 1
				if settingIndex <= 0 then settingIndex = #settingStuff end
				updateDescArray()
			end

			if controls.pressed.back then
				switchState(menuSettings)
			end
		elseif curMenu == 'select' then
			if controls.pressed.confirm then
				if menuIndex == 1 then
					settingStuff = {}
					for i,v in pairs(settings:getOrder()) do
						if settings.metadata[v] then
							table.insert(settingStuff, {
								key = v,
								metadata = settings.metadata[v],
								y = 0,
								targetY = 0,
								print = ''
							})
						end
					end
					updateDescArray()
					curMenu = 'general'
				elseif menuIndex == 2 then
					controlYs = {}
					for i,v in pairs(controlArray) do
						controlYs[v[2]] = {-720, (64 * i) - 100}
					end
					curMenu = 'controls'
				else
					languageState.fromSettings = true
					switchState(languageState)
				end	
			elseif controls.pressed.back then
				switchState(menuSelect)
			elseif controls.pressed.up then
				menuIndex = menuIndex - 1
				if menuIndex < 1 then
					menuIndex = #menuStuff
				end
			elseif controls.pressed.down then
				menuIndex = menuIndex + 1
				if menuIndex > #menuStuff then
					menuIndex = 1
				end
			end
			for i,v in ipairs(menuStuff) do
				menuYs[v][1] = lerp(menuYs[v][1], menuYs[v][2] - (64 * menuIndex), dt * 15)
			end
		elseif curMenu == 'controls' then
			if controlYs then
				for i,v in pairs(controlArray) do
					controlYs[v[2]][1] = lerp(controlYs[v[2]][1], controlYs[v[2]][2] - (64 * controlIndex), dt * 15)
				end
			end
			if not settingControl then
				if controls.pressed.up then
					controlIndex = controlIndex - 1
					if controlIndex < 1 then
						controlIndex = #controlArray
					end
				elseif controls.pressed.down then
					controlIndex = controlIndex + 1
					if controlIndex > #controlArray then
						controlIndex = 1
					end
				elseif controls.pressed.confirm then
					settingControl = true
					confirm:stop()
					confirm:play()
				elseif controls.pressed.back then
					switchState(menuSettings)
				end
			else
				for _,control in pairs(bindableKeys) do
					if controls.pressed[control] then
						confirm:stop()
						confirm:play()
						settings[controlArray[controlIndex][2]][3] = control
						settingControl = false
						settings:save()
						reloadInput()
						break;
					end
				end
				if controls.pressed.select then
					settingControl = false
				end
			end
		end
	end,

	draw = function(self)
		love.graphics.push()
		love.graphics.translate(graphics.getWidth() / 2, graphics.getHeight() / 2)
		graphics.setColor(73, 101, 255)
		titleBG:draw()
		fonts('comic', 32)
		if curMenu == 'general' then
			for i,setting in pairs(settingStuff) do
				printfOutline(setting.print, -curFont:getWidth(setting.print)/2, setting.y, nil, {alpha = (i == settingIndex and 1 or 0.5)})
			end
			graphics.setColor(0, 0, 0, 0.5)
			love.graphics.rectangle('fill', -S_HALF_WIDTH, -S_HALF_HEIGHT, GAMESIZE.width, GAMESIZE.height * 0.2)
			fonts('comic', 32)
			for i,v in pairs(descArray) do
				printfOutline(v, -curFont:getWidth(v)/2, (-S_HALF_HEIGHT) + 50 + (curFont:getHeight() * (i-1)))
			end
		elseif curMenu == 'select' then
			for i,txt in pairs(menuStuff) do
				printfOutline(txt, -curFont:getWidth(txt)/2, menuYs[txt][1], nil, {alpha = ((i == menuIndex) and 1 or 0.5)})
			end
		elseif curMenu == 'controls' then
			for i,data in pairs(controlArray) do
				local str = data[1]..' | '..(controlList[data[2]][3]:split':'[2]:gsub('+', ''))
				printfOutline(str, -curFont:getWidth(str)/2, controlYs[data[2]][1], nil, {alpha = (i == controlIndex and 1 or 0.5), color = ((i == controlIndex and settingControl) and {1, 1, 0} or {1, 1, 1})})
			end
			if settingControl then
				graphics.setColor(0, 0, 0, 0.5)
				love.graphics.rectangle('fill', -S_HALF_WIDTH, -S_HALF_HEIGHT, GAMESIZE.width, GAMESIZE.height * 0.2)
				fonts('comic', 32)
				local desc = 'Bind a key to this action or press SELECT to cancel'
				printfOutline(desc, -curFont:getWidth(desc)/2, (-S_HALF_HEIGHT) + 50)
			end
		end
		love.graphics.pop()
	end,

	leave = function(self)
		settings:save()
		Timer.clear()
		curMenu = 'select'
		controlYs = nil
	end
}
