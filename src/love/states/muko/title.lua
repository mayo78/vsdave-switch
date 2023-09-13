local util = mukoUtil

local logo, start, startImages, static, staticImages, muko, muko_scary, muko_anger

local staticTimer, staticIndex
local function evilMuko(loop)
	muko:setImage(muko_anger)
	local time = 0.3 * (loop and 2 or 1)
	Timer.after(0.1, function()
		muko:setImage(muko_scary)
		Timer.after(0.2, function()
			if loop then evilMuko() end
		end)
	end)
	return time
end
local function mukoLoop()
	Timer.after(love.math.random(2, 15), function()
		Timer.after(evilMuko(love.math.random(1, 2) == 1), mukoLoop)
	end)
end
local titleMusic
return {
	enter = function()
		titleMusic = paths.sounds 'muko/darkness music'
		titleMusic:setLooping(true)
		titleMusic:play()
		lovesize.set(480, 360)
		muko_scary, muko_anger = paths.image('muko/shared/muko_scary'), paths.image('muko/shared/muko_anger')
		mukoMode = true
		mukoDay = 1
		staticTimer = 0
		staticIndex = false
		logo = graphics.newImage(paths.image('muko/title/logo'))
		logo.x, logo.y = util:getX(-128), util:getY(76)
		logo.sizeX, logo.sizeY = 0.8, 0.8
		start = graphics.newImage(paths.image('muko/title/start'))
		start.x, start.y = util:getX(-161), util:getY(-52)
		start.sizeX, start.sizeY = 0.8, 0.8
		muko = graphics.newImage(muko_scary)
		muko.x, muko.y = util:getX(82), util:getY(-29)
		staticImages = {paths.image('muko/shared/camera'), paths.image('muko/shared/camera2')}
		static = graphics.newImage(staticImages[1])
		mukoLoop()
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
		love.graphics.setColor(1, 1, 1, 0.4)
		static:draw()
		love.graphics.pop()
	end,
	leave = function()
		love.audio.stop()
		Timer.clear()
	end
}