
local done = false
local txt = [[This mod contains flashing lights and shaders that can strain your eyes!
Press A to continue with them enabled, press B to disable them.]]
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
            switchState(meuTitle)
        end
    end,
    draw = function()
        love.graphics.push()
        fonts('comic', 32)
        for i,v in pairs(txtLines) do
            love.graphics.print(v, -((#v/2) * 16), (32*i) + 100)
        end
        love.graphics.pop()
    end,
    leave = function()
    end
}