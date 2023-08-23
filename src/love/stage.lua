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

local song, difficulty

local stageBack, stageFront, curtains

local subHalfWidth = false
local sprites = {}
local function newSprite(image, x, y)
	local spr = graphics.newImage(paths.image(image))
	spr.x = x or 0
	spr.y = y or 0
	if subHalfWidth then
		addHalfWidth(spr)
	end
	--print('adding spr!', image, spr.draw)
	return spr
end
local function add(spr)
	if not spr.scrollFactor then spr.scrollFactor = point(1, 1) end
	table.insert(sprites, spr)
	return #sprites
end

local function addChars()
	--gfPos = add({char = true})
	--bfPos = add({char = true})
	--dadPos = add({char = true})
	girlfriend.isChar = 2
	boyfriend.isChar = 0
	enemy.isChar = 1
	add(girlfriend)
	add(boyfriend)
	add(enemy)
end

local onUpdate, onBeat, onStep

local davemode = false

local eyesores = false
local useeyesores = false

local houseStage

local function drawTable(sprites)
	for i,spr in ipairs(sprites) do
		if spr.isChar == 1 then
			if shredderMode then return end
			spr = weeks:getCurEnemy()
		elseif spr.isChar == 0 then
			if shredderMode then return end
			spr = weeks:getCurBoyfriend()
		elseif spr.isChar == 2 then
			spr = weeks:getCurGirlfriend()
		end
		if not spr.dontdraw then
			love.graphics.push()
			if not spr.scrollFactor then 
				spr.scrollFactor = point(1, 1)
			end
			love.graphics.translate((cam.x + camOffsetPos.x + shakeOffset.x) * spr.scrollFactor.x, (cam.y + camOffsetPos.y + shakeOffset.y) * spr.scrollFactor.y)
			if spr.shader then
				love.graphics.setShader(spr.shader)
			end
			if spr.color then
				--print('we found a color... a big color', spr.color[1], spr.color[2], spr.color[3], spr.color[4])
				love.graphics.setColor(rgb255(spr.color[1], spr.color[2], spr.color[3], (spr.color[4] or spr.alpha or 1) * (spr.alphaMult or 1)))
			elseif spr.alpha then
				love.graphics.setColor(1, 1, 1, spr.alpha * (spr.alphaMult or 1))
			end
			if spr.blendMode then
				love.graphics.setBlendMode(spr.blendMode)
			end
			--print(i, bfPos, gfPos, dadPos)
			spr:draw()
			if spr.shader then
				love.graphics.setShader()
			end
			if spr.blendMode then
				love.graphics.setBlendMode 'alpha'
			end
			lastScrollFactor = spr.scrollFactor
			love.graphics.pop()
			love.graphics.setColor(1, 1, 1, 1)
		end
	end
end
local function updateTable(sprites, dt) --nice and simple :3
	for _,sprite in pairs(sprites) do
		if sprite.update and not sprite.isChar and not sprite.dontupdate then sprite:update(dt) end
	end
end

local jsonChart
local eyesore
local nightColor = {135, 135, 135}
local sunsetColor = {255, 143, 178}
local zoom
local function sectionStartTime(section)
	local bpm = jsonChart.bpm
	local pos = 0
	for i=1,section do
		pos = pos + 4 * (1000 * 60 / bpm)
	end
	return pos
end
local stages = {
	stage = function()
		stageBack = newSprite"week1/stage-back"
		stageBack.scrollFactor = point(0.9, 0.9)
		add(stageBack)
		stageFront = newSprite"week1/stage-front"
		stageFront.scrollFactor = point(0.9, 0.9)
		add(stageFront)

		addChars()

		curtains = newSprite"week1/curtains"
		curtains.scrollFactor = point(1.1, 1.1)
		add(curtains)

		stageFront.y = 400
		curtains.y = -100

		--enemy = love.filesystem.load("sprites/week1/daddy-dearest.lua")()

		girlfriend.x, girlfriend.y = 30, -90
		enemy.x, enemy.y = -380, -110
		boyfriend.x, boyfriend.y = 260, 100
	end,
	house = function(dont, skyType, assetType)
		zoom = 0.8
		local nighty = {'glitch', 'bonus-song', 'memory'}
		if table.contains(nighty, jsonChart.song:lower()) then 
			skyType = 'sky_night'
			assetType = 'night/'
		end
		local staticsnd = paths.sound 'static'
		local sprs = {}
		local add = add
		if dont then
			add = function(spr)
				table.insert(sprs, spr)
				return #sprs
			end
		end
		skyType = skyType or 'sky'
		assetType = assetType or ''
		local bg = newSprite('dave/backgrounds/shared/'..skyType, -600, -300)
		bg.scrollFactor = point(0.6, 0.6)
		addWidth(bg)
		add(bg)
		local stageHills = newSprite('dave/backgrounds/dave-house/'..assetType..'hills', -834, -159)
		stageHills.scrollFactor = point(0.7, 0.7)
		addWidth(stageHills)
		add(stageHills)
		local grassbg = newSprite('dave/backgrounds/dave-house/'..assetType..'grass bg', -1205, 580)
		addWidth(grassbg)
		add(grassbg)
		local gate = newSprite('dave/backgrounds/dave-house/'..assetType..'gate', -832, 580)
		addWidth(gate)
		add(gate)
		local stageFront = newSprite('dave/backgrounds/dave-house/'..assetType..'grass', -832, 700)
		addWidth(stageFront)
		add(stageFront)

		local redsky
		if jsonChart.song:lower() == 'insanity' then
			redsky = newSprite('dave/backgrounds/void/redsky_insanity', 2000, 1000)
			redsky.shader = shaders:GLITCH()
			redsky.dontdraw = true
			redsky.image:setFilter(getAA(false))
			add(redsky)
		end

		eventEvents = function(n, v1)
			if n == 'Change Character' then
				redsky.dontdraw = not redsky.dontdraw
				if not redsky.dontdraw then love.audio.play(staticsnd) end
			elseif n == 'Play Animation' and v1 == 'scared' then
				enemyObject.skipDance = true
				enemy:setLooping(true)
			end
		end

		for _,spr in pairs(sprites) do
			spr.x = spr.x - 2250
			spr.y = spr.y - 1000
		end
		girlfriend.x, girlfriend.y = 60, -90
		enemy.x, enemy.y = -380, 100
		boyfriend.x, boyfriend.y = 300, 100
		if not dont then
			addChars()
			if skyType == 'sky_night' then
				boyfriend.color = nightColor
				enemy.color = nightColor
				girlfriend.color = nightColor
			end
		end
		return sprs
	end,
	void = function()
		zoom = 0.8
		useeyesores = true
		girlfriend.x, girlfriend.y = 60, -90
		enemy.x, enemy.y = -380, 100
		boyfriend.x, boyfriend.y = 300, 100

		local voidStuff = {
			cheating = 'cheater',
			unfairness = 'scarybg',
			expoitation = 'exploit/creepyRoom'
		}
		local void = voidStuff[jsonChart.song:lower()] or 'redsky'

		local bg = newSprite('dave/backgrounds/void/'..void, 2000, 1000)
		bg.shader = shaders:GLITCH()
		bg:getImage():setFilter('nearest', 'nearest')
		add(bg)

		local alphaThing = {value = 0}
		local meAlpha = {value = 0}
		local songStuff = {
			polygonized = function()
				houseStage = getStage('house', true, 'sky_night', 'night/')
				for _,spr in pairs(houseStage) do
					spr.x, spr.y = spr.x - 2250, spr.y - 1000
				end
				local events = {
					finaly = function()
						weeks:flash(0.25)
						bg.dontdraw = true
						enemy.color = nightColor
						boyfriend.color = nightColor
						girlfriend.color = nightColor
					end
				}
				weeks.bookmarkEvents = function(n, v)
					if events[n] then events[n](v) end
				end
				eventEvents = function(n, v1)
					if n == 'Change Character' and v1 == '0' then
						weeks:triggerEvent 'eyesores'
					end
				end
			end,
			unfairness = function()
				bg.sizeX, bg.sizeY = 3, 3
				bg.x, bg.y = bg.x - 2500, bg.y - 1500
				local aaa = {
					slowfade = function()
						for i=1,4 do
							Timer.tween(6, enemyArrows[i], {alpha = 0})
						end
					end,
					slowfadeagain = function()
						for i=1,4 do
							Timer.tween(6, boyfriendArrows[i], {alpha = 0})
						end
					end,
					byelol = function()
						enemy.dontdraw = true
						enemyIcon.dontdraw = true
						weeks:flash(0.25)
					end
				}
				weeks.bookmarkEvents = function(n)
					if aaa[n] then aaa[n]() end
				end
			end,
			cheating = function()
				bg.x, bg.y = bg.x - 2000, bg.y - 1000
			end
		}
		if songStuff[jsonChart.song:lower()] then songStuff[jsonChart.song:lower()]() end

		addChars()
	end,
	farm = function()
		zoom = 0.8
		girlfriend.x, girlfriend.y = -25, -150
		enemy.x, enemy.y = -380, 100
		boyfriend.x, boyfriend.y = 100, 70
		local skyType = jsonChart.stage == 'farm-night' and 'sky_night' or jsonChart.stage == 'farm-sunset' and 'sky_sunset' or 'sky'
		--skyType = 'sky_sunset'
		local nighty = {'splitathon', 'mealie'}
		if table.contains(nighty, jsonChart.song:lower()) then skyType = 'sky_night' end
		local sunsetBG, nightBG, globalColor
		local tweenTime = sectionStartTime(25) / 1000
		--local globalColorController = 
		if jsonChart.song:lower() == 'maze' then
			nightBG = newSprite('dave/backgrounds/shared/sky_night', -600/4, -300)
			nightBG.alphaMult = 1
			nightBG.scrollFactor = point(0.65, 0.65)
			add(nightBG)
			sunsetBG = newSprite('dave/backgrounds/shared/sky_sunset', -600/4, -300)
			sunsetBG.alphaMult = 1
			sunsetBG.scrollFactor = point(0.65, 0.65)
			add(sunsetBG)
			globalColor = {255, 255, 255}
		end
		local bg = newSprite('dave/backgrounds/shared/'..skyType, -600/4, -300)
		bg.alphaMult = 1
		add(bg)

		local flatgrass = newSprite('dave/backgrounds/farm/gm_flatgrass', -317.5,  -385)
		flatgrass.sizeX, flatgrass.sizeY = 0.34, 0.34
		flatgrass.scrollFactor = point(0.65, 0.65)
		add(flatgrass)

		local hills = newSprite('dave/backgrounds/farm/orangey hills', -88.2, -75)
		hills.scrollFactor = point(0.65, 0.65)
		add(hills)

		local farmHouse = newSprite('dave/backgrounds/farm/funfarmhouse', 340, -155)
		farmHouse.scrollFactor = point(0.7, 0.7)
		farmHouse.sizeX, farmHouse.sizeY = 0.9, 0.9
		add(farmHouse)

		local grassLand = newSprite('dave/backgrounds/farm/grass lands', -10, 305)
		add(grassLand)

		local cornFence = newSprite('dave/backgrounds/farm/cornFence', -830, -150)
		add(cornFence)

		local cornFence2 = newSprite('dave/backgrounds/farm/cornFence2', 815, -150)
		add(cornFence2)

		local picnic
		if jsonChart.song:lower() == 'splitathon' then
			picnic = newSprite('dave/backgrounds/farm/picnic_towel_thing', 545, 175)
			add(picnic)
		end

		local bagType = (love.math.random(0, 1000) == 0) and 'popeye' or 'cornbag'
		local cornBag = newSprite('dave/backgrounds/farm/'..bagType, 545, 80)
		add(cornBag)

		local sign = newSprite('dave/backgrounds/farm/sign', -25 - 700, 340 - 350)
		add(sign)

		if skyType == 'sky_night' then
			globalColor = nightColor
			print('global color is not NIGHTCOLOR!@!')
		elseif skyType == 'sky_sunset' then
			globalColor = sunsetColor
		end
		bambcon = graphics.newSprite(
			paths.image("dave/icons/bambi"),
			{
				{x = 0, y = 0, width = 150, height = 150}, -- 1: Boyfriend
				{x = 150, y = 0, width = 150, height = 150} -- 2: Boyfriend Losing
			},
			{
				idle = {start = 1, stop = 1, speed = 0, offsetX = 0, offsetY = 0},
				losing = {start = 2, stop = 2, speed = 0, offsetX = 0, offsetY = 0}
			},
			"idle",
			false
		)
		bambcon.dontdraw = true
		bambcon.y = enemyIcon.y
		bambcon.sizeX, bambcon.sizeY = enemyIcon.sizeX, enemyIcon.sizeY
		local update
		local songStuff = {
			maze = function()
				Timer.tween(tweenTime, globalColor, sunsetColor, nil, function()
					Timer.tween(tweenTime, globalColor, nightColor)
				end)
				Timer.tween(tweenTime, bg, {alphaMult = 0}, nil, function()
					Timer.tween(tweenTime, sunsetBG, {alphaMult = 0})
				end)
			end,
			splitathon = function()
				local bambi = character.new 'bambi-splitathon'
				bambi.sprite.x = enemy.x - 450
				bambi.sprite.y = enemy.y + 25
				bambi.skipDance = true
				bambi.sprite.dontdraw = true
				bambi.sprite.dontupdate = true
				add(bambi.sprite)
				local dave = character.new 'dave-splitathon'
				dave.sprite.x = enemy.x - 450
				dave.sprite.y = enemy.y + 25
				dave.skipDance = true
				dave.sprite.dontdraw = true
				dave.sprite.dontupdate = true
				add(dave.sprite)
				local daveAnim = 'what'
				local bambiAnim = 'umWhatIsHappening'
				local hasSwapped = false
				onBeat = function(b)
					if b % 2 == 0 then
						bambi:playAnim(bambiAnim)
						dave:playAnim(daveAnim)
					end
				end
				update = function(dt)
					bambi:update(dt)
					dave:update(dt)
				end
				local swapTimes = 0
				stupididiotvariable = true
				eventEvents = function(n, v)
					if n == 'Change Character' then
						swapTimes = swapTimes + 1
						if swapTimes == 1 then
							weeks:setCamShaking(false)
							dave.sprite.dontdraw = false
							bambcon.x = -1000
							bambcon.dontdraw = false
							Timer.tween(0.25, bambcon, {x = enemyIcon.x}, nil, function()
								Timer.tween(2.5, bambcon, {x = -900})
								Timer.tween(5, bambcon, {y = bambcon.y + 250}, 'in-back', nil, 10)
								enemyIcon:setSheet(paths.image('dave/icons/bambi'))
								bambcon:setSheet(paths.image('dave/icons/dave'))
								bambcon:animate 'losing'
							end)
							stupididiotvariable = false
						elseif swapTimes == 2 then
							dave.sprite.dontdraw = true
							bambi.sprite.dontdraw = false
							daveAnim = 'happy'
						elseif swapTimes == 3 then
							bambi.sprite.dontdraw = true
							dave.sprite.dontdraw = false
							bambiAnim = 'yummyCornLol'
						else
							dave.sprite.dontdraw = true
							bambi.sprite.dontdraw = false
						end
					elseif n == 'bookmark' and v == 'motherfuck' then
						weeks:setCamShaking(true)
					end
				end
			end
		}
		if songStuff[jsonChart.song:lower()] then songStuff[jsonChart.song:lower()]() end
		local moveSpr = picnic
		onUpdate = function(dt)
			if update then update(dt) end
			for _,spr in pairs(sprites) do
				spr.color = globalColor
				--print('this spr color should be global color lol!')
			end
			enemy.color = globalColor
			boyfriend.color = globalColor
			girlfriend.color = globalColor
			--local mult = 1
			--if controls.down.gameFive then mult = 2 
			--else mult = 1 
			--end
			--if controls.down.left then moveSpr.x = moveSpr.x - (5*mult)
			--elseif controls.down.right then moveSpr.x = moveSpr.x + (5*mult)
			--end
			--if controls.down.down then moveSpr.y = moveSpr.y + (5*mult)
			--elseif controls.down.up then moveSpr.y = moveSpr.y - (5*mult)
			--end
			--if controls.pressed.confirm then
			--	print('MY POS:', moveSpr.x, moveSpr.y)
			--end
		end
		--for _,spr in pairs(sprites) do
		--	spr.x = spr.x - 700
		--	spr.y = spr.y - 350
		--end
		addChars()
		--Timer.after(5, function()
		--	Timer.tween(5, globalColor, sunsetColor)
		--end)
	end,
	festival = function()
		girlfriend.x, girlfriend.y = -25, -150
		enemy.x, enemy.y = -380, 100
		boyfriend.x, boyfriend.y = 100, 70
		
		local sprs = {}
		local add = add
		if dont then
			add = function(spr)
				table.insert(sprs, spr)
				return #sprs
			end
		end
		--subHalfWidth = true
		zoom = 0.7
		local mainChars
		local whatever = fromTopLeft
		local function fromTopLeft(x, y)
			local hi = whatever(x, y)
			return hi.x, hi.y
		end
		if jsonChart.song:lower() == 'shredder' then
			mainChars = {
				{'dave', 'idle', 0.8, -295, -120},
				{'tristan', 'bop', 0.4, 400, -45}
			}
			shredderHighway = newSprite('dave/festival/shredder/ch_highway')
			shredderHighway.image:setFilter(getAA(false))
			shredderHighway.alpha = 0
			shredderHighway.sizeX, shredderHighway.sizeY = 1.3076171875, 1.3076171875
			--shredderHighway.y = shredderHighway.y + shredderHighway.height / 
			bambispot = newSprite('dave/festival/shredder/bambi_spot', fromTopLeft(34, 151))
			addHalfWidth(bambispot)
			bambispot.alpha = 0
			bfspot = newSprite('dave/festival/shredder/boyfriend_spot', fromTopLeft(995, 381))
			addHalfWidth(bfspot)
			bfspot.alpha = 0
			--would be a cool effect to add later too lazy to make it work rn!
			--Timer.tween(sectionStartTime(16)/1000, shredderHighway, {y = -shredderHighway.height})
			local hi = {
				SHREDDERITHINK = function()
					shredderHighway.alpha = 1
					boyfriend.alpha = 0
					shredderMode = true
					boyfriend.x, boyfriend.y = 700, -50
					enemy.x, enemy.y = fromTopLeft(-21/0.7, -10/0.7)
					bambispot.alpha = 1
					--addHalfWidth(enemy)
					for i=1,4 do
						enemyArrows[i].alpha = 0
						boyfriendArrows[i].alpha = 0
						boyfriendArrows[i].x = boyfriendArrows[i].x - 500
					end
					for _,strum in pairs(ghStrums) do strum.alpha = 1 end
				end,
				hibf = function()
					Timer.tween(0.5, bfspot, {alpha = 1})
					Timer.tween(0.5, boyfriend, {alpha = 1})
					for i=1,4 do
						Timer.tween(0.5, boyfriendArrows[i], {alpha = 1})
					end
					for _,strum in pairs(ghStrums) do 
						Timer.tween(0.5, strum, {alpha = 0})
					end
				end,
				noshredder = function()
					for i=1,4 do
						enemyArrows[i].alpha = 1
						boyfriendArrows[i].x = boyfriendArrows[i].x + 500
					end
					shredderMode = false
					shredderHighway.alpha = 0
					bambispot.alpha = 0
					bfspot.alpha = 0
					enemy.x, enemy.y = -380, 100
					boyfriend.x, boyfriend.y = 100, 70
				end
			}
			weeks.bookmarkEvents = function(n)
				if hi[n] then hi[n]() end
			end
		elseif jsonChart.song:lower() == 'greetings' then
			if greetingsCutscene then
				mainChars = {
					{'bambi', 'bambi idle', 0.9, 325, -70},
					{'tristan', 'bop', 0.4, -510, -65}
				}
			else
				mainChars = {
					{'dave', 'idle', 0.8, -295, -120},
					{'bambi', 'bambi idle', 0.9, 325, -70}
				}
			end
		elseif jsonChart.song:lower() == 'interdimensional' then
			mainChars = {
				{'bambi', 'bambi idle', 0.9, 400, 350},
				{'tristan', 'bop', 0.4, -510, -65}
			}
		end
		local bg = newSprite('dave/backgrounds/shared/sky_festival', -600, -230)
		bg.scrollFactor = point(0.6, 0.6)
		add(bg)

		local flatGrass = newSprite('dave/backgrounds/festival/gm_flatgrass', 430, -475)
		flatGrass.scrollFactor = point(0.7, 0.7)
		add(flatGrass)

		local farmHouse = newSprite('dave/backgrounds/festival/farmHouse', -785, -480)
		farmHouse.scrollFactor = point(0.7, 0.7)
		add(farmHouse)

		local hills = newSprite('dave/backgrounds/festival/hills', -5, -85)
		hills.scrollFactor = point(0.7, 0.7)
		add(hills)

		local corn = graphics:newAnimatedSprite('dave/backgrounds/festival/corn', {
			{anim = 'corn', name = 'idle', fps = 5}
		}, 'corn')
		corn.scrollFactor = point(0.85, 0.85)
		corn:setPosition(-500, -120)
		add(corn)

		local cornGlow = graphics:newAnimatedSprite('dave/backgrounds/festival/cornGlow', {
			{anim = 'cornGlow', name = 'idle', fps = 5, loops = true}
		}, 'cornGlow')
		cornGlow.scrollFactor = point(0.85, 0.85)
		cornGlow.blendMode = 'add'
		cornGlow:setPosition(-500, -120)
		add(cornGlow)

		local backGrass = newSprite('dave/backgrounds/festival/backGrass', -5, 265)
		backGrass.scrollFactor = point(0.85, 0.85)
		add(backGrass)

		local crowd = graphics:newAnimatedSprite('dave/backgrounds/festival/crowd', {
			{anim = 'idle', name = 'crowdDance', loops = true}
		}, 'idle')
		crowd.scrollFactor = point(0.85, 0.85)
		crowd:setPosition(-165, -270)
		add(crowd)

		local crowdChars = {}
		if mainChars then
			for _,chary in pairs(mainChars) do
				local char = graphics:newAnimatedSprite('dave/backgrounds/festival/mainCrowd/'..chary[1], {
					{anim = 'idle', name = chary[2]}
				}, 'idle')
				char.scrollFactor = point(0.85, 0.85)
				char.sizeX, char.sizeY = chary[3], chary[3]
				print(chary[4], chary[5])
				char:setPosition(chary[4], chary[5])
				add(char)
				table.insert(crowdChars, char)
			end
		end
		
		local frontGrass = newSprite('dave/backgrounds/festival/frontGrass', -400, 360) ---1300, 600
		add(frontGrass)

		addChars()

		local generalGlow = graphics:newAnimatedSprite('dave/backgrounds/festival/generalGlow', {
			{anim = 'glow', name = 'idle', fps = 5, loops = true}
		}, 'glow')
		generalGlow.blendMode = 'add'
		generalGlow:setPosition(-825, 340)
		add(generalGlow)

		onBeat = function(b)
			if b % 2 == 0 then
				for _,char in pairs(crowdChars) do
					char:animate 'idle'
				end
			end
		end

		--local moveSpr = crowdChars[2]
		--onUpdate = function(dt)
		--	local mult = 1
		--	if controls.down.gameFive then mult = 2 
		--	else mult = 1 
		--	end
		--	if controls.down.left then moveSpr.x = moveSpr.x - (5*mult)
		--	elseif controls.down.right then moveSpr.x = moveSpr.x + (5*mult)
		--	end
		--	if controls.down.down then moveSpr.y = moveSpr.y + (5*mult)
		--	elseif controls.down.up then moveSpr.y = moveSpr.y - (5*mult)
		--	end
		--	if controls.pressed.confirm then
		--		print('MY POS:', moveSpr.x, moveSpr.y)
		--	end
		--end
		return sprs
	end,
	interdimensional = function()
		zoom = 0.6
		girlfriend.x, girlfriend.y = -25, -150
		enemy.x, enemy.y = -380, 100
		boyfriend.x, boyfriend.y = 100, 70

		houseStage = getStage 'festival'

		local bg = newSprite('dave/backgrounds/void/interdimensions/interdimensionVoid', 0, 0)
		bg.shader = shaders:GLITCH()
		bg:getImage():setFilter('nearest', 'nearest')
		bg.sizeX, bg.sizeY = 1.75, 1.75
		add(bg)

		local function voidBg(k)
			local lol = paths.image('dave/backgrounds/void/interdimensions/'..k)
			lol:setFilter(getAA(false))
			return lol
		end

		local bgChars = {}
		local leftCheck = -1280
		local rightCheck = 1280 * 2
		for i,char in pairs{'ball', 'bimpe', 'maldo', 'memes kids', 'muko', 'ruby man', 'tristan', 'bambi'} do
			local char = newSprite('dave/backgrounds/festival/scaredCrowd/'..char, 0, -250)
			local obj = {
				angleChangeAmount = love.math.random(100, 200),
				randomSpeed = love.math.random(1, 5),
				goLeft = love.math.random(1,2) == 1,
				angle = 0,
				update = function(self, dt, et)
					local spr = self.sprite
					spr.x = spr.x + 300 * dt * (self.goLeft and -1 or 1) * self.randomSpeed
					spr.y = spr.y + (math.sin(et+i) * 5)
					self.angle = self.angle + self.angleChangeAmount * dt
					spr.orientation = self.angle * DEGREE_TO_RADIAN
					if self.goLeft and spr.x < leftCheck or not self.goLeft and spr.x > rightCheck then
						self.angleChangeAmount = love.math.random(100, 200)
						spr.y = 720 / 2
						self.goLeft = not self.goLeft
					end
				end,
				sprite = char
			}
			char.x = obj.goLeft and rightCheck or leftCheck
			table.insert(bgChars, obj)
			add(char)
		end
		local nimbiLand = newSprite('dave/backgrounds/void/interdimensions/nimbi/nimbi_land', 200, 100)
		nimbiLand.sizeX, nimbiLand.sizeY = 1.5, 1.5
		nimbiLand.dontdraw = true
		add(nimbiLand)
	
		local nimbiSign = newSprite('dave/backgrounds/void/interdimensions/nimbi/sign', 800, -73)
		nimbiSign.sizeX, nimbiSign.sizeY = 0.2, 0.24
		nimbiSign.x, nimbiSign.y = nimbiSign.x - nimbiSign.width/2, nimbiSign.y - nimbiSign.height/2
		nimbiSign.dontdraw = true
		add(nimbiSign)

		local colorThing = {255, 255, 255}
		local et = 0
		onUpdate = function(dt)
			et = et + dt
			--local mecolor = {rgb255(colorThing[1], colorThing[2], colorThing[3], 1)}
			for _,char in pairs(bgChars) do
				char:update(dt, et)
				char.sprite.color = colorThing
			end
			boyfriend.color = colorThing
			enemy.color = colorThing
			girlfriend.color = colorThing
		end
		for _,bg in pairs{'spike', 'darkSpace', 'hexagon', 'nimbi/nimbiVoid'} do --preload sprites!
			voidBg(bg)
		end
		local bgStuff = {
			function()
				bg:setImage(voidBg 'spike')
				bg.sizeX, bg.sizeY = 3, 3
				bg.x = bg.x - math.abs(-700-200)
			end,
			function()
				bg:setImage(voidBg 'darkSpace')
				bg.sizeX, bg.sizeY = 2.75, 2.75
				bg.x = 0
				Timer.tween(1, colorThing, {0, 0, 255})
			end,
			function()
				bg:setImage(voidBg 'hexagon')
				bg.sizeX, bg.sizeY = 3, 3
				Timer.tween(1, colorThing, {255, 255, 255})
			end,
			function()
				bg:setImage(voidBg 'nimbi/nimbiVoid')
				bg.sizeX, bg.sizeY = 2.75, 2.75

				nimbiLand.dontdraw = false
				nimbiSign.dontdraw = false
			end,
			function()
				bg:setImage(voidBg 'interdimensionVoid')
				bg.sizeX, bg.sizeY = 1.75, 1.75
				nimbiLand.dontdraw = true
				nimbiSign.dontdraw = true
			end,
			function()
				bg.dontdraw = true
				for _,char in pairs(bgChars) do
					char.sprite.dontdraw = true
				end
			end
		}

		local whatever = 0
		eventEvents = function(n)
			if n == 'flash' then
				whatever = whatever + 1
				bgStuff[whatever]()
			end
		end

		addChars()
	end,
	backyard = function()
		zoom = 0.7
		girlfriend.x, girlfriend.y = -355, -350
		enemy.x, enemy.y = -1070, -180
		boyfriend.x, boyfriend.y = -300, -70

		
		local sunrise, sky
		if jsonChart.song:lower() == 'rano' then
			sky = newSprite('dave/backgrounds/shared/sky', 615, -670)
			sky.scrollFactor = point(0.6, 0.6)
			add(sky)

			sunrise = newSprite('dave/backgrounds/shared/sky_sunrise', -600, -230)
			sunrise.scrollFactor = point(0.6, 0.6)
			sunrise.alpha = 1
			add(sunrise)
		end

		local bg = newSprite('dave/backgrounds/shared/sky_festival', 450, -580)
		bg.scrollFactor = point(0.6, 0.6)
		bg.alpha = 1
		add(bg)

		local hills = newSprite('dave/backgrounds/backyard/hills', -810, -165)
		hills.scrollFactor = point(0.75, 0.75)
		add(hills)

		local grass = newSprite('dave/backgrounds/backyard/supergrass', -285, 95)
		add(grass)

		local gates = newSprite('dave/backgrounds/backyard/gates', -86, -353)
		add(gates)

		--thats a bear!
		--local bear = newSprite('dave/backgrounds/backyard/bearDude', fromTopLeft(-1035, -710))
		--bear.scrollFactor = point(0.95, 0.95)
		--add(bear)

		local house = newSprite('dave/backgrounds/backyard/house', -1425, -333)
		house.scrollFactor = point(0.95, 0.95)
		add(house)

		
		addChars()
		
		local grill = newSprite('dave/backgrounds/backyard/grill', -1614, 97)
		grill.scrollFactor = point(0.95, 0.95)
		add(grill)

		colory = nightColor

		--local moveSpr = sky
		onUpdate = function(dt)
			for _,spr in pairs(sprites) do
				if not spr.isChar then
					spr.color = colory
				end
			end
			boyfriend.color = colory
			enemy.color = colory
			girlfriend.color = colory
			
			--local mult = 1
			--if controls.down.gameFive then mult = 2 
			--else mult = 1 
			--end
			--if controls.down.left then moveSpr.x = moveSpr.x - (5*mult)
			--elseif controls.down.right then moveSpr.x = moveSpr.x + (5*mult)
			--end
			--if controls.down.down then moveSpr.y = moveSpr.y + (5*mult)
			--elseif controls.down.up then moveSpr.y = moveSpr.y - (5*mult)
			--end
			--if controls.pressed.confirm then
			--	print('MY POS:', moveSpr.x, moveSpr.y)
			--end
		end
		if jsonChart.song:lower() == 'rano' then
			local timey = sectionStartTime(56) / 1000
			Timer.tween(timey, colory, sunsetColor)
			Timer.tween(timey, bg, {alpha = 0}, nil, function()
				Timer.tween(timey, sunrise, {alpha = 0})
				Timer.tween(timey, colory, {255, 255, 255})
			end)
			weeks.bookmarkEvents = function(n)
				if n == 'dostuffnow' then
					enemyObject.idleAnim = 'sleepIdle'
				end
			end
		end
	end,
	--extras
	['exbungo-land'] = function()
		zoom = 0.7
		girlfriend.x, girlfriend.y = -25, -150
		enemy.x, enemy.y = -380, -250
		boyfriend.x, boyfriend.y = 100, 70
		local bg = newSprite('dave/backgrounds/void/exbongo/Exbongo', -200, -150)
		bg.shader = shaders:GLITCH()
		bg:getImage():setFilter('nearest', 'nearest')
		bg.sizeX, bg.sizeY = 1.5, 1.5
		add(bg)

		local ball = newSprite('dave/backgrounds/void/exbongo/Circle', -400, 125)
		ball:getImage():setFilter(getAA(false))
		add(ball)

		local place = newSprite('dave/backgrounds/void/exbongo/Place', 400, 0)
		place:getImage():setFilter(getAA(false))
		add(place)

		local et = 0
		onUpdate = function(dt)
			et = et + dt
			place.y = place.y + math.sin(et+5) * 0.6
			ball.y = ball.y - math.sin(et+3) * 0.6
		end
		if settings.modcharts then
			hudShader = bg.shader
		end
		addChars()
	end,
	rapWorld = function()
		enemy.x, enemy.y = -620, -30
		girlfriend.x = -305
		boyfriend.x, boyfriend.y = -30, 50
		zoom = 1
		local bg = newSprite('dave/backgrounds/rapBattle')
		add(bg)

		addChars()

		--local moveSpr = boyfriend
		--onUpdate = function(dt)
		--	local mult = 1
		--	if controls.down.gameFive then mult = 2 
		--	else mult = 1 
		--	end
		--	if controls.down.left then moveSpr.x = moveSpr.x - (5*mult)
		--	elseif controls.down.right then moveSpr.x = moveSpr.x + (5*mult)
		--	end
		--	if controls.down.down then moveSpr.y = moveSpr.y + (5*mult)
		--	elseif controls.down.up then moveSpr.y = moveSpr.y - (5*mult)
		--	end
		--	if controls.pressed.confirm then
		--		print('MY POS:', moveSpr.x, moveSpr.y)
		--	end
		--end
	end
}
local songtostage = {
	house = {'warmup', 'house', 'insanity', 'supernovae', 'glitch'},
	farm = {'blocked', 'corn-theft', 'maze', 'splitathon', 'mealie'},
	festival = {'shredder', 'greetings'},
	void = {'polygonized', 'cheating', 'unfairness', 'exploitation'},
	recursed = {'recursed'},
	desktop = {'expoitation'},
	backyard = {'rano'},
	rapWorld = {'vs-dave-rap', 'vs-dave-rap-two'}
}
local playedCutscene = false
return {
	enter = function(self, from, songNum, songAppend)
		stopthisnow = false
		hudShader = nil
		jsonChart = weeks:enter()
		bambcon = nil
		
		print(jsonChart)

		song = songNum
		difficulty = songAppend

		function getStage(stage, ...)
			return stages[stage](...)
		end
		
		for k,v in pairs(songtostage) do
			if table.contains(v, jsonChart.song:lower()) then
				jsonChart.stage = k
				davemode = true
				print 'ENABLING DAVE MODEEEE'
			end
		end
		if jsonChart.stage and stages[jsonChart.stage] then
			stages[jsonChart.stage]()
		else
			stages.stage()
		end
		if zoom then
			print('setting the zoom toooo', zoom)
			camZoom = zoom
			curCamZoom = zoom
			origZoom = zoom
		end
		if useeyesores then
			eyesore = shaders:EYESORE()
		end

		self:load()
	end,

	load = function(self)
		weeks:load()

		self:initUI()
		if storyMode and love.filesystem.getInfo('data/dialogue/'..funkin.curSong..'.txt') and not playedCutscene then
			playedCutscene = true
			openSubstate(dialogue, false, funkin.curSong)
		else
			weeks:setupCountdown()
		end
	end,

	initUI = function(self)
		weeks:initUI()

		weeks:generateNotes()
	end,

	update = function(self, dt)
		--if song == 1 and musicThres ~= oldMusicThres and math.fmod(absMusicTime + 500, 480000 / bpm) < 100 then
		--	weeks:safeAnimate(boyfriend, "hey", false, 3)
		--end
		if stopthisnow then return end

		if songFinished or stage.stateToLeaveTo then
			if not songFinished then
				if inst then 
					inst:stop() 
					print('stoppng my sshit')
				end
				if voices then voices:stop() end
				local dont = false
			end
			if not dont and not cutscene then
				local result = self:tryToLeave()
				if result then return end
			end
		end

		weeks:update(dt, onBeat, onStep)
		if onUpdate then onUpdate(dt) end
		weeks:updateUI(dt)

		if houseStage then updateTable(houseStage, dt) end
		updateTable(sprites, dt)
	end,
	songEnd = function(self)
		if songFinished and love.filesystem.getInfo('data/dialogue/'..funkin.curSong..'-endDialogue.txt') and not cutscene then
			print('hi ')
			openSubstate(dialogue, false, funkin.curSong..'-endDialogue', true)
			dont = true
		else
			print('leaving thtouirfhg hafFDSD')
			self:tryToLeave()
		end
	end,
	tryToLeave = function(self)
		print 'gonna leave this stuff'
		if not stage.stateToLeaveTo and storyMode and songIndex < #funkin.songList then
			songIndex = songIndex + 1
			funkin.curSong = funkin.songList[songIndex]
			completeScore = (completeScore or 0) + score
			playedCutscene = false
			if songIndex == 3 and curWeek == '_WEEK2' then
				switchState(mazeCutscene)
			else
				switchState(stage)
			end
		else
			if songFinished and not noMissMode then
				print 'writing highscore'
				if not storyMode then
					local curHighscore = save.highscores[funkin.curSong:lower()] or -99999999
					if score > curHighscore then
						save.highscores[funkin.curSong:lower()] = score
						save:writeSave()
					end
				else
					local curHighscore = save.highscores[curWeek] or -99999999
					completeScore = (completeScore or 0) + score
					if completeScore > curHighscore then
						save.highscores[curWeek] = completeScore
						save:writeSave()
						completeScore = nil
					end
				end
			end
			--real shitty
			local myBallsJustBlewUp = false
			local whatever = false
			if not stage.stateToLeaveTo then 
				stage.stateToLeaveTo = storyMode and menuWeek or menuFreeplay 
				myBallsJustBlewUp = true
				playedCutscene = false
				if curWeek == '_WEEK1' then
					if health >= 1 then
						save.save['unlocked_dave-angey'] = true
						save:writeSave()
						switchState(endings, 'goodEnding')
					elseif health < 1 then
						save.save.unlocked_bambi = true
						save:writeSave()
						switchState(endings, 'vomit_ending', 'badending')
					else
						switchState(endings, 'badEnding', 'badending')
					end
					whatever = true
					myBallsJustBlewUp = false
				end
				noMissMode = false
			end
			if not whatever	then
				switchState(stage.stateToLeaveTo)
			end
			if myBallsJustBlewUp then
				love.audio.stop()
				love.audio.play(paths.music('menu/menu'))
			end
		end
		stopthisnow = true
		weeks.leaving = false
		stage.stateToLeaveTo = nil
		songFinished = false
		return true
	end,
	draw = function(self)
		love.graphics.push()
		love.graphics.translate(graphics.getWidth() / 2, graphics.getHeight() / 2)
		love.graphics.scale(curCamZoom, curCamZoom)
		love.graphics.push()
		
		--if eyesores then
		--	print 'DO THEM !!'
		--	love.graphics.setShader(eyesore.shader)
		--end
		if houseStage then drawTable(houseStage) end
		drawTable(sprites)


		love.graphics.pop()
		weeks:drawRating(0.9)
		love.graphics.pop()
		if not cutscene then
			weeks:drawUI()
		end
	end,

	leave = function(self)
		table.clear(sprites)
		if houseStage then table.clear(houseStage) end
		--if inst and inst:isPlaying() then inst:stop() end
		--if voices and voices:isPlaying() then voices:stop() end
		onUpdate = nil
		onBeat = nil
		onStep = nil
		weeks.bookmarkEvents = nil
		eventEvents = nil
		shredderMode = false
		weeks:leave()
	end
}
