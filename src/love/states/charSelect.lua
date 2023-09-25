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

local function updatePortrait()
	portrait:animate(characters[charIndex].forms[formIndex].char)
	portrait.image:setFilter(getAA(characters[charIndex].forms[formIndex].note ~= '3D'))
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

local accepted = false

return {
	enter = function()
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
		changeChar(0)
	end,
	leave = function()
	end,
	update = function(self, dt)
		portrait:update(dt)
		if not accepted then
			if controls.pressed.left then changeChar(-1)
			elseif controls.pressed.right then changeChar(1)
			end
			if controls.pressed.up then changeForm(-1)
			elseif controls.pressed.down then changeForm(1)
			end
			if controls.pressed.confirm then
				accepted = true
				charOverride = characters[charIndex].forms[formIndex].char
				scoreMultiplier = characters[charIndex].scoreMultiplier
				switchState(stage)
			end
		end
	end,
	draw = function()
		love.graphics.push()
		love.graphics.translate(1280/2, 720/2)
		love.graphics.scale(2, 2)
		portrait:draw()
		love.graphics.pop()
	end,
}