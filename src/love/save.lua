--just the settings stuff but theres a bit more this itme!
local s = {}
s.save = {}
s.highscores = {}
s.highscoreChars = {} --stupid
function s:writeSave()
	--print'saving nowe'
	local lines = {}
	for k,v in pairs(s.save) do
		--print('saving value', k, v, type(v))
		local value = v
		if type(v) == 'boolean' then value = tostring(v)
		elseif type(v) == 'table' then value = table.concat(v, ',')
		end
		table.insert(lines, table.concat({type(v), k, value}, ' '))
	end
	local str = table.concat(lines, '\n')
	love.filesystem.write('save.txt', str)
	local highlines = {}
	for k,v in pairs(s.highscores) do
		local yay = table.concat({k, v, s.highscoreChars[k] or 'bf'}, ' ')
		--print('saving line', table.concat({k, v}, ' '))
		table.insert(highlines, yay)
	end
	local highstr = table.concat(highlines, '\n')
	love.filesystem.write('highscores.txt', highstr)
	return str, highstr
end
--settings:writeSave()

local hasSave = love.filesystem.getInfo 'save.txt'
local hasHighscore = love.filesystem.getInfo 'highscores.txt'
local settingsRaw, highscoreRaw
if hasSave then 
	settingsRaw = paths.read 'save.txt' 
	highscoreRaw = hasHighscore and paths.read 'highscores.txt'
end
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
			s.save[key] = value
		end
	end
	if hasHighscore then
		local me = highscoreRaw:split '\n'
		for _,line in pairs(me) do
			local key, value, char = unpack(line:split' ')
			s.highscores[key] = tonumber(value)
			s.highscoreChars[key] = char or 'bf'
		end
	end
else
	s:writeSave()
end

return s