--just the settings stuff but theres a bit more this itme!
local s = {}
s.save = {}
s.highscores = {}
function s:writeSave()
	print'saving nowe'
	local lines = {}
	for k,v in pairs(s.save) do
		print('saving value', k, v, type(v))
		local value = v
		if type(v) == 'boolean' then value = tostring(v)
		elseif type(v) == 'table' then value = table.concat(v, ',')
		end
		table.insert(lines, table.concat({type(v), k, value}, ' '))
	end
	love.filesystem.write('save.txt', table.concat(lines, '\n'))
	local highlines = {}
	for k,v in pairs(s.highscores) do
		local yay = table.concat({k, v}, ' ')
		print('saving line', table.concat({k, v}, ' '))
		table.insert(highlines, yay)
	end
	love.filesystem.write('highscores.txt', table.concat(highlines, '\n'))
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
			local key, value = unpack(line:split' ')
			s.highscores[key] = tonumber(value)
		end
	end
else
	s:writeSave()
end

return s