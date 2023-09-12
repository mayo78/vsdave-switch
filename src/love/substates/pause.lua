local repeater, gridguy, curSelected, fadeInAlpha, targetYs, curYs, gridPos, musVol, pauseMus, texts
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
		skippingSong = true
	end
}
local expungedTaunts = {"YOU'RE FUCKED", 'HAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHA', "YOU CAN'T ESCAPE FROM THE FUN ALREADY", 
"EXPUNGED'S REIGN IS HERE, YOU'RE FUCKED", "YOU HAVE REACHED THE END OF THE RABBIT HOLE", "YOU'RE WORTHLESS YOU'RE WORTHLESS YOU'RE WORTHLESS YOU'RE WORTHLESS YOU'RE WORTHLESS", }
return {
	enter = function(self)
		texts = {}
		local name = point(0, -16)
		name.alpha = 0
		name.print = funkin.curSong:gsub('-', ' ')
		table.insert(texts, name)

		if funkin.curSong:lower() == 'exploitation' then
			local randomString = expungedTaunts[love.math.random(1, #expungedTaunts)]

			for i=1,math.ceil(720/16) do
				local hi = point(0, (32 * (i+1)) - 32)
				hi.alpha = 0
				hi.print = randomString
				if i > 0 then hi.back = true end
				table.insert(texts, hi)
			end
		end
		for i,v in pairs(texts) do
			v.timer = 0
			if i > 1 then
				v.timer = 1 + (0.05 * (i-1))
			end
			v.targetY = v.y + 32 --lazy way of doing this whwtaver
		end
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
		for i,v in pairs(texts) do
			v.timer = v.timer - dt
			if v.timer < 0 then
				v.y = math.lerp(v.y, v.targetY, dt * 15)
				v.alpha = math.lerp(v.alpha, 1, dt * 15)
			end
		end
	end,
	draw = function(self)
		love.graphics.push()
		fonts('comic', 32)
		for _,v in pairs(texts) do
			if v.back then printfOutline(v.print, 1280-curFont:getWidth(v.print), v.y, nil, {alpha = v.alpha}) end
		end
		graphics.setColor(0, 0, 0, fadeInAlpha)
		love.graphics.rectangle("fill", 0, 0, 1280, 720)
		graphics.setColor(0, 0, 0, (fadeInAlpha * 2) * 0.6)
		love.graphics.draw(gridguy, gridframe, gridPos.x, gridPos.y)
		graphics.setColor(1, 1, 1)
		fonts('comic', 64)
		for i,option in ipairs(menuItems) do
			printfOutline(option, curPos[i][1], curPos[i][2], nil, {alpha = ((i == curSelected) and 1 or 0.5)})
		end
		fonts('comic', 32)
		for _,v in pairs(texts) do
			printfOutline(v.print, 1280-curFont:getWidth(v.print) - 6, v.y, nil, {alpha = v.alpha})
			if v.back then break end
		end
		love.graphics.pop()
	end,
	leave = function(self)
		pauseMus:stop()
		weeks:substateClosed()
	end
}