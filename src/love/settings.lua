local curOS = love.system.getOS()
--note: only string arrays supported! lol! get rekt! noob! loser!
local settings = {}
local default = { --default values
	eyesores = true, 
	modcharts = true, 
	--controls, first two are keyboard keys and may seem weird, but the controls setting menu only changes the third control in the list!
	controls = {
		gameLeft = {'key:d', 'key:left', 'axis:triggerleft+'},
		gameDown = {'key:f', 'key:down', 'button:leftshoulder'},
		gameUp = {'key:j', 'key:up', 'button:rightshoulder'},
		gameRight = {'key:k', 'key:right', 'axis:triggerright+'},
		gameFive = {'key:space', 'key:b', 'button:a'},
		confirm = {"key:return", "key:y", "button:b"},
		back = {"key:escape", "key:n", "button:a"},
		mukoNext = {"key:l", 'key:u', 'button:leftshoulder'},
		mukoPrev = {'key:j', 'key:i', 'button:rightshoulder'},
		mukoCams = {'key:space', 'key:b', 'button:a'},
		mukoDoor = {'key:e', 'key:f', 'button:b'},
	},
	volume = 1,
	downscroll = false,
	showDebug = false,
	settingsVer = 'DAVE_4',
	selfAwareness = true,
	metadata = { --oops this daveing sucks
		eyesores = {'Eyesore effects', 'Whether to show eye straining effects or not'},
		modcharts = {'Modcharts', 'Whether to have modcharts that makes it hard to play'},
		volume = {'Master Volume', '', {min = 0, max = 1, change = 0.1, onChange = function(v) 
			if v < 0.1 then
				v = 0
			end
			love.audio.setVolume(v) 
			return v
		end}},
		downscroll = {'Downscroll', 'checking this puts the strums on the bottom, and makes the notes come from the top'},
		selfAwareness = {'Self Awareness', 'If disabled, Exploitation will not use your current user\'s nickname.', {onChange = function(v)
			nickname = (love.getNickname and v) and love.getNickname() or 'User'
		end}},
		showDebug = {'Show debug', 'This will show debug information on screen!'},
	}
}
function settings:reset()
	for i,v in pairs(default) do
		self[i] = v
	end
	print(love.filesystem.getSaveDirectory())
	function settings:save()
		local clean = table.copy(self)
		for i,v in pairs(clean) do
			if type(v) == 'function' or i == 'metadata' then
				clean[i] = nil
				v = nil
				--print('getting rid of', i)
			--else
			--	print('keeping', i)
			end
		end
		local raw = json.encode(clean)
		love.filesystem.write('settings.json', raw)
		--print ('saved this', raw)
		return raw
	end
	--settings:save()

	local hasWhatever = love.filesystem.getInfo 'settings.json'
	local settingsRaw
	if hasWhatever then settingsRaw = paths.read 'settings.json' end
	if settingsRaw then
		local me = json.decode(settingsRaw)
		for i,v in pairs(me) do
			self[i] = v
		end
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
	love.window.setMode(
		1280,
		720,
		{
			vsync = 0,
			resizable = true
		}
	)
end

return settings
