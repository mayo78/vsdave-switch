
local done = false
local txt = [[Hey! You are using an old version of this port!
Your current version is ]]..tostring(version)..[[
The newest version is ]]..tostring(onlineVersion)..[[
Download the newest build through github or another source!]]
local txtLines = txt:split '\n'
return {
    enter = function()
    end,
    update = function()
        if controls.pressed.confirm and not done then
            done = true
            switchState(save.seenWarning and titleMenu or flashingState)
        end
    end,
    draw = function()
        love.graphics.push()
		love.graphics.translate(lovesize.getWidth() / 2, lovesize.getHeight() / 2)
        fonts('comic', 32)
        for i,v in pairs(txtLines) do
            love.graphics.print(v, -((#v/2) * 16), (32*i) + 100)
        end
        love.graphics.pop()
    end,
    leave = function()
    end
}