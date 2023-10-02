


local coolWeeks
local weekIndex = 1

local banner

local colory
local curColor

local stupid

local butts

local targetButt

local targetScore = 0
local curScore = 49324858

local purpleColor, blueColor

local listText

local selectSound, confirmSound, leaving

local sevenshit, sevenalpha, sevenshake

local function change(how)
	weekIndex = weekIndex + how
	if weekIndex > #coolWeeks then
		weekIndex = 1
	elseif weekIndex < 1 then
		weekIndex = #coolWeeks
	end
	banner:setImage(paths.image('dave/title/weekbanners/'..coolWeeks[weekIndex][3]))
	--print('MY NWEW COLOLR', coolWeeks[weekIndex][1].color)
	colory = {hex2rgb(colors:get(coolWeeks[weekIndex][1].storyColor))}
	for i,butt in pairs(butts) do
		targetButt[i] = (butt.width*1.25) * (i-weekIndex) + S_HALF_WIDTH
	end
	targetScore = save.highscores[coolWeeks[weekIndex][4]] or 0
	if coolWeeks[weekIndex][1]._WEEKNAME == 'weekquestionmark' then
		listText = '??? - ??? - ???'
	else
		local tab = {}
		for i,song in pairs(coolWeeks[weekIndex][1].songs) do
			local stupid = song[1]:gsub('-', ' ')
			table.insert(tab, stupid)
		end
		listText = table.concat(tab, ' - ')
	end
	if how ~= 0 then 
		selectSound:stop()
		selectSound:play() 
	end
end

local confirmed

local blued = false
local function blueLoop()
	blued = not blued
	Timer.after(0.1, blueLoop)
end

local awaitingMasterWeek

return {
	enter = function(self)
		coolWeeks = {
			{funkin.weeks.week0, lm.string.story_tutorial, 'warmup', '_WEEK0'},
			{funkin.weeks.week1, lm.string.story_daveWeek, 'davehouse', '_WEEK1'},
			{funkin.weeks.week2, lm.string.story_bambiWeek, 'bamboi', '_WEEK2'},
			{funkin.weeks.week3, lm.string.story_finale, 'splitathon', '_WEEK3'},
			{funkin.weeks.week4, lm.string.story_festivalWeek, 'festival', '_WEEK4'},
		}
		if save.save.found_joke then
			local hi = table.copy(funkin.weeks.week5)
			if save.save.played_joke then
				table.insert(coolWeeks, {hi, lm.string.story_masterWeek, 'masterweek', '_WEEK5'})
			else
				hi._WEEKNAME = 'weekquestionmark'
				table.insert(coolWeeks, {hi, lm.string.story_masterWeekToPlay, 'masterweekquestion', '_WEEK5'})
			end
		end
		leaving = false
        selectSound = paths.sound('menu/select')
        confirmSound = paths.sound('menu/confirm')
		confirmed = false
		butts = {}
		targetButt = {}
		for i,w in pairs(coolWeeks) do
			paths.image('dave/title/weekbanners/'..w[3])
			local butt = graphics.newImage(paths.image('dave/title/storymenu/'..w[1]._WEEKNAME))
			butts[i] = butt
			butt.y = 620
			targetButt[i] = (butt.width*1.25) * (i-1) + S_HALF_WIDTH
		end
		banner = graphics.newImage(paths.image('dave/title/weekbanners/'..coolWeeks[weekIndex][3]))
		banner.x, banner.y = banner.width/2, banner.height/2 + 52
		stupid = banner.y - banner.height/2
		purpleColor = {hex2rgb '0xFFe55777'}
		blueColor = {hex2rgb '0xFF33ffff'}
		if awaitingMasterWeek then
			weekIndex = 6
		end
		change(0)
		curColor = table.copy(colory)
		sevenshit, sevenalpha, sevenshake = false, 0, 0
		paths.sound 'doom'
		awaitingMasterWeek = false
	end,

	update = function(self, dt)
		if transOut then return end
		if not sevenshit then
			if controls.pressed.right then
				change(1)
			elseif controls.pressed.left then
				change(-1)
			elseif controls.pressed.confirm then
				confirmed = true
				love.audio.play(confirmSound)
				blueLoop()
				local week = coolWeeks[weekIndex]
				curWeek = week[4]
				songIndex = 1
				storyMode = true
				local tab = {}
				for i,song in pairs(coolWeeks[weekIndex][1].songs) do
					print('ADDINGSONG TO SONG LIST', song[1])
					table.insert(tab, song[1]:lower())
				end
				funkin.songList = tab
				funkin.curSong = funkin.songList[1]:lower()
				completeScore = 0
				charOverride = nil
				scoreMultiplier = {1, 1, 1, 1}
				if curWeek == '_WEEK1' then
					local scale = 1280/1920
					switchState(layeredCutscene, true, 'daveCutscene', 'cutscenes/daveCutscene', 30, {scale, scale, scale, scale, scale, scale}, {[4] = point(626.3)}, true)
				else
					if curWeek == '_WEEK5' and not save.save.played_joke then
						save.save.played_joke = true
						save.writeSave()
					end
					switchState(stage)
				end
			elseif controls.pressed.back and not leaving then
				leaving = true
				switchState(menuSelect)
			elseif not save.save.found_joke and press7() then
				sevenshit = true
				local v = {0,0}
				local vol = {1}
				paths.sound 'doom':play()
				Timer.tween(5.05, v, {1, 10}, nil, {during = function()
					sevenalpha = v[1]
					sevenshake = v[2]
				end, after = function()
					save.save.found_joke = true
					save.save.played_joke = false
					save.writeSave()
					awaitingMasterWeek = true
					switchState(menuWeek)
				end})
				Timer.tween(1, vol, {0}, nil, {during = function()
					paths.music'menu/menu':setVolume(vol[1])
				end, after = function()
					paths.music'menu/menu':stop()
					paths.music'menu/menu':setVolume(1)
				end})
			end
		end
		for i=1,3 do
			curColor[i] = lerp(curColor[i], colory[i], dt * 15)
		end
		for i,butt in pairs(butts) do
			butt.x = lerp(butt.x, targetButt[i], dt * 20)
		end
		curScore = math.floor(lerp(curScore, targetScore, 0.4))
	end,

	draw = function(self)
		--print(lm.string.story_tutorial)
		love.graphics.push()
		if sevenshake > 0 then
			love.graphics.translate(love.math.random(-sevenshake, sevenshake), love.math.random(-sevenshake, sevenshake))
		end
		graphics.setColor(rgb255(curColor[1], curColor[2], curColor[3]))
		love.graphics.rectangle('fill', 0, stupid, banner.width, banner.height)
		graphics.setColor(1, 1, 1)
		banner:draw()
		for i,spr in pairs(butts) do 
			if not blued or (i ~= weekIndex) then
				graphics.setColor(1, 1, 1, (i == weekIndex) and 1 or 0.7)
			elseif blued and (i == weekIndex) then
				graphics.setColor(rgb255(unpack(blueColor)))
			end
			spr:draw() 
		end
		graphics.setColor(1, 1, 1)
		fonts('comic', 36)
		love.graphics.print('SCORE: '..curScore, 10, 0)
		fonts('comic', 32)
		local ay = coolWeeks[weekIndex][2]
		graphics.setColor(1, 1, 1, 0.7)
		love.graphics.print(ay, 1280 - curFont:getWidth(ay), 0)
		graphics.setColor(rgb255(unpack(purpleColor)))
		fonts('comic', 28)
		love.graphics.print(lm.string.story_track:upper(), (S_HALF_WIDTH) - curFont:getWidth(lm.string.story_track:upper())/2, stupid + banner.height + 20)
		love.graphics.print(listText, (S_HALF_WIDTH) - curFont:getWidth(listText)/2, stupid + banner.height + 20 + 28)
		if sevenalpha > 0 then
			love.graphics.setColor(1,1,1,sevenalpha)
			love.graphics.rectangle('fill', 0, 0, 1280, 720)
		end
		love.graphics.pop()
	end,

	leave = function(self)
		table.clear(butts)
		table.clear(targetButt)
		Timer.clear()
		if confirmed then
			love.audio.stop()
		end
	end
}
