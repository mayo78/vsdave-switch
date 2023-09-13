local util = mukoUtil
local function random(a, b) --randomizer that supports random floats
	if math.floor(a) ~= a or math.floor(b) ~= b then
		local scale = 1
		while math.floor(a) ~= a or math.floor(b) ~= b do
			scale = scale * 10
			a = a * 10
			b = b * 10
		end
		scale = scale * 10
		a = a * 10
		b = b * 10
		return love.math.random(a, b)/scale
	else
		return love.math.random(a, b)
	end
end
-- Collision detection function;
-- Returns true if two boxes overlap, false if they don't;
-- x1,y1 are the top-left coords of the first box, while w1,h1 are its width and height;
-- x2,y2,w2 & h2 are the same, but for the second box.
local function CheckCollision(x1,y1,w1,h1, x2,y2,w2,h2)
  return x1 < x2+w2 and
         x2 < x1+w1 and
         y1 < y2+h2 and
         y2 < y1+h1
end

local office, inCams, camFlipper, map, usageSprite, cam, static, staticImages, door, doorImages
local staticTimer, staticIndex
local powerUsage, power
local cams = {}
local camIndex
local doorClosed, doorJammed
do
	local camList = {'stage_empty', 'diner', 'lounge', 'hall', 'kitchen'}
	for i=1,5 do table.insert(cams, {name = 'cam_0'..i, cam = camList[i], num = i}) end
end
local function powerLoop()
	power = power - powerUsage
	if power > 0 then
		Timer.after(8.9 + random(-0.05, 0.6), powerLoop)
	end
end
local frame30

local cameraScrollLoop

local freeze
local camBounds = {util:getX(120), util:getY(240)}
local function frame30loop() --fixed 30 fps update thing
	if camIndex ~= 4 then
		cameraScrollLoop = cameraScrollLoop + 1
		if cameraScrollLoop <= 120 then
			cam.x = cam.x - 2
		else
			if cameraScrollLoop > 240 then
				cameraScrollLoop = 0
			else
				cam.x = cam.x + 2
			end
		end
	end
end
local function changeCam(how)
	local lastCam = camIndex
	camIndex = camIndex + how
	if camIndex > #cams then camIndex = 1
	elseif camIndex < 1 then camIndex = #cams
	end
	cam.x = (camIndex == 4) and 0 or camBounds[1]
	cameraScrollLoop = 0
	cam:setImage(cams[camIndex].image)
	if camIndex == 4 then powerUsage = powerUsage + 1
	elseif lastCam == 4 then powerUsage = powerUsage - 1
	end
end
local ai
local function character(name, spots, level, pos, handler)
	local char = {
		camImages = {},
		pos = pos,
		handler = handler,
		level = level,
		visible = true,
		updateSprite = function(self)
			print('updateing sprite', name, self.pos)
			if self.camImages[self.pos] then
				self.visible = true
				self.sprite:setImage(self.camImages[self.pos])
			else
				self.visible = false
			end
		end,
	}
	handler.char = char
	for i,v in pairs(spots) do
		char.camImages[i] = paths.image('muko/cameras/characters/'..name..'/'..v)
	end
	char.sprite = graphics.newImage(char.camImages[pos])
	char.sprite.sizeX, char.sprite.sizeY = 1.5, 1.5
	handler:start()
	return char
end
local mukoHandler, daveHandler, tiktokHandler, scottHandler, mixHandler
local jumpscare, jumpscareSprites, doingJumpscare, jumpscareLoop, nextJumpscare, doneJumpscare
local function doJumpscare()
	doingJumpscare = true
	if inCams then
		inCams = false
	end
	jumpscare:setImage(jumpscareSprites[nextJumpscare])
	Timer.clear()
end
local function amLoop()
	time = time + 1
	if time == 13 then 
		time = 1
	elseif time == 1 then
		ai.muko.level = ai.muko.level + 1
	elseif time == 2 then
		ai.mix.level = ai.mix.level + 1
	elseif time == 3 then
		ai.dave.level = ai.dave.level + 1
	elseif time == 4 then
		if ai.tiktok.level ~= 0 then
			ai.tiktok.level = ai.tiktok.level + 1
		end
	elseif time == 5 then
		ai.dave.level = ai.dave.level + 1
		ai.mix.level = ai.mix.level - 1
		ai.muko.level = ai.muko.level + 1
	else
		print 'finished Night!!'
		return
	end
	Timer.after(70, amLoop)
end
return {
	enter = function(self)
		doneJumpscare = false
		nextJumpscare = nil
		jumpscareLoop = 1
		freeze = false
		self:initChars()
		local aiLevels = {
			muko = {2, 3, 5, 7, 8, 13, mukoAi.muko or 0},
			dave = {0, 4, 5, 6, 7, 11, mukoAi.dave or 0},
			tiktok = {0, 0, 2, 6, 12, 16, mukoAi.tiktok or 0},
			scott = {0, 1, 2, 4, 8, 13, mukoAi.scott or 0},
			mix = {0, 1, 3, 6, 10, 13, mukoAi.mix or 0}
		}
		ai = {
			muko = character('muko', {nil, 'diner_just_muko', 'muko_bar'}, aiLevels.muko[mukoDay], 2, mukoHandler),
			dave = character('dave', {'stage_just_dave', 'diner_dave', 'dave_bar'}, aiLevels.dave[mukoDay], 1, daveHandler),
			tiktok = character('tiktok', {[5] = 'kitchen_tiktok'}, aiLevels.tiktok[mukoDay], 5, tiktokHandler),
			scott = character('scott', {'scott_generic', 'scott_generic', 'lounge_travis_only', nil, 'scott_generic'}, aiLevels.scott[mukoDay], 3, scottHandler),
			mix = character('mix', {[2] = 'diner_mix', [5] = 'kitchen_mix'}, aiLevels.mix[mukoDay], 5, mixHandler)
		}
		doorClosed = false
		doorJammed = false
		cameraScrollLoop = 0 
		frame30 = 0
		camIndex = 1
		power = 100
		powerUsage = 0
		time = 12
		powerLoop()
		powerUsage = 1
		inCams = false
		office = graphics.newImage(paths.image('muko/office/office'))
		office.sizeX, office.sizeY = 1.5, 1.5
		for k,v in pairs(cams) do
			v.image = paths.image('muko/cameras/'..v.cam)
		end
		cam = graphics.newImage(cams[1].image)
		cam.x = util:getX(120)
		cam.sizeX, cam.sizeY = 1.5, 1.5
		camFlipper = graphics.newImage(paths.image('muko/office/canera_thing'))
		camFlipper.y = util:getY(-159)
		do
			local pos = {
				point(133, -4),
				point(155, -58),
				point(95, -123),
				point(137, -100),
				point(207, -113),
			}
			for i,v in pairs(cams) do
				v.sprite = graphics.newImage(paths.image('muko/cameras/buttons/'..v.name), {full = false})
				v.sprite.sizeX, v.sprite.sizeY = 0.5, 0.5
				v.sprite.x, v.sprite.y = util:getX(pos[i].x), util:getY(pos[i].y)
			end
		end
		map = graphics.newImage(paths.image('muko/cameras/map'))
		map.x, map.y = util:getX(158), util:getY(-58)
		map.sizeX, map.sizeY = 0.6, 0.6

		usageSprite = graphics.newImage(paths.image('muko/office/usage'))
		usageSprite.sizeX, usageSprite.sizeY = 0.8, 0.8
		usageSprite.x, usageSprite.y = util:getX(195), util:getY(-159)

		staticTimer = 0
		staticIndex = false
		staticImages = {paths.image('muko/shared/camera'), paths.image('muko/shared/camera2')}
		static = graphics.newImage(staticImages[1])

		doorImages = {paths.image('muko/office/open_door'), paths.image('muko/office/close_door')}
		door = graphics.newImage(doorImages[1])
		door.sizeX, door.sizeY = 0.5, 0.5
		paths.sounds'muko/door'

		tiktokSong = graphics.newImage(paths.image('muko/office/tiktoksong'))
		cursor = graphics.newImage(paths.image('muko/office/cursor'))

		jumpscareSprites = {}
		for i,v in pairs(ai) do
			jumpscareSprites[i] = paths.image('muko/jumpscares/'..i)
		end
		jumpscare = graphics.newImage(jumpscareSprites.muko)
	end,
	leave = function()
		Timer.clear()
	end,
	draw = function()
		love.graphics.push()
		love.graphics.translate(lovesize.getWidth()/2,lovesize.getHeight()/2)
		love.graphics.scale(480/960, 360/720)
		if not inCams then
			office:draw()
			local darkness = controls.down.mukoDoor and 0.5 or 1
			love.graphics.setColor(darkness, darkness, darkness, doorJammed and 0.3 or 1)
			door:draw()
			love.graphics.setColor(1, 1, 1)
			if tiktokHandler.visible then
				tiktokSong:draw()
			end
			love.graphics.setColor(1, 1, 1, (tiktokHandler.visible and 1 or 0.25))
			cursor:draw()
			love.graphics.setColor(1, 1, 1)
			if nextJumpscare then
				jumpscare:draw()
			end
		else
			cam:draw()
			for i,v in pairs(ai) do
				if v.visible and v.pos == camIndex then
					--if camIndex == 4 then print 'WARNIGN !!! warnihng the warn' end
					v.sprite.x = cam.x
					v.sprite:draw()
				end
			end
			love.graphics.setColor(1, 1, 1, 0.2)
			static:draw()
			love.graphics.setColor(1, 1, 1)
			map:draw()
			for i,v in pairs(cams) do
				if i == camIndex then
					love.graphics.setColor(1, 0, 0)
				end
				v.sprite:draw()
				if i == camIndex then
					love.graphics.setColor(1, 1, 1)
				end
			end
		end
		camFlipper:draw()
		usageSprite:draw()
		love.graphics.setColor(0,0,0)
		love.graphics.rectangle('fill', usageSprite.x + usageSprite.width*0.4, usageSprite.y - usageSprite.height*0.4, -(5-powerUsage)*33, usageSprite.height * 0.8)
		love.graphics.setColor(1,1,1)
		fonts('notosans', 32)
		love.graphics.print(time..' AM', util:getX(193) - curFont:getWidth(time..' AM')/2, util:getY(147) - 16)
		love.graphics.print('Night '..mukoDay, util:getX(189) - curFont:getWidth('Night '..mukoDay)/2, util:getY(128) - 16)
		love.graphics.pop()
		love.graphics.setColor(rgb255(hex2rgb 'C3CCD9'))
		love.graphics.roundrect('fill', 6, 324, 52, 22, 25, 3, 7)
		love.graphics.setColor(rgb255(hex2rgb 'FF8C1A'))
		love.graphics.roundrect('fill', 7, 325, 50, 20, 25, 3, 7)
		love.graphics.setColor(1,1,1)
		fonts('notosans', 16)
		love.graphics.print(power, 26-curFont:getWidth(power)/2 + 3, 322)
--		love.graphics.printf([[Muko: ]]..ai.muko.pos..[[
--Dave: ]]..ai.dave.pos..[[
--Scott: ]]..ai.scott.pos, 0, 25, 9999)
		love.graphics.print(tiktokHandler:getMisses(), 0, 50)
	end,
	update = function(self, dt)
		frame30 = frame30 + (30 * dt)
		if frame30 >= 1 then 
			frame30loop()
			frame30 = 0
		end
		if nextJumpscare and not (doingJumpscare or doneJumpscare) then
			freeze = true
			doJumpscare()
		end
		if doingJumpscare then
			jumpscare.sizeX, jumpscare.sizeY = jumpscare.sizeX + 0.1 * dt * 30, jumpscare.sizeY + 0.1 * dt * 30
			jumpscare.y = jumpscare.y + (10 * util.scaleY) * dt * 30
			jumpscareLoop = jumpscareLoop + dt * 30
			if jumpscareLoop >= 20 then
				switchState(mukoTitle)
				doneJumpscare = true
				doingJumpscare = false
			end
		end
		if freeze then
			return
		end
		if not inCams then
			if controls.down.left and office.x < camBounds[1] then
				office.x = office.x + dt * 350
				if office.x > camBounds[1] then office.x = camBounds[1] end
			elseif controls.down.right and office.x > -camBounds[1] then
				office.x = office.x - dt * 350
				if office.x < -camBounds[1] then office.x = -camBounds[1] end
			end
			tiktokSong.x, tiktokSong.y = office.x + tiktokHandler.pos.x, office.y + tiktokHandler.pos.y
			if controls.pressed.mukoDoor then
				doorClosed = not doorClosed
				paths.sounds'muko/door':stop()
				paths.sounds'muko/door':play()
				door:setImage(doorImages[doorClosed and 2 or 1])
				powerUsage = powerUsage + (1 * (doorClosed and 1 or -1))
			end
			if tiktokHandler.visible and controls.pressed.mukoClick and 
				CheckCollision(cursor.x-cursor.width/2,cursor.y-cursor.height/2,cursor.width,cursor.height,
								tiktokSong.x-tiktokSong.width/2,tiktokSong.y-tiktokSong.height/2,tiktokSong.width,tiktokSong.height) then
				tiktokHandler.visible = false
			end
			door.x = office.x - (110 * util.scaleX)
			door.y = office.y - (60 * util.scaleY)
		else
			if controls.pressed.mukoNext then
				changeCam(1)
			elseif controls.pressed.mukoPrev then
				changeCam(-1)
			end
		end
		if controls.down.mukoLeft then
			cursor.x = cursor.x - 1000 * dt
		elseif controls.down.mukoRight then
			cursor.x = cursor.x + 1000 * dt
		end
		if controls.down.mukoUp then
			cursor.y = cursor.y - 1000 * dt
		elseif controls.down.mukoDown then
			cursor.y = cursor.y + 1000 * dt
		end
		if controls.pressed.mukoCams then
			inCams = not inCams
			camFlipper.sizeY = inCams and -1 or 1
			powerUsage = powerUsage + ((inCams and 1 or -1) * ((camIndex == 4) and 2 or 1))
		end
		
		staticTimer = staticTimer - dt
		if staticTimer < 0 then
			staticIndex = not staticIndex
			static:setImage(staticImages[staticIndex and 1 or 2])
			staticTimer = 0.05
		end

		if controls.pressed.back then
			nextJumpscare = 'muko'
		end
	end,
	--dbeug
	--keypressed = function(self, key)
	--	if key == 't' then
	--		powerUsage = powerUsage + 1
	--	elseif key == 'y' then
	--		powerUsage = powerUsage - 1
	--	end
	--end
	initChars = function()
		local baseHandler = {
			start = function(self)
				self:wait(function()
					self:move()
				end)
			end,
			wait = function(self, callback)
				if self.char.pos == 4 then
					Timer.after(random(6, 10), callback)
				else
					Timer.after(random(15.5, 35.5), function()
						self:tryToMove(callback)
					end)
				end
			end,
			tryToMove = function(self, callback)
				if random(1, 20) > 20 - self.char.level then
					callback()
				else
					Timer.after(random(1.5, 4), function()
						self:tryToMove(callback)
					end)
				end
			end
		}
		mukoHandler = table.copy(baseHandler)
		local function _mukomove_()
			mukoHandler:move()
		end
		function mukoHandler:move()
			--print 'im muko and im moving'
			local pos = self.char.pos
			if pos == 1 then
				self.char.pos = 2
			elseif pos == 2 then
				self.char.pos = (random(1, 15) == 1) and 4 or 3
			elseif pos == 3 then
				self.char.pos = 2
				self:wait(function()
					self.char.pos = 4
					self:wait(_mukomove_)
				end)
				self.char:updateSprite()
				return
			elseif pos == 4 then
				if not doorClosed then
					nextJumpscare = 'muko'
					return
				else
					self.char.pos = 2
					self:wait(function()
						self.char.pos = 3
						self:wait(_mukomove_)
					end)
					self.char:updateSprite()
					return
				end
			end
			self:wait(_mukomove_)
			self.char:updateSprite()
		end
		daveHandler = table.copy(baseHandler)
		local function _davemove_()
			daveHandler:move()
		end
		local canHeadBackToBar = true
		function daveHandler:move()
			local pos = self.char.pos
			if pos == 1 then
				self.char.pos = 2
			elseif pos == 2 then
				self:wait(function()
					if canHeadBackToBar then
						canHeadBackToBar = false
						self.char.pos = love.math.random(3, 4)
					else
						self.char.pos = 4
					end
					self.char:updateSprite()
					self:wait(_davemove_)
				end)
				return
			elseif pos == 3 then
				self:wait(function()
					self.char.pos = 2
					self.char:updateSprite()
					self:wait(_davemove_)
				end)
				return
			elseif pos == 4 then
				if not doorClosed then
					nextJumpscare = self.char.name
					return
				else
					canHeadBackToBar = true
					self.char.pos = 2
					self.char:updateSprite()
					self:wait(function()
						self.char.pos = 1
						self.char:updateSprite()
						self:wait(_davemove_)
					end)
					return
				end
			end
			self.char:updateSprite()
			self:wait(_davemove_)
		end
		local function _scottmove_()
			scottHandler:move()
		end
		scottHandler = {
			start = function(self)
				self:wait(function()
					self:move()
				end)
			end,
			wait = function(self, callback)
				if self.char.pos == 4 then
					Timer.after(random(4, 7), callback)
				else
					Timer.after(random(12.5, 32.6), function()
						self:tryToMove(callback)
					end)
				end
			end,
			tryToMove = function(self, callback)
				if (random(1, 20) > 20 - self.char.level) and camIndex ~= self.char.pos then
					callback()
				else
					Timer.after(random(3, 6), function()
						self:tryToMove(callback)
					end)
				end
			end,
			move = function(self)
				local pos = self.char.pos
				if pos == 1 then
					self.char.pos = 2
				elseif pos == 2 then
					return
				end
				self.char:updateSprite()
				self:wait(_scottmove_)
			end,
		}
		local function _mixmove_()
			mixHandler:move()
		end
		mixHandler = {
			start = function(self)
				self:wait(function()
					self:move()
				end)
			end,
			wait = function(self, callback)
				if self.char.pos == 4 then
					Timer.after(random(8, 18), callback)
				else
					Timer.after(random(15.5, 40), function()
						self:tryToMove(callback)
					end)
				end
			end,
			tryToMove = function(self, callback)
				if random(1, 20) > 20 - self.char.level then
					callback()
				else
					Timer.after(random(1.5, 3), function()
						self:tryToMove(callback)
					end)
				end
			end,
			move = function(self)
				local pos = self.char.pos
				if pos == 5 then
					self.char.pos = 2
				elseif pos == 2 then
					self.char.pos = random(5,4)
				elseif pos == 4 then
					if not doorClosed then
						nextJumpscare = 'mix'
					else
						self.char.pos = 2
					end
				end
				self.char:updateSprite()
				self:wait(_mixmove_)
			end
		}
		local failed = 0
		tiktokHandler = {
			pos = point(-100,-100),
			start = function(self)
				if self.char.level == 0 then
					print 'not looping cause 0'
					self.char.pos = 9999
				else
					print 'i am the looping'
					self:loop()
				end
			end,
			loop = function(self, first)
				Timer.after(random(25, 40) - self.char.level, function() 
					self.visible = true
					self.pos:set(util:getX(random(240, -240)), util:getY(random(128, -128)))
					Timer.after(random(5, 8), function()
						if self.visible then
							failed = failed + 1
							self.visible = false
							if failed == 2 then
								power = 0
								return
							else
							end
						end
						self:loop()
					end)
				end)
			end,
			--debug function
			getMisses = function() return failed end
		}
	end
}