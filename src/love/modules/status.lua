

local loading

local noResize

return {
	setLoading = function(state)
		loading = state
	end,
	getLoading = function()
		return loading
	end,

	setNoResize = function(state)
		noResize = state
	end,
	getNoResize = function(state)
		return noResize
	end,

	getDebugStr = function(type)
		local debugStr

		if type == "detailed" then
			debugStr = "FPS: " .. tostring(love.timer.getFPS()) ..
			"\nLUA MEM USAGE (KB): " .. tostring(math.floor(collectgarbage("count"))) ..
			"\nGRAPHICS MEM USAGE (MB): " .. tostring(math.floor(love.graphics.getStats().texturememory / 1048576)) ..

			"\n\nsettings.hardwareCompression: " .. tostring(settings.hardwareCompression) ..
			"\ngraphics.getImageType(): " .. tostring(graphics.getImageType()) ..

			"\n\nmusicTime: " .. tostring(math.floor(musicTime)) ..  -- Floored for readability
			"\nhealth: " .. tostring(health)
		else
			debugStr = "FPS: " .. tostring(love.timer.getFPS())
		end

		return debugStr
	end
}
