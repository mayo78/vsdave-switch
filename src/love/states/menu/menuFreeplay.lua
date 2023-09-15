local weekNum = 1
local songNum, songAppend
local songDifficulty = 2

local titleBG
local selectSound
local confirmSound
local catStrings

local inRealFreeplay
local cats = {}
local catIndex = 1

local songs = {}
local songIndex = 1
local icons = {}
local leaving = false
local targetColor = {0, 0, 0}
local colors = {}
local noCat = false
local curScore, targetScore

local lastCat

local targetX, targetY


--recursed
local timeSincePress
local lastTimeSincePress

local pressSpeed
local pressSpeeds = {}
local pressUnlockNumber
local lastKey
local stringKey

local canMove

local recursedScale
local recursedPrints

local function resetPresses()
	table.clear(pressSpeeds)
	pressUnlockNumber = love.math.random(20,40)
	timeSincePress = 0
	lastTimeSincePress = 0
end
local function changeCat(how)
	catIndex = catIndex + how
	if catIndex > #catStrings then catIndex = 1
	elseif catIndex <= 0 then catIndex = #catStrings
	end
end
local shakeAmount, shakeTime
local function changeSong(how)
	songIndex = songIndex + how
	if songIndex > #songs then songIndex = 1
	elseif songIndex <= 0 then songIndex = #songs
	end
	targetScore = save.highscores[songs[songIndex][1]:lower()] or 0

	local key = how > 0 and 'up' or 'down'
	if lastKey ~= key then
		lastKey = key
		resetPresses()
	else
		pressSpeed = timeSincePress - lastTimeSincePress
		lastTimeSincePress = timeSincePress
		timeSincePress = 0
		table.insert(pressSpeeds, math.abs(pressSpeed))
		local shakeCheck = #pressSpeeds % 5
		if shakeCheck == 0 and #pressSpeeds > 0 and not save.save.found_recursed then
			shakeAmount = 3 * (#pressSpeeds / 5)
			shakeTime = 0.2
			paths.sounds 'recursed/thud':stop()
			paths.sounds 'recursed/thud':play()
		end
	end
end
local function recurserUnlock()
	save.save.found_recursed = true
	save.writeSave()
	canMove = false

	love.audio.stop()
	paths.sound 'recursed/rumble':play()
	local boom = paths.sound 'recursed/boom'
	shakeAmount = 15
	shakeTime = 3
	Timer.after(3, function()
		overlayColor.alpha = 1
		Timer.tween(1, overlayColor, {alpha = 0})
		titleBG.color = {44, 44, 44}
		paths.sound 'recursed/rumble':stop()
		paths.sound 'recursed/ambience':play()
		boom:play()
		for i,v in pairs(icons) do
			v.angle = 0
			Timer.tween(4, v, {x = love.math.random(-1280/2, 1280/2), y = love.math.random(-500, 100), angle = love.math.random(-360, 360)}, 'out-cubic')
		end
		local bigString = {}
		recursedPrints = {}
		for i,v in ipairs(songs) do
			local hi = 0
			v[1]:gsub(".", function(c)
				if c ~= '-' then
					hi = hi + 1
					table.insert(recursedPrints, {
						x = -500 + (75*i) + targetX + (72*hi),
						y = -100 + (-165*i) + targetY,
						angle = 0,
						print = c
					})
				end
			end)
		end

		for i,v in pairs(recursedPrints) do
			v.angle = 0
			Timer.tween(4, v, {x = love.math.random(-1280/2, 1280/2), y = love.math.random(-500, 100), angle = love.math.random(-360, 360)}, 'out-cubic')
		end
		
		local hi = {1}
		Timer.tween(4, hi, {0}, 'out-cubic', {during = function()
			recursedScale = hi[1]
		end, after = function()
			shakeAmount = 5
			shakeTime = 3
			paths.sound 'recursed/ambience':stop()
			paths.sound 'recursed/rumble':play()
			paths.sound 'recursed/piecedTogether':play()
			for i,v in pairs(icons) do
				Timer.tween(1, v, {x = 0, y = 0, angle = 0}, 'out-back')
			end
			for i,v in pairs(recursedPrints) do
				Timer.tween(1, v, {x = 0, y = 0, angle = 0}, 'out-back')
			end
			Timer.tween(3, overlayColor, {alpha = 1}, nil, function()
				overlayColor = {0,0,0,alpha = 1}
				paths.sound 'recursed/recurser_laugh':play()
				Timer.after(paths.sound 'recursed/recurser_laugh':getDuration 'seconds', function()
					funkin.curSong = 'recursed'
					switchState(stage)
				end)
			end)
		end})
	end)
end
return {
	enter = function(self, previous)
		recursedScale = 1
		canMove = true
		shakeAmount, shakeTime = 0,0
		recursedCooldown, recursedCount = 0, 0
		inRealFreeplay = false
		table.clear(icons)
		table.clear(cats)
		table.clear(songs)
		resetPresses()
		if not save.save.found_terminal then 
			catStrings = {'dave', 'joke', 'extras'}
		else 
			catStrings = {'dave', 'joke', 'extras', 'terminal'}
		end
		targetX, targetY = 75 * 25, 165 * 25
        selectSound = paths.sound('menu/select')
        confirmSound = paths.sound('menu/confirm')
		targetColor = nil
		leaving = false
		songNum = 0
		noCat = false
		curScore = 42353

		titleBG = graphics.newImage(paths.image(funkin.randomBG()))
		titleBG.color = {73, 101, 255}
		
		for _,cat in ipairs(catStrings) do
			local spr = graphics.newImage(paths.image('dave/title/packs/'..cat))
			spr.alpha = 1
			table.insert(cats, spr)
		end

	end,

	update = function(self, dt)
		if shakeTime > 0 then
			shakeTime = shakeTime - dt
		end
		if drawTransition or leaving then return end
		if not inRealFreeplay then
			if controls.pressed.left and not noCat then
				changeCat(-1)
			elseif controls.pressed.right and not noCat then
				changeCat(1)
			elseif controls.pressed.back then
				switchState(menuSelect)
			elseif controls.pressed.confirm and not noCat then
				noCat = true
				audio.playSound(confirmSound)
				Timer.after(0.1, function()
					cats[catIndex].alpha = 1
					Timer.tween(1, cats[catIndex], {alpha = 0, y = -720}, 'out-expo', function()
						inRealFreeplay = true
						if catIndex ~= lastCat then songIndex = 1 end
						for _,cat in pairs(cats) do
							cat.dontdraw = true
						end
						
						--print('idiots', funkin.freeplayList.extras, funkin.freeplayList.extras[1], funkin.freeplayList.extras[2], funkin.freeplayList.extras[2].songs[1][1])
						for k,cat in pairs(funkin.freeplayList) do
							print('hiii')
							local docat = k == catStrings[catIndex]
							if k == 'terminal' and not save.save.found_terminal then
								print 'its the terminal song!!! and terminal not found oops!'
								docat = catIndex == 2
							end
							if docat then
								print('found a guy')
								for _,week in pairs(cat) do
									for _,song in ipairs(week.songs) do
										--song[4] = nil
										if not song[4] or save.save[song[4]] then
											song[3] = _G.colors[song[3] or week.color] or (song[3] or week.color)
											table.insert(songs, song)
											local icon = graphics.newSprite(
												paths.image("dave/icons/"..song[2]),
												{{x = 0, y = 0, width = 150, height = 150}, {x = 0, y = 0, width = 150, height = 150}}, 
												{idle = {start = 1, stop = 2, speed = 0, offsetX = 0, offsetY = 0}},
												"idle",
												false,
												{smartOffsets = true}
											)
											icon.y = -25
											if song[2]:endsWith '-pixel' then icon.image:setFilter(getAA(false)) end
											icons[song[1]] = icon
											colors[song[1]:lower()] = {hex2rgb(song[3])}
											print('adding song', song[1])
										end
									end
								end
							end
						end
						targetScore = save.highscores[songs[1][1]:lower()] or 0
					end)
				end)
			end
			for i,cat in ipairs(cats) do
				local targetX = -(1280 * (-i + catIndex))
				cat.x = math.lerp(cat.x, targetX, dt * 15)
			end
		elseif canMove then
			timeSincePress = timeSincePress + dt
			if timeSincePress > 2 and #pressSpeeds > 0 then
				resetPresses()
			end
			if #pressSpeeds > pressUnlockNumber and not save.save.found_recursed then
				local canPass = true
				for k,v in pairs(pressSpeeds) do
					if v >= 0.5 then canPass = false end
				end
				if canPass then recurserUnlock()
				else resetPresses()
				end
			end
			targetX = math.lerp(targetX, -75 * songIndex, dt * 15)
			targetY = math.lerp(targetY, -165 * songIndex, dt * 15)
			for i,song in ipairs(songs) do
				if i == songIndex then
					if colors[song[1]:lower()] then
						for i=1,3 do
							titleBG.color[i] = lerp(titleBG.color[i], colors[song[1]:lower()][i], dt * 15)
						end
					end
				end
			end
			if controls.pressed.back then --lazy
				switchState(menuFreeplay)
			elseif controls.pressed.down then
				changeSong(1)
			elseif controls.pressed.up then
				changeSong(-1)
			elseif controls.pressed.confirm then
				love.audio.stop();
				storyMode = false
				curWeek = nil
				if songs[songIndex][1]:lower() == 'enter-terminal' then
					switchState(terminalState)
				else
					charOverride = nil
					scoreMultiplier = {1, 1, 1, 1}
					funkin.curSong = songs[songIndex][1]:lower()
					switchState((controls.down['button:y'] or love.keyboard.isDown'lshift') and stage or charSelect)
				end
			end
			curScore = math.floor(lerp(curScore, targetScore, 0.4))
		end
	end,

	draw = function(self)
		if leaving then return end
		love.graphics.push()
		love.graphics.translate(graphics.getWidth() / 2, graphics.getHeight() / 2)
		if shakeTime > 0 then
			love.graphics.translate(love.math.random(-shakeAmount, shakeAmount), love.math.random(-shakeAmount, shakeAmount))
		end
		love.graphics.setColor(rgb255(unpack(titleBG.color)))
		titleBG:draw()
		for i,v in pairs(cats) do
			if not v.dontdraw and v.alpha > 0 then
				love.graphics.setColor(1,1,1,v.alpha)
				v:draw()
			end
		end
		if not inRealFreeplay then
			for i,cat in ipairs(cats) do
				--print(catStrings[i], catStrings, i)
				printfOutline(lm.string['freeplay_'..catStrings[i]] or lm.string.freeplay_extra, cat.x - 128, cat.y - 300, nil, {size = 72, depth = 0.05})
			end
		else
			love.graphics.push()
			love.graphics.translate(-500 * recursedScale, -100 * recursedScale)
			love.graphics.translate(targetX * recursedScale, targetY * recursedScale)
			fonts('comic', 72)
			for i,song in ipairs(songs) do
				love.graphics.translate(75 * recursedScale, 165 * recursedScale)
				local icon = icons[song[1]]
				local nodash = song[1]:gsub('-', ' ')
				local alpha = (i == songIndex) and 1 or 0.5
				love.graphics.setColor(1, 1, 1, alpha)
				if icon.angle then
					icon.orientation = icon.angle * DEGREE_TO_RADIAN
				else
					icon.x = curFont:getWidth(song[1])
				end
				--if i == 1 then icon.x = icon.x + 75 end
				icon:draw()
				if recursedScale == 1 then
					printfOutline(nodash, 0, 0, nil, {size = 64, depth = 0.05, alpha = alpha})
				end
				love.graphics.setColor(1, 1, 1, 1)
			end
			if recursedPrints then
				for i,v in pairs(recursedPrints) do
					love.graphics.push()
					love.graphics.rotate(v.angle * DEGREE_TO_RADIAN)
					printfOutline(v.print, v.x, v.y, nil)
					love.graphics.pop()
				end
			end
			love.graphics.pop()
			fonts('comic', 32)
			love.graphics.setColor(0, 0, 0, 0.6)
			local str = lm.string.freeplay_personalBest..curScore..'\n'..(save.highscoreChars[songs[songIndex][1]:lower()] or 'bf')
			local strWidth = curFont:getWidth(str)
			love.graphics.rectangle('fill', (1280/2)-strWidth-6, -(720/2), strWidth + 6, 66)
			love.graphics.setColor(1, 1, 1)
			love.graphics.printf(str, (1280/2)-strWidth, (-720/2), 9999999)
		end
		love.graphics.pop()
	end,

	leave = function(self)
		lastCat = catIndex
		Timer.clear()
	end
}
