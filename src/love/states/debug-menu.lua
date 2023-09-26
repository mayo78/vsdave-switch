local bf

-- -35

local animList = {
	'idle',
	'singLEFT',
	'singUP',
	'singDOWN',
	'singRIGHT',
	'singLEFTmiss',
	'singUPmiss',
	'singDOWNmiss',
	'singRIGHTmiss',
}
local animIndex = 1
local animOffsets = {
	idle = point(206, 207),
	singLEFT = point(193, 203),
	singDOWN = point(188, 181),
	singUP = point(-18, 17),
	singRIGHT = point(205, 204),
}

for _,dir in pairs(animList) do
	animOffsets[dir] = point(0, 0)
end

return {
	enter = function(self, previous)
		bf = character ('bf', true)
		bf.skipDance = true
	end,

	update = function(self, dt)
		bf:update(dt)
		if controls.pressed.confirm then
			animIndex = animIndex + 1
			if animIndex > #animList then animIndex = 1 end
			bf:playAnim(animList[animIndex])
		elseif controls.pressed.back then
			animIndex = animIndex - 1
			if animIndex < 1 then animIndex = #animList end
			bf:playAnim(animList[animIndex])
		end
		local modifier = controls.down.gameFive and 25 or 1
		if controls.pressed.left then
			animOffsets[animList[animIndex]].x = animOffsets[animList[animIndex]].x - modifier
		elseif controls.pressed.right then
			animOffsets[animList[animIndex]].x = animOffsets[animList[animIndex]].x + modifier
		end
		if controls.pressed.up then
			animOffsets[animList[animIndex]].y = animOffsets[animList[animIndex]].y - modifier
		elseif controls.pressed.down then
			animOffsets[animList[animIndex]].y = animOffsets[animList[animIndex]].y + modifier
		end
		if controls.pressed.gameFive then
			print(animList[animIndex])
			print(animOffsets[animList[animIndex]].x, animOffsets[animList[animIndex]].y)
			print(- bf.sprite.width/2 + animOffsets[animList[animIndex]].x, - bf.sprite.height/2 + animOffsets[animList[animIndex]].y)
			--print(bf.sprite.drawX, bf.sprite.drawY)
			bf:playAnim(animList[animIndex])
		end
	end,

	draw = function(self)
		love.graphics.push()
		love.graphics.rectangle('fill', 0, 0, 1280, 720)
		love.graphics.translate(1280/2, 720/2)
		bf.sprite:draw()
		--love.graphics.pop()
		--love.graphics.push()
		--love.graphics.translate(1280/2, 720/2)
		graphics.setColor(1, 0, 0)
		love.graphics.line(bf.sprite.x - bf.sprite.width/2, bf.sprite.y - bf.sprite.height/2, bf.sprite.x + bf.sprite.width/2, bf.sprite.y + bf.sprite.height/2)
		love.graphics.pop()
	end
}
