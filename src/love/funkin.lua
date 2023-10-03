local f = {};

f.weekIndex = 1
f.songIndex = 1
f.difficulties = {'easy', 'normal', 'hard'} --name of diff
f.difficultyChart = {'-easy', '', '-hard'} --name of chart suffix
f.difficulty = 1
f.weeks = {}
f.weekOrder = {}
function f:getWeek(week)
	local ok = love.filesystem.load("weekFiles/"..week..'.lua')()
	ok._WEEKNAME = week
	return ok
end
f.freeplayList = {
	dave = {},
	joke = {f:getWeek 'week5', f:getWeek 'extrajoke'},
	extras = {f:getWeek 'extra'},
	terminal = {f:getWeek 'console'},
	uhoh = {{
		songs = {
			{
				'exploitation',
				'expunged-pixel'
			}
		},
		color = 'other',
		storyColor = '4965FF',
		banner = 'DaveHouse',
		name = "Dave's fun rapping battle!"
	}}
}
for i=0,5 do
	local week = f:getWeek('week'..i)
	f.weeks['week'..i] = week
	if i ~= 5 then table.insert(f.freeplayList.dave, week) 
	--else table.insert(f.freeplayList.joke, week)
	end
	table.insert(f.weekOrder, 'week'..i)
end
local bgPaths = {
	'Aadsta',
	'ArtiztGmer',
	'DeltaKastel',
	'DeltaKastel2',
	'DeltaKastel3',
	'DeltaKastel4',
	'DeltaKastel5',
	'diamond man',
	'Jukebox',
	'kiazu',
	'Lancey',
	'mamakotomi',
	'mantis',
	'mepperpint',
	'morie',
	'neon',
	'Onuko',
	'ps',
	'ricee_png',
	'sk0rbias',
	'SwagnotrllyTheMod',
	'zombought'
}

function f:randomBG()
	return 'dave/title/backgrounds/'..bgPaths[love.math.random(1, #bgPaths)]
end

return f;