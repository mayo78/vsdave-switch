
local done = false
local curSelected = 1
local stop = false
local gridguy, gridPos
local langColors = {
    {1, 0, 0},
    {0, 1, 0},
    {1, 1, 0}
}
local curColor, targetColor
return {
    enter = function()
        love.audio.stop()
        gridguy = paths.image('dave/title/checkeredBG')
		gridguy:setWrap('repeat','repeat')
		gridframe = love.graphics.newQuad(0, 0, gridguy:getWidth() * 12, gridguy:getHeight() * 6, gridguy:getWidth(), gridguy:getHeight())
		gridPos = point()
        paths.music('menu/language'):play()
        curColor, targetColor = table.copy(langColors[1]), table.copy(langColors[1])
    end,
    update = function(self, dt)
        if not stop then
            if controls.pressed.down then
                curSelected = curSelected + 1
                if curSelected > #lm.languageArray then
                    curSelected = 1
                end
                targetColor = table.copy(langColors[curSelected])
                print(targetColor[1])
            elseif controls.pressed.up then
                curSelected = curSelected - 1
                if curSelected < 1 then
                    curSelected = #lm.languageArray
                end
                targetColor = table.copy(langColors[curSelected])
                print(targetColor[1])
            elseif controls.pressed.confirm then
                stop = true
                lm:reloadLanguage(lm.languageArray[curSelected].language)
                settings.language = lm.language
                settings:save()
                switchState(self.fromSettings and menuSettings or (save.save.seenWarning and titleMenu or flashingState))
            end
        end

        gridPos.x, gridPos.y = gridPos.x - (gridguy:getWidth()/5) * dt, gridPos.y - (gridguy:getHeight()/5) * dt
		--print('cur pos is', gridPos.x, gridPos.y)
		if gridPos.y <= -(gridguy:getHeight()) then
			gridPos.x, gridPos.y = -(gridguy:getWidth()/5) * dt, -(gridguy:getHeight()/5) * dt
		end
        for i=1,3 do
            curColor[i] = lerp(curColor[i], targetColor[i], dt * 15)
        end
    end,
    draw = function()
        love.graphics.push()
        graphics.setColor(unpack(curColor))
		love.graphics.draw(gridguy, gridframe, gridPos.x, gridPos.y)
        graphics.setColor(1, 1, 1)
		love.graphics.translate(lovesize.getWidth() / 2, lovesize.getHeight() / 2)
        fonts('comic', 32)
        do
            local me = 'Please select a language.'
            love.graphics.print(me, -(((#me/2) * 16)), -100)
        end
        for i,v in pairs(lm.languageArray) do
            local txt = v.name
            if i == curSelected then
                graphics.setColor(1, 1, 0)
            end
            love.graphics.print(txt, -((#txt/2) * 16), (64*i) - ((#lm.languageArray * 64)/2))
            graphics.setColor(1, 1, 1)
        end
        love.graphics.pop()
    end,
    leave = function(self)
        love.audio.stop()
        if self.fromSettings then
            paths.music('menu/menu'):play()
        end
    end,
    fromSettings = false
}