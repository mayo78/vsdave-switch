

local animList = {
	"left",
	"down",
	"up",
	"right"
}
local ghAnimList = {
	'left',
	'down',
	'middle',
	'up',
	'right'
}
local inputList = {
	"gameLeft",
	"gameDown",
	"gameUp",
	"gameRight"
}

local scramble = {4, 1, 2, 3}

local ratingTimers = {}

local useAltAnims
local notMissed = {}

local misses = 0
local accuracy = 0
local totalNotes = 0
local notesHit = 0

local curSong;
local jsonChart

local songEvents = {}

local camPos = point()

local colors = {'purple', 'blue', 'green', 'red'}

local has3D = false

local curSongTime = 0
local lastEvent = {c = 0, st = 0, bpm = 0}

local healthBarOverlay
local timeBarOverlay

local safeZoneOffset = (10 / 60) * 1000
local hasShapes = false

local _boyfriendArrows

local CREDITS_X = -1280/2/0.7 + (4/0.7)

local boyfriends = {}
local dads = {}
local gfs = {}

stageOverlay = {0, 0, 0, alpha = 0}
local stageMode = false

local elapseduitime = 0

local screenShader
local screenShaderOn = false
local blockedShader
local blockedShaderOn = false

local hudZoom, hudTargetZoom

--local addedSubs = false

local function addCharToList(type, char)
	if type == 1 then
		print('my dad')
		if not dads[char] then 
			dads[char] = character.new(char)
			dads[char].onIdle = function()
				if not mustHitSection then camOffset = point() end
			end
		end
	elseif type == 2 then
		if not gfs[char] then 
			gfs[char] = character.new(char) 
		end
	else
		if not boyfriends[char] then 
			boyfriends[char] = character.new(char, true) 
			boyfriends[char].onIdle = function()
				if mustHitSection then camOffset = point() end
			end
		end
	end
end
local function changeChar(type, char)
	if type == 1 then
		--print('changing dad to ', char)
		local pos = point(enemy.x, enemy.y)
		local col = enemy.color
		enemyObject:dance()
		enemyObject = dads[char]
		enemy = enemyObject.sprite
		enemy.x, enemy.y, enemy.color = pos.x, pos.y, col
		if not stupididiotvariable then
			enemyIcon:setSheet(paths.image('dave/icons/'..enemyObject.icon))
			enemyIcon.image:setFilter(enemyObject.is3D and 'nearest' or 'linear', enemyObject.is3D and 'nearest' or 'linear')
		end
		--print('changed dad', enemyObject, enemyObject.curCharacter, enemy)
	elseif type == 2 then
		local pos = point(girlfriend.x, girlfriend.y)
		local col = girlfriend.color
		girlfriendObject:dance()
		girlfriendObject = gfs[char]
		girlfriend = girlfriendObject.sprite
		girlfriend.x, girlfriend.y, girlfriend.color = pos.x, pos.y, col
	else
		local pos = point(boyfriend.x, boyfriend.y)
		local col = boyfriend.color
		boyfriendObject:dance()
		boyfriendObject = boyfriends[char]
		boyfriend = boyfriendObject.sprite
		boyfriend.x, boyfriend.y, boyfriend.color = pos.x, pos.y, col
		boyfriendIcon:setSheet(paths.image('dave/icons/'..boyfriendObject.icon))
		boyfriendIcon.image:setFilter(boyfriendObject.is3D and 'nearest' or 'linear', boyfriendObject.is3D and 'nearest' or 'linear')
	end
end
local subtitles = {}
local subtitleIndex = 0
local curSubtitle
local combospr
local readyImg, setImg, goImg
local stageLight, stageLightOn
--stolen from my dave psych port lol!
local function getData(song)
	local aa = love.filesystem.read('data/credits.txt'):split '\n'
	local data = {}
	for k,v in pairs(aa) do
		local shitter = v:split ', '
		if (shitter[1] or ''):lower() == song then
			local penis = {song = shitter[1], composer = shitter[2], header = shitter[3], intro = shitter[4], headerXml = shitter[6], antialiasing = shitter[5]};
			local checkNil = function(inp)
			return inp == nil or #inp <= 1 or inp == '';
			end
			if checkNil(penis.composer) then penis.composer = 'None' end
			if checkNil(penis.header) then penis.header = 'tristanHeading' end
			if checkNil(penis.intro) then penis.intro = nil end
			if penis.headerXml == 'NO' then penis.headerXml = nil end
			penis.antialiasing = penis.antialiasing == 'true'
			return penis;
		end
	end
end
local hudAlpha
local strumsAreShapes
local function sectionEvent(eventID)
	--print('my eventid is', eventID)
		local oldBpm = bpm

		if events[eventID].bpm then
			lastEvent = {c = crochet, st = curSongTime, bpm = bpm}
			bpm = events[eventID].bpm
			crochet = ((60 / bpm) * 1000)
			stepCrochet = crochet / 4
			curSongTime = 0
			if not bpm then bpm = oldBpm end
		end

		if camTimer then
			Timer.cancel(camTimer)
		end
		mustHitSection = events[eventID].mustHitSection
		altSection = events[eventID].altAnim

		if events[eventID].altAnim then
			useAltAnims = true
		else
			useAltAnims = false
		end
		events[eventID] = nil
	end
return {
	enter = function(self)
		hudZoom, hudTargetZoom = 1, 1
		strumsAreShapes = false
		hudAlpha = {0}
		timebarAlpha = {0}
		dads = {}
		boyfriends = {}
		gfs = {}
		screenShader = shaders:EYESORE()
		screenShaderOn = false
		blockedShader = shaders:BLOCKED()
		blockedShaderOn = false
		origZoom = camZoom
		enemyNotesToDraw = {0, 0, 0, 0, 0}
		boyfriendNotesToDraw = {0, 0, 0, 0}
		sounds = {
			countdown = {},
			miss = {
				paths.sounds("miss1", "static"),
				paths.sounds("miss2", "static"),
				paths.sounds("miss3", "static")
			},
			death = paths.sounds("death", "static")
		}

		for _,v in pairs(sounds.miss) do
			v:setVolume(0.25)
		end



		curSong = funkin.curSong
		jsonChart = paths.song(curSong) -- funkin.difficulty)
		self.jsonChart = jsonChart
		randomSpeed = settings.modcharts and (curSong:lower() == 'unfairness' or curSong:lower() == 'exploitation')
		--eventChart = paths.event(curSong)

		local healths = {
			exploitation = 'ui/HELLthBar',
			['five-nights'] = 'title/fnafengine',
			overdrive = 'title/fnfengine'
		}
		local healthImg = paths.image('dave/'..(healths[curSong:lower()] or 'healthBar'))
		healthBarOverlay = graphics.newImage(healthImg)
		healthBarOverlay.y = settings.downscroll and -450 - 20 or 720 * (0.9 * 0.7) - 10
		healthBarOverlay.sizeX = 1/0.7
		healthBarOverlay.sizeY = 1/0.7
		timeBarOverlay = graphics.newImage(paths.image('dave/timeBar'))
		timeBarOverlay.y = settings.downscroll and 720 * (0.9 * 0.7) - 10 or -450 - 20
		timeBarOverlay.sizeX = 1/0.7
		timeBarOverlay.sizeY = 1/0.7

		if greetingsCutscene then jsonChart.player2 = 'dave-festival'
		elseif weirdPolygonized then jsonChart.player2 = 'dave'
		end
		addCharToList(1, jsonChart.player2 or 'bf')
		enemyObject = dads[jsonChart.player2 or 'bf']
		enemy = enemyObject.sprite

		addCharToList(2, jsonChart.gfVersion or 'gf')
		girlfriendObject = gfs[jsonChart.gfVersion or 'gf']
		girlfriend = girlfriendObject.sprite

		local bf = jsonChart.player1 or 'bf'
		if bf == 'bf' and charOverride then bf = charOverride end
		--bf = 'exclusive-bf'
		addCharToList(0, bf)
		boyfriendObject = boyfriends[bf]
		boyfriend = boyfriendObject.sprite
		--boyfriend.debug = true
		if boyfriendObject.deadChar then 
			addCharToList(0, boyfriendObject.deadChar, true) 
			deadBF = boyfriends[boyfriendObject.deadChar]
			print('set dead bf to ', deadBF)
		end
		--boyfriend.dothecoolthing = true

		local countdowns = {
			bambi = 'bambi',
			dave = 'dave'
		}
		local thing
		for k,v in pairs(countdowns) do
			if enemyObject.curCharacter:startsWith(k) then
				thing = v
				break
			end
		end
		local cool = (curSong:lower() == 'overdrive') and {'three', 'two', 'one', 'go'} or {'one', 'two', 'three', 'go'}
		for i,v in ipairs(cool) do
			sounds.countdown[v] = paths.sounds('introSounds/'..(thing or 'default')..'/intro'..(i == 4 and 'Go' or i)..(thing and '_'..thing or ''))
		end
		if enemyObject.curCharacter == 'expunged' then sounds.countdown.go = paths.sounds('introSounds/ex/introGo_weird') end

		--print(, funkin.weekIndex, funkin.songIndex)
		--print()

		rating = graphics.newImage(paths.image('dave/ui/sick'))
		combospr = graphics.newImage(paths.image('dave/ui/combo'))
		paths.image('dave/ui/3D/combo')
		for _,ui in pairs{'sick', 'good', 'bad', 'shit'} do
			paths.image('dave/ui/'..ui)
			paths.image('dave/ui/3D/'..ui)
		end
		for i=0,9 do
			paths.image('dave/ui/num'..i)
			paths.image('dave/ui/3D/num'..i)
		end

		rating.sizeX, rating.sizeY = 0.75, 0.75
		combospr.sizeX, combospr.sizeY = 0.75, 0.75
		numbers = {}
		for i = 1, 3 do
			numbers[i] = graphics.newImage(paths.image('dave/ui/num0'))

			numbers[i].sizeX, numbers[i].sizeY = 0.5, 0.5
		end

		enemyIcon = graphics.newSprite(
			paths.image("dave/icons/"..enemyObject.icon),
			{
				{x = 0, y = 0, width = 150, height = 150}, -- 1: Boyfriend
				{x = 150, y = 0, width = 150, height = 150} -- 2: Boyfriend Losing
			},
			{
				idle = {start = 1, stop = 1, speed = 0, offsetX = 0, offsetY = 0},
				losing = {start = 2, stop = 2, speed = 0, offsetX = 0, offsetY = 0}
			},
			"idle",
			false
		)
		if enemyObject.json.no_antialiasing then enemyIcon.image:setFilter('nearest', 'nearest') end
		boyfriendIcon = graphics.newSprite(
			paths.image("dave/icons/"..boyfriendObject.icon),
			{
				{x = 0, y = 0, width = 150, height = 150}, -- 1: Boyfriend
				{x = 150, y = 0, width = 150, height = 150} -- 2: Boyfriend Losing
			},
			{
				idle = {start = 1, stop = 1, speed = 0, offsetX = 0, offsetY = 0},
				losing = {start = 2, stop = 2, speed = 0, offsetX = 0, offsetY = 0}
			},
			"idle",
			false
		)
		if boyfriendObject.json.no_antialiasing then boyfriendIcon.image:setFilter('nearest', 'nearest') end

		--boyfriendIcon.y, enemyIcon.y = healthBarOverlay.y + 37.5, healthBarOverlay.y + 37.5
		enemyIcon.sizeX, enemyIcon.sizeY = 1/0.7, 1/0.7
		boyfriendIcon.sizeX, boyfriendIcon.sizeY = -1/0.7, 1/0.7

		countdownFade = {}
		readyImg = paths.image('dave/ui/ready'..((curSong:lower() == 'overdrive') and '1' or ''))
		setImg = paths.image('dave/ui/set'..((curSong:lower() == 'overdrive') and '1' or ''))
		goImg = paths.image('dave/ui/go'..((curSong:lower() == 'overdrive') and '1' or (curSong:lower() == 'exploitation') and '_glitch' or ''))
		countdown = graphics.newImage(readyImg)

		--print('returning this', jsonChart)
		return jsonChart --hahfdhjklasjklfhjklsdh
	end,

	load = function(self)
		for i = 1, 4 do
			notMissed[i] = true
		end
		useAltAnims = false

		--cam:set(-boyfriend.x - 150, -boyfriend.y + 75)
		camScale.x, camScale.y = camScale.x, camScale.y

		rating.x = girlfriend.x
		combospr.x = rating.x
		for i = 1, 3 do
			numbers[i].x = girlfriend.x - 100 + 50 * i
		end

		ratingVisibility = {0}
		combo = 0

		enemyObject:dance()
		boyfriendObject:dance()
	end,

	initUI = function(self)
		stageLight = nil
		stageLightOn = false
		events = {}
		enemyNotes = {}
		enemyNoteData = {}
		boyfriendNotes = {}
		boyfriendNoteData = {}
		health = 50
		score = 0
		totalNotes = 0
		notesHit = 0
		misses = 0

		enemyArrows = {}
		ghStrums = {}
		boyfriendArrows = {}
		_boyfriendArrows = {}
		has3D = false
		hasShapes = false
		songHeader = nil
		songHeaderIcon = nil
		songHeaderTxt = nil
		shapeWarning = nil
		for i=1,8 do
			local dir = animList[((i-1)%4)+1]
			local tex
			if i > 4 then tex = boyfriendObject.is3D and 'NOTE_assets_3D' or 'NOTE_assets'
			else tex = enemyObject.is3D and 'NOTE_assets_3D' or 'NOTE_assets'
			end
			local spr = graphics:newAnimatedSprite('dave/notes/'..tex, {
				{anim = 'off', name = 'arrow'..(dir:upper()), fps = 0},
				{anim = 'confirm', name = dir..' confirm'},
				{anim = 'press', name = dir..' press'}
			}, 'off')
			if tex == 'NOTE_assets_3D' then 
				has3D = true 
				spr.image:setFilter('nearest', 'nearest')
			end
			spr.alpha = 1
			if i > 4 then
				i = i - 4
				boyfriendArrows[i] = spr
				_boyfriendArrows[i] = spr --hold for when swapping and stuff
				boyfriendArrows[i].x = 100 + 165 * i
				boyfriendArrows[i].y = -350 * (settings.downscroll and -1 or 1)
				boyfriendNotes[i] = {}
				boyfriendNoteData[i] = {}
			else
				enemyArrows[i] = spr
				enemyArrows[i].x = -925 + 165 * i
				enemyArrows[i].y = -350 * (settings.downscroll and -1 or 1)
				enemyNotes[i] = {}
				enemyNoteData[i] = {}
			end
		end
		if curSong:lower() == 'shredder' then
			local dirs = {'A', 'B', 'C', 'D', 'E'}
			for i=1,5 do
				local spr = graphics:newAnimatedSprite('dave/notes/NOTE_gh', {
					{anim = 'off', name = dirs[i]..' Strum'},
					{anim = 'confirm', name = dirs[i]..' Confirm', offsets = {-19, -19}},
					{anim = 'press', name = dirs[i]..' Press'}
				}, 'off')
				spr.alpha = 0
				spr.x = (-925 + 165 * i) + 500
				spr.y = -300 * (settings.downscroll and -1 or 1)
				ghStrums[i] = spr
				enemyNotes[5] = {}
			end
		end
		--for i,arrow in ipairs(animList) do
		--	local tex = enemyObject.
		--	local sprite = graphics:newAnimatedSprite()
		--	sprites[arrow..'Arrow'] = sprite
		--	enemyArrows[i] = sprite()
		--	boyfriendArrows[i] = sprite()

		--	print('doing x', i)
		--	enemyArrows[i].x = -925 + 165 * i
		--	boyfriendArrows[i].x = 100 + 165 * i
		--	enemyArrows[i].y = -400 * (settings.downscroll and -1 or 1)
		--	boyfriendArrows[i].y = -400 * (settings.downscroll and -1 or 1)

		--	enemyNotes[i] = {}
		--	enemyNoteData[i] = {}
		--	boyfriendNotes[i] = {}
		--	boyfriendNoteData[i] = {}
		--end

		--for k,v in pairs(enemyArrows) do
		--	print(k, v)
		--end

		local data = getData(curSong:lower())
		if data then
			if data.composer == 'glitch' then data.composer = 'DeadShadow & PixelGH' end
			local animatedNameGuys = {
				expungedHeading = 'Expunged',
				unfairHeading = 'Unfairness',
				botHeading = 'Bot trot',
				cheatingHeading = 'Cheating',
				somethingHeading = 'Scramble',
				californiaHeading = 'California'
			}
			local me
			if animatedNameGuys[data.header] then
				me = graphics:newAnimatedSprite('dave/songHeadings/'..data.header, {{anim = 'idle', name = animatedNameGuys[data.header], loops = true}}, 'idle')
			else
				me = graphics.newImage(paths.image('dave/songHeadings/'..data.header))
			end
			songHeaderTxt = lm.string.credits_songby..' '..data.composer
			songHeaderIcon = graphics.newImage(paths.image('dave/songCreators/'..data.composer))
			--print('hi!', me.width, songHeaderIcon.width)
			me.image:setFilter(getAA(data.antialiasing))
			me.x, me.y = -685, -200
			me.sizeX = (#songHeaderTxt * (15/0.7) + songHeaderIcon.width + 1) / me.width
			me.sizeY = 1.1
			me.x = me.x - me.width * me.sizeX
			songHeader = me
		end
	end,

	generateNotes = function(self, chart)
		local eventBpm

		bpm = jsonChart.bpm or 100
		crochet = ((60 / bpm) * 1000)
		stepCrochet = crochet / 4
		curStep = 0
		curBeat = 0

		strumsBlocked = {}

		
		--for k,v in pairs(jsonChart) do
		--	print(k, v)
		--end

		speed = jsonChart.speed
		events = {}
		for k,section in pairs(jsonChart.notes) do
			local eventBpm = section.changeBPM and section.bpm or jsonChart.bpm
			do
				local event = {mustHitSection = section.mustHitSection, bpm = eventBpm, altAnim = section.altAnim}
				if k ~= 1 then
					table.insert(events, event)
				else
					events[-999] = event
				end
			end
			for i,note in ipairs(section.sectionNotes) do
				if note[1] ~= nil and note[2] ~= nil then --whaaaa maze chart why!
					local noteTable
					local strumTable
					--decide note table based off stuff


					--print(note[2]+1, id)
					--print(note[2])
					local whenToSplit = 4
					local id = ((note[2])%4)+1
					local mustPress = false
					local ghNote = false
					local colors = colors
					--if curSong:lower() == 'shredder' and note[1] >= 76800 and note[1] < 96000 then
					--	whenToSplit = 5
					--end
					if section.mustHitSection then
						noteTable = ((note[2] >= whenToSplit) and enemyNotes or boyfriendNotes)
						noteDataTable = ((note[2] >= whenToSplit) and enemyNoteData or boyfriendNoteData) --holds strumtime, id, and type
						strumTable = ((note[2] >= whenToSplit) and enemyArrows or boyfriendArrows)
						mustPress = not (note[2] >= whenToSplit)
					else
						noteTable = ((note[2] < whenToSplit) and enemyNotes or boyfriendNotes)
						noteDataTable = ((note[2] < whenToSplit) and enemyNoteData or boyfriendNoteData)
						strumTable = ((note[2] < whenToSplit) and enemyArrows or boyfriendArrows)
						mustPress = not (note[2] < whenToSplit)
					end
					if curSong:lower() == 'shredder' and note[2] <= 4 and note[1] >= 76800 and note[1] < 96000 then
						ghNote = true
						mustPress = false
						if note[2] == 4 then
							noteTable = enemyNotes
							noteDataTable = enemyNoteData
							id = 1
						end
						--noteTable = enemyNotes[1]
						--noteDataTable = enemyNoteData[1]
						colors = {'A', 'B', 'C', 'D', 'E'}
					end
					--print('these are the shit...', id)

					local c = #noteTable[id] + 1 --latest note in the notetables direction table thing
					local threedee = false
					--visualiszstion
					--[[
						STRUM1 STRUM2 STRUM3 STRUM4 STRUM1 STRUM2 STRUM3 STRUM4
						NOTE1	NOTE1	etc
						NOTE2	NOTE2
						NOTE3	NOTE3
						C		C
						
					]]
					--local x = 					
					if note[4] == 'normal' or note[4] == '' or weirdPolygonized then 
						note[4] = nil
					end
					local typeTex = {
						phone = 'NOTE_phone',
						['phone-alt'] = 'NOTE_phone',
						DEFAULT = 'NOTE_assets',
						shape = 'NOTE_assets_Shape'
					}
					local tex = 'dave/notes/'..(typeTex[note[4] or 'DEFAULT'] or typeTex.DEFAULT)
					if not note[4] and 
						((mustPress and boyfriendObject.is3D or not mustPress and love.math.random(1, 4) == 1 and has3D) or
						 (not mustPress and enemyObject.is3D or mustPress and love.math.random(1, 4) == 1) and has3D) then
						threedee = true
						tex = tex..'_3D'
					end
					if ghNote then 
						tex = 'dave/notes/NOTE_gh' 
						threedee = false
					end
					local noteREAL = graphics:newAnimatedSprite(tex, {
						{anim = 'on', name = (ghNote and colors[note[2]+1]..' Note' or colors[id]..'0'), fps = 0}
					}, 'on')
					if note[4] == 'shape' and not weirdPolygonized then hasShapes = true end
					if threedee or note[4] == 'shape' then
						noteREAL.image:setFilter('nearest', 'nearest')
					end
					noteREAL.dontdraw = true
					--noteREAL.
					--local coolY = settings.downscroll and 400 or -400
					local strum = strumTable[id]
					if curSong:lower() == 'cheating' and settings.modcharts then strum = strumTable[scramble[id]] end
					if ghNote then strum = ghStrums[note[2]+1] end
					--print('my strum is', strum, id)
					noteREAL.strumTime = note[1] --i should really just rewrite this whole system
					table.insert(noteTable[id], noteREAL)
					table.insert(noteDataTable[id], {
						id = id,
						strumTime = note[1],
						distance = note[1],
						noteType = note[4], --maybe????
						is3D = (threedee or note[4] == 'shape'),
						speed = settings.modcharts and love.math.random(1, 5) or 3, --for unfairness and exploitation
						ghNote = ghNote,
						origID = note[2],
						strum = strum
					})
					if settings.modcharts and curSong:lower() == 'cheating' then
						noteREAL.orientation = math.pi
					end
					--noteREAL.y = note[1] + coolY * 0.6 * speed --actually stupid
					--fuck this ill fix it later (sustains sometimes play the on animation for no reason and theres no trace of it doing that AGHJKDKLSJHDFJKLSGUHDFIKHDFJKLHDJK:FL)
					if note[3] > 0 then
						for susNote = 71 / speed, note[3], 71 / speed do
							local sus = graphics:newAnimatedSprite(tex, {
								{anim = 'hold', name = colors[id]..' hold piece', fps = 0},
								{anim = 'end', name = (colors[id] ~= 'purple') and colors[id]..' hold end' or 'pruple end hold', fps = 0}
							}, 'hold')
							sus.x = strumTable[id].x
							sus.dontdraw = true
							--sus.offsetY = -10
							sus.strumTime = note[1] + susNote
							table.insert(noteTable[id], sus)
							table.insert(noteDataTable[id], {
								id = id,
								strumTime = note[1] + susNote,
								distance = note[1] + susNote,
								noteType = note[4],
								isSustain = true,
								alphaMult = 0.5,
								speed = settings.modcharts and love.math.random(1, 5) or 3, --for unfairness and exploitation
								ghNote = ghNote,
								origID = note[2],
								strum = strum
							})
							--local anims = sus:getAnims() --remove anything that isnt hold or end
							--for k,v in pairs(anims) do
							--	if k ~= 'hold' and k ~= 'end' then
							--		anims[k] = nil
							--	end
							--end
							--sus:setAnims(anims)
						end
						--print ('can we do this please', noteDataTable[id][#noteTable[id]].isSustain)
						if curSong:lower() ~= 'unfairness' and curSong:lower() ~= 'exploitation' and settings.modcharts or not settings.modcharts then
							noteTable[id][#noteTable[id]]:animate('end', true)
							if settings.downscroll then noteTable[id][#noteTable[id]].sizeY = -1 end
						end
						--print(noteTable[id][#noteTable[id]]:getAnimName(), 'tguis is AFTER GJNDSJKLGJSDGJH')
					end
				end
			end
		end
		shapeArrows = {}
		if hasShapes then
			for i=4,8 do
				local dir = animList[((i-1)%4)+1]
				local spr = graphics:newAnimatedSprite('dave/notes/NOTE_assets_Shape', {
					{anim = 'off', name = 'arrow'..(dir:upper()), fps = 0},
					{anim = 'confirm', name = dir..' confirm'},
					{anim = 'press', name = dir..' press'}
				}, 'off')
				spr.image:setFilter('nearest', 'nearest')
				spr.alpha = 1
				i = i - 4
				shapeArrows[i] = spr
				shapeArrows[i].x = 100 + 165 * i
				shapeArrows[i].y = -350 * (settings.downscroll and -1 or 1)
			end
		end
		local addedSubs = false
		songEvents = {}
		if jsonChart.events then
			for i,section in pairs(jsonChart.events) do
				for i,event in pairs(section[2]) do
					table.insert(songEvents, {
						strumTime = section[1],
						event = event[1],
						value1 = event[2],
						value2 = event[3]
					})
					--print('adding event', event, value1, value2)
					if event[1] == 'Change Character' and (not weirdPolygonized or charOverride and event[3] == 'bf') then
						addCharToList(tonumber(event[2]), event[3])
					elseif event[1] == 'subtitles' and not addedSubs then
						addedSubs = true
						local subNames = {
							['corn-theft'] = 'ctheft',
							['exploitation'] = 'exploit',
							['escape-from-california'] = 'california',
							['shredder'] = 'shred',
							['vs-dave-rap'] = 'daverap',
							['vs-dave-rap-two'] = 'daveraptwo'
						}
						local song = subNames[curSong:lower()] and subNames[curSong:lower()] or curSong:lower()
						local _sub = '_sub'
						for k,v in pairs(lm.string) do
							if k:startsWith(song) then
								local index = tonumber(k:sub(#song + #_sub+1))
								--print('attempting to get index did i do it', k, k:sub(#song + #_sub+1))
								if index then 
									subtitles[tonumber(index)] = v
									--print('adding sub', k, v, index)
								end
							end
						end
					elseif event[1] == 'stageLightToggle' and not stageLight then
						stageLight = graphics.newImage(paths.image'dave/spotlight')
						stageLight.y = -200
						stageLight.x = -400
						stageLight.blendMode = 'add'
						stageLight.dontdraw = true
						stageLight.dontupdate = true
						stageLight.stageLight = true
						local meangle = 0
						local et = 0
						function stageLight:update(dt)
							et = et + dt
							meangle = (math.sin(et * 2) * 10)
							stageLight.orientation = meangle * DEGREE_TO_RADIAN
							stageLight.x = lerp(stageLight.x, mustHitSection and 150 or -390, math.boundTo(dt * 2.4, 0, 1))
						end
						stage:addSpr(stageLight) --woops
					end
				end
			end
		end
		--eventChart = nil
		--if eventChart then
		--	for k,section in pairs(eventChart.notes) do
		--		for i,note in pairs(section.sectionNotes) do
		--			table.insert(songEvents, {
		--				strumTime = note[1],
		--				event = note[3],
		--				value1 = note[4],
		--				value2 = note[5]
		--			})
		--		end
		--	end
		--end
		local function sort(a, b) return a.strumTime < b.strumTime end
		for i = 1, 4 do
			table.sort(enemyNotes[i], sort)
			table.sort(boyfriendNotes[i], sort)
			table.sort(enemyNoteData[i], sort) 
			table.sort(boyfriendNoteData[i], sort)
		end

		-- Workarounds for bad charts that have multiple notes around the same place
		--for i = 1, 4 do
		--	local offset = 0

		--	for j = 2, #enemyNotes[i] do
		--		local index = j - offset

		--		if enemyNotes[i][index]:getAnimName() == "on" and enemyNotes[i][index - 1]:getAnimName() == "on" and ((not settings.downscroll and enemyNotes[i][index].y - enemyNotes[i][index - 1].y <= 10) or (settings.downscroll and enemyNotes[i][index].y - enemyNotes[i][index - 1].y >= -10)) then
		--			table.remove(enemyNotes[i], index)

		--			offset = offset + 1
		--		end
		--	end
		--end
		--for i = 1, 4 do
		--	local offset = 0

		--	for j = 2, #boyfriendNotes[i] do
		--		local index = j - offset

		--		if boyfriendNotes[i][index]:getAnimName() == "on" and boyfriendNotes[i][index - 1]:getAnimName() == "on" and ((not settings.downscroll and boyfriendNotes[i][index].y - boyfriendNotes[i][index - 1].y <= 10) or (settings.downscroll and boyfriendNotes[i][index].y - boyfriendNotes[i][index - 1].y >= -10)) then
		--			table.remove(boyfriendNotes[i], index)

		--			offset = offset + 1
		--		end
		--	end
		--end
	end,

	-- Gross countdown script
	setupCountdown = function(self)
		Timer.tween(0.5, hudAlpha, {1})
		print 'setting up the countdown now'
		if inst then
			inst:release()
			inst = nil
		end
		if voices then
			voices:release()
			voices = nil
		end
		inst = paths.inst(curSong)
		if jsonChart.needsVoices then
			voices = paths.voices(curSong)
		else
			voices = nil
		end
		lastReportedPlaytime = 0
		musicTime = (240 / bpm) * -1000

		musicThres = 0
		musicPos = 0

		mustHitSection = true
		mustHitSection = not mustHitSection

		countingDown = true
		countdownFade[1] = 0
		audio.playSound(sounds.countdown.three)
		Timer.after(
			(60 / bpm),
			function()
				mustHitSection = not mustHitSection
				countdownFade[1] = 1
				audio.playSound(sounds.countdown.two)
				Timer.tween(
					(60 / bpm),
					countdownFade,
					{0},
					"linear",
					function()
						mustHitSection = not mustHitSection
						countdown:setImage(setImg)
						countdownFade[1] = 1
						audio.playSound(sounds.countdown.one)
						Timer.tween(
							(60 / bpm),
							countdownFade,
							{0},
							"linear",
							function()
								mustHitSection = not mustHitSection
								countdown:setImage(goImg)
								countdownFade[1] = 1
								audio.playSound(sounds.countdown.go)
								Timer.tween(
									(60 / bpm),
									countdownFade,
									{0},
									"linear",
									function()
										mustHitSection = not mustHitSection
										if not greetingsCutscene then
											Timer.tween(0.25, timebarAlpha, {1})
											countingDown = false

											previousFrameTime = love.timer.getTime() * 1000
											musicTime = 0
											if inst then 
												inst:play()
											end
											if voices then voices:play() end
											if songHeader then
												Timer.tween(0.5, songHeader, {x = songHeader.x + (songHeader.width * songHeader.sizeX)}, 'out-back', function()
													Timer.after(0.5, function() Timer.tween(0.5, songHeader, {x = songHeader.x - (songHeader.width * songHeader.sizeX)}, 'in-back') end)
												end)
											end
											if table.contains({'polygonized', 'interdimensional', 'five-nights'}, curSong:lower()) then
												local img = paths.image((curSong:lower() == 'five-nights') and 'dave/ui/doorWarning' or 'dave/ui/shapeNoteWarning')
												local hi = graphics.newImage(img)
												hi.x = hi.width - ((1280/2)/0.7)
												local they = ((720/2)/0.7) - ((hi.height/0.7)/2)
												local othery = ((720/2)/0.7) + ((hi.height/0.7))
												hi.y = othery
												hi.alpha = 0
												hi.sizeX, hi.sizeY = 1/0.7, 1/0.7
												shapeWarning = hi
												Timer.tween(1, shapeWarning, {alpha = 1, y = they}, 'out-back', function()
													Timer.after(2, function()
														Timer.tween(1, shapeWarning, {alpha = 0, y = othery}, 'in-back')
													end)
												end)
											end
											sectionEvent(-999)
										else
											Timer.tween(0.5, hudAlpha, {0})
											local hi = paths.sound 'rumble'
											hi:play()
											local me = paths.sound 'transition'
											-- local mydave = point(enemy.x, enemy.y)
											local fly = true
											local angle = 0
											camShaking = true
											enemyObject.skipDance = true
											enemyObject:playAnim 'ohNo'
											stage:setOnUpdate(function(dt)
												if fly then
													enemy.y = enemy.y - dt * 50
													angle = angle - dt * 6
													enemy.orientation = angle * DEGREE_TO_RADIAN
												end
											end)
											Timer.after(3, function()
												me:play()
												stageOverlay = {1, 1, 1, alpha = 0}
												Timer.tween(3, stageOverlay, {alpha = 1}, nil, function()
													fly = false
													camShaking = false
													stageOverlay = {0, 0, 0, alpha = 1} --for when the dialogue ends and the substate is closed
													openSubstate(dialogue, false, 'greetings-cutscene', true)
												end)
											end)
										end
									end
								)
							end
						)
					end
				)
			end
		)
	end,
	updateStep = function()
		local old = curStep
		local oldb = curBeat
		curStep = math.floor(musicTime / stepCrochet)
		curBeat = math.floor(curStep/4)
		if old ~= curStep then
			--print('step is now this', curStep, curBeat)
			if curBeat ~= oldb then return true, true end
			return true
		end
	end,
	update = function(self, dt, onb, ons)
		if weeks.leaving then return end
		if camShaking then
			shakeOffset.x = love.math.random(-10, 10)
			shakeOffset.y = love.math.random(-10, 10)
		else
			shakeOffset.x, shakeOffset.y = 0, 0
		end
		oldMusicThres = musicThres
		if countingDown or love.system.getOS() == "Web" then -- Source:tell() can't be trusted on love.js!
			musicTime = musicTime + 1000 * dt
		else
			if inst and not cutscene then
				local time = love.timer.getTime() -- - (pauseOffset * 1000)
				local seconds = inst:tell("seconds")
				if voices and voices:tell 'seconds' ~= seconds then
					voices:seek(seconds)
				end
				local last = musicTime
				musicTime = musicTime + (time * 1000) - previousFrameTime
				previousFrameTime = time * 1000

				if lastReportedPlaytime ~= seconds * 1000 then
					lastReportedPlaytime = seconds * 1000
					musicTime = (musicTime + lastReportedPlaytime) / 2
				end
				curSongTime = curSongTime + (musicTime - last)
				if seconds >= (inst:getDuration "seconds" - 0.1) then --GOING TO FUCKING KILL MYSELF
					print "NFHDSHKLFGHJK<DSGH JKLFKZHJHJKBFKLS"
					songFinished = true
					stage:songEnd()
				end
			end
		end
		absMusicTime = math.abs(musicTime)
		musicThres = math.floor(absMusicTime / 100) -- Since "musicTime" isn't precise, this is needed

		
		local dsh, dbh = self:updateStep()

		local eventID = (curStep / 16)
		if events[eventID] then
			sectionEvent(eventID)
		end

		
		if dsh and ons then ons(curStep) end
		if dbh then 
			girlfriendObject:dance()
			if funkin.curSong == 'warmup' or curBeat % 2 == 0 then
				if not enemyObject.sprite:isAnimated() then
					enemyObject:dance()
				end
				if not boyfriendObject.sprite:isAnimated() then
					boyfriendObject:dance()
				end
			end
			if curBeat % 4 == 0 then 
				curCamZoom = curCamZoom + 0.015 
				hudZoom = hudZoom + 0.03
			end
			local funny = math.max(math.min(health/100, 1.9), 0.1)
			
			boyfriendIcon.sizeX = -((150 + (50 * (funny + 0.1))) / (150 * 1/0.7))
			boyfriendIcon.sizeY = (150 - (25 * funny)) / (150 * 1/0.7)
			--print(boyfriendIcon.sizeX, boyfriendIcon.sizeY)
			--boyfriendIcon.offsetX = (boyfriendIcon.width * boyfriendIcon.sizeX) / 2
			--boyfriendIcon.offsetY = (boyfriendIcon.height * boyfriendIcon.sizeY) / 2
			
			enemyIcon.sizeX = (150 + (50 * ((2 - funny) + 0.1))) / (150 * 1/0.7)
			enemyIcon.sizeY = (150 - (25 * ((2 - funny) + 0.1))) / (150 * 1/0.7)
			--enemyIcon.offsetX = (enemyIcon.width * enemyIcon.sizeX) / 2
			--enemyIcon.offsetY = (enemyIcon.height * enemyIcon.sizeY) / 2

			print('new sizes', funny)

			if onb then onb(curBeat) end
		end
		
		if not shredderMode then
			if mustHitSection then
				camPos.x = -(boyfriendObject.sprite.width/2)-boyfriendObject.sprite.x + 100 -- - cam.x
				camPos.y = -(boyfriendObject.sprite.height/2)-boyfriendObject.sprite.y + 100 -- - cam.y
			else
				camPos.x = -(enemyObject.sprite.width/2)-enemyObject.sprite.x - 150 -- - cam.x
				camPos.y = -(enemyObject.sprite.height/2)-enemyObject.sprite.y + 100 -- - cam.y
			end
		end

		curCamZoom = lerp(curCamZoom, camZoom, dt * 7.5)
		
		local lerpVal = math.boundTo(dt * 2.4, 0, 1)
		cam.x, cam.y = math.lerp(cam.x, camPos.x, lerpVal), math.lerp(cam.y, camPos.y, lerpVal)
		local lerpVal = math.boundTo(dt * 5, 0, 1)
		camOffsetPos.x, camOffsetPos.y = math.lerp(camOffsetPos.x, -camOffset.x, lerpVal), math.lerp(camOffsetPos.y, -camOffset.y, lerpVal)

		for i,event in pairs(songEvents) do
			if event.strumTime <= absMusicTime then
				--print('my event is now', event.strumTime, absMusicTime)
				self:triggerEvent(event.event, event.value1, event.value2)
				table.remove(songEvents, i)
			end
		end




		girlfriendObject:update(dt)
		enemyObject:update(dt)
		boyfriendObject:update(dt)
		if not substateJustLeft and controls.pressed.pause and not cutscene then
			openSubstate(pause, true)
		end

		if controls.down['button:leftshoulder'] and controls.down['axis:triggerleft+'] and 
			controls.down['axis:triggerright+'] and controls.down['button:rightshoulder'] and 
			controls.down.select and controls.down.pause then
			
				local cheater = {
					supernovae = 'cheating',
					cheating = 'unfairness',
					glitch = 'kabunga'
				}
				storyMode = false
				if funkin.curSong == 'unfairness' then
					--terminal stuff
					save.save.found_terminal = true
					save.writeSave()
					switchState(terminalState)
				elseif cheater[funkin.curSong:lower()] then
					save.save['found_'..cheater[funkin.curSong:lower()]] = true
					save.writeSave()
					funkin.curSong = cheater[funkin.curSong:lower()]
					switchState(stage)
				end
		end
	end,
	substateOpened = function(self, pause)
		if pause then
			if inst then 
				inst:pause() 
				print 'pausing my shit'
			end
			if voices then voices:pause() end
		end
	end,
	substateClosed = function(self, dontstart)
		--print 'the shit is closeddddd'
		if not weeks.leaving and not songFinished then
			--print 'my penis'
			local time = weeks.laststupidfuckingpieceofshitthing
			--print('time in ', time)
			previousFrameTime = love.timer.getTime() * 1000
			if not countingDown and not dontstart then
				if inst then inst:play() end
				if voices then voices:play() end
			end
		end
	end,
	updateUI = function(self, dt)
		hudZoom = math.lerp(hudZoom, hudTargetZoom, dt * 7.5)
		if weeks.leaving or cutscene then return end
		musicPos = musicTime * 0.6 * speed
		local spacey = controls.down.gameFive
		if spacey and hasShapes and not strumsAreShapes then
			--print 'okay turning on me'
			strumsAreShapes = true
			boyfriendArrows = shapeArrows
		elseif not spacey and hasShapes and strumsAreShapes then
			--print 'turning offg stupid'
			strumsAreShapes = false
			boyfriendArrows = _boyfriendArrows
		end
		for i = 1, 5 do
			if ghStrums[i] then
				ghStrums[i]:update(dt)
				if not ghStrums[i]:isAnimated() then
					ghStrums[i]:animate('off', false)
				end
			end
			if i == 5 then break end
			local enemyArrow = enemyArrows[i]
			local boyfriendArrow = boyfriendArrows[i]
			local boyfriendAltArrows = strumsAreShapes and _boyfriendArrows[i] or (shapeArrows and shapeArrows[i])
			local enemyNote = enemyNotes[i]
			local boyfriendNote = boyfriendNotes[i]
			local enemyNoteData = enemyNoteData[i]
			local boyfriendNoteData = boyfriendNoteData[i]
			local curAnim = animList[i]
			local curInput = inputList[i]

			local noteNum = i

			enemyArrow:update(dt)
			boyfriendArrow:update(dt)
			--if boyfriendAltArrows then
			--	boyfriendAltArrows:update(dt)
			--end

			if settings.modcharts then
				elapseduitime = elapseduitime + (dt/10)
				if curSong:lower() == 'cheating' then
					boyfriendArrow.x = boyfriendArrow.x + math.sin(elapseduitime) * (((i % 2) == 0) and 2 or -2);
					boyfriendArrow.x = boyfriendArrow.x - math.sin(elapseduitime) * 1.5;

					enemyArrow.x = enemyArrow.x - math.sin(elapseduitime) * (((i % 2) == 0) and 2 or -2);
					enemyArrow.x = enemyArrow.x + math.sin(elapseduitime) * 1.5;
				elseif curSong:lower() == 'unfairness' then
					local spr = boyfriendArrow
					spr.x = (math.sin((elapseduitime + i)) * 400);
					spr.y = (math.cos((elapseduitime + i)) * 400);
					
					local spr = enemyArrow
					spr.x = (math.sin((elapseduitime + i) * 3) * 400);
					spr.y = (math.cos((elapseduitime + i) * 3) * 400);
				end
			end

			
			if not enemyArrow:isAnimated() then
				enemyArrow:animate("off", false)
			end
			--if enemyNote[1] == nil then print 'OHHHH SHIT!!!!!!!!!!!!' end
			--print(#enemyNote)
			for j,note in ipairs(enemyNote) do
				local speed = speed
				local curAnim = curAnim
				--for k,v in pairs(enemyNoteData[j]) do print(k, v) end
				--print('me is', enemyNote, 'and i looove', enemyNoteData[j], noteNum)
				local enemyArrow = enemyNoteData[j].strum
				if randomSpeed then speed = enemyNoteData[j].speed end
				enemyNoteData[j].distance = (enemyNoteData[j].strumTime - musicTime) * speed * 0.6
				note.x = enemyArrow.x
				note.y = enemyArrow.y + (enemyNoteData[j].distance * (settings.downscroll and -1 or 1))
				if settings.downscroll and note.y < -1000 or note.y > 1000 then
					if randomSpeed then
						note.dontdraw = true
					else
						enemyNotesToDraw[noteNum] = j
						break;
					end
				else
					note.dontdraw = false
				end
				if enemyNoteData[j].distance <= 0 then
					if voices then
						voices:setVolume(1)
					end
					
					if enemyNoteData[j].noteType == 'phone' then
						enemyObject:playAnim 'singSmash'
						if not mustHitSection then camOffset = point() end
					else
						if enemyNoteData[j].ghNote then curAnim = ghAnimList[enemyNoteData[j].origID+1] end
						local altAnim = ''
						if enemyNoteData[j].noteType == 'phone-alt' then altAnim = '-alt' end
						enemyObject:playAnim('sing'..curAnim:upper()..altAnim)
						--if useAltAnims then
						--	self:safeAnimate(enemy, curAnim .. " alt", false, 2)
						--else
						--	self:safeAnimate(enemy, curAnim, false, 2)
						--end
						if not enemyNoteData[j].ghNote and not mustHitSection and offsetStuff[noteNum] then
							camOffset = offsetStuff[noteNum]
						end
					end

					--print(enemyArrow, i)
					if settings.modcharts and curSong:lower() == 'cheating' then
						enemyArrows[noteNum]:animate('confirm', false)
					else
						enemyArrow:animate("confirm", false)
					end
					
					local speed = speed
					local healthToLower = 0.5
					if altSection then healthToLower = healthToLower / 10 end
					if curSong:lower() == 'unfairness' then healthToLower = healthToLower/3 end
					if curSong:lower() == 'unfairness' or curSong:lower() == 'cheating' then 
						health = health - healthToLower
					end
					--print('HIT OPPONENT NOTE!', enemyNoteData[i].noteType, enemyNoteData[1].strumTime)
					table.remove(enemyNote, j)
					table.remove(enemyNoteData, j)
				end
			end
			if randomSpeed then enemyNotesToDraw[noteNum] = #enemyNote end
			if input:pressed(curInput) and not strumsBlocked[noteNum] then
				boyfriendArrow:animate("press", false)
				if boyfriendAltArrows then
					boyfriendAltArrows:animate 'press'
				end
			end
			local pressedNote = false
			local noteMissed
			for i,note in ipairs(boyfriendNote) do
				local boyfriendArrow = boyfriendNoteData[i].strum
				if hasShapes then
					if boyfriendNoteData[i].noteType == 'shape' and not spacey or spacey and boyfriendNoteData[i].noteType ~= 'shape' then
						boyfriendNoteData[i].alpha = 0.5
					else
						boyfriendNoteData[i].alpha = 1
					end
				end
				local speed = speed
				if randomSpeed then speed = boyfriendNoteData[i].speed end
				boyfriendNoteData[i].distance = (boyfriendNoteData[i].strumTime - musicTime) * speed * 0.6
				note.x = boyfriendArrow.x
				note.y = boyfriendArrow.y + (boyfriendNoteData[i].distance * (settings.downscroll and -1 or 1))
				if settings.downscroll and note.y < -1000 or note.y > 1000 then
					if randomSpeed then
						note.dontdraw = true
					else
						boyfriendNotesToDraw[noteNum] = i
						break;
					end
				else
					note.dontdraw = false
				end
				if boyfriendNoteData[i].distance < -500 then
					if voices then voices:setVolume(0) end

					noteMissed = i

					table.remove(boyfriendNote, i)
					table.remove(boyfriendNoteData, i)
				elseif input:pressed(curInput) and not strumsBlocked[noteNum] and boyfriendNote[i] and not boyfriendNoteData[i].isSustain and not pressedNote and
				not (hasShapes and (boyfriendNoteData[i].noteType == 'shape' and not spacey or boyfriendNoteData[i].noteType ~= 'shape' and spacey)) then
					local notePos = boyfriendNoteData[i].distance
					if notePos <= safeZoneOffset then
						pressedNote = true
						local ratingAnim = 'sick'

						--if notePos <= safeZoneOffset * 0.25 then
						--end
						notMissed[noteNum] = true

						if voices then
							voices:setVolume(1)
						end

						if notePos <= 20 then -- "Sick"
							score = score + (350 * scoreMultiplier[noteNum])
							ratingAnim = "sick"
							notesHit = notesHit + 1
							--print('REWARDING SICK', i)
						elseif notePos <= safeZoneOffset * 0.25 then -- "Good"
							score = score + (200 * scoreMultiplier[noteNum])
							ratingAnim = "good"
							notesHit = notesHit + 0.65
							--print('REWARDING gooood', i)
						elseif notePos <= safeZoneOffset * 0.45 then -- "Bad"
							score = score + (100 * scoreMultiplier[noteNum])
							ratingAnim = "bad"
							notesHit = notesHit + 0.2
							--print('REWARDING bad...', i)
						else -- "Shit"
							score = score + (10 * scoreMultiplier[noteNum])
							notesHit = notesHit - 2
							ratingAnim = "shit"
							--print('reqwarffding NOTHGIN YOU ARE SHIT', i)
						end
						combo = combo + 1
						local prefix = 'dave/ui/'..(boyfriendNoteData[i].is3D and '3D/' or '')
						rating:setImage(paths.image(prefix..ratingAnim), false)
						combospr:setImage(paths.image(prefix..'combo'), false)
						numbers[1]:setImage(paths.image(prefix..'num'..tostring(math.floor(combo / 100 % 10), false)))
						numbers[2]:setImage(paths.image(prefix..'num'..tostring(math.floor(combo / 10 % 10), false)))
						numbers[3]:setImage(paths.image(prefix..'num'..tostring(math.floor(combo % 10), false)))
						if boyfriendNoteData[i].is3D then
							combospr.image:setFilter('nearest', 'nearest')
							rating.image:setFilter('nearest', 'nearest')
							for i=1,3 do numbers[i].image:setFilter('nearest', 'nearest') end
						end

						for i = 1, #ratingTimers do
							if ratingTimers[i] then Timer.cancel(ratingTimers[i]) end
						end

						ratingVisibility[1] = 1
						rating.x = girlfriend.x
						rating.y = girlfriend.y - 50
						combospr.x = girlfriend.x
						combospr.y = rating.y + 50
						for i = 1, 3 do
							numbers[i].x = girlfriend.x - 100 + 50 * i
							numbers[i].y = girlfriend.y + 50
						end

						ratingTimers[1] = Timer.tween(0.5, ratingVisibility, {0}, 'in-expo')
						ratingTimers[2] = Timer.tween(0.5, rating, {y = rating.y + love.math.random(50, 60)}, "in-back", nil, 5)
						ratingTimers[3] = Timer.tween(0.5, combospr, {y = combospr.y + love.math.random(50, 60)}, 'in-back', nil, 5)
						ratingTimers[10] = Timer.tween(0.5, rating, {x = rating.x + love.math.random(-5, 5)}, 'out-quad')
						ratingTimers[11] = Timer.tween(0.5, combospr, {x = combospr.x + love.math.random(-5, 5)}, 'out-quad')
						for i=1,3 do 
							ratingTimers[i+3] = Timer.tween(0.5, numbers[i], {y = numbers[i].y + love.math.random(50, 60)}, "in-back", nil, 5)
							ratingTimers[i+6] = Timer.tween(0.5, numbers[i], {x = numbers[i].x + love.math.random(-5, 5)}, 'out-quad')
						end
					

						if shapeArrows and strumsAreShapes then
							shapeArrows[noteNum]:animate 'confirm'
						else
							boyfriendArrow:animate("confirm", false)
						end
						if boyfriendAltArrows then
							boyfriendAltArrows:animate 'confirm'
						end

						if boyfriendNoteData[i].noteType ~= 'phone' then
							boyfriendObject:playAnim('sing'..curAnim:upper())
							if mustHitSection and offsetStuff[noteNum] then
								camOffset = offsetStuff[noteNum]
							end
						else
							if mustHitSection and offsetStuff[noteNum] then camOffset = point() end
							boyfriendObject:playAnim 'dodge'
							enemyObject:playAnim 'throw'
						end
						health = health + 1
						table.remove(boyfriendNote, i)
						table.remove(boyfriendNoteData, i)
						
						totalNotes = totalNotes + 1
					end
				elseif boyfriendNoteData[i] and input:down(curInput) and boyfriendNoteData[i].distance < -10 and boyfriendNoteData[i].isSustain then
					if not (strumsBlocked[noteNum] or (hasShapes and (boyfriendNoteData[i].noteType == 'shape' and not spacey or boyfriendNoteData[i].noteType ~= 'shape' and spacey))) then
						
						if voices then
							voices:setVolume(1)
						end
	
						table.remove(boyfriendNote, i)
						table.remove(boyfriendNoteData, i)
	
						if shapeArrows and strumsAreShapes then --whaaaat the hell
							shapeArrows[noteNum]:animate 'confirm'
						else
							boyfriendArrow:animate("confirm", false)
						end
						if boyfriendAltArrows then
							boyfriendAltArrows:animate 'confirm'
						end
	
						boyfriendObject:playAnim('sing'..curAnim:upper())
						--notesHit = notesHit + 1
						health = health + 0.15
						notesHit = notesHit + 1
						totalNotes = totalNotes + 1
					end
				end
			end
			local forcedMiss = false
			if randomSpeed then forcedMiss = input:pressed(curInput) and not pressedNote end
			if (noteMissed or forcedMiss) and not skippingSong then
				notMissed[noteNum] = false
				if not noMissMode then
					audio.playSound(sounds.miss[love.math.random(3)])
					--if combo >= 5 then girlfriendObject:playAnim('sad', true) end
					if noteMissed and boyfriendNoteData[noteMissed] and boyfriendNotes[noteMissed] then
						if boyfriendNoteData[noteMissed].noteType ~= 'phone' then
							if boyfriendObject:animExists('sing'..curAnim:upper()..'miss') then
								boyfriendObject:playAnim('sing'..curAnim:upper()..'miss')
							end
						else
							boyfriendObject:playAnim 'hit'
							strumsBlocked[noteNum] = true
							boyfriendArrow.alpha = 0.01
							Timer.tween(7, boyfriendArrow, {alpha = 1}, 'in-expo', function()
								strumsBlocked[noteNum] = false
							end)
						end
						totalNotes = totalNotes + 1
					else
						if boyfriendObject:animExists('sing'..curAnim:upper()..'miss') then
							boyfriendObject:playAnim('sing'..curAnim:upper()..'miss')
						end
					end
					misses = misses + 1
					health = health - 2
				else --is this bad?
					totalNotes = totalNotes + 1
				end

				combo = 0
			end

			if input:released(curInput) then
				boyfriendArrow:animate("off", false)
				if boyfriendAltArrows then
					boyfriendAltArrows:animate 'off'
				end
			end
			if randomSpeed then boyfriendNotesToDraw[noteNum] = #boyfriendNote end
		end

		if health > 20 and boyfriendIcon:getAnimName() == "losing" then
			boyfriendIcon:animate("idle", false)
		elseif health <= 0 and not debugMode then -- Game over
			if camShaking then
				if funkin.curSong == 'blocked' or funkin.curScore == 'corn-theft' or funkin.curSong == 'maze' then
					love.system.openURL 'https://www.youtube.com/watch?v=HtfxYr4uV9k' --would this even work lol?? also reupload!
					love.event.quit()
				else
					save.save['unlocked_bambi-3d'] = true
					save:writeSave()
					switchState(endings, 'rtxx_ending', 'badending')
				end
			else
				openSubstate(gameOver, true)
			end
		elseif health <= 20 and boyfriendIcon:getAnimName() == "idle" then
			boyfriendIcon:animate("losing", false)
		end

		if health >= 80 and enemyIcon:getAnimName() == 'idle' then
			enemyIcon:animate('losing', false)
		elseif enemyIcon:getAnimName() == 'losing' and health <= 80 then
			enemyIcon:animate('idle', false)
		end

		boyfriendIcon.sizeX, boyfriendIcon.sizeY = lerp(boyfriendIcon.sizeX, -1/0.7, dt * 30), lerp(boyfriendIcon.sizeY, 1/0.7, dt * 30)
		enemyIcon.sizeX, enemyIcon.sizeY = lerp(enemyIcon.sizeX, 1/0.7, dt * 30), lerp(enemyIcon.sizeY, 1/0.7, dt * 30)

		local hw = healthBarOverlay.width*healthBarOverlay.sizeX
		boyfriendIcon.x = 425 - (hw - 9) * -(1-(health/100)) - 925 - 37.5
		enemyIcon.x = 425 - (hw - 9) * -(1-(health/100)) - 925 + 37.5
		boyfriendIcon.y = healthBarOverlay.y + (150 * enemyIcon.sizeY)
		enemyIcon.y = healthBarOverlay.y +  (150 * enemyIcon.sizeY)

		if curSubtitle and not curSubtitle.finished then
			curSubtitle.timer = curSubtitle.timer - dt
			if curSubtitle.timer <= 0 then
				curSubtitle.timer = curSubtitle.speed
				curSubtitle.index = curSubtitle.index + 1
				curSubtitle.print = curSubtitle.sub:sub(1, curSubtitle.index)
				if curSubtitle.print == curSubtitle.sub then
					curSubtitle.finished = true
					curSubtitle.timer = Timer.after(0.5, function()
						curSubtitle.tween = Timer.tween(1, curSubtitle, {alpha = 0})
					end)
				end
			end
		end

		if songHeader and songHeader.update then
			songHeader:update(dt)
		end
		if songHeaderIcon then
			songHeaderIcon.x = songHeader.x - 300 + (songHeader.width * songHeader.sizeX)
			--print((songHeader.width * songHeader.sizeX))
			songHeaderIcon.y = songHeader.y
		end
		health = math.min(100, math.max(0, health))
	end,

	drawRating = function(self, multiplier)
		love.graphics.push()
			if multiplier then
				love.graphics.translate(cam.x * multiplier, cam.y * multiplier)
			else
				love.graphics.translate(cam.x, cam.y)
			end

			graphics.setColor(1, 1, 1, ratingVisibility[1])
			combospr:draw()
			rating:draw()
			for i = 1, 3 do
				numbers[i]:draw()
			end
			graphics.setColor(1, 1, 1)
		love.graphics.pop()
	end,

	drawUI = function(self)
		love.graphics.push()
		love.graphics.scale(hudZoom, hudZoom)
		love.graphics.translate(-(1280 * hudZoom - 1280)/2, -(720 * hudZoom - 720)/2)
		if stageOverlay.alpha > 0 and not stageLightOn then
			graphics.setColor(stageOverlay[1], stageOverlay[2], stageOverlay[3], stageOverlay.alpha)
			love.graphics.rectangle("fill", 0, 0, 1280, 720)
			graphics.setColor(1, 1, 1, 1)
		end
		love.graphics.translate(lovesize.getWidth() / 2, lovesize.getHeight() / 2)
		if hudShader then
			love.graphics.setShader(hudShader)
		end
		
		if shredderHighway then --whatever
			if shredderHighway.alpha > 0 then
				graphics.setColor(1, 1, 1, shredderHighway.alpha)
				shredderHighway:draw()
			end
			if bambispot.alpha > 0 then
				graphics.setColor(1, 1, 1, bambispot.alpha)
				bambispot:draw()
			end
			if bfspot.alpha > 0 then
				graphics.setColor(1, 1, 1, bfspot.alpha)
				bfspot:draw()
			end
			if shredderMode then
				love.graphics.scale(0.65, 0.65)
				graphics.setColor(1, 1, 1, boyfriend.alpha)
				boyfriend:draw()
				graphics.setColor(1, 1, 1, enemy.alpha)
				enemy:draw()
				love.graphics.scale(1/0.65, 1/0.65)
			end
		end

		love.graphics.scale(0.7, 0.7)
		for _,strum in pairs(ghStrums) do --so its uinder the notes
			graphics.setColor(1, 1, 1, strum.alpha * hudAlpha[1])
			strum:draw()
		end
		for i = 1, 4 do
			graphics.setColor(1, 1, 1, enemyArrows[i].alpha * hudAlpha[1])
			enemyArrows[i]:draw()
			graphics.setColor(1, 1, 1, boyfriendArrows[i].alpha * hudAlpha[1])
			boyfriendArrows[i]:draw()
			graphics.setColor(1, 1, 1)

			love.graphics.push()
			--love.graphics.translate(0, -musicPos)
			if not settings.downscroll and enemyNotesToDraw[i] > 0 or settings.downscroll and #enemyNotes > 0 then
				for j = (settings.downscroll and 1 or enemyNotesToDraw[i]), (settings.downscroll and enemyNotesToDraw[i] or 1), (settings.downscroll and 1 or -1) do
					if enemyNotes[i][j] and not enemyNotes[i][j].dontdraw then
						graphics.setColor(1, 1, 1, (enemyNoteData[i][j].alpha or 1) * (enemyNoteData[i][j].alphaMult or 1) * (enemyNoteData[i][j].strum.alpha or 1) * hudAlpha[1])
						enemyNotes[i][j]:draw()
						graphics.setColor(1, 1, 1)
					end
				end
			end
			if not settings.downscroll and boyfriendNotesToDraw[i] > 0 or settings.downscroll and #boyfriendNotes > 0 then
				for j = (settings.downscroll and 1 or boyfriendNotesToDraw[i]), (settings.downscroll and boyfriendNotesToDraw[i] or 1), (settings.downscroll and 1 or -1) do
					--print(boyfriendNotesToDraw, i, j)
					if boyfriendNotes[i][j] and not boyfriendNotes[i][j].dontdraw then
						graphics.setColor(1, 1, 1, (boyfriendNoteData[i][j].alpha or 1) * (boyfriendNoteData[i][j].alphaMult or 1) * (boyfriendNoteData[i][j].strum.alpha or 1) * hudAlpha[1])
						boyfriendNotes[i][j]:draw()
					end
				end
			end
			graphics.setColor(1, 1, 1)
			love.graphics.pop()
		end

		if curSong:lower() ~= 'exploitation' then
			local hw = healthBarOverlay.width*healthBarOverlay.sizeX
			local hh = healthBarOverlay.height*healthBarOverlay.sizeY
			graphics.setColor(boyfriendObject.healthbarColors[1], boyfriendObject.healthbarColors[2], boyfriendObject.healthbarColors[3], hudAlpha[1])
			love.graphics.rectangle("fill", healthBarOverlay.x + 5 - hw/2, healthBarOverlay.y - healthBarOverlay.height/2 + 2, hw - 9, hh - (8 * healthBarOverlay.sizeY) + 0.1)
			graphics.setColor(enemyObject.healthbarColors[1], enemyObject.healthbarColors[2], enemyObject.healthbarColors[3], hudAlpha[1])
			love.graphics.rectangle("fill", healthBarOverlay.x + 5 - hw/2, healthBarOverlay.y - healthBarOverlay.height/2 + 2, (hw - 9) * (1-(health/100)), hh - (8 * healthBarOverlay.sizeY) + 0.1)
			graphics.setColor(1, 1, 1, hudAlpha[1])
		end
		healthBarOverlay:draw()

		local tw = timeBarOverlay.width*timeBarOverlay.sizeX
		local th = timeBarOverlay.height*timeBarOverlay.sizeY
		if musicTime >= 0 then
			--print(musicTime)
			graphics.setColor(128/255, 128/255, 128/255, hudAlpha[1] * timebarAlpha[1])
			love.graphics.rectangle("fill", timeBarOverlay.x + 5 - tw/2, timeBarOverlay.y - timeBarOverlay.height/2 + 2, tw - 9, th - (8 * timeBarOverlay.sizeY) + 0.1)
			graphics.setColor(57/255, 1, 20/255, hudAlpha[1] * timebarAlpha[1])
			--print(inst:getDuration"seconds", musicTime/1000, (musicTime/1000)/inst:getDuration"seconds")
			love.graphics.rectangle("fill", timeBarOverlay.x + 5 - tw/2, timeBarOverlay.y - timeBarOverlay.height/2 + 2, (tw - 9) * (musicTime/1000)/inst:getDuration"seconds", th - (8 * timeBarOverlay.sizeY) + 0.1)
			graphics.setColor(1, 1, 1, hudAlpha[1] * timebarAlpha[1])
			timeBarOverlay:draw()
			local hi = formatTime(inst:getDuration"seconds"-(musicTime/1000))
			printfOutline(hi, -curFont:getWidth(hi)/2, timeBarOverlay.y - 32, nil, {size = 48, depth = 0.05, alpha = hudAlpha[1] * timebarAlpha[1]})
		end
		
		--love.graphics.print("INFO:"..inst:getDuration"seconds"..", "..inst:tell"seconds", 0, 0)

		graphics.setColor(1, 1, 1, hudAlpha[1])

		boyfriendIcon:draw()
		if not enemyIcon.dontdraw then enemyIcon:draw() end
		if bambcon and not bambcon.dontdraw then bambcon:draw() end

		accuracy = math.floor((notesHit/totalNotes)*1000)/1000
		--print(totalNotes, notesHit)
		if totalNotes == 0 then accuracy = 0 end
		fonts('comic', 32)
		local txt = "Score: " .. score..' | Misses: '..misses..' | Accuracy: '..(math.floor(accuracy*1000)/10)..'%'
		printfOutline(txt, -curFont:getWidth(txt)/2, healthBarOverlay.y + 25, nil, {alpha = hudAlpha[1]})

		fonts('comic', 16/0.7)
		local myY = healthBarOverlay.y + 40
		local stringy = curSong:gsub('-', '')
		if lm.string[curSong:lower()..'_credit'] then
			myY = myY - 30
			stringy = stringy..'\n'..lm.string[curSong:lower()..'_credit']
			if curSong:lower() == 'exploitation' then stringy = stringy..' '..nickname..'!' end
		end
		if not greetingsCutscene then
			printfOutline(stringy, CREDITS_X, myY, nil, {alpha = hudAlpha[1]})
		end

		if curSubtitle and curSubtitle.print and curSubtitle.alpha > 0 then
			fonts('comic', curSubtitle.size * 1.5)
			printfOutline(curSubtitle.print, -curFont:getWidth(curSubtitle.print)/2, -200, nil, {alpha = curSubtitle.alpha})
		end

		if songHeader then songHeader:draw() end
		if songHeaderIcon and not cutscene then songHeaderIcon:draw() end
		--print(songHeaderIcon.x)
		if songHeaderTxt then
			fonts('comic', 30/0.7)
			printfOutline(songHeaderTxt, songHeader.x - (songHeader.width * songHeader.sizeX/2), songHeader.y - (songHeader.height * songHeader.sizeY/2))
		end

		if shapeWarning and shapeWarning.alpha > 0 then
			graphics.setColor(1, 1, 1, shapeWarning.alpha * hudAlpha[1])
			shapeWarning:draw()
		end

		if countingDown then
			graphics.setColor(1, 1, 1, countdownFade[1])
			countdown:draw()
			graphics.setColor(1, 1, 1)
		end
		if hudShader then
			love.graphics.setShader()
		end
		love.graphics.pop()
	end,
	leave = function(self)
		Timer.clear()
		overlayColor = {0, 0, 0, alpha = 0}
		globalShader = nil
		screenShaderOn = false
		blockedShader = nil
		hudShader = nil
		blockedShaderOn = false
		camShaking = false
		subtitleIndex = 0
		
		fakeBoyfriend = nil
		table.clear(boyfriends)
		table.clear(gfs)
		table.clear(dads)
		table.clear(subtitles)
		table.clear(strumsBlocked)
		table.clear(songEvents)
		if curSubtitle and curSubtitle.tween then curSubtitle.tween = nil end
		if curSubtitle and curSubtitle.timer then curSubtitle.timer = nil end
		curSubtitle = nil
		stageOverlay = {0, 0, 0, alpha = 0}
		--musicTime = -9999
		skippingSong = false
		print 'CLEANED UP'
	end,

	triggerEvent = function(self, n, v1, v2)
		if skippingSong then return end
		if musicTime < 0 then return end
		if v1 == '' then v1 = nil end
		if v2 == '' then v2 = nil end
		local eventFuncs = {
			['Hey!'] = function()
				if v1 == 'BF' or not v1 then
					boyfriendObject:playAnim 'hey'
				end
				if v1 == 'GF' or not v1 then
					girlfriendObject:playAnim 'hey'
				end
			end,
			setZoom = function()
				if v1 == '0' then v1 = origZoom end
				camZoom = tonumber(v1 or origZoom)
			end,
			flash = function() self:flash() end,
			['Change Character'] = function()
				if not weirdPolygonized then
					if v2 == 'bf' and charOverride then return end
					changeChar(tonumber(v1), v2)
				end
			end,
			bookmark = function()
				if self.bookmarkEvents then self.bookmarkEvents(v1, v2) end
			end,
			fadeOutNotes = function()
				for i=1,4 do
					Timer.tween(1, boyfriendArrows[i], {alpha = tonumber(v1)})
					Timer.tween(1, enemyArrows[i], {alpha = tonumber(v1)})
				end
			end,
			stageMode = function()
				local dumbidiots = {'cheating', 'unfairness'} --i forgot how the system works fdjsafjasd;fl
				stageMode = not stageMode
				v1 = v1 == 'true'
				local split, v3 = nil, false
				if v2 then --how the hell did it turn into a bool whatttt
					split = v2:split(', ')
					v3 = v2[2] == 'true'
					v2 = v2[1] == 'true'
				end
				if not v3 and not table.contains(dumbidiots, curSong:lower()) then
					self:flash()
				end
				if v1 and curSong:lower() ~= 'interdimensional' and not table.contains(dumbidiots, curSong:lower()) then
					for i=1,4 do
						Timer.tween(1, boyfriendArrows[i], {alpha = tonumber(v1)})
						Timer.tween(1, enemyArrows[i], {alpha = tonumber(v1)})
					end
				end
				if not v2 then
					Timer.tween(1, stageOverlay, {alpha = stageMode and 0.5 or 0})
				end
			end,
			forceStageModeOff = function()
				v1 = v1 == 'true'
				v2 = v2 == 'true'
				if not v1 and v2 and curSong:lower() ~= 'interdimensional' then
					for i=1,4 do
						boyfriendArrows[i].alpha = 1
						enemyArrows[i].alpha = 1
					end
				end
				stageMode = v1
				stageOverlay.alpha = stageMode and 0.5 or 0
				self:flash()
			end,
			subtitles = function()
				--print('changing sub to', subtitles[subtitleIndex])
				subtitleIndex = subtitleIndex + 1
				if curSubtitle and curSubtitle.tween then 
					Timer.cancel(curSubtitle.tween)
					curSubtitle.tween = nil 
				end
				if curSubtitle and curSubtitle.timer then
					Timer.cancel(curSubtitle.timer)
					curSubtitle.timer = nil 
				end
				curSubtitle = {
					speed = 0.02,
					sub = subtitles[subtitleIndex],
					alpha = 1,
					index = 0,
					timer = 0,
					size = tonumber(v1 or 32)
				}
			end,
			['Play Animation'] = function()
				local char = boyfriendObject
				if v2:lower() == 'dad' then char = enemyObject
				elseif v2:lower() == 'gf' then char = girlfriendObject
				end
				char:playAnim(v1)
			end,
			eyesores = function()
				if not weirdPolygonized then
					if settings.eyesores and not globalShader then
						globalShader = screenShader.shader
					end
					if settings.eyesores then
						screenShaderOn = not screenShaderOn
						screenShader.enabled = screenShaderOn
						camShaking = screenShaderOn
						if switchController then
							if screenShaderOn then
								switchController:setVibration(1, 1)
							else
								switchController:setVibration()
							end
						end
					end
				end
			end,
			GlitchEffect = function()
				blockedShaderOn = not blockedShaderOn
				hudShader = blockedShaderOn and blockedShader or nil
				if switchController then
					if blockedShaderOn then
						switchController:setVibration(1, 1)
					else
						switchController:setVibration()
					end
				end
			end,
			stageLightToggle = function()
				stageLightOn = not stageLightOn
				stageLight.dontdraw = not stageLightOn
				stageLight.dontupdate = not stageLightOn
			end
		}
		print('DOING EVENT', n, v1, v2)
		if eventFuncs[n] then eventFuncs[n]() end
		if eventEvents then eventEvents(n, v1, v2) end
	end,
	flash = function(self, duration, color)
		if color then overlayColor = color end
		overlayColor.alpha = 1
		Timer.tween(duration or 1, overlayColor, {alpha = 0})
	end,
	setDefaultZoom = function(zoom)
		origZoom = zoom
	end,
	--i do not like this one!
	getCurBoyfriend = function(self)
		return boyfriendObject.sprite
	end,
	getCurEnemy = function(self)
		return enemyObject.sprite
	end,
	getCurGirlfriend = function(self)
		return girlfriendObject.sprite
	end,
	setCamShaking = function(self, v)
		camShaking = v
	end
}
