

local leftFunc, rightFunc, confirmFunc, backFunc, drawFunc

local menuState

local titleBG
local menuButton

--local selectSound = love.audio.newSource("sounds/menu/select.ogg", "static")
--local confirmSound = love.audio.newSource("sounds/menu/confirm.ogg", "static")
local selectSound, confirmSound


local function switchMenu(menu)
	menuState = 1
end

local curSelected = 1

local optionShit

local states

local logoBl

local lilMenuGuy

local curOptText
local curOptDesc

local canInteract

local black

local bg
local magenta
local selectUi
local bigIcons

local sprites = {}
local function newSprite(image, x, y)
	local spr = graphics.newImage(paths.image(image))
	spr.x = x or 0
	spr.y = y or 0
	return spr
end
local function add(spr)
	table.insert(sprites, spr)
end

local function change(how)
    curSelected = curSelected + how
    if curSelected <= 0 then curSelected = #optionShit
    elseif curSelected > #optionShit then curSelected = 1
    end
    for i,icon in pairs(icons) do icon:animate((i == curSelected) and 'select' or 'idle') end
    bigIcons:animate(optionShit[curSelected], false)
    if how ~= 0 then
        selectSound:stop()
        selectSound:play()
    end
end

beenInTitle = false

local canMove = true

local function flickerLoop()
    magenta.color[4] = (magenta.color[4] == 0) and 1 or 0
    Timer.after(0.1, flickerLoop)
end

local reset

local redsky, glitchshader

return {
	enter = function(self, previous)
        print('awaitgg', awaitingExploitation)
        canMove = true
		table.clear(sprites)
        if awaitingExploitation then
            optionShit = {'freeplay', 'options'}

            redsky = graphics.newImage(paths.image('dave/backgrounds/void/redsky'))
            glitchshader = shaders:GLITCH()
        else
            optionShit = {		
                'story mode', 
                'freeplay', 
                'credits',
                'ost',
                'options'
            }
        end
        --reset = {
        --    open = false,
        --    selected = false,
        --    resetAll = function(self)
        --        local settingsBackup, saveBackup, highscoreBackup = settings:save(), save:writeSave()
        --        if not love.filesystem.getInfo 'savebackups' then love.filesystem.createDirectory 'savebackups' end
        --        local folder = table.concat({time.year, time.month, time.hour, time.min, time.sec}, '-')
        --        love.filesystem.createDirectory ('savebackups/'..folder)
        --        love.filesystem.write('savebackups/'..folder..'/settings.txt', settingsBackup)
        --        love.filesystem.write('savebackups/'..folder..'/save.txt', saveBackup)
        --        love.filesystem.write('savebackups/'..folder..'/highscores.txt', highscoreBackup)
        --        love.filesystem.remove 'settings.txt'
        --        love.filesystem.remove 'save.txt.'
        --        love.filesystem.remove 'highscores.txt'
        --        settings:reset()
        --        save:reset()
        --    end
        --}
        selectSound = paths.sound('menu/select')
        confirmSound = paths.sound('menu/confirm')
        states = {
            ['story mode'] = menuWeek,
            freeplay = menuFreeplay,
            options = menuSettings,
            credits = menuCredits,
            ost = menuOst,
        }
		menuButton = 1
		songNum = 0
        
        bg = graphics.newImage(paths.image(funkin:randomBG()))
        bg.color = {253, 232, 113}

        magenta = graphics.newImage(bg:getImage())
        magenta.color = {253, 113, 155, 0}

        selectUi = newSprite('dave/title/mainMenu/Select_Thing')
        add(selectUi)

        local anims = {}
        icons = {}
        for i,o in ipairs(optionShit) do
            table.insert(anims, {anim = o, name = (o == 'freeplay' and (awaitingExploitation and 'freeplay glitch' or 'freeplay0')) or o})
            local spr = graphics:newAnimatedSprite('dave/title/main_menu_icons', {
                {anim = 'idle', name = o..' basic', fps = 12, loops = true},
                {anim = 'select', name = o..' white', loops = true}
            }, 'idle')
            spr.x = fromTopLeft(GAMESIZE.width * 1.6).x
            spr.sizeX = 128/204
            spr.sizeY = spr.sizeX
            spr.y = 130
            local targetX = fromTopLeft((S_HALF_WIDTH) - 450 + ((i-1) * 160)).x
            if not beenInTitle then
                Timer.tween(1 + (i * 0.25), spr, {x = targetX}, 'in-out-expo')
            else
                spr.x = targetX
            end
            add(spr)
            table.insert(icons, spr)
        end
        bigIcons = graphics:newAnimatedSprite('dave/title/menu_big_icons', anims, 'story mode', false, nil, {center=true})
        bigIcons:animate('story mode', false)
        bigIcons.image:setFilter('nearest', 'nearest')
        bigIcons.y = -S_HALF_HEIGHT + 352/2
        add(bigIcons)
        
		cam.sizeX, cam.sizeY = 0.9, 0.9
		camScale.x, camScale.y = 0.9, 0.9

		--switchMenu(1)

        
        beenInTitle = true

        change(0)
	end,

	update = function(self, dt)
        --crashmygame:now()
		if canMove then
            --if input:pressed("back") then
			--	love.audio.play(selectSound)

			--	switchState(titleMenu)
			--end
            if controls.pressed.left then
                change(-1)
            elseif controls.pressed.right then
                change(1)
            end
            if controls.pressed.confirm then
                love.audio.play(confirmSound)
                canMove = false
                flickerLoop()
                Timer.after(1.5, function()
                    local state = states[optionShit[curSelected]]
                    print('state is', state, optionShit[curSelected], curSelected)
                    switchState(states[optionShit[curSelected]])
                end)
            end
		end
        for _,spr in pairs(sprites) do
            if spr.update then spr:update(dt) end
        end
	end,

	draw = function(self)
		love.graphics.push()
        love.graphics.translate(graphics.getWidth() / 2, graphics.getHeight() / 2)

        if awaitingExploitation then
            love.graphics.setShader(glitchshader)
            redsky:draw()
            love.graphics.setShader()
            love.graphics.setColor(0,0,0,0.4)
            love.graphics.rectangle('fill', -S_HALF_WIDTH, -S_HALF_HEIGHT, GAMESIZE.width, GAMESIZE.height)
            love.graphics.setColor(1,1,1)
        else
            love.graphics.setColor(rgb255(unpack(bg.color)))
            bg:draw()
            if magenta.color[4] > 0 then
                love.graphics.setColor(rgb255(unpack(magenta.color)))
                magenta:draw()
            end
            love.graphics.setColor(1,1,1)
        end
        
        local colorized = false
        for _,spr in pairs(sprites) do
            if spr.color then
                love.graphics.setColor(rgb255(spr.color[1], spr.color[2], spr.color[3], spr.color[4]))
                colorized = spr.color
            else
                love.graphics.setColor(1, 1, 1, 1)
            end
            spr:draw()
        end
        local aaa = (optionShit[curSelected] == 'story mode') and 'story' or optionShit[curSelected]
        if awaitingExploitation and optionShit[curSelected] == 'freeplay' then
            aaa = 'freeplay_glitch'
        end
        --print(lm.string['main_'..aaa], 'main_'..aaa)
        fonts('comic', 64)
        local main = lm.string['main_'..aaa]
        printfOutline(main, -curFont:getWidth(main)/2, fromTopLeft(0, S_HALF_HEIGHT + 28).y, 9999)
        fonts('comic', 24)
        local desc = lm.string['desc_'..aaa]
        printfOutline(desc, -curFont:getWidth(desc)/2, fromTopLeft(0, 720 - 58).y, 9999)
        printfOutline('Version '..tostring(version)..'\nMod version: v3', -S_HALF_WIDTH, -S_HALF_HEIGHT + 16) --..'\nHold start and select to reset data.'
        

        love.graphics.push()
        love.graphics.scale(cam.sizeX, cam.sizeY)
        love.graphics.pop()
		love.graphics.pop()
	end,

	leave = function(self)
		Timer.clear()
	end
}
