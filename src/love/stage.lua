

local song, difficulty

local stageBack, stageFront, curtains

local subHalfWidth = false
local sprites = {}

local onUpdate, onBeat, onStep

local davemode = false

local eyesores = false
local useeyesores = false

local houseStage

local jsonChart
local eyesore
local nightColor = {135, 135, 135}
local sunsetColor = {255, 143, 178}
local zoom

local fullMode


local songtostage = {
	house = {'warmup', 'house', 'insanity', 'supernovae', 'glitch'},
	farm = {'blocked', 'corn-theft', 'maze', 'splitathon', 'mealie'},
	festival = {'shredder', 'greetings'},
	void = {'polygonized', 'cheating', 'unfairness', 'exploitation'},
	desktop = {'expoitation'},
	backyard = {'rano'},
	rapWorld = {'vs-dave-rap', 'vs-dave-rap-two'},
	freeplay = {'recursed'},
	master = {'master'},
	roof = {'roofs'},
	['inside-house'] = {'bonus-song'},
	desert = {'escape-from-california'},
	office = {'five-nights'},
}
local playedCutscene

local function newSprite(image, x, y)
	local spr = graphics.newImage(paths.image(image), {full=fullMode})
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
		local alpha = (spr.alpha or (spr.color and spr.color[4]) or 1)
		if not spr.dontdraw and alpha > 0 then
			local color = spr.color
			if spr.color2 then
				if not spr.color then spr.color = {255, 255, 255} end
				color = {
					spr.color[1] * spr.color2[1], 
					spr.color[2] * spr.color2[2], 
					spr.color[3] * spr.color2[3],
				}
			end
			if spr.stageLight and stageOverlay.alpha > 0 then
				love.graphics.scale(1/curCamZoom, 1/curCamZoom)
				graphics.setColor(stageOverlay[1], stageOverlay[2], stageOverlay[3], stageOverlay.alpha)
				love.graphics.rectangle("fill", -1280/2, -720/2, 1280, 720)
				graphics.setColor(1, 1, 1, 1)
				love.graphics.scale(curCamZoom, curCamZoom)
			end
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
				love.graphics.setColor(rgb255(color[1], color[2], color[3], (color[4] or color.alpha or spr.alpha or 1) * (spr.alphaMult or 1)))
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
		fullMode = true
		stageBack = newSprite("week1/stage-back", -600, -200)
		stageBack.scrollFactor = point(0.9, 0.9)
		add(stageBack)
		stageFront = newSprite("week1/stage-front", -650, 600)
		stageFront.scrollFactor = point(0.9, 0.9)
		stageFront.sizeX, stageFront.sizeY = 1.1, 1.1
		add(stageFront)

		addChars()

		curtains = newSprite("week1/curtains", -500, -300)
		curtains.scrollFactor = point(1.3, 1.3)
		curtains.sizeX, curtains.sizeY = 0.9, 0.9
		add(curtains)

		--enemy = love.filesystem.load("sprites/week1/daddy-dearest.lua")()

		girlfriend.x, girlfriend.y = 400, 130
		enemy.x, enemy.y = 100, 450
		boyfriend.x, boyfriend.y = 770, 450
	end,
	house = function(dont, skyType, assetType)
		zoom = 0.8
		
		local nighty = {'glitch', 'bonus-song', 'memory'}
		if table.contains(nighty, jsonChart.song:lower()) or weirdPolygonized then 
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
		fullMode = true
		local bg = newSprite('dave/backgrounds/shared/'..skyType, -600, -300)
		bg.scrollFactor = point(0.6, 0.6)
		--addWidth(bg)
		add(bg)
		local stageHills = newSprite('dave/backgrounds/dave-house/'..assetType..'hills', -834, -200)
		stageHills.scrollFactor = point(0.7, 0.7)
		--addWidth(stageHills)
		add(stageHills)
		local grassbg = newSprite('dave/backgrounds/dave-house/'..assetType..'grass bg', -1205, 580)
		--addWidth(grassbg)
		add(grassbg)
		local gate = newSprite('dave/backgrounds/dave-house/'..assetType..'gate', -755, 250)
		--addWidth(gate)
		add(gate)
		local stageFront = newSprite('dave/backgrounds/dave-house/'..assetType..'grass', -832, 505)
		--addWidth(stageFront)
		add(stageFront)

		local redsky
		if jsonChart.song:lower() == 'insanity' then
			redsky = newSprite('dave/backgrounds/void/redsky_insanity', -600, -200)
			redsky.shader = shaders:GLITCH()
			redsky.dontdraw = true
			redsky.image:setFilter(getAA(false))
			add(redsky)
		elseif weirdPolygonized then
			redsky = newSprite('dave/backgrounds/void/redsky', -600, -200)
			redsky.shader = shaders:GLITCH()
			redsky.dontdraw = true
			redsky.image:setFilter(getAA(false))
			add(redsky)

			local events = {
				finaly = function()
					redsky.dontdraw = false
					enemyObject:playAnim 'scared'
					enemyObject.skipDance = true
				end
			}
			weeks.bookmarkEvents = function(n, v)
				if events[n] then events[n](v) end
			end
		elseif jsonChart.song:lower() == 'supernovae' then
			local events = {
				fly = function()
					Timer.tween(15, enemyObject.sprite, {x = enemyObject.sprite.x - 25, y = enemyObject.sprite.y - 230})
				end,
				nofly = function()
					Timer.tween(0.6, enemyObject.sprite, {x = enemyObject.sprite.x + 25, y = enemyObject.sprite.y + 230})
				end
			}
			weeks.bookmarkEvents = function(n, v)
				if events[n] then events[n](v) end
			end
		elseif jsonChart.song:lower() == 'glitch' then
			local events = {
				fly = function()
					Timer.tween(20, enemyObject.sprite, {x = enemyObject.sprite.x - 25, y = enemyObject.sprite.y - 230})
				end,
				nofly = function()
					Timer.tween(1, enemyObject.sprite, {x = enemyObject.sprite.x + 25, y = enemyObject.sprite.y + 230})
				end
			}
			weeks.bookmarkEvents = function(n, v)
				if events[n] then events[n](v) end
			end
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
		local aaa = point(0, 100)
		girlfriend.x, girlfriend.y = 300, -60
		enemy.x, enemy.y = 50, 270
		boyfriend.x, boyfriend.y = 843, 270
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
		fullMode = true
		zoom = 0.8
		useeyesores = true

		local voidStuff = {
			cheating = 'cheater',
			unfairness = 'scarybg',
			exploitation = 'exploit/creepyRoom' --will probably be moved to its own stage like interdimensional soon
		}
		local void = voidStuff[jsonChart.song:lower()] or 'redsky'

		local bg = newSprite('dave/backgrounds/void/'..void, -600, -200)
		bg.shader = shaders:GLITCH()
		bg:getImage():setFilter('nearest', 'nearest')
		add(bg)
		--print('fudfs', fullMode)

		local alphaThing = {value = 0}
		local meAlpha = {value = 0}
		local songStuff = {
			polygonized = function()
				houseStage = getStage('house', true, 'sky_night', 'night/')
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
				bg.x, bg.y = 0, 200
				bg.sizeX, bg.sizeY = 3, 3
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
				bg.x, bg.y = -700, -350
				bg.sizeX, bg.sizeY = 2, 2
			end,
		}
		if songStuff[jsonChart.song:lower()] then songStuff[jsonChart.song:lower()]() end

		addChars()

		--aftger the stuff since housestage overrides the pos so this overrides the overisde that was a really bad explanation sorry
		girlfriend.x, girlfriend.y = 400, 130
		enemy.x, enemy.y = 100, 450
		boyfriend.x, boyfriend.y = 770, 450
	end,
	farm = function()
		zoom = 0.8
		fullMode = true
		girlfriend.x, girlfriend.y = 400, 130
		enemy.x, enemy.y = 100, 450
		boyfriend.x, boyfriend.y = 770, 450
		enemy.x = enemy.x + 100
		local skyType = jsonChart.stage == 'farm-night' and 'sky_night' or jsonChart.stage == 'farm-sunset' and 'sky_sunset' or 'sky'
		--skyType = 'sky_sunset'
		local nighty = {'splitathon', 'mealie'}
		if table.contains(nighty, jsonChart.song:lower()) then skyType = 'sky_night' end
		local sunsetBG, nightBG, globalColor
		local tweenTime = sectionStartTime(25) / 1000
		--local globalColorController = 
		if jsonChart.song:lower() == 'maze' then
			nightBG = newSprite('dave/backgrounds/shared/sky_night', -600, -200)
			nightBG.alphaMult = 1
			nightBG.scrollFactor = point(0.65, 0.65)
			add(nightBG)
			sunsetBG = newSprite('dave/backgrounds/shared/sky_sunset', -600, -200)
			sunsetBG.alphaMult = 1
			sunsetBG.scrollFactor = point(0.65, 0.65)
			add(sunsetBG)
			globalColor = {255, 255, 255}
		end
		local bg = newSprite('dave/backgrounds/shared/'..skyType, -600, -200)
		bg.alphaMult = 1
		bg.scrollFactor = point(0.65, 0.65)
		add(bg)

		local flatgrass = newSprite('dave/backgrounds/farm/gm_flatgrass', 350, 75)
		flatgrass.sizeX, flatgrass.sizeY = 0.34, 0.34
		flatgrass.scrollFactor = point(0.65, 0.65)
		add(flatgrass)

		local hills = newSprite('dave/backgrounds/farm/orangey hills', -173, 100)
		hills.scrollFactor = point(0.65, 0.65)
		add(hills)

		local farmHouse = newSprite('dave/backgrounds/farm/funfarmhouse', 100, 125)
		farmHouse.scrollFactor = point(0.7, 0.7)
		farmHouse.sizeX, farmHouse.sizeY = 0.9, 0.9
		add(farmHouse)

		local grassLand = newSprite('dave/backgrounds/farm/grass lands', -600, 500)
		add(grassLand)

		local cornFence = newSprite('dave/backgrounds/farm/cornFence', -400, 200)
		add(cornFence)

		local cornFence2 = newSprite('dave/backgrounds/farm/cornFence2', 1100, 200)
		add(cornFence2)

		local picnic
		if jsonChart.song:lower() == 'splitathon' then
			picnic = newSprite('dave/backgrounds/farm/picnic_towel_thing', 1050, 650)
			add(picnic)
		end

		local bagType = (love.math.random(0, 1000) == 0) and 'popeye' or 'cornbag'
		local cornBag = newSprite('dave/backgrounds/farm/'..bagType, 1200, 550)
		add(cornBag)

		local sign = newSprite('dave/backgrounds/farm/sign', 0, 350)
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
				songStart = function()
					Timer.tween(tweenTime, globalColor, sunsetColor, nil, function()
						Timer.tween(tweenTime, globalColor, nightColor)
					end)
					Timer.tween(tweenTime, bg, {alphaMult = 0}, nil, function()
						Timer.tween(tweenTime, sunsetBG, {alphaMult = 0})
					end)
				end
			end,
			splitathon = function()
				local bambi = character 'bambi-splitathon'
				bambi.sprite.x = enemy.x - 450
				bambi.sprite.y = enemy.y + 25
				bambi.skipDance = true
				bambi.sprite.dontdraw = true
				bambi.sprite.dontupdate = true
				add(bambi.sprite)
				local dave = character 'dave-splitathon'
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
			--if controls.down.left then moveSpr.x = moveSpr.x - mult
			--elseif controls.down.right then moveSpr.x = moveSpr.x + mult
			--end
			--if controls.down.down then moveSpr.y = moveSpr.y + mult
			--elseif controls.down.up then moveSpr.y = moveSpr.y - mult
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
		local aaa = point(0, 0)
		girlfriend.x, girlfriend.y = 200, 130
		enemy.x, enemy.y = 100, 450
		boyfriend.x, boyfriend.y = 570, 450
		
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
				{'dave', 'idle', 0.8, 175, 100},
				{'tristan', 'bop', 0.4, 800, 325}
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
					boyfriend.x, boyfriend.y = 700 - (411/2), -50 - (414/2)
					enemy.x, enemy.y = fromTopLeft(-21/0.7 - enemy.width/2, -10/0.7 - enemy.height/2 - 50)
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
					enemy.x, enemy.y = 100 - aaa.x, 450 - aaa.y
					boyfriend.x, boyfriend.y = 770 - aaa.x, 450 - aaa.y
				end
			}
			weeks.bookmarkEvents = function(n)
				if hi[n] then hi[n]() end
			end
		elseif jsonChart.song:lower() == 'greetings' then
			if greetingsCutscene then
				mainChars = {
					{'bambi', 'bambi idle', 0.9, 400, 350},
					{'tristan', 'bop', 0.4, 800, 325}
				}
			else
				mainChars = {
					{'dave', 'idle', 0.8, 175, 100},
					{'bambi', 'bambi idle', 0.9, 700, 350}
				}
			end
			weeks.bookmarkEvents = function(n)
				if n == 'coolzoom' then
					local curZoom = camZoom
					local time = (stepCrochet / 1000) * 20
					local z = {camZoom}
					Timer.tween(time, z, {camZoom+0.4}, nil, {after = function()
						camZoom = 0.7
					end, during = function(v)
						camZoom = z[1]
					end})
					overlayColor = {1,1,1,alpha=0}
					Timer.tween(time, overlayColor, {alpha=1}, nil, function()
						weeks:flash()
					end)
				end
			end
		elseif jsonChart.song:lower() == 'interdimensional' then
			mainChars = {
				{'bambi', 'bambi idle', 0.9, 400, 350},
				{'tristan', 'bop', 0.4, 800, 325}
			}
		end
		
		fullMode = true
		local bg = newSprite('dave/backgrounds/shared/sky_festival', -600, -230)
		bg.scrollFactor = point(0.6, 0.6)
		add(bg)

		local flatGrass = newSprite('dave/backgrounds/festival/gm_flatgrass', 800, -100)
		flatGrass.scrollFactor = point(0.7, 0.7)
		add(flatGrass)

		local farmHouse = newSprite('dave/backgrounds/festival/farmHouse', -300, -150)
		farmHouse.scrollFactor = point(0.7, 0.7)
		add(farmHouse)

		local hills = newSprite('dave/backgrounds/festival/hills', -1000, -100)
		hills.scrollFactor = point(0.7, 0.7)
		add(hills)

		local corn = graphics:newAnimatedSprite('dave/backgrounds/festival/corn', {
			{anim = 'corn', name = 'idle', fps = 5}
		}, 'corn')
		corn.scrollFactor = point(0.85, 0.85)
		corn:setPosition(-1000, 120)
		add(corn)

		local cornGlow = graphics:newAnimatedSprite('dave/backgrounds/festival/cornGlow', {
			{anim = 'cornGlow', name = 'idle', fps = 5, loops = true}
		}, 'cornGlow')
		cornGlow.scrollFactor = point(0.85, 0.85)
		cornGlow.blendMode = 'add'
		cornGlow:setPosition(-1000, 120)
		add(cornGlow)

		local backGrass = newSprite('dave/backgrounds/festival/backGrass', -1000, 475)
		backGrass.scrollFactor = point(0.85, 0.85)
		add(backGrass)

		local crowd = graphics:newAnimatedSprite('dave/backgrounds/festival/crowd', {
			{anim = 'idle', name = 'crowdDance', loops = true}
		}, 'idle')
		crowd.scrollFactor = point(0.85, 0.85)
		crowd:setPosition(-500, -150)
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
		
		local frontGrass = newSprite('dave/backgrounds/festival/frontGrass', -1300, 600) ---1300, 600
		add(frontGrass)

		addChars()

		local generalGlow = graphics:newAnimatedSprite('dave/backgrounds/festival/generalGlow', {
			{anim = 'glow', name = 'idle', fps = 5, loops = true}
		}, 'glow')
		generalGlow.blendMode = 'add'
		generalGlow:setPosition(-450, 400)
		add(generalGlow)

		onBeat = function(b)
			if b % 2 == 0 then
				for _,char in pairs(crowdChars) do
					char:animate 'idle'
				end
			end
		end
		return sprs
	end,
	interdimensional = function()
		zoom = 0.6

		houseStage = getStage 'festival'

		local bg = newSprite('dave/backgrounds/void/interdimensions/interdimensionVoid', -700, -350)
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
				bg.x, bg.y = -200, 0
			end,
			function()
				bg:setImage(voidBg 'darkSpace')
				bg.sizeX, bg.sizeY = 3, 3
				bg.x, bg.y = -200, 0
				Timer.tween(1, colorThing, {0, 0, 255})
			end,
			function()
				bg:setImage(voidBg 'hexagon')
				bg.sizeX, bg.sizeY = 3, 3
				Timer.tween(1, colorThing, {255, 255, 255})
			end,
			function()
				bg:setImage(voidBg 'nimbi/nimbiVoid')
				bg.sizeX, bg.sizeY = 3, 3

				nimbiLand.dontdraw = false
				nimbiSign.dontdraw = false
			end,
			function()
				bg:setImage(voidBg 'interdimensionVoid')
				bg.x, bg.y = -700, -350
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
		girlfriend.x, girlfriend.y = 500, -100
		enemy.x, enemy.y = 50, 300
		boyfriend.x, boyfriend.y = 790, 300
		fullMode = true

		
		local sunrise, sky
		if jsonChart.song:lower() == 'rano' then
			sky = newSprite('dave/backgrounds/shared/sky', 615, -670)
			sky.scrollFactor = point(0.6, 0.6)
			add(sky)

			sunrise = newSprite('dave/backgrounds/shared/sky_sunrise', -600, -400)
			sunrise.scrollFactor = point(0.6, 0.6)
			sunrise.alpha = 1
			add(sunrise)
		end

		local bg = newSprite('dave/backgrounds/shared/sky_festival', -600, -400)
		bg.scrollFactor = point(0.6, 0.6)
		bg.alpha = 1
		add(bg)

		local hills = newSprite('dave/backgrounds/backyard/hills', -1330, -432)
		hills.scrollFactor = point(0.75, 0.75)
		add(hills)

		local grass = newSprite('dave/backgrounds/backyard/supergrass', -800, 150)
		add(grass)

		local gates = newSprite('dave/backgrounds/backyard/gates', 564, -33)
		add(gates)

		--thats a bear!
		local bear = newSprite('dave/backgrounds/backyard/bearDude', -1035, -710)
		bear.scrollFactor = point(0.95, 0.95)
		add(bear)

		local house = newSprite('dave/backgrounds/backyard/house', -1025, -323)
		house.scrollFactor = point(0.95, 0.95)
		add(house)

		
		addChars()
		
		local grill = newSprite('dave/backgrounds/backyard/grill', -489, 452)
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
			--if controls.down.left then moveSpr.x = moveSpr.x - mult
			--elseif controls.down.right then moveSpr.x = moveSpr.x + mult
			--end
			--if controls.down.down then moveSpr.y = moveSpr.y + mult
			--elseif controls.down.up then moveSpr.y = moveSpr.y - mult
			--end
			--if controls.pressed.confirm then
			--	print('MY POS:', moveSpr.x, moveSpr.y)
			--end
		end
		if jsonChart.song:lower() == 'rano' then
			songStart = function()
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
		--	if controls.down.left then moveSpr.x = moveSpr.x - mult
		--	elseif controls.down.right then moveSpr.x = moveSpr.x + mult
		--	end
		--	if controls.down.down then moveSpr.y = moveSpr.y + mult
		--	elseif controls.down.up then moveSpr.y = moveSpr.y - mult
		--	end
		--	if controls.pressed.confirm then
		--		print('MY POS:', moveSpr.x, moveSpr.y)
		--	end
		--end
	end,
	--everything from here on out is actually good
	freeplay = function()
		local daveBG, bambiBG, tristanBG = funkin.randomBG(), funkin.randomBG(), funkin.randomBG()
		zoom = 0.4
		local function img(p) return paths.image('dave/'..p) end

		local full = {full=true}

		local darksky = graphics.newImage(img 'recursed/darksky', full)
		darksky.sizeX, darksky.sizeY = ((1/zoom) * 2), 1/zoom
		darksky.x = -1280*2
		darksky.y = (720 - (darksky.height*darksky.sizeY)) / 2
		add(darksky)

		local darksky2 = graphics.newImage(img 'recursed/darksky', full)
		darksky2.sizeX, darksky2.sizeY = ((1/zoom) * 2), 1/zoom
		darksky2.y = darksky.y
		add(darksky2)

		local freeplayBG = graphics.newImage(paths.image(daveBG))
		freeplayBG.sizeX, freeplayBG.sizeY = 2,2
		freeplayBG.color = {hex2rgb '0xFF4965FF'}
		freeplayBG.color2 = {rgb255(44, 44, 44)}
		freeplayBG.alpha = 0
		freeplayBG.scrollFactor = point()
		add(freeplayBG)

		local scrolls = {}
		for _,v in pairs{'davescroll','bambiscroll','tristanscroll'} do
			local image = img('recursed/'..v)
			image:setWrap('repeat', 'repeat')
			image:setFilter(getAA(false))
			scrolls[v] = image
		end

		local gridguy = scrolls.davescroll
		local gridframe = love.graphics.newQuad(0, 0, gridguy:getWidth() * 6, gridguy:getHeight() * 4, gridguy:getWidth(), gridguy:getHeight())

		local charBackdrop = graphics.newImage(gridguy, {quad=gridframe})
		charBackdrop.color = {255,255,255}
		charBackdrop.color2 = {rgb255(44,44,44)}
		charBackdrop.alpha = 0
		charBackdrop.sizeX, charBackdrop.sizeY = 2,2
		add(charBackdrop)

		local daveSongs = {'House', 'Insanity', 'Polygonized', 'Bonus Song'};
		local bambiSongs = {'Blocked', 'Corn-Theft', 'Maze', 'Mealie'};
		local tristanSongs = {'Adventure', 'Vs-Tristan', 'Greetings'}; --added greetings to here since cmon man only 2 songs thats pathetic

		local alphabets = {}
		local function newAlphabet(list)
			for i,v in pairs(alphabets) do v.dontdraw = true end
			alphabets = {}
			local startWidth = 640
			local width = startWidth
			local row = 0
			while row < 720 do
				while width < (1280*2) do
					for _,curSong in pairs(list) do
						curSong:gsub('.', function(c)
							local angvel = love.math.random(300, 500)/10
							angvel = angvel * (love.math.random(1,2) == 1 and -1 or 1)
							local vel = point(love.math.random(-500, 500)/10, love.math.random(-500, 500)/10)
							local txt = {
								draw = function(self)
									fonts('comic', 256)
									printfOutline(c, self.x, self.y, nil, {angle = self.angle, alpha = self.alpha})
								end,
								update = function(self, dt)
									self.angle = self.angle + dt * angvel * 2
									self.x, self.y = self.x + vel.x*dt, self.y + vel.y*dt
								end,
								x = love.math.random(-1280, 1280 * 2.5),
								y = love.math.random(0, love.math.random(-720, (720 * 2.5) -720)),
								angle = 0,
								alpha = 0,
							}
							width = width + curFont:getWidth(c) + 20
							table.insert(alphabets, txt)
							add(txt)
							--print('inserting', c, 'from', curSong)
						end)
						if width > 1280 * 2 then break end
					end
					--print('new width:', width)
				end
				row = row + 512
				width = startWidth
			end
		end
		newAlphabet(daveSongs)

		girlfriend.x, girlfriend.y = 30, -90
		enemy.x, enemy.y = -380, -110
		boyfriend.x, boyfriend.y = 400, 200

		addChars()

		local darkskylimit = darksky.x + (darksky.width*darksky.sizeX)
		local darkskyx = darksky.x
		local camRight = false
		onUpdate = function(dt)
			charBackdrop.x = charBackdrop.x - 150 * dt
			charBackdrop.y = charBackdrop.y + 150 * dt
			darksky.x = darksky.x + (40 * 150 * dt)
			if darksky.x >= darkskylimit then
				darksky.x = darkskyx
			end
			darksky2.x = darksky.x - (darksky.width*darksky.sizeX)
			freeplayBG.alpha = lerp(freeplayBG.alpha,0,dt*7)
			charBackdrop.alpha = lerp(charBackdrop.alpha,0,dt*7)
			for _,v in pairs(alphabets) do
				v.alpha = lerp(v.alpha, 0,dt*7)
			end
			if isRecursed then
				screenAngle = screenAngle + (dt * 5 * (camRight and 1 or -1))
				if screenAngle > 8 then
					camRight = false
				elseif screenAngle < -8 then
					camRight = true
				end
			else
				screenAngle = 0
				screenRadian = 0
			end
		end
		onBeat = function(b)
			if b % 4 == 0 then
				freeplayBG.alpha = 0.8
				charBackdrop.x, charBackdrop.y = -1280/2 + (gridguy:getWidth() * 6)/2, -720/2 - (gridguy:getHeight() * 4)/4
				charBackdrop.alpha = 0.8
				for i,v in pairs(alphabets) do
					v.alpha = 0.4
				end
			end
		end
		local events = {
			bambimode = function()
				charBackdrop:setImage(scrolls.bambiscroll)
				freeplayBG:setImage(paths.image(bambiBG))
				freeplayBG.color = {hex2rgb '0xFF00B515'}
				newAlphabet(bambiSongs)
			end,
			tristanmode = function()
				charBackdrop:setImage(scrolls.tristanscroll)
				freeplayBG:setImage(paths.image(tristanBG))
				freeplayBG.color = {hex2rgb '0xFFFF0000'}
				newAlphabet(tristanSongs)
			end
		}
		weeks.bookmarkEvents = function(n, v)
			if events[n] then events[n](v) end
		end
	end,
	master = function()
		zoom = 0.4
		local space = graphics.newImage(paths.image'dave/backgrounds/shared/sky_space', {full=true})
		space.scrollFactor = point(1.2, 1.2)
		space.sizeX, space.sizeY = 10, 10
		space.x, space.y = 2000, 1000
		space.image:setFilter(getAA(false))
		add(space)

		local land = graphics.newImage(paths.image'dave/backgrounds/dave-house/land', {full=true})
		land.scrollFactor = point(0.9, 0.9)
		land.x, land.y = 675, 555
		add(land)

		
		girlfriend.x, girlfriend.y = 15, -390
		enemy.x, enemy.y = -enemy.width + 150, 150 -enemy.height
		boyfriend.x, boyfriend.y = 300, -150

		addChars()

		paths.sounds 'dead'
		eventEvents = function(n)
			if n:lower() == 'play animation' then
				paths.sounds 'dead':play()
			end
		end
	end,
	roof = function()
		zoom = 0.8
		local roof = graphics.newImage(paths.image'dave/backgrounds/gm_house5', {full=true})
		roof.x, roof.y = -584, -397
		roof.sizeX, roof.sizeY = 2, 2
		add(roof)

		girlfriend.x, girlfriend.y = 232, -1
		enemy.x, enemy.y = -3, 467
		boyfriend.x, boyfriend.y = 859, 343

		addChars()
		--local moveSpr = enemy
		--onUpdate = function(dt)
		--	local mult = 1
		--	if controls.down.gameFive then mult = 2 
		--	else mult = 1 
		--	end
		--	if controls.down.left then moveSpr.x = moveSpr.x - mult
		--	elseif controls.down.right then moveSpr.x = moveSpr.x + mult
		--	end
		--	if controls.down.down then moveSpr.y = moveSpr.y + mult
		--	elseif controls.down.up then moveSpr.y = moveSpr.y - mult
		--	end
		--	if controls.pressed.confirm then
		--		print('MY POS:', moveSpr.x, moveSpr.y)
		--	end
		--end
		
	end,
	['inside-house'] = function()
		local aaa = point(775, 500)
		girlfriend.x, girlfriend.y = 400 - aaa.x, 130 - aaa.y
		enemy.x, enemy.y = 100 - aaa.x, 450 - aaa.y
		boyfriend.x, boyfriend.y = 770 - aaa.x, 450 - aaa.y
		zoom = 0.6

		local bg = graphics.newImage(paths.image'dave/backgrounds/inside_house')
		bg.y = -50
		add(bg)

		local moveSpr = boyfriend
		local dx = point()
		onUpdate = function(dt)
			if update then update(dt) end
			for _,spr in pairs(sprites) do
				spr.color = globalColor
				--print('this spr color should be global color lol!')
			end
			enemy.color = globalColor
			boyfriend.color = globalColor
			girlfriend.color = globalColor
			local mult = 1
			if controls.down.gameFive then mult = 2 
			else mult = 1 
			end
			if controls.down.left then 
				moveSpr.x = moveSpr.x - mult
				dx.x = dx.x - mult
			elseif controls.down.right then 
				moveSpr.x = moveSpr.x + mult
				dx.x = dx.x + mult
			end
			if controls.down.down then 
				moveSpr.y = moveSpr.y + mult
				dx.y = dx.y + mult
			elseif controls.down.up then 
				moveSpr.y = moveSpr.y - mult
				dx.y = dx.y - mult
			end
			if controls.pressed.confirm then
				print('MY POS:', table.concat({dx.x, -dx.y}, ', '))
			end
		end

		addChars()
	end,
	desert = function()
		zoom = 0.5
		fullMode = true
		girlfriend.x, girlfriend.y = 400, 130
		enemy.x, enemy.y = 100 - 160, 450 - 350
		boyfriend.x, boyfriend.y = 770 - 275, 450 - 160
		enemyObject.camPos.y = enemyObject.camPos.y - 100
		boyfriendObject.camPos.y = boyfriendObject.camPos.y - 100

		local nightBG = newSprite('dave/backgrounds/shared/sky_night', -1250, -700)
		nightBG.alpha = 1
		nightBG.sizeX, nightBG.sizeY = 2, 2
		nightBG.sky = true
		nightBG.scrollFactor = point(0.2, 0.2)
		add(nightBG)

		local sunsetBG = newSprite('dave/backgrounds/shared/sky_sunset', -1250, -700)
		sunsetBG.alpha = 1
		sunsetBG.sizeX, sunsetBG.sizeY = 2, 2
		sunsetBG.sky = true
		sunsetBG.scrollFactor = point(0.2, 0.2)
		add(sunsetBG)

		local bg = newSprite('dave/backgrounds/shared/sky', -1250, -700)
		bg.sizeX, bg.sizeY = 2, 2
		bg.alpha = 1
		bg.sky = true
		bg.scrollFactor = point(0.2, 0.2)
		add(bg)

		

		

		local desertBG	= newSprite('dave/backgrounds/wedcape_from_cali_backlground', -786, -500)
		desertBG.sizeX, desertBG.sizeY = 1.2, 1.2
		add(desertBG)

		local desertBG2	= newSprite('dave/backgrounds/wedcape_from_cali_backlground', -786 - desertBG.width, -500)
		desertBG2.sizeX, desertBG2.sizeY = 1.2, 1.2
		add(desertBG2)

		
		local georgia = newSprite('dave/california/geor gea', 400, -50)
		georgia.dontdraw = true
		georgia.sizeX, georgia.sizeY = 2.5, 2.5
		georgia.color = nightColor
		georgia.sky = true
		add(georgia)

		local sign = newSprite('dave/california/leavingCalifornia', 500, 450)
		add(sign)

		local train = graphics:newAnimatedSprite('dave/california/train', {
			{name = 'trainRide', anim = 'idle', loops = true, fps = 0}
		}, 'idle')
		train.x, train.y = -800, 500
		train.sizeX, train.sizeY = 2.5, 2.5
		train.image:setFilter(getAA(false))
		add(train)

		addChars()

		for _,v in pairs{'1500miles', '1000miles', '500miles', 'welcomeToGeorgia'} do paths.image('dave/california/'..v) end

		if funkin.curSong:lower() == 'escape-from-california' then
			local trainSpeed = {0}
			local scrollSpeed = 100
			local tend = false
			local globalColor = {255, 255, 255}
			songStart = function()
				local tweenTime = sectionStartTime(56) / 1000
				Timer.tween(tweenTime, bg, {alpha = 0}, nil, function()
					Timer.tween(tweenTime, sunsetBG, {alpha = 0})
				end)
				Timer.tween(tweenTime, globalColor, sunsetColor, nil, function()
					Timer.tween(tweenTime, globalColor, nightColor)
				end)
				enemyObject:playAnim ('helpMe', function()
					enemyObject.skipOtherAnims = false
				end)
				Timer.tween(2, trainSpeed, {30}, nil, {during = function()
					train:setAnimSpeed(lerp(0, 24, trainSpeed[1]/30))
				end})
				enemyObject.skipOtherAnims = true
			end
			onUpdate = function(dt)
				for i,v in pairs(sprites) do
					if not v.sky then
						v.color = globalColor
					end
				end
				desertBG.x = desertBG.x - trainSpeed[1] * scrollSpeed * dt
				if desertBG.x <= -(desertBG.width) + (desertBG.width - 1280) then
					desertBG.x = desertBG.width - 1280
				end
				desertBG2.x = desertBG.x - desertBG.width
				sign.x = sign.x - trainSpeed[1] * scrollSpeed * dt
				if tend then
					georgia.x = georgia.x - trainSpeed[1] * scrollSpeed * dt
				end
			end
			local hi = {
				wa = function()
					weeks:setCamShaking(true)
					overlayColor = {1,1,1,alpha=0}
					Timer.tween(0.6, overlayColor, {alpha=1}, nil, function()
						weeks:setCamShaking(false)
						weeks:flash()
					end)
				end,
				wah = function()
					weeks:setCamShaking(true)
					enemyObject:playAnim('waa', function()
						enemyObject.skipOtherAnims = false
						weeks:setCamShaking(false)
					end)
					enemyObject.skipOtherAnims = true
				end,
				changeSign = function(v)
					sign:setImage(paths.image('dave/california/'..v))
					if v == 'welcomeToGeorgia' then
						sign.x = 1000
					else
						sign.x = 1280 + sign.width
					end
				end,
				fade = function()
					Timer.tween((crochet * 8) / 1000, overlayColor, {alpha=1}, nil, function()
						weeks:flash()
					end)
				end,
				['end'] = function()
					tend = true
					weeks.bookmarkEvents('changeSign', 'welcomeToGeorgia')
					desertBG.dontdraw = true
					desertBG2.dontdraw = true
					georgia.dontdraw = false
					Timer.tween(3, trainSpeed, {0}, 'out-expo', {during = function()
						train:setAnimSpeed(lerp(0, 24, trainSpeed[1]/30))
					end})
				end
			}
			weeks.bookmarkEvents = function(n, v)
				if hi[n] then hi[n](v) end
			end
		end
	end,
	office = function()
		hudFont = 'fnaf'
		hudFontScale = 2
		zoom = 0.9
		fullMode = true

		enemy.x, enemy.y = 306, 50
		boyfriend.x, boyfriend.y = 86, 100

		local backdoor = newSprite('dave/backgrounds/office/backFloor', -500, -130)
		add(backdoor)

		
		girlfriend.isChar = 2
		boyfriend.isChar = 0
		enemy.isChar = 1
		add(girlfriend)
		add(boyfriend)

		local floor = newSprite('dave/backgrounds/office/floor', -689, 525)
		add(floor)

		local dsa = {}
		for i=22,11,-1 do table.insert(dsa, i) end
		local doa = {}
		for i=11,0,-1 do table.insert(doa, i) end
		local door = graphics:newAnimatedSprite('dave/backgrounds/office/door', {
			{anim = 'idle', name = 'doorLOL instance 1', fps = 0, indices = {11}},
			{anim = 'doorShut', name = 'doorLOL instance 1', indices = dsa},
			{anim = 'doorOpen', name = 'doorLOL instance 1', indices = doa},
		}, 'idle')
		door.x, door.y = 68, -152
		add(door)

		local frontWall = newSprite('dave/backgrounds/office/frontWall', -716, -381)
		add(frontWall)

		local doorButton = newSprite('dave/fiveNights/btn_doorOpen', 521, 61)
		add(doorButton)

		add(enemy)
		
		local doorClosed = false
		local powerDrainer = 1
		local power = 100
		local doorChanging = false
		--powerMeter = graphics.newImage()
		if funkin.curSong:lower() == 'five-nights' then
			local me = {
				swap = function()
					weeks:switchNoteSide()
				end,
				attack = function()
					print 'nofriend attack'
					enemyObject:playAnim('attack', function()
						if doorClosed then
							enemyObject.skipOtherAnims = false
							enemyObject:playAnim('fail', function()
								enemyObject.skipOtherAnims = false
							end)
							enemyObject.skipOtherAnims = true
						else
							health = 0
						end
					end)
					enemyObject.skipOtherAnims = true
				end
			}
			weeks.bookmarkEvents = function(n, v)
				print('hi', n, me[n])
				if me[n] then me[n](v) end
			end
		end
		for _,v in pairs{'yay', 'doorInteract', 'error', 'powerOut', 'run1', 'run2', 'scream', 'slam', 'static'} do
			paths.sounds('fiveNights/'..v)
		end
		onUpdate = function()
			if controls.pressed.gameFive and not doorChanging then
				doorClosed = not doorClosed
				doorButton:setImage(paths.image(doorClosed and 'dave/fivenights/btn_doorClosed' or 'dave/fivenights/btn_doorOpen'))
				powerDrainer = doorClosed and 3 or 1
				doorChanging = true
				door:animate(doorClosed and 'doorOpen' or 'doorShut', function()
					doorChanging = false
				end)
				paths.sounds 'fiveNights/doorInteract':stop()
				paths.sounds 'fiveNights/doorInteract':play()
			end
		end
	end,
}
return {
	enter = function(self, from, songNum, songAppend)
		fullMode = false
		stopthisnow = false
		hudShader = nil
		jsonChart = weeks:enter()
		bambcon = nil
		hudFont = 'comic'
		hudFontScale = 1
		print(jsonChart)
		zoom = nil

		song = songNum
		difficulty = songAppend

		function getStage(stage, ...)
			return stages[stage](...)
		end
		
		for k,v in pairs(songtostage) do
			if table.contains(v, jsonChart.song:lower()) then
				jsonChart.stage = k
				davemode = true
				print ('ENABLING DAVE MODEEEE', funkin.curSong)
				break
			end
		end
		if weirdPolygonized then
			jsonChart.stage = 'house'
		end
		if jsonChart.stage and stages[jsonChart.stage] then
			stages[jsonChart.stage]()
		else
			stages.stage()
		end
		zoom = zoom or 1
		--print('setting the zoom toooo', zoom)
		camZoom = zoom
		curCamZoom = zoom
		origZoom = zoom
		if useeyesores then
			eyesore = shaders:EYESORE()
		end

		self:load()
	end,

	load = function(self)
		weeks:load()

		self:initUI()
		if (storyMode and paths.dialogue(funkin.curSong) or weirdPolygonized) and not playedCutscene then
			playedCutscene = true
			openSubstate(dialogue, false, funkin.curSong..(weirdPolygonized and '-recurser' or ''))
		else
			weeks:setupCountdown()
		end
		cam.x = -(girlfriendObject.sprite.width/2)-girlfriendObject.sprite.x+girlfriendObject.camPos.x
		cam.y = -(girlfriendObject.sprite.height/2)-girlfriendObject.sprite.y+girlfriendObject.camPos.x
		camPos:fromPoint(cam)
		if scripts then
			scripts:call 'onCreatePost'
		end
	end,

	initUI = function(self)
		weeks:initUI()

		weeks:generateNotes()
	end,

	update = function(self, dt)
		if transOut then return end
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
		if scripts then
			scripts:call('onUpdate', dt)
		end
	end,
	songEnd = function(self)
		if storyMode and songFinished and paths.dialogue(funkin.curSong..'-endDialogue') and not cutscene then
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
			if funkin.curSong == 'greetings' and not greetingsCutscene then
				greetingsCutscene = true
				switchState(stage)
			else
				greetingsCutscene = false
				songIndex = songIndex + 1
				funkin.curSong = funkin.songList[songIndex]:lower()
				completeScore = (completeScore or 0) + score
				playedCutscene = false
				if songIndex == 3 and curWeek == '_WEEK2' then
					switchState(layeredCutscene, false, 'mazeCutscene', 'break_phone', 24, {0.75, 1.5, 0.75, 2.67})
				else
					switchState(stage)
				end
			end
		else
			if songFinished and not noMissMode then
				print 'writing highscore'
				if not storyMode then
					local curHighscore = save.highscores[funkin.curSong:lower()] or -99999999
					if score > curHighscore then
						save.highscores[funkin.curSong:lower()] = score
						save.highscoreChars[funkin.curSong:lower()] = charOverride or 'bf'
						save:writeSave()
					end
				else
					local curHighscore = save.highscores[curWeek] or -99999999
					completeScore = (completeScore or 0) + score
					if completeScore > curHighscore then
						save.highscores[curWeek] = completeScore
						save.highscoreChars[funkin.curSong:lower()] = charOverride or 'bf'
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
				elseif curWeek == '_WEEK4' then
					--save.save.beatGame = true
					--save.writeSave()
					switchState(menuCredits)
					whatever = true
					myBallsJustBlewUp = false
				elseif weirdPolygonized then
					whatever = true
					myBallsJustBlewUp = false
					switchState(recurserState)
				elseif funkin.curSong:lower() == 'bonus-song' then
					save.save.unlocked_dave = true
				elseif funkin.curSong:lower() == 'cheating' then
					save.save['unlocked_bambi-3d'] = true
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
		if scripts then
			scripts:call 'draw'
		end
	end,

	leave = function(self)
		weirdPolygonized = false
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
	end,

	addSpr = function(self, spr)
		return add(spr)
	end,
	removeSpr = function(self, index)
		return table.remove(sprites, index)
	end,
	setOnUpdate = function(self, ou)
		onUpdate = ou
	end
}
