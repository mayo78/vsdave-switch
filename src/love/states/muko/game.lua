local util = mukoUtil

local office, inCams, camFlipper, map, usageSprite
local powerUsage, power
local cams = {}
local camIndex
for i=1,5 do table.insert(cams, {name = 'cam_0'..i}) end
local function powerLoop()
	power = power - powerUsage
	if power > 0 then
		Timer.after(8.9 + love.math.random(-0.05, 0.6), powerLoop)
	end
end
return {
	enter = function() 
		camIndex = 1
		power = 100
		powerUsage = 0
		time = 12
		powerLoop()
		powerUsage = 1
		inCams = false
		office = graphics.newImage(paths.image('muko/office/office'))
		office.sizeX, office.sizeY = 1.5, 1.5
		camFlipper = graphics.newImage(paths.image('muko/office/canera_thing'))
		camFlipper.y = util:getY(-159)
		do
			local pos = {
				point(133, -4),
				point(155, -58),
				point(95, -123),
				point(137, -100),
				point(207, -113),
			}
			for i,v in pairs(cams) do
				v.sprite = graphics.newImage(paths.image('muko/cameras/buttons/'..v.name), {full = false})
				v.sprite.sizeX, v.sprite.sizeY = 0.5, 0.5
				v.sprite.x, v.sprite.y = util:getX(pos[i].x), util:getY(pos[i].y)
			end
		end
		map = graphics.newImage(paths.image('muko/cameras/map'))
		map.x, map.y = util:getX(158), util:getY(-58)
		map.sizeX, map.sizeY = 0.6, 0.6

		usageSprite = graphics.newImage(paths.image('muko/office/usage'))
		usageSprite.sizeX, usageSprite.sizeY = 0.8, 0.8
		usageSprite.x, usageSprite.y = util:getX(195), util:getY(-159)
	end,
	leave = function()
	end,
	draw = function()
		love.graphics.push()
		love.graphics.translate(lovesize.getWidth()/2,lovesize.getHeight()/2)
		love.graphics.scale(480/960, 360/720)
		if not inCams then
			office:draw()
		else
			map:draw()
			for i,v in pairs(cams) do
				v.sprite:draw()
			end
		end
		camFlipper:draw()
		usageSprite:draw()
		love.graphics.setColor(0,0,0)
		love.graphics.rectangle('fill', usageSprite.x + usageSprite.width*0.4, usageSprite.y - usageSprite.height*0.4, -(5-powerUsage)*33, usageSprite.height * 0.8)
		love.graphics.setColor(1,1,1)
		fonts('notosans', 32)
		love.graphics.print(time..' AM', util:getX(193) - curFont:getWidth(time..' AM')/2, util:getY(147))
		love.graphics.print('Night '..mukoDay, util:getX(189) - curFont:getWidth('Night '..mukoDay)/2, util:getY(128))
		love.graphics.pop()
		love.graphics.print(power, 0, 50)
		love.graphics.print(powerUsage, 0, 80)
	end,
	update = function(self, dt)
		if not inCams then
			if controls.down.left and office.x < 120 then
				office.x = office.x + dt * 350
				if office.x > 120 then office.x = 120 end
			elseif controls.down.right and office.x > -120 then
				office.x = office.x - dt * 350
				if office.x < -120 then office.x = -120 end
			end
		end
		if controls.pressed.mukoCams then
			inCams = not inCams
			camFlipper.sizeY = inCams and -1 or 1
			powerUsage = powerUsage + ((inCams and 1 or -1) * ((camIndex == 4) and 2 or 1))
		end
	end,
	--dbeug
	--keypressed = function(self, key)
	--	if key == 't' then
	--		powerUsage = powerUsage + 1
	--	elseif key == 'y' then
	--		powerUsage = powerUsage - 1
	--	end
	--end
}