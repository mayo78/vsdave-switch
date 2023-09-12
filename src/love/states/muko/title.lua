local logo, start, startImages, static, staticImages, muko

local staticTimer, staticIndex
return {
	enter = function()
		lovesize.set(480, 360)
		mukoMode = true
		mukoDay = 1
		staticTimer = 0
		staticIndex = false
		logo = graphics.newImage(paths.image('muko/title/logo'))
		logo.x, logo.y = -75, 100
		start = graphics.newImage(paths.image('muko/title/start'))
		start.x, start.y = -225, 200
		muko = graphics.newImage(paths.image('muko/shared/muko_scary'))
		muko.x, muko.y = 600, 450
		staticImages = {paths.image('muko/shared/camera'), paths.image('muko/shared/camera2')}
		static = graphics.newImage(staticImages[1])
		static.y = static.height/2
		static.x = static.width/2
	end,
	update = function(self, dt)
		staticTimer = staticTimer - dt
		if staticTimer < 0 then
			staticIndex = not staticIndex
			static:setImage(staticImages[staticIndex and 1 or 2])
			staticTimer = 0.05
		end
		if controls.pressed.confirm then
			switchState(mukoGame)
		end
	end,
	draw = function()
		love.graphics.push()
		love.graphics.translate(lovesize.getWidth()/2,lovesize.getHeight()/2)
		love.graphics.scale(480/960, 360/720)
		logo:draw()
		start:draw()
		muko:draw()
		love.graphics.setColor(1, 1, 1, 0.3)
		static:draw()
		love.graphics.pop()
	end
}