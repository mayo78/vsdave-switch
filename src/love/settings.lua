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

local curOS = love.system.getOS()
--note: only string arrays supported! lol! get rekt! noob! loser!
local settings = { --default values
	eyesores = true, 
	modcharts = true, 
	shoulderControls = true,
	gameLeft = {'d', 'left'},
	gameDown = {'f', 'down'},
	gameUp = {'j', 'up'},
	gameRight = {'k', 'right'},
	volume = 1,
	hardwareCompression = true,
	downscroll = false,
	showDebug = false,
	settingsVer = 'DAVE_1',
	fullscreentype = 'desktop',
	vsync = 0,
	width = 1280,
	height = 720,
	metadata = { --oops this daveing sucks
		eyesores = {'Eyesore effects', 'Whether to show eye straining effects or not'},
		modcharts = {'Modcharts', 'Whether to have modcharts that makes it hard to play'},
		shoulderControls = {'Shoulder Controls', 'Unchecking this will have you play with the buttons, and key five will become the shoulder buttons', {onChange = function() input = reloadInput() end}},
		volume = {'Master Volume', '', {min = 0, max = 1, change = 0.1, onChange = function(v) love.audio.setVolume(v) end}},
		downscroll = {'Downscroll', 'checking this puts the strums on the bottom, and makes the notes come from the top'}
	}
}
print(love.filesystem.getSaveDirectory())
function settings:save()
	local str = {}
	local lines = {}
	for k,v in pairs(settings) do
		if k ~= 'save' and k ~= 'metadata' then
			--print('saving value', k, v, type(v))
			local value = v
			if type(v) == 'boolean' then value = tostring(v)
			elseif type(v) == 'table' then value = table.concat(v, ',')
			end
			table.insert(lines, table.concat({type(v), k, value}, ' '))
		end
	end
	str = table.concat(lines, '\n')
	love.filesystem.write('settings.txt', str)
	return str
end
--settings:save()

local hasWhatever = love.filesystem.getInfo 'settings.txt'
local settingsRaw
if hasWhatever then settingsRaw = paths.read 'settings.txt' end
if settingsRaw then
	--print('loading settings:', settingsRaw)
	local hiii = settingsRaw:split('\n')
	for _,line in pairs(hiii) do
		local typey, key, value = unpack(line:split ' ')
		if value then
			--print('reading this', line)
			if typey == 'number' then value = tonumber(value)
			elseif typey == 'boolean' then value = value == 'true'
			elseif typey == 'table' then value = value:split ','
			end
			--print('got value', value)
			--if type(value) == 'table' then print(table.concat(value, ';')) end
			settings[key] = value
		end
	end
	love.audio.setVolume(settings.volume)
else
	settings:save()
end


if curOS == 'NX' then
	love.window.setMode(1920, 1080)
elseif curOS == 'web' then
	love.window.setMode(1280, 720) -- Due to shared code, lovesize will be used even though the resolution will never change :/
else
	if settings.fullscreen then
		love.window.setMode(
			settings.width,
			settings.height,
			{
				fullscreen = true,
				fullscreentype = settings.fullscreentype,
				vsync = settings.vsync
			}
		)
	else
		love.window.setMode(
			settings.width,
			settings.height,
			{
				vsync = settings.vsync,
				resizable = true
			}
		)
	end
end

return settings
