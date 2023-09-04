
local deadOver, bopTimer, fade, deadSong
local confirmed = false
local function bopLoop()
	deadBF:playAnim 'deathLoop'
	bopTimer = Timer.after(0.57, bopLoop)
end
return {
	enter = function(self)
		fade = {v = 1}
		deathBop = false
		if inst then inst:setVolume(0) end
		if voices then voices:setVolume(0) end
		if not deadBF then
			deadBF = boyfriendObject
			--noDeadAnims = true
		end
		deadBF.skipDance = true
		deadBF:playAnim 'firstDeath'
		local deathies = {'dave', 'bambi', 'tristan'}
		local deathWhatever = '-generic'
		if table.contains(deathies, boyfriendObject.curCharacter) then deathWhatever = '-'..boyfriendObject.curCharacter
		elseif boyfriendObject.curCharacter == 'bf' then deathWhatever = ''
		end
		love.audio.play(paths.sound('death/fnf_loss_sfx'..deathWhatever))
		deadSong = paths.music('gameover'..(funkin.curSong == 'exploitation' and '-ohno' or ''))
		deadSong:setLooping(true)
		deadOver = paths.music('gameoverend'..(funkin.curSong == 'exploitation' and '-ohno' or ''))
		Timer.clear()
		Timer.after(3, function()
			deadSong:play()
			bopLoop()
		end)
		Timer.tween(2, cam, {x = -deadBF.sprite.x + 100, y = -deadBF.sprite.y + 100}, 'out-expo')
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
			Timer.after(0.25, function()
				Timer.tween(6, fade, {v = 0}, nil, function()
					switchState(stage)
				end)
			end)
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
