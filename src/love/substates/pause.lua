local repeater, gridguy, curSelected, fadeInAlpha, targetYs, curYs, gridPos, musVol, pauseMus
local menuItems = {
	'Resume',
	'Restart Song',
	'Change Character',
	'No Miss Mode',
	'Exit to menu',
	--'End Song' --debug thing
}
local funcs = {
	function()
		closeSubstate()
	end,
	function()
		closeSubstate()
		Timer.clear()
		if inst then inst:stop() end
		if voices then voices:stop() end
		switchState(stage)
	end,
	function()
	end,
	function()
		closeSubstate()
		Timer.clear()
		if inst then inst:stop() end
		if voices then voices:stop() end
		switchState(stage)
		noMissMode = true
	end,
	function()
		closeSubstate()
		Timer.clear()
		if inst then inst:stop() end
		if voices then voices:stop() end
		switchState(storyMode and menuWeek or menuFreeplay)
		love.audio.play(paths.music('menu/menu'))
	end,
	function()
		closeSubstate()
		inst:seek(inst:getDuration "seconds" - 0.3)
		voices:seek(inst:getDuration "seconds" - 0.3)
	end
}
return {
	enter = function(self)
		weeks:substateOpened(true)
		--repeater = shaders:REPEAT()
		--repeater.forceUpdate = true		
		gridguy = paths.image('dave/title/checkeredBG')
		gridguy:setWrap('repeat','repeat')
		gridframe = love.graphics.newQuad(0, 0, gridguy:getWidth() * 12, gridguy:getHeight() * 6, gridguy:getWidth(), gridguy:getHeight())


		curSelected = 1
		fadeInAlpha = 0
		gridPos = point()
		curPos = {}
		targetPos = {}
		for i,option in ipairs(menuItems) do
			curPos[i] = {0, 0}
			targetPos[i] = {0, 0}
		end
		musVol = 0

		pauseMus = paths.music((funkin.curSong:lower() == 'exploitation') and 'breakfast-ohno' or 'breakfast')
		pauseMus:setVolume(0)
		pauseMus:setLooping(true)
		pauseMus:play()
	end,
	update = function(self, dt)	
		if controls.pressed.down then
			curSelected = curSelected + 1
			if curSelected > #menuItems then curSelected = 1 end
		elseif controls.pressed.up then
			curSelected = curSelected - 1
			if curSelected < 1 then curSelected = #menuItems end
		end
		if fadeInAlpha > 0 and controls.pressed.confirm then
			funcs[curSelected]()
		end
		if fadeInAlpha <= 0.5 then
			fadeInAlpha = fadeInAlpha + dt
			if fadeInAlpha > 0.5 then fadeInAlpha = 0.5 end
		end
		--targetY = -(72 * (-i + curSelected)) + 720/2
		--curY = lerp(curY, targetY, dt * 15)
		gridPos.x, gridPos.y = gridPos.x - (gridguy:getWidth()/5) * dt, gridPos.y - (gridguy:getHeight()/5) * dt
		--print('cur pos is', gridPos.x, gridPos.y)
		if gridPos.y <= -(gridguy:getHeight()) then
			gridPos.x, gridPos.y = -(gridguy:getWidth()/5) * dt, -(gridguy:getHeight()/5) * dt
		end
		--if gridPos.y <= -720 then
		--	gridPos.x, gridPos.y = 0, 0
		--end
		if musVol <= 0.5 then
			musVol = musVol + (dt/10)
		end
		pauseMus:setVolume(musVol)
		for i,option in ipairs(menuItems) do
			targetPos[i][1] = -(50 * (-i + curSelected)) + 200
			curPos[i][1] = lerp(curPos[i][1], targetPos[i][1], dt * 15)
			targetPos[i][2] = -(72 * (-i + curSelected)) + 720/2
			curPos[i][2] = lerp(curPos[i][2], targetPos[i][2], dt * 15)
		end
	end,
	draw = function(self)
		love.graphics.push()
		graphics.setColor(0, 0, 0, fadeInAlpha)
		love.graphics.rectangle("fill", 0, 0, 1280, 720)
		love.graphics.draw(gridguy, gridframe, gridPos.x, gridPos.y)
		graphics.setColor(1, 1, 1)
		fonts('comic', 64)
		for i,option in ipairs(menuItems) do
			printfOutline(option, curPos[i][1], curPos[i][2], nil, {alpha = ((i == curSelected) and 1 or 0.5)})
		end
		fonts('comic', 24)
		local song = funkin.curSong:gsub('-', ' ')
		printfOutline(song, 1280 - ((#song/2) * 24), 0)
		love.graphics.pop()
	end,
	leave = function(self)
		pauseMus:stop()
		weeks:substateClosed()
	end
}