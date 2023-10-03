local bg

local frame30, coolalpha
return {
	enter = function()
		frame30 = 0
		coolalpha = 0
		local img
		local no20 = false
		if mukoDay == 7 then
			for k,v in pairs(mukoAi) do
				if v ~= 20 then no20 = true end
			end
		else
			no20 = true
		end
		if not no20 then img = paths.image 'muko/screens/allmax'
		elseif mukoDay > 4 then img = paths.image 'muko/screens/final'
		else img = paths.image 'muko/screens/6am'
		end

		bg = graphics.newImage(img)

		paths.sounds 'muko/chimes2':play()

		mukoDay = mukoDay + 1

		Timer.after(3, function()
			paths.sounds 'muko/breath':play()
			Timer.after(5.5, function()
				switchState((mukoDay > 5) and mukoTitle or mukoGame)
			end)
		end)
	end,
	update = function(self, dt)
		frame30 = frame30 + dt * 30
		if frame30 >= 1 then
			frame30 = 0
			coolalpha = coolalpha + 0.1
		end
	end,
	draw = function()
		love.graphics.push()
		love.graphics.translate(lovesize.getWidth()/2,lovesize.getHeight()/2)
		love.graphics.scale(480/960, 360/720)
		love.graphics.setColor(1, 1, 1, coolalpha)
		bg:draw()
		love.graphics.setColor(1,1,1,1)
		love.graphics.pop()
	end,
	leave = function()
		Timer.clear()
	end
}