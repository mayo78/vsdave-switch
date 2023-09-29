local mesongs = {
	polygonized = 'scaryAmbience',
	interdimensional = 'scaryAmbience',
	master =  'scaryAmbience',
	supernovae = 'dooDooFeces',
	glitch =  'dooDooFeces'
}

--copied from psych port so ingore the stupid table setup 
local dialogueSounds = {
	['bf'] = {'dialogue/bfDialogue'},
	['gf'] = {'dialogue/gfDialogue'},
	['dave'] = {'dialogue/daveDialogue'},
	['bambi'] = {'dialogue/bambDialogue1', 'dialogue/bambDialogue2', 'dialogue/bambDialogue3'},
	['tristan'] = {'dialogue/trisDialogue'},
	DEFAULT = {'dialogue/pixelText'}
}
local expressionPositions = { --if expressions have specific positions put them here
	['dave'] = {
		['scared'] = {180, 220},
		['phone'] = {0, -100},
		['3d-scared'] = {110, 226},
		['shocked'] = {150, 220},
		['furious'] = {170, 220},
		['festival-3d-scared'] = {135, 174},
		['festival'] = {200, 175},
		['festival-tired'] = {200, 175},
		['festival-exhausted'] = {200, 175}
	}
}
local charPositions = {
	['dave'] = {200, 220},
	['bambi'] = {200, 220},
	['tristan'] = {142, 200},
	['bf'] = {570, 220},
	['gf'] = {570, 220}
}
local killingmyself = {
	bambi = 'normal',
	tristan = 'content'
}

local STUPIDNAMES = {
	['post-maze'] = 'postmaze',
	festival = 'festival_happy',
	['festival-3d-scared'] = '3d_festival'
}

local song
local songVol
local dialogue

local dialPrint = ''
local curDial

local dialIndex = 0
local finishedDial = false
local curDialLoop, curDialSounds
local dropTxtColor, leaving, fadeColor, portraitAlpha, endDial
local lastAudio
local playAudio = false
local function dialLoop()
	playAudio = not playAudio
	if playAudio then
		if lastAudio then lastAudio:stop() end
		lastAudio = curDialSounds[love.math.random(1, #curDialSounds)]
		lastAudio:play()
	end
	curDial.index = curDial.index + 1
	dialPrint = curDial.dialogue:sub(1, curDial.index)
	if dialPrint ~= curDial.dialogue then
		curDialLoop = Timer.after(0.023, dialLoop)
	else
		finishedDial = true
	end
end
local exprStuff = {}
local speechBubble
local fadeAlpha
local portrait, scaredDave, fadingOut, fadeOutAlpha
local function nextDial()
	if curDialLoop then curDialLoop = nil end
	finishedDial = false
	dialIndex = dialIndex + 1
	curDial = dialogue[dialIndex]
	if curDial then
		portraitAlpha = 0
		if curDial.char ~= 'generic' then
			portrait:setImage(exprStuff[curDial.char][curDial.emotion])
			portrait.x = curDial.right and 1280 + portrait.width or -portrait.width
		end
		if curDial.effect == 'to_black' then
			fadingOut = true
			fadeOutAlpha = 0
		end
		dialPrint = ''
		curDial.index = 0
		curDialSounds = {}
		for _,e in pairs(dialogueSounds[curDial.char] or dialogueSounds.DEFAULT) do table.insert(curDialSounds, paths.sound(e)) end
		speechBubble.sizeX = curDial.right and 1 or -1
		speechBubble:animate((curDial.emotion == 'shocked' or curDial.emotion == 'sad') and 'loudOpen' or 'open')
		speechBubble.onAnimComplete = function(n)
			if (curDial.emotion == 'shocked' or curDial.emotion == 'sad') then
				speechBubble:animate('loud')
			else
				speechBubble:animate('idle')
			end
			dialLoop()
			speechBubble.onAnimComplete = nil
		end
	else
		leaving = true
		if song then
			song:stop()
		end
		--Timer.after(1, function()
		--	song:stop()
		--end)
		Timer.after(1.25, function()
			closeSubstate()
		end)
	end
end
local endThing
return {
	enter = function(self, dial, endy)
		musicTime = (240 / bpm) * -1000
		leaving = false
		if not greetingsCutscene then
			if weirdPolygonized then song = paths.music 'DaveDialogue'
			else song = paths.music(mesongs[funkin.curSong] or 'DaveDialogue')
			end
			song:setLooping(true)
			song:setVolume(0)
			song:play()
		end
		songVol = 0
		cutscene = true
		dialIndex = 0
		finishedDial = false
		endDial = endy
		if endDial then 
			print 'it will leave...'
			endThing = function()
				print 'GOING AWAY BECAUSE I AM END DIALIOUGEING'
				stage:tryToLeave()
			end
		else 
			endThing = function()
				weeks:setupCountdown()
			end
		end
		print('am i end ignasr k;gh ', endDial)

		local raw = paths.dialogue(dial)
		--print('MY RAW ASS IS ', raw)
		dialogue = {}
		for k,v in pairs(raw:split'\n') do
			local me = ' '..v:gsub('\\n', '')
			local thing = me:split ':'
			local split = string.split --copied from my dave psych port so this is why this is the thing cool!
			local dial = {
				char = split(thing[2], ',')[1],
				emotion = split(thing[2], ',')[2],
				dialogue = thing[3],
				effect = thing[1]:gsub(' ', ''),
				animated = split(thing[2], ',')[2] == 'scared', --lazy but its the only animated guy
				right = split(thing[2], ',')[1] == 'bf' or split(thing[2], ',')[1] == 'gf'
			}
			dial.emotion = ((dial.emotion and STUPIDNAMES[dial.emotion]) or dial.emotion or killingmyself[dial.char] or 'happy'):gsub('-', '_')
			if dial.char ~= 'generic' then
				if not exprStuff[dial.char] then exprStuff[dial.char] = {} end
				exprStuff[dial.char][dial.emotion] = paths.image('dave/dialogue/'..dial.char..'/'..dial.char..'_'..dial.emotion)
			end
			table.insert(dialogue, dial)
		end
		dropTxtColor = {hex2rgb'0xFF00137F'}
		fadeColor = {hex2rgb'0xFF8A9AF5'}
		speechBubble = graphics:newAnimatedSprite('dave/ui/speech_bubble_talking', {
			{anim = 'open', name = 'speech bubble normal open'},
			{anim = 'idle', name = 'speech bubble normal0', loops = true, fps = 12},
			{anim = 'loud', name = 'AHH speech bubble'},
			{anim = 'loudOpen', name = 'speech bubble loud open'}
		}, 'open', false, nil, {center=true})
		scaredDave = graphics:newAnimatedSprite('dave/dialogue/dave/dave_scared', {
			{anim = 'scared', name = 'post insanity'}
		}, 'scared')
		portrait = graphics.newImage(paths.image('dave/dialogue/dave/dave_happy'))
		portrait.y = 350
		speechBubble.x = 1280/2
		speechBubble.y = 550
		nextDial()
	end,
	update = function(self, dt)
		songVol = songVol + dt * 2 * (leaving and -1 or 1)
		fadeAlpha = songVol * 0.7
		if songVol > 1 then songVol = 1 end
		if curDial and curDial.char ~= 'generic' then
			portraitAlpha = portraitAlpha + dt * 5
			if curDial.right and portrait.x > 950 then
				portrait.x = portrait.x - dt * 3500
			elseif portrait.x < 200 then
				portrait.x = portrait.x + dt * 3500
			end
			--print(portrait.x, portraitAlpha)
		end
		if fadingOut then fadeOutAlpha = fadeOutAlpha + dt * 5 end
		dropTxtColor[4] = songVol
		if not greetingsCutscene then
			song:setVolume(songVol)
		end
		if controls.pressed.confirm and not leaving then
			if finishedDial then
				nextDial()
			else
				curDial.index = #curDial.dialogue-1
			end
		end
		speechBubble:update(dt)
		scaredDave:update(dt)
		scaredDave:setLooping(true)
		if portrait then
			scaredDave.x, scaredDave.y = portrait.x, portrait.y
		end
	end,
	draw = function(self)
		love.graphics.push()
		fadeColor[4] = fadeAlpha
		if greetingsCutscene then
			love.graphics.setBlendMode 'replace'
		end
		graphics.setColor(rgb255(unpack(fadeColor)))
		love.graphics.rectangle('fill', 0, 0, 1280, 720)
		if fadeOutAlpha and fadeOutAlpha > 0 then
			graphics.setColor(0, 0, 0, fadeOutAlpha)
			love.graphics.rectangle('fill', 0, 0, 1280, 720)
		end
		if greetingsCutscene then
			love.graphics.setBlendMode 'alpha'
		end
		graphics.setColor(1, 1, 1, portraitAlpha * songVol)
		if curDial and curDial.animated then
			scaredDave:draw()
		else
			portrait:draw()
		end
		graphics.setColor(1, 1, 1, songVol)
		speechBubble:draw()
		if not (mesongs[funkin.curSong] == 'scaryAmbience' and not weirdPolygonized) then
			fonts('comic', 32)
			graphics.setColor(rgb255(unpack(dropTxtColor)))
			love.graphics.printf(dialPrint, 102, 502, speechBubble.width - 55)
		else
			fonts((curDial and curDial.char == 'dave') and 'barcode' or 'comic', 32)
		end
		graphics.setColor(0, 0, 0, songVol)
		love.graphics.printf(dialPrint, 100, 500, speechBubble.width - 55)
		love.graphics.pop()
	end,
	leave = function(self)
		print 'END DIALOGUE'
		cutscene = false
		table.clear(dialogue)
		table.clear(exprStuff)
		dialIndex = 0
		dialPrint = ''
		finishedDial = false
		--im nmto recoding this fuck you that was mean sorry aboiut tthat
		song, songVol, dialogue, curDial, fadeAlpha, curDialLoop, curDialSounds, dropTxtColor, leaving, fadeColor, portraitAlpha, endDial, lastAudio, portrait, scaredDave, fadingOut, fadeOutAlpha, speechBubble = nil
		weeks:substateClosed(true)
		endThing()
	end
}