
local done = false
local txt = lm.string.introWarningFirstPlay
local txtLines = txt:split '\n'
return {
    enter = function()
        save.save.seenWarning = true
        save.writeSave()
    end,
    update = function()
        if not done and (controls.pressed.a or controls.pressed.b) then
            done = true
            settings.eyesores = controls.pressed.a
            settings:save()
            switchState(titleMenu)
        end
    end,
    draw = function()
        love.graphics.push()
		love.graphics.translate(lovesize.getWidth() / 2, lovesize.getHeight() / 2)
        fonts('comic', 24)
        for i,v in pairs(txtLines) do
            love.graphics.print(v, -curFont:getWidth(v)/2, (32*i) - ((#txtLines * 48)/2))
        end
        love.graphics.pop()
    end,
    leave = function()
    end
}