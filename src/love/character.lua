--i think this kinda sucks and is really unoptimized but not my fault totally lol bye
local c = {}
--precachedChars = {}
local threedees = {'dave-angey', 'bambi-3d', 'expunged', 'bambi-unfair', 'exbungo', 'dave-festival-3d', 'dave-3d-recursed', 'bf-3d', 'nofriend'}
local deadChars = {'dave', 'bambi', 'tristan-golden', 'tristan'}
local floaters = {'dave-angey', 'bambi-3d', 'expunged', 'bambi-unfair', 'exbungo', 'dave-festival-3d', 'dave-3d-recursed', 'bf-3d'}
function c:new (character, isPlayer, noPosOfs)
	
	--if precachedChars[character] then return table.copy(precachedChars[character]) end
	local lastColor
	local o = {}
	o.danced = false
	o.idleSuffix = ''
	o.animSuffix = ''
	o.curCharacter = character
	--get json
	local path
	o.json, path = paths.character(character)
	if not o.json then
		error('Character (char: '..tostring(character)..') json not found!')
	end
	--print(o.json.healthIcon)
	o.icon = o.json.healthicon or 'bf'
	o.singDuration = o.json.sing_duration or 6
	o.singTimer = 0
	o.playingAnim = false
	local anims
	o.sprite, anims = graphics:newAnimatedSprite(o.json.image, o.json.animations, 'idle')
	o.is3D = table.contains(threedees, character)
	o.deadChar = o.json.deadChar
	if not o.is3D then
		for i,v in ipairs(deadChars) do --im lazy
			if character:startsWith(v) then
				o.deadChar = v..'-death'
				break;
			end
		end
	end

	if o.json.no_antialiasing then o.sprite.image:setFilter('nearest', 'nearest') end

	--print(character, o.json.camera_position[1] or 0, o.json.camera_position[2] or 0, o.camPos.x, o.camPos.y)

	o.sprite.sizeX, o.sprite.sizeY = o.json.scale, o.json.scale
	if o.json.flip_x then o.sprite.sizeX = o.sprite.sizeX * -1 end
	if isPlayer then o.sprite.sizeX = o.sprite.sizeX * -1 end --no or because bf is flipped within the json so that they can be unflipped here


	o.camPos = ((o.sprite.sizeX < 0) and o.json.pcamera_position) and point():fromArray(o.json.pcamera_position) or point():fromArray(o.json.camera_position)
	print('AAAAAAAAAAAAAAA', character, o.json.pcamera_position and o.json.pcamera_position[2], (o.sprite.sizeX < 0), o.sprite.sizeX)

	print('my cam pos', o.camPos.x, o.camPos.y)
	--o.sprite.onAnimComplete = function(anim) 
	--	if anim ~= 'idle' and anim ~= 'danceLeft' and anim ~= 'danceRight' then 
	--		o:dance()
	--	end
	--end

	o.healthbarColors = {}
	for i,c in pairs(o.json.healthbar_colors) do
		o.healthbarColors[i] = c/255
	end
	local lastAnim
	function o:playAnim(animName, after)
		self.sprite.color2 = nil
		if self.skipOtherAnims then return end
		if animName:startsWith 'singLEFT' and (o.sprite.sizeX < 0) then animName = 'singRIGHT'..animName:sub(9)
		elseif animName:startsWith 'singRIGHT' and (o.sprite.sizeX < 0) then animName = 'singLEFT'..animName:sub(10)
		end
		lastAnim = animName
		if not self:animExists(animName) then
			print('Animation not found: '..tostring(animName), character, timerID)
			return;
		end
		o.playingAnim = true
		self.sprite:animate(animName, after)
		if animName:startsWith 'sing' then
			o.singTimer = o.singDuration
		end
	end
	o.idleAnim = 'idle'
	o.danceAnims = {'danceLeft', 'danceRight'}
	function o:dance()
		if self.skipDance then return end
		if not (self:inIdle() and self.sprite:isLooped()) then
			if self.onIdle then self.onIdle() end
			if self:inIdle() and self.sprite:isLooped() then return end
			if self.hasDanceAnims then
				self:playAnim((self.danced and self.danceAnims[2] or self.danceAnims[1])..self.idleSuffix)
				self.danced = not self.danced
			else
				self:playAnim(self.idleAnim..self.idleSuffix)
			end
			o.playingAnim = false
		end
	end
	function o:animExists(anim)
		return anims[anim]
	end	
	if anims.danceLeft then 
		o.hasDanceAnims = true
	end
	local elapsedtime = 0
	local canFloat = table.contains(floaters, o.curCharacter)
	o.canFloat = canFloat
	if not noPosOfs then
		local positionOffset = ((o.sprite.sizeX < 0) and o.json.playerOffset or o.json.positionOffset) or {0,0}
		o.sprite.offsetX = positionOffset[1]
		o.sprite.offsetY = positionOffset[2]
	end
	function o:update(dt)
		elapsedtime = elapsedtime + dt
		self.sprite:update(dt)
		if not self.sprite:isAnimated() and not self:inIdle() and not self.skipDance and not self.skipOtherAnims then
			self:dance()
		end
		--welcome to 3d (character) sinning avenue
		if curStep and (self.curCharacter:lower() == 'recurser' or self.curCharacter:lower() == 'expunged') then
			local tox = (-100 - math.sin((curStep / 9.5) * 2) * 30 * 5)
			local toy = (-330 - math.cos((curStep / 9.5)) * 100)
			if self.curCharacter:lower() == 'recurser' then
				toy = 100 - math.sin((elapsedtime) * 2) * 300;
				tox = -400 - math.cos((elapsedtime)) * 200;
				self.sprite.x = self.sprite.x + (tox - self.sprite.x)
				self.sprite.y = self.sprite.y + (toy - self.sprite.y)
			end
			if canFloat then
				if self.curCharacter:lower() == 'expunged' then
					self.sprite.x = self.sprite.x + (tox - self.sprite.x) / 12
					self.sprite.y = self.sprite.y + (toy - self.sprite.y) / 12
				end
			end
		elseif canFloat then
			self.sprite.y = self.sprite.y + math.sin(elapsedtime) * 0.2
		end
	end
	function o:purpleMiss()
		self.sprite.color2 = {rgb255(hex2rgb '0xFF000084')}
	end
	
	local idleList = {o.idleAnim..o.idleSuffix, o.danceAnims[2]..o.idleSuffix, o.danceAnims[1]..o.idleSuffix}
	function o:inIdle()
		return table.contains(idleList, self.sprite:getAnimName())
	end
	--precachedChars[character] = table.copy(o)
	o:dance()
	o.sprite.color = {255,255,255,alpha=1}
	return o
end
return c