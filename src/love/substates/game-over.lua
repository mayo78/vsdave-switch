
local deadOver, bopTimer, fade, deadSong, noDeadAnims
local confirmed
local tweened
local function bopLoop()
	if not confirmed then
		deadBF:playAnim 'deathLoop'
		bopTimer = Timer.after(0.57, bopLoop)
	end
end
return {
	enter = function(self)
		fade = {v = 1}
		deathBop = false
		confirmed = false
		tweened = false
		if inst then inst:setVolume(0) end
		if voices then voices:setVolume(0) end
		noDeadAnims = false
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
			Timer.tween(2, cam, {x = -deadBF.sprite.x + 100 - deadBF.sprite.width/2, y = -deadBF.sprite.y + 100 - deadBF.sprite.height/2}, 'out-expo')
		end
	end,

	draw = function(self)
		love.graphics.push()
		graphics.setColor(0, 0, 0)
		love.graphics.rectangle("fill", 0, 0, 1280, 720)
		graphics.setColor(fade.v, fade.v, fade.v)
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
