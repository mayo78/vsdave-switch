local dial, curDial

local dialSound

local stop

local bgTexts

local function newDial()
	local hi = table.remove(dial, 1)
	if not hi then
		switchState(terminalState)
		stop = true
		return;
	end
	local me = hi:split '|'
	curDial = me[1]
	dialSound:stop()
	dialSound:play()
	Timer.after(tonumber(me[2]), newDial)
end

local elapsedTime

local dialPos

return {
	enter = function(self)
		dialPos = point()
		elapsedTime = 0
		stop = false
		dial = paths.dialogue 'recurser-post':split '\n'
		dialSound = paths.sound 'dialogue/recurserDialogue'
		bgTexts = {}
		for _=1,50 do
			local hi = point()
			hi.range = point(love.math.random(40, 400), love.math.random(40, 400))
			hi.offset = love.math.random(-999, 999)
			table.insert(bgTexts, hi)
		end
		newDial()
	end,
	update = function(self, dt)
		elapsedTime = elapsedTime + dt
		dialPos.x = math.sin(elapsedTime / 2) * 30;
		dialPos.y = math.sin(elapsedTime / 3) * 30;
		for i,v in pairs(bgTexts) do
			local curtime = elapsedTime + v.offset
			v.x = math.sin(curtime / 1.5) * v.range.x;
			v.y = math.sin(curtime / 2) * v.range.y;
		end
	end,
	draw = function()
		love.graphics.push()
		love.graphics.translate(1280/2, 720/2)
		fonts('recurser', 32)
		for i,v in pairs(bgTexts) do
			love.graphics.setColor(1,1,1,0.5)
			love.graphics.print(curDial, -curFont:getWidth(curDial)/2 + v.x, (-54/2) + v.y)
		end
		love.graphics.setColor(1,1,1)
		fonts('recurser', 54)
		love.graphics.print(curDial, -curFont:getWidth(curDial)/2 + dialPos.x, (-54/2) + dialPos.y)
		love.graphics.pop()
	end,
	leave = function()
		Timer.clear()
	end
}