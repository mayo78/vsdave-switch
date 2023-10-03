
local done = false
local txtLines = {'Coward.'}
return {
    enter = function()
        save.save.coward = false
        save.writeSave()
    end,
    update = function()
        if controls.pressed.confirm then
            done = true
            switchState(menuSelect)
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