local layers = {}
local layerScales = {0.75, 1.5, 0.75, 2.67}
local paused
local audio
local started
local leaving
return {
	enter = function()
		love.audio.stop()
		paused = false
		leaving = false
		for i=1,4 do
			local layer = 'layer'..i
			layers[i] = graphics:newAnimatedSprite('mazeCutscene/'..layer, {
				{anim = 'play', name = layer},
				{anim = 'static', name = layer, fps = 0}
			}, 'static')
			layers[i].x = -1280/2 + (layers[i].width * layerScales[i])/2
		end
		audio = paths.sounds('break_phone')
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
		if (started and not layers[1]:isAnimated() or paused) and not leaving then
			leaving = true
			switchState(weeks)
		end
	end,
	draw = function(self)
		love.graphics.push()
		love.graphics.translate(graphics.getWidth() / 2, graphics.getHeight() / 2)
		for i,layer in pairs(layers) do
			love.graphics.scale(layerScales[i], layerScales[i])
			layer:draw()
			love.graphics.scale(1/layerScales[i], 1/layerScales[i])
		end
		love.graphics.pop()
	end
}