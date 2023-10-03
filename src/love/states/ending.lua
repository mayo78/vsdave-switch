local endspr, endsong
return {
	enter = function(self, STUPID, image, song)
		print(self, image, song)
		endspr = graphics.newImage(paths.image('dave/dave/endings/'..image))
		endspr:getImage():setFilter(getAA(false))
		endsong = paths.music(song or 'goodending')
		endsong:play()
	end,
	update = function(self, dt)
		if controls.pressed.confirm then
			endsong:stop()
			switchState(storyMode and menuWeek or menuFreeplay)
		end
	end,
	draw = function(self)
		love.graphics.push()
		love.graphics.translate(S_HALF_WIDTH, S_HALF_HEIGHT)
		endspr:draw()
		love.graphics.pop()
	end,
	leave = function(self)
		love.audio.play(paths.music('menu/menu'))
	end
}