
local curVid, started, leaving, scale, curAudio, pauseVid
return {
	enter = function(self, FUCKYOU, vid, fps)
		pauseVid = false
		started = false
		leaving = false
		curVid = graphics:newAnimatedSprite(vid, {
			{name = 'cutscene', anim = 'cutscene', fps = 30},
			{name = 'cutscene', anim = 'static', fps = 0, loops = true}
		}, 'static', false)
		curAudio = paths.sound('cutscenes/'..vid)
		Timer.after(0.5, function()
			started = true
			curVid:animate 'cutscene'
			curAudio:play()
		end)
	end,
	leave = function()
		curVid = nil
	end,
	update = function(self, dt)
		if controls.pressed.confirm then 
			pauseVid = true 
			curAudio:stop()
		end
		if started and not curVid:isAnimated() and not leaving then
			leaving = true
			switchState(stage)
		end
		if not pauseVid then curVid:update(dt) end
	end,
	draw = function()
		love.graphics.push()
		love.graphics.translate(lovesize.getWidth() / 2, lovesize.getHeight() / 2)
		curVid:draw()
		love.graphics.pop()
	end
}