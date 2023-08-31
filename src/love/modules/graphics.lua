

local imageType = "png"
local fade = {1}
local isFading = false

local fadeTimer

local screenWidth, screenHeight

return {
	screenBase = function(width, height)
		screenWidth, screenHeight = width, height
	end,
	getWidth = function()
		return screenWidth
	end,
	getHeight = function()
		return screenHeight
	end,

	imagePath = function(path)
		if not path then error 'No path provided!' end
		local checks = { --checks these paths for an image thats a dds or png, it always looks for a dds first since it uses very little ram!
			lm and "locale/"..lm.language.."/images/dds/" .. path .. ".dds" or nil,
			lm and "locale/"..lm.language.."/images/png/"..path..".png" or nil,
			"images/dds/" .. path .. ".dds", 
			"images/png/" .. path .. ".png"
		}
		local pathStr
		for _,path in pairs(checks) do
			if path and love.filesystem.getInfo(path) then
				pathStr = path
				break;
			end
		end
		if not pathStr then error('Image ['..path..'] not found! Checked paths: ['..table.concat(checks, ',')..']') end
		return pathStr
	end,
	setImageType = function(type)
		imageType = type
	end,
	getImageType = function()
		return imageType
	end,

	newImage = function(imageData, optionsTable)
		local image, width, height

		local options

		local object = {
			x = 0,
			y = 0,
			orientation = 0,
			sizeX = 1,
			sizeY = 1,
			offsetX = 0,
			offsetY = 0,
			shearX = 0,
			shearY = 0,

			setImage = function(self, imageData)
				image = imageData
				width = image:getWidth()
				self.width = width
				height = image:getHeight()
				self.height = height
				self.image = imageData
			end,

			getImage = function(self)
				return image
			end,

			draw = function(self)
				if paths.clearing then return end
				local x = self.x
				local y = self.y

				if options and options.floored then
					x = math.floor(x)
					y = math.floor(y)
				end

				love.graphics.draw(
					image,
					self.x,
					self.y,
					self.orientation,
					self.sizeX,
					self.sizeY,
					math.floor(width / 2) + self.offsetX,
					math.floor(height / 2) + self.offsetY,
					self.shearX,
					self.shearY
				)
			end
		}

		object:setImage(imageData)

		options = optionsTable

		return object
	end,
	
	newAnimatedSprite = function(self, imagePth, animations, defaultAnim, loops, manualimage)
		--get xml and make it compatible with the graphics module
		local xml = paths.xml(imagePth)
		local anims = {}
		for k,v in pairs(animations) do
			--print('FROM '..imagePth, k, v)
			local last
			if not v.offsets then v.offsets = {0, 0} end
			if not v.name then error('no name in anim!') end
			local anim = {speed = v.fps or 24, offsetX = v.offsets[1], offsetY = v.offsets[2], flixelOffset = true, frames = {}, loops = v.loops or v.loop}
			for i,c in pairs(xml) do
				--for k,v in pairs(c) do print(k, v) end
				if c.name:lower():startsWith(v.name:lower()) then
					--print('FOUND', v.name, 'IN', c.name, i)
					table.insert(anim.frames, i)
				end
			end
			--table.remove(anim.frames, #anim.frames)
			
			if v.indices and #v.indices > 0 then
				anim.indices = v.indices
			end
			if #anim.frames == 0 then
				print '--------------------ERROR IMBOUND!!------------------------'
				for k,v in pairs(anim.frames) do print(k,v) end
				print('couldnt find this guy.. '..v.name..', '..v.anim)
			end
			anims[v.anim] = anim
		end
		return self.newSprite(manualimage or paths.image(imagePth), xml, anims, defaultAnim, anims[defaultAnim] and anims[defaultAnim].loops or false), anims, xml
	end,

	newSprite = function(imageData, frameData, animData, animName, loopAnim, optionsTable)
		local sheet, sheetWidth, sheetHeight

		local frames = {}
		local frame
		local anims = animData
		local anim = {
			name = nil,
			start = nil,
			stop = nil,
			speed = nil,
			offsetX = nil,
			offsetY = nil,
			flixelOffset = nil --makes offsets subtract instead of add like in an flxsprite
		}

		local isAnimated
		local isLooped

		local options

		local pastLength

		local calledAnimCallback = false


		local drawData

		local object = {
			x = 0,
			y = 0,
			orientation = 0,
			sizeX = 1,
			sizeY = 1,
			offsetX = 0,
			offsetY = 0,
			shearX = 0,
			shearY = 0,
			offsetScale = 1,

			setSheet = function(self, imageData)
				sheet = imageData
				sheetWidth = sheet:getWidth()
				sheetHeight = sheet:getHeight()
				return self
			end,

			getSheet = function(self)
				return sheet
			end,

			animate = function(self, animName, loopAnim)
				--print('playing this animation!', animName, loopAnim)
				calledAnimCallback = false
				isLooped = loopAnim
				isAnimated = true
				if anim.name == animName then
					--print('gonna loop cause its the same!')
					if anim.indices then 
						anim.indices.index = 1
						frame = anim.indices[anim.indices.index]
					elseif anim.frames then 
						anim.frames.index = 1
						frame = anim.frames[anim.frames.index]
					else 
						frame = anim.start
					end
					return self
				end
				anim.name = animName
				if not anims[animName] then
					print('anim not found '..animName)
					return
				end

				anim.start = anims[animName].start
				anim.stop = anims[animName].stop
				anim.speed = anims[animName].speed
				anim.offsetX = anims[animName].offsetX
				anim.offsetY = anims[animName].offsetY
				anim.flixelOffset = anims[animName].flixelOffset
				anim.indices = anims[animName].indices
				if anim.indices then anim.indices.index = 1 end
				anim.frames = anims[animName].frames
				if anim.frames then anim.frames.index = 1 end
				if anim.loops ~= nil then isLooped = anim.loops end
				if anim.loop ~= nil then isLooped = anim.loop end

				local data
				if anim.frames then data = frameData[anim.frames[1]]
				elseif anim.indices then data = frameData[anim.indices[1]]
				else data = frameData[anim.start]
				end
				if data then
					self.width = (data.frameWidth or data.width or 0)
					self.height = (data.frameHeight or data.height or 0)
					--print('okayyy', self.width)
				else
					self.width = 0
					self.height = 0
				end

				frame = anim.start
				return self
			end,
			getAnims = function(self)
				return anims
			end,
			setAnims = function(self, anims)
				self.anims = anims
			end,
			getAnimName = function(self)
				return anim.name
			end,
			setAnimSpeed = function(self, speed)
				anim.speed = speed
			end,
			isAnimated = function(self)
				return isAnimated
			end,
			isLooped = function(self)
				return isLooped or anim.loops
			end,
			setLooping = function(self)
				isLooped = true
			end,

			setOptions = function(self, optionsTable)
				options = optionsTable
			end,
			getOptions = function(self)
				return options
			end,

			update = function(self, dt)
				if isAnimated then
					if anim.indices then
						anim.indices.index = anim.indices.index + anim.speed * dt
						--print(anim.indices.index, anim.indices.finalIndex)
						pastLength = anim.indices.index > #anim.indices
					elseif anim.frames then
						anim.frames.index = anim.frames.index + anim.speed * dt
						pastLength = anim.frames.index > #anim.frames
						--if pastLength then print('ohahdf', anim.name, anim.loops) end
					else
						frame = frame + anim.speed * dt
						pastLength = frame > anim.stop
					end
				end
				--if anim.frames then
				--	print(anim.frames, anim.frames.index, frame, anim.frames[anim.frames.index])
				--end
				if isAnimated and pastLength then
					if isLooped or anim.loops then
						if anim.indices then
							anim.indices.index = 1
						elseif anim.frames then
							anim.frames.index = 1
							--print('LOOPING')
						else
							frame = anim.start
						end
					else
						isAnimated = false
						if not calledAnimCallback and self.onAnimComplete then
							calledAnimCallback = true
							self.onAnimComplete(anim.name)
						end
					end
				end
			end,
			screenCenter = function(self)
				
			end,
			draw = function(self)
				if isAnimated then
					if anim.indices then
						pastLength = anim.indices.index > #anim.indices
						anim.frames.index = anim.indices[math.floor(anim.indices.index)] + 1
						frame = anim.frames[math.floor(anim.frames.index)]
					elseif anim.frames then
						frame = anim.frames[math.floor(anim.frames.index)]
						pastLength = anim.frames.index > #anim.frames
					else
						pastLength = frame > anim.stop
					end
				end
				--frame = frame or 1 --fbasdklghfjkldhgfsdklgsdfkl;
				if frame == nil or anim.speed == 0 and frame == nil then
					print('ermm this sucks!')
					for k,v in pairs(anim.frames) do print(k, v) end
					frame = frameData[anim.frames[1]]
					pastLength = false
					error 'this one... is akward..'
				end
				local flooredFrame = math.floor(frame)
				--if not frameData[flooredFrame] then
				--	--pastLength = true
				--	print('uhhhh', flooredFrame, anim.name, #frameData, frameData[flooredFrame+1])
				--	--print ('FUCK IT WE BALL', anim.name, anim.start, anim.stop)
				--end

				--if frame == 1 and pastLength then 
				--	frame = 0 
				--	pastLength = false
				--end

				--local stop = anim.indices and anim.indices[#anim.indices] or anim.stop
				local framey = frameData[flooredFrame]
				local x = self.x
				local y = self.y
				if options and options.floored then
					x = math.floor(x)
					y = math.floor(y)
				end
				if not pastLength then
					local width
					local height


					local offset = point(-(anim.offsetX or 0)/2, -(anim.offsetY or 0)/2)
					local x,y = 0,0


					if not framey.frameWidth or framey.frameWidth == 0 then
						width = math.floor(frameData[flooredFrame].width / 2)
					else
						width = math.floor(frameData[flooredFrame].frameWidth / 2) + frameData[flooredFrame].frameX
					end
					if offset.x >= 0 then width = width + offset.x else x = x + offset.x end
					if not framey.frameHeight or framey.frameHeight == 0 then
						height = math.floor(frameData[flooredFrame].height / 2)
					else
						height = math.floor(frameData[flooredFrame].frameHeight / 2) + frameData[flooredFrame].frameY
					end
					if offset.y >= 0 then height = height + offset.y else y = y + offset.y end

					drawData = {
						sheet = sheet,
						frame = frames[flooredFrame],
						width = width + self.offsetX,
						height = height + self.offsetY,
						x = x,
						y = y
					}
					local flixelOffset
					local firstFrame = anim.frames and frameData[anim.frames[1]] or nil
					local firstFrameOffsets
					--self.width = width
				end		
				
				if drawData then
					love.graphics.draw(
						drawData.sheet,
						drawData.frame,
						x + drawData.x,
						y + drawData.y,
						self.orientation,
						self.sizeX,
						self.sizeY,
						drawData.width,
						drawData.height,
						self.shearX,
						self.shearY
					)
				end
			end,
			setPosition = function(self, x, y)
				self.x = x
				self.y = y
				return self
			end,
			image = imageData
		}

		object:setSheet(imageData)

		for i = 1, #frameData do
			table.insert(
				frames,
				love.graphics.newQuad(
					frameData[i].x,
					frameData[i].y,
					frameData[i].width,
					frameData[i].height,
					sheetWidth,
					sheetHeight
				)
			)
		end

		object:animate(animName, loopAnim)

		--print('new obj with a width of', object.width)

		options = optionsTable

		return object
	end,

	setFade = function(value)
		if fadeTimer then
			Timer.cancel(fadeTimer)

			isFading = false
		end

		fade[1] = value
	end,
	getFade = function(value)
		return fade[1]
	end,
	fadeOut = function(duration, func)
		if fadeTimer then
			Timer.cancel(fadeTimer)
		end

		isFading = true

		fadeTimer = Timer.tween(
			duration,
			fade,
			{0},
			"linear",
			function()
				isFading = false

				if func then func() end
			end
		)
	end,
	fadeIn = function(duration, func)
		if fadeTimer then
			Timer.cancel(fadeTimer)
		end

		isFading = true

		fadeTimer = Timer.tween(
			duration,
			fade,
			{1},
			"linear",
			function()
				isFading = false

				if func then func() end
			end
		)
	end,
	isFading = function()
		return isFading
	end,

	clear = function(r, g, b, a, s, d)
		local fade = fade[1]

		love.graphics.clear(fade * r, fade * g, fade * b, a, s, d)
	end,
	setColor = function(r, g, b, a)
		local fade = fade[1]

		love.graphics.setColor(fade * r, fade * g, fade * b, a)
	end,
	setBackgroundColor = function(r, g, b, a)
		local fade = fade[1]

		love.graphics.setBackgroundColor(fade * r, fade * g, fade * b, a)
	end,
	getColor = function()
		local r, g, b, a = love.graphics.getColor()
		local fade = fade[1]

		return r / fade, g / fade, b / fade, a
	end
}
