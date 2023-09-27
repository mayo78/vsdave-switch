
local deadOver, bopTimer, fade, deadSong, noDeadAnims
local confirmed
local tweened
local function bopLoop()
	if not confirmed then
		deadBF:playAnim 'deathLoop'
		bopTimer = Timer.after(0.57, bopLoop)
	end
end
local tween3D
local function camTween()
	Timer.tween(2, cam, {
		x = -(boyfriendObject.sprite.width/2)-boyfriendObject.sprite.x+boyfriendObject.camPos.x + 100,
		y = -(boyfriendObject.sprite.height/2)-boyfriendObject.sprite.y+boyfriendObject.camPos.y + 100,
	}, 'out-expo')
end
return {
	enter = function(self)
		tween3D = false
		fade = {v = 1}
		deathBop = false
		confirmed = false
		tweened = false
		if inst then inst:setVolume(0) end
		if voices then voices:setVolume(0) end
		noDeadAnims = boyfriendObject.is3D
		if not deadBF and not boyfriendObject.curCharacter:startsWith 'bf' then
			deadBF = boyfriendObject
			noDeadAnims = true
		end
		local deathies = {'dave', 'bambi', 'tristan'}
		local deathWhatever = '-generic'
		if table.contains(deathies, boyfriendObject.curCharacter) then deathWhatever = '-'..boyfriendObject.curCharacter
		elseif boyfriendObject.curCharacter == 'bf' or deadBF.curCharacter == 'bf' then deathWhatever = ''
		end
		love.audio.play(paths.sound('death/fnf_loss_sfx'..deathWhatever))
		deadSong = paths.music('gameover'..(funkin.curSong == 'exploitation' and '-ohno' or ''))
		deadSong:setLooping(true)
		deadOver = paths.music('gameoverend'..(funkin.curSong == 'exploitation' and '-ohno' or ''))
		Timer.clear()
		deadBF.sprite.x, deadBF.sprite.y = boyfriendObject.sprite.x, boyfriendObject.sprite.y
		if not noDeadAnims then
			deadBF.skipDance = true
			deadBF:playAnim 'firstDeath'
			deadBF.sprite.onAnimComplete = function(n)
				if n == 'firstDeath' then
					deadSong:play()
					bopLoop()
				end
			end
		else
			local angle = 0
			local spr = deadBF.sprite
			tween3D = true
			deadBF.sprite.alpha = 1
			spr:setCentered(true)
			spr.x, spr.y = spr.x - (spr.width/2), spr.y + (spr.height/2)
			Timer.tween(2, spr, {alpha = 0, sizeX = 0.05, sizeY = 0.05}, 'in-out-expo', {
				after = function()
					
				end,
				during = function(dt)
					angle = angle + (dt/100) * 2.5
					spr.orientation = angle * RADIAN_TO_DEGREE
				end,
			})
		end
	end,

	update = function(self, dt)
		deadBF:update(dt)
		Timer.update(dt)
		if controls.pressed.confirm and not confirmed then
			if bopTimer then Timer.cancel(bopTimer) end
			Timer.clear()
			deadBF:playAnim 'deathConfirm'
			confirmed = true
			deadSong:stop()
			deadOver:play()
			Timer.after(0.7, function()
				Timer.tween(2, fade, {v = 0}, nil, function()
					switchState(stage)
				end)
			end)
		end			
		if deadBF.sprite:getAnimName() == 'firstDeath' and deadBF.sprite:getFrame() >= 12 and not tweened then
			tweened = true
			camTween()
		end
	end,

	draw = function(self)
		love.graphics.push()
		graphics.setColor(0, 0, 0)
		love.graphics.rectangle("fill", 0, 0, 1280, 720)
		graphics.setColor(fade.v, fade.v, fade.v, deadBF.sprite.alpha or 1)
		love.graphics.translate(cam.x + (graphics.getWidth() / 2), cam.y + (graphics.getHeight() / 2))
		love.graphics.scale(curCamZoom, curCamZoom)
		deadBF.sprite:draw()
		love.graphics.pop()
	end,
	
	leave = function(self)
		deadBF = nil
		confirmed = false
		deadSong, deadOver = nil
		Timer.clear()
	end
}
