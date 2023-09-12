
--i just realized i should've used a json for the save someone remind me to convert later
local curOS = love.system.getOS()
--note: only string arrays supported! lol! get rekt! noob! loser!
local settings = {}
settings.default = { --default values
	eyesores = true, 
	modcharts = true, 
	shoulderControls = true,
	gameLeft = {'key:d', 'key:left', 'axis:triggerleft+'},
	gameDown = {'key:f', 'key:down', 'button:leftshoulder'},
	gameUp = {'key:j', 'key:up', 'button:rightshoulder'},
	gameRight = {'key:k', 'key:right', 'axis:triggerright+'},
	gameFive = {'key:space', 'key:b', 'button:a'},
	confirm = {"key:return", "key:y", "button:b"},
	back = {"key:escape", "key:n", "button:a"},
	mukoNext = {"key:j", 'key:u', 'button:leftshoulder'},
	mukoPrev = {'key:l', 'key:i', 'button:rightshoulder'},
	mukoCams = {'key:space', 'key:b', 'button:b'},
	mukoDoor = {'key:e', 'key:f', 'button:a'},
	volume = 1,
	hardwareCompression = true,
	downscroll = false,
	showDebug = false,
	settingsVer = 'DAVE_3',
	fullscreentype = 'desktop',
	vsync = 0,
	width = 1280,
	height = 720,
	selfAwareness = true,
	metadata = { --oops this daveing sucks
		eyesores = {'Eyesore effects', 'Whether to show eye straining effects or not'},
		modcharts = {'Modcharts', 'Whether to have modcharts that makes it hard to play'},
		volume = {'Master Volume', '', {min = 0, max = 1, change = 0.1, onChange = function(v) love.audio.setVolume(v) end}},
		downscroll = {'Downscroll', 'checking this puts the strums on the bottom, and makes the notes come from the top'},
		selfAwareness = {'Self Awareness', 'If disabled, Exploitation will not use your current user\'s nickname.'}
	}
}
function settings:reset()
	settings = table.copy(settings.default)
	print(love.filesystem.getSaveDirectory())
	function settings:save()
		local str = {}
		local lines = {}
		for k,v in pairs(settings) do
			if k ~= 'save' and k ~= 'metadata' and k ~= 'reset' then
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
end
settings:reset()
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
if settings.settingsVer == 'DAVE_1' then --reset controls if settings are old maybe
	settings.gameLeft = {'key:d', 'key:left', 'axis:triggerleft+'}
	settings.gameDown = {'key:f', 'key:down', 'button:leftshoulder'}
	settings.gameUp = {'key:j', 'key:up', 'button:rightshoulder'}
	settings.gameRight = {'key:k', 'key:right', 'axis:triggerright+'}
	settings.gameFive = {'key:space', 'key:b', 'button:a'}
	settings.confirm = {"key:return", "key:y", "button:b"}
	settings.back = {"key:escape", "key:n", "button:a"}
	settings.settingsVer = 'DAVE_3'
end

return settings
