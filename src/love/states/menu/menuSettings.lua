--[[----------------------------------------------------------------------------
This file is part of Friday Night Funkin' Rewritten

Copyright (C) 2021  HTV04

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>.
------------------------------------------------------------------------------]]
local settingStuff = {}
local settingIndex = 1
local titleBG
return {
	enter = function(self, previous)
		settingStuff = {}
        for k,v in pairs(settings) do
			if settings.metadata[k] then
				table.insert(settingStuff, {
					key = k,
					metadata = settings.metadata[k],
					y = 0,
					targetY = 0
				})
			end
		end
		
		titleBG = graphics.newImage(paths.image(funkin.randomBG()))
	end,

	update = function(self, dt)
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
		elseif controls.pressed.up then
			settingIndex = settingIndex - 1
			if settingIndex <= 0 then settingIndex = #settingStuff end
		end

		if controls.pressed.back then
			switchState(menuSelect)
		end
	end,

	draw = function(self)
		love.graphics.push()
		love.graphics.translate(graphics.getWidth() / 2, graphics.getHeight() / 2)
		graphics.setColor(73, 101, 255)
		titleBG:draw()
		fonts('comic', 32)
		for i,setting in pairs(settingStuff) do
			printfOutline(setting.print, -((#setting.print/2) * 16), setting.y, nil, {alpha = (i == settingIndex and 1 or 0.5)})
		end
		graphics.setColor(0, 0, 0, 0.5)
		love.graphics.rectangle('fill', -1280/2, -720/2, 1280, 720 * 0.2)
		fonts('comic', 16)
		local desc = settingStuff[settingIndex].metadata[2]
		printfOutline(desc, -((#desc/2) * 8), (-720/2) + 50)
		love.graphics.pop()
	end,

	leave = function(self)
		settings:save()
		Timer.clear()
	end
}
