local bf

-- -35

local animList = {
	'idle',
	'singLEFT',
	'singDOWN',
	'singUP',
	'singRIGHT',
}
local animIndex = 1
local animOffsets = {
	idle = point(0, 0),
	singLEFT = point(-13, -3),
	singDOWN = point(-18, -26),
	singUP = point(-18, 17),
	singRIGHT = point(-1, -2),
}

for _,dir in pairs(animList) do
	animOffsets[dir] = point(0, 0)
end

return {
	enter = function(self, previous)
		bf = character.new ('bf', true)
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
		if controls.pressed.left then
			animOffsets[animList[animIndex]].x = animOffsets[animList[animIndex]].x - 1
		elseif controls.pressed.right then
			animOffsets[animList[animIndex]].x = animOffsets[animList[animIndex]].x + 1
		end
		if controls.pressed.up then
			animOffsets[animList[animIndex]].y = animOffsets[animList[animIndex]].y - 1
		elseif controls.pressed.down then
			animOffsets[animList[animIndex]].y = animOffsets[animList[animIndex]].y + 1
		end
		if controls.pressed.gameFive then
			print(animOffsets[animList[animIndex]].x, animOffsets[animList[animIndex]].y)
			print(bf.sprite.drawX, bf.sprite.drawY)
			bf:playAnim(animList[animIndex])
		end
	end,

	draw = function(self)
		love.graphics.push()
		love.graphics.rectangle('fill', 0, 0, 1280, 720)
		love.graphics.translate(1280/2, 720/2)
		love.graphics.translate(animOffsets[animList[animIndex]].x, animOffsets[animList[animIndex]].y)
		bf.sprite:draw()
		--love.graphics.pop()
		--love.graphics.push()
		--love.graphics.translate(1280/2, 720/2)
		graphics.setColor(1, 0, 0)
		love.graphics.line(bf.sprite.x - bf.sprite.width/2, bf.sprite.y - bf.sprite.height/2, bf.sprite.x + bf.sprite.width/2, bf.sprite.y + bf.sprite.height/2)
		love.graphics.pop()
	end
}
