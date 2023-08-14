
local curVid, started, leaving, scale
return {
	enter = function(self, FUCKYOU, vid)
		started = false
		leaving = false
		curVid = love.graphics.newVideo('videos/'..vid..'.ogv')
		scale = 1280/curVid:getWidth()
		Timer.after(0.5, function()
			curVid:play()
			started = true
		end)
	end,
	leave = function()
		curVid:release()
		curVid = nil
	end,
	update = function(self, dt)
		if controls.pressed.confirm then curVid:pause() end
		if started and not curVid:isPlaying() and not leaving then
			leaving = true
			switchState(stage)
		end
	end,
	draw = function()
		love.graphics.push()
		love.graphics.scale(scale, scale)
		love.graphics.draw(curVid)
		love.graphics.pop()
	end
}