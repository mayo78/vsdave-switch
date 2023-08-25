

local leftFunc, rightFunc, confirmFunc, backFunc, drawFunc

local menuState

local menuNum = 1

local weekNum = 1
local songNum, songAppend
local songDifficulty = 2

local titleBG
local selectSound
local confirmSound
local catStrings = {'dave', 'joke', 'extras', 'terminal'}
local sprites = {}
local function newSprite(image, x, y)
	local spr = graphics.newImage(paths.image(image))
	spr.x = x or 0
	spr.y = y or 0
	return spr
end
local function add(spr)
	table.insert(sprites, spr)
end


local inRealFreeplay = false
local cats = {}
local catIndex = 1
local function changeCat(how)
	catIndex = catIndex + how
	if catIndex > #catStrings then catIndex = 1
	elseif catIndex <= 0 then catIndex = #catStrings
	end
end
local songs = {}
local songIndex = 1
local songOffset = {value = 0}
local icons = {}
local leaving = false
local targetColor = {0, 0, 0}
local colors = {}
local noCat = false
local curScore, targetScore
local function changeSong(how)
	songIndex = songIndex + how
	if songIndex > #songs then songIndex = 1
	elseif songIndex <= 0 then songIndex = #songs
	end
	targetScore = save.highscores[songs[songIndex][1]:lower()] or 0
end
local lastCat
return {
	enter = function(self, previous)
        selectSound = paths.sound('menu/select')
        confirmSound = paths.sound('menu/confirm')
		targetColor = nil
		leaving = false
		songNum = 0
		noCat = false
		curScore = 42353

		titleBG = newSprite(funkin.randomBG())
		titleBG.color = {73, 101, 255}
		add(titleBG)
		
		for _,cat in ipairs(catStrings) do
			local spr = newSprite('dave/title/packs/'..cat)
			add(spr)
			table.insert(cats, spr)
		end

	end,

	update = function(self, dt)
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
					songOffset.value = 720
					Timer.tween(1, songOffset, {value = 0}, 'out-expo')
					Timer.tween(1, cats[catIndex], {alpha = 0, y = -720}, 'out-expo', function()
						inRealFreeplay = true
						if catIndex ~= lastCat then songIndex = 1 end
						for _,cat in pairs(cats) do
							cat.dontdraw = true
						end
						
						--print('idiots', funkin.freeplayList.extras, funkin.freeplayList.extras[1], funkin.freeplayList.extras[2], funkin.freeplayList.extras[2].songs[1][1])
						for k,cat in pairs(funkin.freeplayList) do
							print('hiii')
							if k == catStrings[catIndex] then
								print('found a guy')
								for _,week in pairs(cat) do
									for _,song in ipairs(week.songs) do
										song[3] = _G.colors[song[3] or week.color] or (song[3] or week.color)
										table.insert(songs, song)
										local icon = graphics.newSprite(
											paths.image("dave/icons/"..song[2]),
											{{x = 0, y = 0, width = 150, height = 150}, {x = 0, y = 0, width = 150, height = 150}}, 
											{idle = {start = 1, stop = 2, speed = 0, offsetX = 0, offsetY = 0}},
											"idle",
											false
										)
										if song[2]:endsWith '-pixel' then icon.image:setFilter(getAA(false)) end
										icons[song[1]] = icon
										colors[song[1]:lower()] = {hex2rgb(song[3])}
										print('adding song', song[1])
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
		else
			for i,song in ipairs(songs) do
				local icon = icons[song[1]]
				local targetx = -(60 * (-i + songIndex)) + ((#song[1]/2) * 64) - 500 + 60 * 1.25
				local targety = -(100 * (-i + songIndex)) - 100 + 50 + songOffset.value
				icon.x = math.lerp(icon.x, targetx, dt * 15)
				icon.y = math.lerp(icon.y, targety, dt * 15)
				if i == songIndex then
					if colors[song[1]:lower()] then
						--print('my color isss', colors[song[1]:lower()], table.concat(colors[song[1]:lower()]))
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
				funkin.curSong = songs[songIndex][1]
				switchState(stage)
			end
			curScore = math.floor(lerp(curScore, targetScore, 0.4))
		end
	end,

	draw = function(self)
		if leaving then return end
		love.graphics.push()
			love.graphics.translate(graphics.getWidth() / 2, graphics.getHeight() / 2)


			love.graphics.push()

			for _,spr in pairs(sprites) do
				if not spr.dontdraw then
					if spr.color or spr.alpha then
						if not spr.color then spr.color = {} end
						love.graphics.setColor(rgb255(spr.color[1], spr.color[2], spr.color[3], spr.color[4] or spr.alpha))
						colorized = spr.color
					else
						love.graphics.setColor(1, 1, 1, 1)
					end
					spr:draw()
				end
			end
			if not inRealFreeplay then
				for i,cat in ipairs(cats) do
					--print(catStrings[i], catStrings, i)
					printfOutline(lm.string['freeplay_'..catStrings[i]] or lm.string.freeplay_extra, cat.x - 128, cat.y - 300, nil, {size = 72, depth = 0.05})
				end
			else
				for i,song in ipairs(songs) do
					local icon = icons[song[1]]
					local nodash = song[1]:gsub('-', ' ')
					local alpha = (i == songIndex) and 1 or 0.5
					love.graphics.setColor(1, 1, 1, alpha)
					icon:draw()
					printfOutline(nodash, icon.x - (((#song[1]/2) * 64)) - 60, icon.y - 50, nil, {size = 64, depth = 0.05, alpha = alpha})
					love.graphics.setColor(1, 1, 1, 1)
				end
				fonts('comic', 32)
				love.graphics.setColor(0, 0, 0, 0.6)
				local str = lm.string.freeplay_personalBest..curScore
				local strWidth = (#str * 32) / 2 * 1.25
				love.graphics.rectangle('fill', (1280/2)-strWidth-6, -(720/2), strWidth + 6, 66)
				love.graphics.setColor(1, 1, 1)
				love.graphics.printf(str, (1280/2)-strWidth, (-720/2), 9999999)
			end
			love.graphics.pop()
		love.graphics.pop()
	end,

	leave = function(self)
		lastCat = catIndex
		inRealFreeplay = false
		table.clear(icons)
		table.clear(cats)
		table.clear(songs)
		table.clear(sprites)
		Timer.clear()
	end
}
