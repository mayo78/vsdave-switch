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
local curSelected
local selectables
local function rect(x,y,w,h)
	return {x = x, y = y, width = w, height = h}
end
local function selectable(id, draw, rect, update, inactive) --rect can be a sprite or rect as seen a line up, update is only called when selected
	return {
		rect = rect,
		id = id,
		update = update,
		inactive = inactive,
		drawable = draw
	}
end
local function slider(x, y, name, value, min, max, onChange) --slider thing that looks likke a scratch slider
	local hi = {
		min = min,
		max = max,
		value = value,
		name = name,
		onChange = onChange,
		addValue = function(self, how)
			self.value = self.value + how
			if self.value > max then self.value = max
			elseif self.value < min then self.value = min
			end
			if self.onChange then self.onChange(self.value) end
		end,
		update = function(self)
			if controls.pressed.left then self:addValue(-1)
			elseif controls.pressed.right then self:addValue(1)
			end
		end,
		draw = function(self)
			fonts('notosans', 16)
			local r,g,b,a = love.graphics.getColor()
			love.graphics.push()
			love.graphics.translate(self.x, self.y)
			local width = curFont:getWidth(self.name)
			--love.graphics.roundrect(0, 0, )
			love.graphics.setColor(rgb255(hex2rgb 'C3CCD9'))
			local bgwidth = 150
			if width + 66 > bgwidth then bgwidth = width + 76 end
			love.graphics.roundrect('fill', 0, 0, bgwidth + 1, 60, 26, 3, 7)
			love.graphics.setColor(rgb255(hex2rgb 'e5f0ff'))
			love.graphics.roundrect('fill', 1, 1, bgwidth, 59, 25, 3, 7)
			--love.graphics.roundrect('fill', 6, 324, 52, 22, 25, 3, 7)
			love.graphics.setColor(rgb255(hex2rgb 'FF8C1A'))
			love.graphics.roundrect('fill', width + 16, 8, 50, 20, 25, 3, 7)
			love.graphics.setColor(0,0,0)
			love.graphics.print(self.name, 5, 5)
			love.graphics.setColor(1,1,1)
			love.graphics.print(self.value, (width + 35), 5)
			love.graphics.setColor(rgb255(hex2rgb 'b2b2b2'))
			love.graphics.roundrect('fill', 9, 39, bgwidth - 13, 12, 3, 7)
			love.graphics.setColor(rgb255(hex2rgb 'efefef'))
			love.graphics.roundrect('fill', 10, 40, bgwidth - 15, 10, 3, 7)
			local sliderScale = ((self.value-self.min)/(self.max-self.min))
			local sliderWidth = (bgwidth - 15) * sliderScale
			love.graphics.setColor(rgb255(hex2rgb '0275ff'))
			love.graphics.roundrect('fill', 10, 40, sliderWidth, 10, 3, 7)
			love.graphics.circle('fill', 10 + sliderWidth, 45, 10)
			love.graphics.pop()
			love.graphics.setColor(r,g,b,a)
			self.bgWidth = bgwidth
			self.width = bgwidth
			self.height = 60
		end,
		x = x or 0,
		y = y or 0,
	}
	return hi
end
local function changeSelection(how)
	local next = curSelected + how
	if selectables[next] and not selectables[next].inactive then
		curSelected = next
	end
end
return {
	enter = function()
		mukoAi = {}
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
		selectables = {}
		local function as(...)
			table.insert(selectables, selectable(...))
		end
		--testslider = slider(0, 0, 'test', 50, 50, 100)
		as(1, start, rect(start.x-start.width/2, start.y-start.height/2,start.width,start.height), function()
			if controls.pressed.confirm then
				switchState(mukoGame)
			end
		end)
		local nightSlider = slider(100, 100, 'Night', 1, 1, 7, function(v)
			for i=3,7 do
				selectables[i].inactive = v ~= 7
			end
			mukoDay = v
		end)
		nightSlider:draw()
		as(2, nightSlider, rect(100, 100, nightSlider.bgWidth, 60), function() nightSlider:update() end)
		curSelected = 1
		
		for i,v in pairs{'Muko', 'Dave', 'Tiktok', 'Scott', 'Mix'} do
			local slider = slider(100, 100 - (80*i), v..' Ai Level', 0, 0, 20, function(v2)
				mukoAi[v:lower()] = v2
			end)
			slider:draw()
			as(i+2, slider, rect(100, 100 - (80*i), slider.bgWidth, 60), function() slider:update() end, true)
		end
		--as(3, slider(90, ))
	end,
	update = function(self, dt)
		staticTimer = staticTimer - dt
		if staticTimer < 0 then
			staticIndex = not staticIndex
			static:setImage(staticImages[staticIndex and 1 or 2])
			staticTimer = 0.05
		end
		--if controls.pressed.confirm then
		--	switchState(mukoGame)
		--end
		if controls.pressed.down then
			changeSelection(-1)
		elseif controls.pressed.up then
			changeSelection(1)
		end

		selectables[curSelected]:update(dt)
			
		--testslider:update(dt)
	end,
	draw = function()
		love.graphics.push()
		love.graphics.translate(lovesize.getWidth()/2,lovesize.getHeight()/2)
		love.graphics.scale(480/960, 360/720)
		logo:draw()
		muko:draw()
		--testslider:draw()
		love.graphics.setColor(1, 1, 1)
		for i,v in pairs(selectables) do
			if not v.inactive then
				if i == 2 then love.graphics.translate(80, 125) end
				v.drawable:draw()
				if i == 1 then
					love.graphics.setColor(1, 1, 1, 0.4)
					static:draw()
				end
				if i == curSelected then
					love.graphics.setColor(1, 0, 0)
					love.graphics.rectangle('line', v.rect.x, v.rect.y, v.rect.width, v.rect.height)
				end
			end
		end
		love.graphics.pop()
	end,
	leave = function()
		love.audio.stop()
		Timer.clear()
	end
}