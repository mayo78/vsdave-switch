local djList
local songIndex, xOffset, xOffsetTarget, yOffset, yOffsetTarget
local songTime, playingSong, songPaused
local inst, voices
local function change(how)
	songIndex = songIndex + how
	if songIndex > #djList then songIndex = 1
	elseif songIndex < 1 then songIndex = #djList
	end
	xOffsetTarget = -64 * songIndex
	yOffsetTarget = -92 * songIndex
end
local bg
local rr, bb, gg = rgb255(hex2rgb '0xFFFD719B')
local songRemap = {
	['im-angey'] = 'scaryAmbience',
	['a-new-day'] = 'DaveDialogue',
	['bambi-speak'] = 'dooDooFeces',
	['good-ending'] = 'goodending',
	['bad-ending'] = 'badending'
}
local timeBarOverlay
local iconP1, iconP2
local function seek(time)
	if time < 0 or time > inst:getDuration 'seconds' then time = 0 end
	musicTime = time
	inst:seek(musicTime, 'seconds')
	if voices then voices:seek(musicTime, 'seconds') end
end
local djsongstring = [[internal,warmup,dave,good
internal,house,dave,good
internal,insanity,dave,bad
external,im-angey,dave-angey-pixel,bad
internal,polygonized,dave-angey-pixel,bad
internal,blocked,bambi,bad
internal,corn-theft,bambi,bad
internal,maze,bambi,good
internal,splitathon,the-duo,good
internal,shredder,bambi,good
internal,greetings,tristan,good
internal,interdimensional,dave-festival-3d-pixel,good
internal,rano,dave-festival,good
internal,bonus-song,dave,good
internal,indignancy,bambi-angey,good
internal,adventure,tristan,good
internal,bot-trot,playrobot,good
internal,escape-from-california,moldy,good
internal,five-nights,dave,good
internal,overdrive,dave-awesome,good
internal,mealie,bambi,good
internal,memory,dave,good
internal,vs-dave-rap,dave-cool,good
external,a-new-day,dave,good
external,bambi-speak,bambi,bad
external,good-ending,bf-old,good
external,bad-ending,bf-old,bad]]
return {
	enter = function(self)
		songTime = 0
		djList = {}
		bg = graphics.newImage(paths.image(funkin.randomBG()))
		songIndex = 1
		playingSong = false
		songPaused = false
		yOffset, xOffset = 1, 1
		local unlockables = {
			{'supernovae', 'bambi-joke', save.save.weekPlayed_WEEK5},
			{'glitch', 'bambi-joke', save.save.weekPlayed_WEEK5},
			{'master', 'bambi-joke', save.save.weekPlayed_WEEK5},
			{'cheating', 'bambi-3d-pixel', save.save.cheatingFound},
			{'unfairness', 'bambi-unfair-pixel', save.save.unfairnessFound},
			{'exploitation', 'expunged-pixel', save.save.exploitationFound},
			{'kabunga', 'exbungo-pixel', save.save.kabungaFound},
			{'roofs', 'baldi', save.save.roofsFound},
			{'recursed', 'recurser', save.save.recursedFound},
			{'vs-dave-rap-two', 'dave-cool', save.save.daverapFound}
		}
		for _,v in pairs(djsongstring:split '\n') do
			local ok = v:split ','
			local hasVoices = false
			local song
			if ok[1] == 'internal' then
				song = paths.song(ok[2]:lower())
				hasVoices = song.needsVoices
			end
			local iconBad = ok[4] == 'bad'
			table.insert(djList, {
				song = ok[2],
				print = ok[2]:gsub('-', ' '),
				icon = ok[3],
				iconBad = iconBad,
				songType = ok[1],
				hasVoices = hasVoices
			})
			if hasVoices then
				table.insert(djList, {
					song = ok[2],
					print = ok[2]:gsub('-', ' ')..' inst',
					icon = ok[3], 
					iconBad = iconBad,
					songType = 'internal'
				})
			end
		end
		for _,ok in pairs(unlockables) do
			if ok[3] then
				table.insert(djList, {
					song = ok[1],
					print = ok[1]:gsub('-', ' '),
					icon = ok[2],
					iconState = 'good',
					hasVoices = true,
					songType = 'internal'
				})
				table.insert(djList, {
					song = ok[1],
					print = ok[1]:gsub('-', ' ')..' inst',
					icon = ok[2],
					iconState = 'good',
					songType = 'internal'
				})
			end
		end
		for k,v in ipairs(djList) do
			local iconImg = paths.image("dave/icons/"..v.icon)
			if v.icon:endsWith '-pixel' then iconImg:setFilter(getAA(false)) end
			local icon = graphics.newSprite(
				iconImg,
				{{x = 0, y = 0, width = 150, height = 150}, {x = 150, y = 0, width = 150, height = 150}}, 
				{
					good = {start = 1, stop = 2, speed = 0, offsetX = 0, offsetY = 0},
					bad = {start = 2, stop = 2, speed = 0, offsetX = 0, offsetY = 0},
				},
				v.iconBad and 'bad' or 'good',
				false
			)
			local song, iconP1, iconP2
			if v.songType == 'internal' then
				song = paths.song(v.song:lower())
				print('FUCK', v.song, song.player1, song.player2, v.print)
				hasVoices = song.needsVoices
				local char1 = paths.character(song.player1) or paths.character 'bf'
				iconP1 = paths.image('dave/icons/'..(char1.healthicon or 'bf'))
				iconP1:setFilter(getAA(not char1.no_antialiasing))
				local char2 = paths.character(song.player2) or paths.character 'bf'
				iconP2 = paths.image('dave/icons/'..(char2.healthicon or 'bf'))
				iconP2:setFilter(getAA(not char2.no_antialiasing))
			else
				iconP1 = paths.image 'dave/icons/bf'
				iconP2 = iconImg
			end
			icon.y = 64
			djList[k].iconSprite = icon
			djList[k].icons = {iconP1, iconP2}
		end
		timeBarOverlay = graphics.newImage(paths.image('dave/healthBar'))
		timeBarOverlay.y = -345
		timeBarOverlay.sizeX, timeBarOverlay.sizeY = 1.5, 1.5
		iconP1 = graphics.newSprite(
			paths.image'dave/icons/face',
			{{x = 0, y = 0, width = 150, height = 150}, {x = 150, y = 0, width = 150, height = 150}}, 
			{
				good = {start = 1, stop = 2, speed = 0, offsetX = 0, offsetY = 0},
				bad = {start = 2, stop = 2, speed = 0, offsetX = 0, offsetY = 0},
			},
			'good',
			false
		)
		iconP1.sizeX = -1
		iconP2 = graphics.newSprite(
			paths.image'dave/icons/face',
			{{x = 0, y = 0, width = 150, height = 150}, {x = 150, y = 0, width = 150, height = 150}}, 
			{
				good = {start = 1, stop = 2, speed = 0, offsetX = 0, offsetY = 0},
				bad = {start = 2, stop = 2, speed = 0, offsetX = 0, offsetY = 0},
			},
			'good',
			false
		)
		iconP1.y = timeBarOverlay.y - (150/2)
		iconP2.y = timeBarOverlay.y - (150/2)
		change(0)
	end,
	update = function(self, dt)
		if controls.pressed.back then --lazy
			switchState(menuSelect)
		elseif controls.pressed.down then
			change(1)
		elseif controls.pressed.up then
			change(-1)
		elseif controls.pressed.confirm then
			love.audio.stop()
			paths.clearCache 'audio'
			songTime = 0
			playingSong = true
			local s = djList[songIndex]
			if s.songType ~= 'external' then
				inst = paths.inst(s.song)
				voices = s.hasVoices and paths.voices(s.song)
			else
				inst = paths.music(songRemap[s.song])
				voices = nil
			end
			iconP1:setSheet(s.icons[1])
			iconP2:setSheet(s.icons[2])
			if inst then 
				inst:play() 
			end
			if voices then 
				voices:play() 
			end
		elseif controls.pressed.back then
			switchState(menuSelect)
		end
		if playingSong then
			musicTime = inst:tell "seconds"
			if controls.pressed.right then
				seek(musicTime + 5)
			elseif controls.pressed.left then
				seek(musicTime - 5)
			elseif controls.pressed['button:y'] then
				songPaused = not songPaused
				if songPaused then
					inst:play()
					if voices then voices:play() end
				else
					inst:pause()
					if voices then voices:pause() end
				end
			end
			local songPercent = musicTime/inst:getDuration 'seconds'
			if songPercent <= 0.2 then
				iconP2:animate 'bad'
				iconP1:animate 'good'
			elseif songPercent >= 0.8 then
				iconP1:animate 'bad'
				iconP2:animate 'good'
			else
				iconP1:animate 'good'
				iconP2:animate 'good'
			end
			local tw = timeBarOverlay.width*timeBarOverlay.sizeX
			local th = timeBarOverlay.height*timeBarOverlay.sizeY
			iconP1.x = 425 - (tw - 9) * -(songPercent) - 850 - 37.5 + (150 * math.abs(iconP1.sizeX)) - 25
			iconP2.x = 425 - (tw - 9) * -(songPercent) - 850 + 37.5 - (150 * iconP2.sizeX) - 25
			iconP1:update(dt)
			iconP2:update(dt)			
		end
		xOffset = lerp(xOffset, xOffsetTarget, dt * 15)
		yOffset = lerp(yOffset, yOffsetTarget, dt * 15)
	end,
	draw = function()
		love.graphics.push()
		love.graphics.translate(S_HALF_WIDTH, S_HALF_HEIGHT)
		graphics.setColor(rr, gg, bb)
		bg:draw()
		fonts('comic', 72)
		love.graphics.translate(-500 + xOffset, -100 + yOffset)
		for i,v in ipairs(djList) do
			love.graphics.translate(64, 92)
			printfOutline(v.print, 0, 0, nil, {alpha = (songIndex == i and 1 or 0.5)})
			v.iconSprite.x = curFont:getWidth(v.print)
			v.iconSprite.y = -150/8
			graphics.setColor(1, 1, 1, (songIndex == i and 1 or 0.5))
			v.iconSprite:draw()
			graphics.setColor(1, 1, 1)
		end
		love.graphics.pop()
		if playingSong then
			love.graphics.push()
			love.graphics.translate(S_HALF_WIDTH, (S_HALF_HEIGHT) + 50)
			local tw = timeBarOverlay.width*timeBarOverlay.sizeX
			local th = timeBarOverlay.height*timeBarOverlay.sizeY
			graphics.setColor(128/255, 128/255, 128/255, 1)
			love.graphics.rectangle("fill", timeBarOverlay.x + 5 - tw/2, timeBarOverlay.y - timeBarOverlay.height/2 + 2, tw - 9, th - (8 * timeBarOverlay.sizeY) + 0.1)
			graphics.setColor(57/255, 1, 20/255, 1)
			love.graphics.rectangle("fill", timeBarOverlay.x + 5 - tw/2, timeBarOverlay.y - timeBarOverlay.height/2 + 2, (tw - 9) * (musicTime)/inst:getDuration"seconds", th - (8 * timeBarOverlay.sizeY) + 0.1)
			graphics.setColor(1, 1, 1, 1)
			timeBarOverlay:draw()
			local hi = formatTime(musicTime)..' / '..formatTime(inst:getDuration 'seconds')
			printfOutline(hi, 0, timeBarOverlay.y + 10, nil, {size = 32, depth = 0.05, alpha = 1, center = true})
			iconP1:draw()
			iconP2:draw()
			love.graphics.pop()
		end
	end,
	leave = function()
	end
}