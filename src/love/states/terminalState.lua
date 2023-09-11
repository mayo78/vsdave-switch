local keyBuffer, curText
local function setKeyboard(what)
	keyBuffer = ''
	love.keyboard.setTextInput(what)
end
local commands = {}
local function makeCommand(command, help, func, showInHelp, oneCommand)
	if showInHelp == nil then showInHelp = true end
	commands[command] = {
		help = help,
		func = func,
		showInHelp = showInHelp,
		oneCommand = oneCommand == true, --uhhh i dont know why id idn this in my psych port but oim doing ti here :)
	}
end

local function updateText(txt)
	curText = curText..txt
	local hi = curText:split '\n'
	--if  then
	--end
end

local function getAwesome(a)
	return lm.string[a]
end


makeCommand('echo', 'Echos', function(...)
	updateText('\n'..table.concat({...}, ' '))
end)

makeCommand('clear', getAwesome('term_clear_ins'), function()
	curText = ''
	updateText ''
end)

makeCommand('ls', nil, function() --my own stuff :)
	updateText '\nAccess denied'
end)

makeCommand('nintendoswitch', nil, function()
	updateText('\nNickname:'..nickname..'\nOnline: '..tostring(onlineVersion)..'\nYour version: '..tostring(version)..'\nThanks for playing!')
end)

makeCommand('characters', getAwesome('term_char_ins'), function(...)
	local args = {...} --add a char here if you want
	--DIEDIEDEID(false)
	updateText("\ndave.dat\nbambi.dat\ntristan.dat\nexpunged.dat\nexbungo.dat\nrecurser.dat\nmoldy.dat")
end)
makeCommand('admin', getAwesome('term_admin_ins'), function(...)
	local args = {...} --add to argstuff
	--DIEDIEDEID(false)
	if #args == 0 then
	  --DIEDIEDEID(false)
	  updateText('\nloser list lol!')
	elseif #args ~= 2 then
	  --DIEDIEDEID(false)
	  updateText(getAwesome('term_admin_error1')..' '..tostring(#args)..getAwesome('term_admin_error2'))
	else
	  if args[1] == 'grant' then
		local argStuff = {
		  ['dave.dat'] = function()
			terminalModChart = 'house'
			loadSong('house', -1)
		  end,
		  ['tristan.dat'] = function()
			terminalModChart = 'tristan'
			loadSong('house', -1)
		  end,
		  ['exbungo.dat'] = function()
			terminalModChart = 'exbungo'
			songs = {"house","insanity","polygonized","five-nights","splitathon","shredder"}
			loadSong(songs[getRandomInt(1, #songs)], -1)
		  end,
		  ['bambi.dat'] = function()
			terminalModchart = 'bambi'
			loadSong('shredder', -1)
		  end,
		  ['recurser.dat'] = function()
			weirdPolygonized = true
			storyMode = false
			funkin.curSong = 'polygonized'
			switchState(stage)
		  end,
		  ['expunged.dat'] = function()
			
		  end,
		  ['moldy.dat'] = function()
			updateText('\n'..getAwesome('term_moldy_error'))
			Timer.after(2, function()
				if tostring(onlineVersion) ~= '-99.-99.-99' then
					love.system.openURL 'https://www.youtube.com/watch?v=azMGySH8fK8'
					love.event.quit()
				else
					updateText('\n'..'You win this time..')
				end
			end)
		  end
		}
		if argStuff[args[2]] ~= nil and argStuff[args[2]:lower()] then
			argStuff[args[2]:lower()]()
			else
				updateText('\ninvalid text11!!!!')
		end
		else
			updateText('\ninvasvdi saf')
	  end
	end
end)
makeCommand('open', getAwesome('term_texts_ins'), function(...)
	local args = {...}
	--DIEDIEDEID(false)
	local txt = 'File not found.'
	local argStuff = {
		['dave'] = "Forever lost and adrift.\nTrying to change his destiny.\nDespite this, it pulls him by a lead.\nIt doesn't matter to him though.\nHe has a child to feed.",
		['bambi'] = "A forgotten GOD.\nThe truth will never be known.\nThe extent of his POWERs won't ever unfold.",
		['god'] = "Artifact 1:\nA stone with symbols and writing carved into it.\nDescription:Its a figure that has hundreds of EYEs all across its body.\nNotes: Why does it look so much like Bambi?",
		['artifact'] = "Artifact 1:\nA stone with symbols and writing carved into it.\nDescription:Its a figure that has hundreds of EYEs all across its body.\nNotes: Why does it look so much like Bambi?",
		['eye'] = "Our LORD told us that he would remove one of his eyes everyday.\nHe tells me that he's doing this to save us.\nThat he might one day become unreasonable and we need to have faith in ourselves.\n...\nPlease, I promise you that's what he said. I-I'm not lying.\nDon't hurt me.",
		['lord'] = "A being of many eyes. A being so wise. He gives it all up to ensure, that the golden one will have a bright future.",
		['artifact2'] = "Artifact 2:\nAn almost entirely destroyed red robe.\nDescription: A red robe. \nIt has a symbol that resembles Bambi's hat, etched on it.",
		['artifact3'] = "Artifact 3:\nA notebook, found on the floor of the 3D realm.\nNotes: I haven't bothered with the cypher yet.\nI have more important matters.",
		['artifact4'] = "\"Artifact\" 4:\nA weird email, with attached images that use the same cypher as Artifact 3.\nNotes: Who sent this?",
		['tristan'] = "The key to defeating the one whose name shall not be stated.\nA heart of gold that will never become faded.",
		['expunged'] = "[DATA EXPUNGED. FUCK YOU!]", -- i think i got that wrong but inm too lkaazy to check ! lol
		['deleted'] = "The unnamable never was a god and never will be. Just an accident.",
		['exbungo'] = "[FAT AND UGLY.]",
		['recurser'] = "A being of chaos that wants to spread ORDER.\nDespite this, his sanity is at the border.",
		['moldy'] = "Let me show you my DS family!",
		['1'] = "LOG 1\nHello. I'm currently writing this from in my lab.\nThis entry will probably be short.\nTristan is only 3 and will wake up soon.\nBut this is mostly just to test things. Bye.",
		['2'] = "LOG 2\nI randomly turned 3-Dimensional again, but things were different this time...\nI appeared in a void with\nrandom red geometric shapes scattered everywhere and an unknown light source.\nWhat is that place?\nCan I visit it again?",
		['3'] = "LOG 3\nI'm currently working on studying interdimensional dislocation.\nThere has to be a root cause. Some trigger.\nI hope there aren't any long term side effects.",
		['4'] = "LOG 4\nI'm doing various tests on myself, trying to figure out what causes the POLYGONization.\nIt hurts a lot, \nBut I must keep a smile. For Tristan's sake.",
		['5'] = "[FILE DELETED]",
		['6'] = "LOG 6\nNot infront of Tristan. I almost lost him in that void. I- [DATA DELETED]",
		['7'] = "LOG 7\nMy interdimensional dislocation appears to be caused by mass amount of stress.\nHow strange.\nMaybe I could isolate this effect somehow?",
		['8'] = "LOG 8\nHey, Muko here. Dave recently called me to assist with the PROTOTYPE. \nIt's been kind of fun. He won't tell me what it does though.",
		['9'] = "[FILE DELETED]",
		['10'] = "LOG 10\nWorking on the prototype.",
		['11'] = "[FILE DELETED]",
		['12'] = "LOG 12\nThe prototype going pretty well.\nDave still won't tell me what this thing does.\nI can't figure it out even with the\nblue--prints.\nI managed to convince him to take a break and\ngo to Cicis Pizza with me and Maldo.\nHe brought Tristan long as well. It was fun.\n-Maldo",
		['13'] = "[FILE DELETED]",
		['14'] = "LOG 14\nI need to stop naming these numerically its getting confusing.",
		['prototype'] = "Project <P.R.A.E.M>\nNotes: The SOLUTION.\nEstimated Build Time: 2 years.",
		['solution'] = "I feel every ounce of my being torn to shreds and reconstructed with some parts removed.\nI can hear the electronical hissing of the machine.\nEvery fiber in my being is begging me to STOP.\nI don't.",
		['stop'] = "A reflection that is always wrong now has appeared in his dreams.\nIt's a part thats now missing.\nA chunk out of his soul.",
		['boyfriend'] = "LOG [REDACTED]\nA multiversal constant, for some reason. Must dive into further research.",
		['order'] = "What is order? There are many definitions. Recurser doesn't use any of these though.\nThey want to keep everything the way they love it.\nTo them, that's order.",
		['power'] = "[I HATE THEM.] [THEY COULD'VE HAD SO MUCH POWER, BUT THEY THREW IT AWAY.]\n[AND IN THAT HEAP OF UNWANTED POWER, I WAS CREATED.]",
		['birthday'] = "Sent back to the void, a shattered soul encounters his broken <reflection>.",
		['polygonized'] = "He will never be <free>.",
		['polygon'] = "He will never be <free>.",
		['3d'] = "He will never be <free>.",
		['p.r.a.e.m'] = "Name: Power Removal And Extraction Machine\nProgress: Complete\nNotes: Took longer than expected. Tristans 7th BIRTHDAY is in a month.",
		['cGVyZmVjdGlvbg'] = "[BLADE WOULD'VE BEEN PERFECT. BUT DAVE HAD TO REFUSE.]",
		['bGlhcg'] = "LOG 331\nI refuse to put Tristan through the torture that is P.R.A.E.M. Especially for [DATA EXPUNGED]. Not now. Not ever.",
		['YmVkdGltZSBzb25n'] = "Even when you're feeling blue.\nAnd the world feels like its crumbling around you.\nJust know that I'll always be there.\nI wish I knew, everything that will happen to you.\nBut I don't, and that's okay.\nAs long as I'm here you'll always see a sunny day.",
		['Y29udmVyc2F0aW9u'] = "Log 336\nI encountered some entity in the void today.\nCalled me \"Out of Order\".\nIt mentioned [DATA EXPUNGED] and I asked it for help.\nI don't know if I can trust it but I don't really have\nany other options.",
		['YXJ0aWZhY3QzLWE='] = "http://gg.gg/davetabase-artifact3",
		['YmlydGhkYXk'] = "http://gg.gg/davetabase-birthday",
		['ZW1haWw='] = "http://gg.gg/davetabase-mysterious-email"
	}
	if args[1] ~= nil and argStuff[args[1]:lower()] then
		txt = argStuff[args[1]:lower()]
	elseif args[1] ~= nil and argStuff[args[1]] then
		txt = argStuff[args[1]]
	end
	updateText('\n'..txt)
end)
makeCommand('help', getAwesome('term_help_ins'), function(...)
	local args = {...}
	--DIEDIEDEID(false)
	local awesomeText = ''
	for k,v in pairs(commands) do
		if v.showInHelp then
			awesomeText = awesomeText..(k..' - '..v.help..'\n')
		end
	end
	updateText('\n'..awesomeText)
end)
makeCommand('vault', getAwesome('term_vault_ins'), function(...)
	local args = {...}
	--DIEDIEDEID(false)
	local requiredStuff = {'free', 'reflection', 'p.r.a.e.m'}
	local numOfKeys = 0
	for k,v in pairs(requiredStuff) do
		if args[k] == v then
			numOfKeys = numOfKeys + 1
		end
	end
	if numOfKeys == 3 then
		updateText("\nVault unlocked.\ncGVyZmVjdGlvbg\nbGlhcg\nYmVkdGltZSBzb25n\ndGhlIG1lZXRpbmcgcDE=\ndGhlIG1lZXRpbmcgcDI=\nYmlydGhkYXk=\nZW1haWw=\nYXJ0aWZhY3QzLWE=")
	else
		updateText("\nInvalid keys. Valid keys: "..tostring(numOfKeys))
	end
end)
makeCommand('secret mod leak', getAwesome('term_leak_ins'), function(...)
	local args = {...}
	funkin.curSong = 'roofs'
	storyMode = false
	save.save.found_roofs = true
	save.writeSave()
	switchState(stage)
	--print('entering secret leak!')
end, false, true)


return {
	enter = function(self)
		keyBuffer = ''
		curText = ''
		if love.system.getOS() ~= 'nx' then
			self.keyboardOpened = true
		end
	end,
	leave = function()
	end,
	draw = function()
		love.graphics.push()
		fonts('fixedsys', 32)
		local printer = curText..'\n>>'..keyBuffer
		love.graphics.printf(printer, 0, 0, 1280)
		love.graphics.pop()
	end,
	update = function(self, dt)
		
	end,
	keyInput = function(self, key)
		if key == 'return' then
			curText = curText..'\n>'..keyBuffer
			if #keyBuffer > 0 then
				local split = keyBuffer:split' '
				if commands[split[1]] then
					local new = {}
					for k,v in pairs(split) do if k ~= 1 then table.insert(new, v) end end
					commands[split[1]].func(unpack(new))
				else
					curText = curText..'\n>Command not found: '..split[1]
				end
				keyBuffer = ''
			else
				updateText ''
			end
		elseif key == 'backspace' then
			keyBuffer = keyBuffer:sub(1, #keyBuffer - 1)
		elseif key == 'space' or #key == 1 then
			if key == 'space' then key = ' ' end
			if love.keyboard.isDown 'lshift' and #key == 1 then key = key:upper() end
			keyBuffer = keyBuffer..key
		end
	end
}