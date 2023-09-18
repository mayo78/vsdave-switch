--i think this kinda sucks and is really unoptimized but not my fault totally lol bye
local c = {}
--precachedChars = {}
local threedees = {'dave-angey', 'bambi-3d', 'expunged', 'bambi-unfair', 'exbungo', 'dave-festival-3d', 'dave-3d-recursed', 'bf-3d'}
local deadChars = {'dave', 'bambi', 'tristan-golden', 'tristan'}
function c.new (character, isPlayer)
	
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
	o.sprite, anims = graphics:newAnimatedSprite(o.json.image, o.json.animations, 'idle', false, nil, {smartOffsets = true})
	o.is3D = table.contains(threedees, character)
	o.deadChar = o.json.deadChar
	for i,v in ipairs(deadChars) do --im lazy
		if character:startsWith(v) then
			o.deadChar = v..'-death'
			break;
		end
	end

	if o.json.no_antialiasing then o.sprite.image:setFilter('nearest', 'nearest') end

	o.sprite.sizeX, o.sprite.sizeY = o.json.scale, o.json.scale
	if o.json.flip_x then o.sprite.sizeX = o.sprite.sizeX * -1 end
	if isPlayer then o.sprite.sizeX = o.sprite.sizeX * -1 end --no or because bf is flipped within the json so that they can be unflipped here

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
	function o:playAnim(animName, loopAnim)
		self.sprite.color2 = nil
		if self.skipOtherAnims then return end
		lastAnim = animName
		if not self:animExists(animName) then
			print('Animation not found: '..tostring(animName), character, timerID)
			return;
		end
		o.playingAnim = true
		self.sprite:animate(animName, loopAnim) --idk if nil would mess anything up
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
	function o:inIdle()
		return table.contains({self.idleAnim..self.idleSuffix, self.danceAnims[2]..self.idleSuffix, self.danceAnims[1]..self.idleSuffix}, self.sprite:getAnimName())
	end
	function o:animExists(anim)
		return anims[anim]
	end	
	if anims['danceLeft'] then 
		o.hasDanceAnims = true
	end
	local elapsedtime = 0
	local canFloat = true
	local positionOffset = ((o.sprite.sizeX < 0) and o.json.playerOffset or o.json.positionOffset) or {0,0}
	o.sprite.x = o.sprite.x + positionOffset[1]
	o.sprite.y = o.sprite.y + positionOffset[2]
	function o:update(dt)
		elapsedtime = elapsedtime + dt
		self.sprite:update(dt)
		if not self.sprite:isAnimated() and not self:inIdle() and not self.skipDance and not self.skipOtherAnims then
			self:dance()
		end
		--welcome to 3d (character) sinning avenue
		if curStep and (self.curCharacter:lower() == 'recurser' or self.curCharacter:lower() == 'expunged') then
			local tox = (-100 - math.sin((curStep / 9.5) * 2) * 30 * 5) + positionOffset[1]
			local toy = (-330 - math.cos((curStep / 9.5)) * 100) + positionOffset[2]
			if self.curCharacter:lower() == 'recurser' then
				toy = 100 - math.sin((elapsedtime) * 2) * 300;
				tox = -400 - math.cos((elapsedtime)) * 200;
				self.sprite.x = self.sprite.x + (tox - self.sprite.x) + positionOffset[1]
				self.sprite.y = self.sprite.y + (toy - self.sprite.y) + positionOffset[2]
			end
			if self.is3D and canFloat then
				if self.curCharacter:lower() == 'expunged' then
					self.sprite.x = self.sprite.x + (tox - self.sprite.x) / 12
					self.sprite.y = self.sprite.y + (toy - self.sprite.y) / 12
				else
					self.sprite.y = self.sprite.y + math.sin(elapsedtime) * 0.2
				end
			end
		end
	end
	function o:purpleMiss()
		self.sprite.color2 = {rgb255(hex2rgb '0xFF000084')}
	end
	--precachedChars[character] = table.copy(o)
	o:dance()
	o.sprite.color = {255,255,255,alpha=1}
	return o
end
c.threedees = threedees
return c