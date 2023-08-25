

local confirmSound = love.audio.newSource("sounds/menu/confirm.ogg", "static")

return {
	enter = function(self, previous)
		
	end,

	mousepressed = function(self, x, y, button, istouch, presses)
		if button == 1 and not graphics.isFading() then
			confirmSound:play()

			graphics.fadeOut(
				0.5,
				function()
					switchState(menu)
				end
			)
		end
	end,

	draw = function(self)
		love.graphics.push()
			love.graphics.translate(graphics.getWidth() / 2, graphics.getHeight() / 2)

			love.graphics.push()
				love.graphics.scale(cam.sizeX, cam.sizeY)

				love.graphics.printf("Click to start game", -1280, 0, 1280, "center", nil, 2, 2)
			love.graphics.pop()
		love.graphics.pop()
	end
}
