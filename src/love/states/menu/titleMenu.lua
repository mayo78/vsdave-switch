local logo

local girlfriendTitle
local titleEnter

local confirmSound

local canMove
local beatTimer
local danceLeft
local curBeat
local introDone = false
local curWacky

local texts = {}
local function addText(text)
	for i,v in pairs(text) do table.insert(texts, v) end
end
local function clearText()
	texts = {}
end
local _flashTimer
local function finish()
	introDone = true
	overlayColor = {1,1,1,alpha=1}
	if _flashTimer then Timer.cancel(_flashTimer) end
	_flashTimer = Timer.tween(1, overlayColor, {alpha=0}, nil, function() _flashTimer = nil end)
end
local beatEvents = {
	[1] = function()
		addText{
			'Created By:',
			'MoldyGH',
			'MissingTextureMan101',
			'Rapparep LOL'
		}
	end,
	[3] = function()
		addText{
			'TheBuilderXD',
			'Erizur, T5mpler'
		}
	end,
	[4] = function()
		addText{
			'and our wonderful contributors!'
		}
	end,
	[5] = function()
		clearText()
	end,
	[6] = function()
		addText{'Supernovae by ArchWk'}
	end,
	[7] = function()
		addText{'Glitch by The Boneyard'}
	end,
	[8] = function()
		clearText()
	end,
	[9] = function()
		addText{curWacky[1]}
	end,
	[10] = function()
		addText{curWacky[2]}
	end,
	[11] = function()
		clearText()
	end,
	[12] = function()
		addText{'Friday Night Funkin\''}
	end,
	[13] = function()
		addText{awaitingExploitation and 'Vs. Expunged' or 'VS. Dave'}
	end,
	[14] = function()
		addText{not awaitingExploitation and 'and Bambi' or 'The Full Mod'}
	end,
	[15] = function()
		addText(awaitingExploitation and tostring('HAHAHHAHAHAHAHHAHAHAHAHHAHAHAHAHHAHA\nHAHAHHAHAHAHAHHAHAHAHAHHAHAHAHAHHAHA\nHAHAHHAHAHAHAHHAHAHAHAHHAHAHAHAHHAHA'):split'\n' or {'The Full Mod'})
		if awaitingExploitation then paths.sound 'evilLaugh':play() end
	end,
	[16] = finish,
}
local function beatLoop() --no need to do any fancy beat stuff, a timer will work fine enough!
	if beatEvents[curBeat] and not introDone then beatEvents[curBeat]() end
	curBeat = curBeat + 1
	danceLeft = not danceLeft
	if not awaitingExploitation then
		girlfriendTitle:animate(danceLeft and 'danceLeft' or 'danceRight')
	end
	if not logo:isAnimated() then
		logo:animate 'idle'
	end
	beatTimer = Timer.after(awaitingExploitation and 0.7 or 0.4, beatLoop)
end

return {
	enter = function(self, previous)
		danceLeft = false
		curBeat = 0
		local awaiting = save.save.awaitingExploitation
		if awaiting then
			awaitingExploitation = true
			save.save.awaitingExploitation = false
			save.writeSave()
		end
		canMove = true
        confirmSound = paths.sound('menu/confirm')
		logo = graphics:newAnimatedSprite('dave/title/logoBumpin'..(awaitingExploitation and 'expunged' or ''), {{name = 'logo bumpin', anim = 'idle'}}, 'idle', true)
		logo.x, logo.y = -25, -50
		logo.sizeX, logo.sizeY = 1.2, 1.2
		if awaitingExploitation then
			logo.x, logo.y = 1280/2 - logo.width/2, 720/2 - logo.height/2 - 100
		end

		if not awaitingExploitation then
			girlfriendTitle = graphics:newAnimatedSprite('dave/title/gfDanceTitle', {
				{name = 'gfDance', anim = 'danceLeft', indices = {30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14}},
				{name = 'gfDance', anim = 'danceRight', indices = {15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29}}
			}, 'danceRight')
			girlfriendTitle.x, girlfriendTitle.y = 1280 * 0.4, 720 * 0.07
		end

		titleEnter = graphics:newAnimatedSprite('dave/titleEnter', {{name = 'Press Enter to Begin', anim = "anim"}, {name = 'ENTER PRESSED', anim = 'pressed'}}, 'anim')
		titleEnter.x, titleEnter.y = 100, 720 * 0.8
		

		cam.sizeX, cam.sizeY = 0.9, 0.9
		camScale.x, camScale.y = 0.9, 0.9

		--switchMenu(1)

		local hi = love.filesystem.read 'data/introText.txt':split '\n'
		curWacky = hi[love.math.random(1, #hi)]:split '--'

		music = paths.music(awaitingExploitation and 'menu/evilmenu' or 'menu/menu')
		music:setLooping(true)
		music:play()
		Timer.after(0.03, beatLoop) --weird delay
	end,

	musicStop = function(self)
		music:stop()
	end,

	update = function(self, dt)
		if introDone then
			--print(love.timer.getTime())
			if not awaitingExploitation then
				girlfriendTitle:update(dt)
			end
			titleEnter:update(dt)
			logo:update(dt)
			--titleEnter:animate("anim", true)
		end
		if not drawTransition and canMove then
			if controls.pressed.confirm then
				if not introDone then finish()
				else
					finish()
					canMove = false
					audio.playSound(confirmSound)

					titleEnter:animate("pressed", false)

					Timer.after(1, function()
						switchState(menuSelect)
					end)
				end
			end
		end
	end,

	draw = function(self)
		love.graphics.push()
		--love.graphics.translate(graphics.getWidth() / 2, graphics.getHeight() / 2)

		if introDone then
			if not awaitingExploitation then
				girlfriendTitle:draw()
			end
			titleEnter:draw()

			logo:draw()
		else
			fonts('comic', 48)
			love.graphics.translate(graphics.getWidth() / 2, graphics.getHeight() / 2)
			for i,v in pairs(texts) do
				love.graphics.print(v, -curFont:getWidth(v)/2, (50 * (i-1)) - 72)
			end
		end

		love.graphics.pop()
	end,

	leave = function(self)
		--music:stop()

		Timer.clear()
	end
}
