

local upFunc, downFunc, confirmFunc, backFunc, drawFunc, musicStop

local menuState

local menuNum = 1

local weekNum = 1
local songNum, songAppend
local songDifficulty = 2

local logo

--local girlfriendTitle = love.filesystem.load("sprites/menu/girlfriend-title.lua")()
--local titleEnter = love.filesystem.load("sprites/menu/titleEnter.lua")()
local girlfriendTitle
local titleEnter

local selectSound
local confirmSound





local canMove = true

return {
	enter = function(self, previous)
		canMove = true
        selectSound = paths.sound('menu/select')
        confirmSound = paths.sound('menu/confirm')
		logo = graphics:newAnimatedSprite('dave/title/logoBumpin', {{name = 'logo bumpin', anim = 'idle', loops = true}}, 'idle', true)
		logo.x, logo.y = -350, -125
		logo.sizeX, logo.sizeY = 1.25, 1.25

		girlfriendTitle = graphics:newAnimatedSprite('dave/title/gfDanceTitle', {{name = 'gfDance', anim = 'idle', loops = true}}, 'idle')
		girlfriendTitle.x, girlfriendTitle.y = 325, 65
		girlfriendTitle.sizeX, girlfriendTitle.sizeY = 1.25, 1.25

		titleEnter = graphics:newAnimatedSprite('dave/titleEnter', {{name = 'Press Enter to Begin', anim = "anim"}, {name = 'ENTER PRESSED', anim = 'pressed'}}, 'anim')
		titleEnter.x, titleEnter.y = 225, 350
		
		songNum = 0



		cam.sizeX, cam.sizeY = 0.9, 0.9
		camScale.x, camScale.y = 0.9, 0.9

		--switchMenu(1)

		music = paths.music('menu/menu')
		music:setLooping(true)
		music:play()
	end,

	musicStop = function(self)
		music:stop()
	end,

	update = function(self, dt)
		--print(love.timer.getTime())
		girlfriendTitle:update(dt)
		titleEnter:update(dt)
		--titleEnter:animate("anim", true)

		if not drawTransition and canMove then
			if input:pressed("confirm") then
				canMove = false
				audio.playSound(confirmSound)

				titleEnter:animate("pressed", false)

				Timer.after(1, function()
					switchState(menuSelect)
				end)
			end

			logo:update(dt)
		end
	end,

	draw = function(self)
		love.graphics.push()
			love.graphics.translate(graphics.getWidth() / 2, graphics.getHeight() / 2)

			love.graphics.push()
				love.graphics.scale(cam.sizeX, cam.sizeY)

				logo:draw()

				girlfriendTitle:draw()
				titleEnter:draw()

				love.graphics.pop()
		love.graphics.pop()
	end,

	leave = function(self)
		--music:stop()

		Timer.clear()
	end
}
