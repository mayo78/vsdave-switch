local static, scream, static
local jumpscareDone
local fade
return {
	enter = function()
		love.audio.stop()
		fade = {1}
		Timer.clear()
		paths.sounds 'fiveNights/scream':play()
		jumpscareDone = false
		scream = graphics:newAnimatedSprite('dave/fiveNights/nofriendJumpscare', {
			{anim = 'scare', name = 'jumpscare'}
		}, 'scare', false, nil, {center = true})
		scream.sizeX, scream.sizeY = GAMESIZE.width/scream.width, GAMESIZE.height/scream.height
		
		static = graphics:newAnimatedSprite('dave/fivenights/deathstatic', {
			{anim = 'static', name = 'static', loops = true}
		}, 'static', false, nil, {center = true})
		static.sizeX, static.sizeY = GAMESIZE.width/static.width, GAMESIZE.height/static.height

		scream.onAnimComplete = function()
			jumpscareDone = true
			paths.sounds 'fiveNights/scream':stop()
			paths.sounds 'fiveNights/static':play()
			Timer.after(2.7, function()
				Timer.tween(2, fade, {0}, nil, function()
					switchState(stage)
				end)
			end)
		end
	end,
	update = function(self, dt)
		if not jumpscareDone then
			scream:update(dt)
		else
			static:update(dt)
		end
		Timer.update(dt)
	end,
	draw = function()
		love.graphics.push()
		love.graphics.setColor(0,0,0)
		love.graphics.rectangle('fill', 0, 0, GAMESIZE.width, GAMESIZE.height)
		love.graphics.translate(S_HALF_WIDTH, S_HALF_HEIGHT)
		love.graphics.setColor(fade[1], fade[1], fade[1])
		if not jumpscareDone then
			scream:draw()
		else
			static:draw()
		end
		love.graphics.pop()
	end,
	leave = function()
		love.audio.stop()
	end,
}