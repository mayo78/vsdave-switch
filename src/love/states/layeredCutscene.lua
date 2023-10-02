local layers
local layerScales
local paused
local audio
local started
local leaving
local singleImage
local dontcenter
local offsets
return {
	enter = function(self, _, _singleImage, image, sound, fps, _layerScales, _offsets, _dontcenter)
		love.audio.stop()
		dontcenter = _dontcenter
		layerScales = _layerScales
		singleImage = _singleImage
		offsets = _offsets or {}
		paused = false
		leaving = false
		layers = {}
		print(layerScales, #layerScales, _layerScales, #_layerScales)
		for i=1,#layerScales do
			local layer = 'layer'..i
			local img = (singleImage and image or (image..'/'..layer))
			layers[i] = graphics:newAnimatedSprite(img, {
				{anim = 'play', name = layer..'0', fps = fps},
				{anim = 'static', name = layer..'0', fps = 0}
			}, 'static', false, nil, {center= (not dontcenter)})
			if not dontcenter then
				layers[i].x = -S_HALF_WIDTH + (layers[i].width * layerScales[i])/2
			end
			if offsets[i] then 
				layers[i].x, layers[i].y = layers[i].x + offsets[i].x, layers[i].y + offsets[i].y
			end
			layers[i].onAnimComplete = function()
				layers[i].finished = true
			end
			print('settging', i, layers[i])
			--layers[i].sizeX, layers[i].sizeY = layerScales[i], layerScales[i]
		end
		audio = paths.sounds(sound)
		Timer.after(0.5, function()
			for _,layer in pairs(layers) do layer:animate 'play' end
			audio:play()
			started = true
		end)
	end,
	update = function(self, dt)
		if controls.pressed.confirm and started then
			paused = true
			audio:stop()
		end
		if not paused then
			for _,layer in pairs(layers) do
				layer:update(dt)
			end
		end
		--print(layers[1])
		if (started and not layers[1]:isAnimated() or paused) and not leaving then
			leaving = true
			switchState(stage)
		end
	end,
	draw = function(self)
		love.graphics.push()
		if not dontcenter then
			love.graphics.translate(graphics.getWidth() / 2, graphics.getHeight() / 2)
		end
		for i,layer in pairs(layers) do
			if not layer.finished then
				love.graphics.push()
				love.graphics.scale(layerScales[i], layerScales[i])
				layer:draw()
				love.graphics.pop()
			end
		end
		love.graphics.pop()
	end
}