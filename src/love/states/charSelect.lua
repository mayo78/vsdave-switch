local function new_CharacterInSelect(char, scoreMultiplier, forms)
	return {
		char = char,
		scoreMultiplier = scoreMultiplier,
		forms = forms,
	}
end

local function new_CharacterForm(char, charPrint, _, note)
	return {
		char = char,
		print = charPrint,
		note = note
	}
end

local characters = {
	new_CharacterInSelect('bf', {1, 1, 1, 1}, {
		new_CharacterForm('bf', 'Boyfriend', {1, 1, 1, 1}),
		new_CharacterForm('bf-3d', 'Boyfriend (3d)', nil, '3D'), --should be in base 3.0
	}), --no pixel bf cause i would rather die
	new_CharacterInSelect('dave', {0.25, 0.25, 2, 2}, {new_CharacterForm('dave', 'Dave', {0.25, 0.25, 2, 2})}),
	new_CharacterInSelect('bambi', {0, 0, 3, 0}, {new_CharacterForm('bambi-new', 'Bambi', {0, 0, 3, 0})}),
	new_CharacterInSelect('tristan', {2, 0.5, 0.5, 0.5}, {new_CharacterForm('tristan', 'Tristan', {2, 0.5, 0.5, 0.5})}),
	new_CharacterInSelect('tristan-golden', {0.25, 0.25, 0.25, 2}, {new_CharacterForm('tristan-golden', 'Golden Tristan', {0.25, 0.25, 0.25, 2})}),
	new_CharacterInSelect('dave-angey', {2, 2, 0.25, 0.25}, {new_CharacterForm('dave-angey', '3D Dave', {2, 2, 0.25, 0.25}, '3D')}),
	new_CharacterInSelect('bambi-3d', {0, 3, 0, 0}, {new_CharacterForm('bambi-3d', 'Expunged', {0, 3, 0, 0}, '3D'),})
};

local portrait

local charIndex, formIndex

local strum3D

local accepted

local animList = {
	"left",
	"down",
	"up",
	"right"
}

local sky, bg, glitchshader
local icon
local guide, arrowLeft, arrowRight
local strumLine

local niceTween
local function strumTween()
	if niceTween then Timer.cancel(niceTween) end
	strumLine.alpha = 0
	niceTween = Timer.tween(0.25, strumLine, {alpha = 1}, nil, function() niceTween = nil end)
end
local function updatePortrait()
	portrait:animate(characters[charIndex].forms[formIndex].char)
	local is3D = characters[charIndex].forms[formIndex].note == '3D'
	if is3D and not strum3D or not is3D and strum3D then
		strum3D = not strum3D
		strumTween()
	end
	portrait.image:setFilter(getAA(not is3D))
end

local function changeChar(how)
	charIndex = charIndex + how
	formIndex = 1
	if charIndex > #characters then charIndex = 1
	elseif charIndex < 1 then charIndex = #characters end
	updatePortrait()
end

local function changeForm(how)
	formIndex = formIndex + how
	if formIndex > #characters[charIndex].forms then formIndex = 1
	elseif formIndex < 1 then formIndex = #characters[charIndex].forms end
	updatePortrait()
end

return {
	enter = function()
		strumLine = {}
		strum3D = false
		if funkin.curSong:lower() == 'exploitation' then            
			sky = graphics.newImage(paths.image 'dave/backgrounds/void/redsky')
            glitchshader = shaders:GLITCH()
		else
			sky = graphics.newImage(paths.image 'dave/backgrounds/shared/sky_night')
			glitchshader = nil
		end
		sky.sizeX, sky.sizeY = 1.2, 1.2
		bg = graphics.newImage(paths.image 'dave/charSelect')
		bg.sizeX, bg.sizeY = 1.2, 1.2
		accepted = false
		charIndex, formIndex = 1, 1
		local anims = {}
		for _,v in pairs(characters) do
			for _,v in pairs(v.forms) do
				table.insert(anims, {
					name = v.char,
					anim = v.char,
					fps = 0,
				})
			end
		end
		portrait = graphics:newAnimatedSprite('switch/portraits', anims, anims[1].anim, false, nil, {center=true})
		paths.music((funkin.curSong:lower() == 'exploitation') and 'badending' or 'goodending'):play()
		icon = graphics.newSprite(
			paths.image("dave/icons/face"),
			{{x = 0, y = 0, width = 150, height = 150}, {x = 0, y = 0, width = 150, height = 150}}, 
			{idle = {start = 1, stop = 2, speed = 0, offsetX = 0, offsetY = 0}},
			"idle",
			false,
			{smartOffsets = true}
		)
		local full = {full=true}
		guide = graphics.newImage(paths.image 'dave/title/charSelectGuide', full)
		guide.x, guide.y = 0, 0
		guide.sizeX, guide.sizeY = 1.5, 1.5
		
		arrowLeft = graphics.newImage(paths.image 'dave/title/ArrowLeft_Idle', full)
		arrowLeft.x = -150
		arrowLeft.y = -arrowLeft.height/2
		paths.image 'dave/title/ArrowLeft_Pressed'
		arrowRight = graphics.newImage(paths.image 'dave/title/ArrowRight_Idle', full)
		arrowRight.x = (1280/0.75) - arrowRight.width - 200
		arrowRight.y = -arrowRight.height/2
		paths.image 'dave/title/ArrowRight_Pressed'
		changeChar(0)

		strumLine.alpha = 0
		strumLine.normals = {}
		strumLine.threedees = {}
		for i=1,4 do
			local dir = animList[i]
			local strum = graphics:newAnimatedSprite('dave/notes/note_assets', {
				{anim = 'off', name = 'arrow'..(dir:upper()), fps = 0},
			}, 'off', false, nil, {center=true})
			strumLine.normals[i] = strum
			strum:update(0)
			
			local dir = animList[i]
			local strum = graphics:newAnimatedSprite('dave/notes/note_assets_3d', {
				{anim = 'off', name = 'arrow'..(dir:upper()), fps = 0},
			}, 'off', false, nil, {center=true})
			strum.image:setFilter(getAA(false))
			strumLine.threedees[i] = strum
			strum:update(0)
		end
		strumTween()
	end,
	leave = function()
		love.audio.stop()
	end,
	update = function(self, dt)
		if transOut then return end
		portrait:update(dt)
		if not accepted then
			if controls.pressed.left then 
				changeChar(-1)
				arrowLeft:setImage(paths.image 'dave/title/ArrowLeft_Pressed')
			elseif controls.pressed.right then 
				changeChar(1)
				arrowRight:setImage(paths.image 'dave/title/ArrowRight_Pressed')
			end
			if controls.released.left then
				arrowLeft:setImage(paths.image 'dave/title/ArrowLeft_Idle')
			end
			if controls.released.right then
				arrowRight:setImage(paths.image 'dave/title/ArrowRight_Idle')
			end
			if controls.pressed.up then 
				changeForm(-1)
			elseif controls.pressed.down then 
				changeForm(1)
			end
			if controls.pressed.confirm and save.save['unlocked_'..characters[charIndex].forms[formIndex].char] then
				if funkin.curSong:lower() == 'exploitation' then
					love.window.showMessageBox('Error', 'Attempt to index nil value "deleteExpunged"')
				end
				accepted = true
				charOverride = characters[charIndex].forms[formIndex].char
				scoreMultiplier = characters[charIndex].scoreMultiplier
				switchState(stage)
			end
		end
	end,
	draw = function()
		love.graphics.push()
		love.graphics.translate(S_HALF_WIDTH, S_HALF_HEIGHT)
		if glitchshader then love.graphics.setShader(glitchshader) end
		sky:draw()
		if glitchshader then love.graphics.setShader() end
		bg:draw()
		love.graphics.scale(2, 2)
		if not save.save['unlocked_'..characters[charIndex].forms[formIndex].char] then 
			love.graphics.setColor(0,0,0)
		end
		portrait:draw()
		if not save.save['unlocked_'..characters[charIndex].forms[formIndex].char] then 
			love.graphics.setColor(1,1,1)
		end
		love.graphics.pop()
		love.graphics.push()
		love.graphics.scale(0.75, 0.75)
		love.graphics.translate(-(1280 * .75 - 1280)/2, -(720 * .75 - 720)/2)
		guide:draw()
		love.graphics.translate(0, S_HALF_HEIGHT + 200)
		arrowLeft:draw()
		arrowRight:draw()
		love.graphics.translate(475, -500)
		fonts('comic', 32)
		if save.save['unlocked_'..characters[charIndex].forms[formIndex].char] then 
			for i=1,4 do
				love.graphics.setColor(1,1,1,1-strumLine.alpha)
				local badstrum = (not strum3D) and strumLine.threedees[i] or strumLine.normals[i]
				badstrum:draw()
				love.graphics.setColor(1,1,1,strumLine.alpha)
				local strum = strum3D and strumLine.threedees[i] or strumLine.normals[i]
				strum:draw()
				local hi = tostring(characters[charIndex].scoreMultiplier[i])
				printfOutline(hi, -curFont:getWidth(hi)/2, -curFont:getHeight()/2)
				love.graphics.translate(154, 0)
			end
		end
		love.graphics.pop()
		fonts('comic', 64)
		local printy = characters[charIndex].forms[formIndex].print
		if not save.save['unlocked_'..characters[charIndex].forms[formIndex].char] then printy = '???' end
		printfOutline(printy, S_HALF_WIDTH - curFont:getWidth(printy)/2, 450)
	end,
}