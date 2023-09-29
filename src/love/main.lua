--[[----------------------------------------------------------------------------
Friday Night Funkin' Rewritten v1.1.0 beta 2

Copyright (C) 2021  HTV04

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>.
------------------------------------------------------------------------------]]
local pauseScreen

RADIAN_TO_DEGREE = 180/math.pi
DEGREE_TO_RADIAN = math.pi/180

screenAngle = 0
screenRadian = 0

local printBuffer = {}

errorData = ''

isLoading = true
--debugMode = true
function love.load()
	--https://love2d.org/forums/viewtopic.php?t=77272
	function love.graphics.roundrect(mode, x, y, width, height, xround, yround, p)
		local points = {}
		local precision =  p or (xround + yround) * .1
		local tI, hP = table.insert, .5*math.pi
		if xround > width*.5 then xround = width*.5 end
		if yround > height*.5 then yround = height*.5 end
		local X1, Y1, X2, Y2 = x + xround, y + yround, x + width - xround, y + height - yround
		local sin, cos = math.sin, math.cos
		for i = 0, precision do
			local a = (i/precision-1)*hP
			tI(points, X2 + xround*cos(a))
			tI(points, Y1 + yround*sin(a))
		end
		for i = 0, precision do
			local a = (i/precision)*hP
			tI(points, X2 + xround*cos(a))
			tI(points, Y2 + yround*sin(a))
		end
		for i = 0, precision do
			local a = (i/precision+1)*hP
			tI(points, X1 + xround*cos(a))
			tI(points, Y2 + yround*sin(a))
		end
		for i = 0, precision do
			local a = (i/precision+2)*hP
			tI(points, X1 + xround*cos(a))
			tI(points, Y1 + yround*sin(a))
		end
		love.graphics.polygon(mode, unpack(points))
	end
	
	--extra useful functions
	function table.copy(t,st,copyMeta,x)
		if (copyMeta == nil) then copyMeta = true; end
		x = x or 0;
		getfenv().things = getfenv().things or {};
		local things = getfenv().things;
		if (things[t] ~= nil) then return things[t]; end

		st = st or {};
		
		things[t] = st;
		
		for i,v in pairs(t) do
			st[i] = type(v) == "table" and table.copy(v,{},copyMeta,x + 1) or v;
		end
		if (x <= 0) then getfenv().things = {}; end
		
		if (copyMeta) then
			local meta = getmetatable(t);
			if (type(meta) == "table") then
				setmetatable(st, meta);
			end
		end
		
		return st;
	end
	function table.clear(t)
		while #t ~= 0 do rawset(t, #t, nil) end
	end
	function string:startsWith(start)
		return self:sub(1, #start) == start
	end
	
	function string:endsWith(ending)
		return ending == "" or self:sub(-#ending) == ending
	end
	function table.contains(t, w)
		for k,v in pairs(t) do
			if w == v then
				return true
			end
		end
	end
	function table.indexOf(t, w)
		for k,v in pairs(t) do
			if w == v then
				return k
			end
		end
	end
	function point(x, y)
		return {x = x or 0, y = y or 0, 
			set = function(self, x, y) 
				self.x = x or 0 
				self.y = y or 0
				return self
			end,
			fromArray = function(self, a)
				--print(a[1], a[2], 'from Array')
				return self:set(a[1], a[2])
			end,
			copy = function(self)
				return point(self.x, self.y)
			end,
			fromPoint = function(self, p)
				return self:set(p.x, p.y)
			end,
		}
	end
	function string:split(sep)
		if sep == nil then
				sep = "%s"
		end
		local t={}
		for str in string.gmatch(self, "([^"..sep.."]+)") do
				table.insert(t, str)
		end
		return t
	end
	function getAA(inp)
		if inp then return 'linear', 'linear'
		else return 'nearest', 'nearest'
		end
	end

	printf = love.graphics.printf
	function printfOutline(text, x, y, limit, extra)
		extra = extra or {}
		if extra.alpha and extra.alpha <= 0 then return end
		if extra.font or extra.size then
			fonts(extra.font or 'comic', extra.size or 24)
		end
		if extra.center then x = x - curFont:getWidth(text)/2 end
		extra.color = extra.color or {1, 1, 1}
		extra.size = extra.size or 24
		extra.depth = extra.depth or 0.1 --non ints make a cool outline
		
		--theres a bettter way to d othis right
		love.graphics.push()
		love.graphics.setColor(0, 0, 0, extra.alpha or 1)
		local limit, alignment, angle = limit or 9999, extra.align or 'left', extra.angle and (extra.angle * DEGREE_TO_RADIAN) or 0
		printf(text, x - extra.depth * extra.size, y, limit, alignment, angle)
		printf(text, x - extra.depth * extra.size, y - extra.depth * extra.size, limit, alignment, angle)
		printf(text, x, y - extra.depth * extra.size, limit, alignment, angle)
		printf(text, x + extra.depth * extra.size, y - extra.depth * extra.size, limit, alignment, angle)
		printf(text, x + extra.depth * extra.size, y, limit, alignment, angle)
		printf(text, x + extra.depth * extra.size, y + extra.depth * extra.size, limit, alignment, angle)
		printf(text, x, y + extra.depth * extra.size, limit, alignment, angle)
		printf(text, x - extra.depth * extra.size, y + extra.depth * extra.size, limit, alignment, angle)
		love.graphics.setColor(extra.color[1], extra.color[2], extra.color[3], extra.alpha or 1)
		printf(text, x, y, limit, alignment, angle)
		love.graphics.setColor(1, 1, 1, 1)
		love.graphics.pop()
	end

	--makes stuff like 255, 255, 255 to 1, 1, 1
	function rgb255(r, g, b, a) --actually rgba but whatebver
		return (r and r/255 or 1), (g and g/255 or 1), (b and b/255 or 1), a or 1
	end

	function fromTopLeft(x, y, spill)
		if spill then return -1280/2 + (x or 0), -720/2 + (y or 0)
		else return point(-1280/2 + (x or 0), -720/2 + (y or 0))
		end
	end
	function addWidth(spr)
		spr.x = spr.x + spr.width
		spr.y = spr.y + spr.height
	end
	function addHalfWidth(spr)
		spr.x = spr.x - ((-spr.width * spr.sizeX)/2)
		spr.y = spr.y - ((-spr.height * spr.sizeY)/2)
	end

	function formatTime(seconds)
		local timeString = math.floor(seconds / 60)..':'
		local timeStringHelper = math.floor(seconds) % 60
		if timeStringHelper < 10 then
			timeString = timeString..'0'
		end
		timeString = timeString..timeStringHelper
		return timeString
	end

	function openSubstate(mesubstate, pause, ...)
		substate = mesubstate
		statePaused = pause
		substate:enter(...)
	end
	function closeSubstate()
		statePaused = false
		substate:leave()
		substate = nil
		substateJustLeft = true
	end

	--https://gist.github.com/jasonbradley/4357406
	function hex2rgb(hex)
		hex = hex:gsub("#",""):gsub('0xFF', '')
		return tonumber("0x"..hex:sub(1,2)), tonumber("0x"..hex:sub(3,4)), tonumber("0x"..hex:sub(5,6))
	end
	
	function math.lerp(a,b,t) return a * (1-t) + b * t end
	lerp = math.lerp --fjasdkljf;klsdj
	function math.boundTo(value, min, max)
		return math.max(min, math.min(max, value))
	end
	function math.round(num, numDecimalPlaces)
		local mult = 10^(numDecimalPlaces or 0)
		return math.floor(num * mult + 0.5) / mult
	end

	colors = {
		main = '0xFFFDE871',
		selected = '0xFFfd719b',
		other = '0xFF4965FF',
		get = function(self, col)
			return self[col] or col
		end
	}



	--shaders lol
	shaders = require 'shaders'


	 

	local curOS = love.system.getOS()


	
	Timer = require "lib.timer"

	loadFont = love.graphics.newFont(64)
	-- Load modules
	Timer.after(0.05, function() --let the loading text draw :)
		json = require 'json'
		xmlparser = require 'modules.xmlparser'
		files = require 'files'

		-- Load libraries
		
		paths = require 'paths'
		graphics = require "modules.graphics"
		Gamestate = require "lib.gamestate"
		baton = require "lib.baton"
		ini = require "lib.ini"
		lovesize = require "lib.lovesize"
		settings = require "settings"
		nickname = (love.getNickname and settings.selfAwareness) and love.getNickname() or 'User'
		save = require 'save'
		funkin = require 'funkin'
		
		lm = require 'gamestrings' --language manager
		lm:reloadLanguage(settings.language or 'en-US')

		local printer = print
		function print(...)
			printer(...)
			if settings.showDebug then
				local hi = {...}
				for k,v in pairs(hi) do hi[k] = tostring(v) end
				table.insert(printBuffer, {print = table.concat(hi, ', '), time = 3})
			end
		end

		
		mukoUtil = require 'mukoUtil'

		
		reloadInput = require "input"
		input = reloadInput()
		local w,h = love.window.getMode()
		globalCanvas = love.graphics.newCanvas(1920, 1080)

		controls = {pressed = {}, down = {}, released = {}}
		for k,t in pairs(controls) do --so you cn do this: controls.pressed.up, controls.down.up, etc
			local mt = {__index = function(a, b, c) 
				--print('calling this guy:', k, 'with argument:', b)
				return input[k](input, b) 
			end}
			setmetatable(t, mt)
		end
		
		http = require 'socket.http'

		versionTable = require 'version'
		version = versionTable:new(1, 0, 0)
		--local ssl = require 'ssl'
		--local body, code, headers, status = http.request("https://raw.githubusercontent.com/mayo78/vsdave-switch/main/version.txt")
		--print(code, status, body)
		onlineVersion = versionTable:fromString((http.request 'https://www.mayo78.com/vsdaveswitch-version.txt' or '-99.-99.-99'):gsub('v', ''))

		floatingKeyboard = require 'floatingkeyboard'

		--scripts = require 'scripts'

		hitbox = require 'states.muko.hitbox'
		-- Load states
		clickStart = require "states.click-start"
		debugMenu = require "states.debug-menu"
		titleMenu = require "states.menu.titleMenu"
		versionState = require 'states.versionState'
		languageState = require 'states.languageState'
		flashingState = require 'states.flashingState'
		menuWeek = require "states.menu.menuWeek"
		menuSelect = require "states.menu.menuSelect"
		menuSettings = require 'states.menu.menuSettings'
		menuFreeplay = require "states.menu.menuFreeplay"
		menuCredits = require 'states.menu.menuCredits'
		menuOst = require 'states.menu.menuOst'
		weeks = require "states.weeks"
		endings = require 'states.ending'
		layeredCutscene = require 'states.layeredCutscene'
		charSelect = require 'states.charSelect'
		terminalState = require 'states.terminalState'
		recurserState = require 'states.recurserState'

		-- Load substates
		gameOver = require "substates.game-over"
		gameOverFnaf = require 'substates.game-over-fnaf'
		pause = require 'substates.pause'
		dialogue = require 'substates.dialogue'

		mukoTitle = require 'states.muko.title'
		mukoGame = require 'states.muko.game'
		mukoEnd = require 'states.muko.end'

		scoreMultiplier = {1, 1, 1, 1}

		stage = require 'stage'

		-- LÖVE init
		if curOS == "OS X" then
			love.window.setIcon(love.image.newImageData("icons/macos.png"))
		else
			love.window.setIcon(love.image.newImageData("icons/default.png"))
		end

		lovesize.set(1280, 720)

		-- Variables
		fonts = require 'fonts'
		
		font = fonts('comic', 24)
		--for k,v in ipairs(fonts.comic) do print(k, v) end
		--font = fonts.comic[24]


		storyMode = false
		countingDown = false

		cam = point()
		cam.sizeX = 0
		cam.sizeY = 0
		camOffset = point()
		camOffsetPos = point()
		shakeOffset = point()
		offsetStuff = {point(-20, 0), point(0, 20), point(0, -20), point(20, 0)}
		camScale = point(0.9, 0.9)
		camZoom = 0.9
		curCamZoom = 1

		overlayColor = {1, 1, 1, alpha = 0}

		musicTime = 0
		health = 0
		
		character = require 'character'

		--print(tostring(version), tostring(onlineVersion))

		--if onlineVersion and version and versionTable:greaterThan(onlineVersion, version) then
		--	switchState(versionState)
		--else
			print(save.save.seenWarning)
			switchState(settings.language and (save.save.seenWarning and titleMenu or flashingState) or languageState)
		--end

		print('the save:', love.filesystem.getSaveDirectory())

		--switchState(charSelect)
		--switchState(mukoTitle)
		--switchState(terminalState)
		--switchState(debugMenu)
		--switchState(menuFreeplay)
		local scale = 1280/1920
		
		--local testChar = character 'bf'
		
		isLoading = false
		--print(font)
	end)
end

function love.resize(width, height)
	if isLoading then return end
	lovesize.resize(width, height)
end

function love.keypressed(key)
	if isLoading then return end
	if key == "6" then
		love.filesystem.createDirectory("screenshots")

		love.graphics.captureScreenshot("screenshots/" .. os.time() .. ".png")
	else
		Gamestate.keypressed(key)
		--weeks:keypressed(key)
	end
end

function love.mousepressed(x, y, button, istouch, presses)
	if not isLoading then
		Gamestate.mousepressed(x, y, button, istouch, presses)
	end
end

function love.update(dt)
	lovedt = dt
	if screenAngle ~= 0 then
		screenRadian = screenAngle * DEGREE_TO_RADIAN
	end
	if gamePaused then return end
	dt = math.min(dt, 1 / 30)
	if isLoading then
		Timer.update(dt)
		return
	end

	input:update()
	if substate then substate:update(dt) end --so if the state is closed the main state also updates!
	if not statePaused then
		Gamestate.update(dt)
		Timer.update(dt)
	end
	if afterSubstateLeft then
		afterSubstateLeft()
		afterSubstateLeft = nil
	end
	shaders:update(dt)
	substateJustLeft = false
	for i,v in pairs(printBuffer) do
		v.time = v.time - dt
		if v.time <= 0 then
			table.remove(printBuffer, i)
		end
	end
	if controls.down.pause and controls.down.select then
		love.event.quit()
	end
end
local function drawWhatever()
end
function love.draw()
	
	if not isLoading then
		love.graphics.setCanvas(globalCanvas)
		love.graphics.clear()
		graphics.screenBase(lovesize.getWidth(), lovesize.getHeight())
		lovesize.begin()
		love.graphics.setFont(font)
		graphics.setColor(1, 1, 1) -- Fade effect on
		Gamestate.draw()
		if overlayColor.alpha > 0 then
			graphics.setColor(overlayColor[1], overlayColor[2], overlayColor[3], overlayColor.alpha)
			love.graphics.rectangle("fill", 0, 0, 1280, 720)
			graphics.setColor(1, 1, 1)
		end
		if substate then substate:draw() end
		love.graphics.setColor(1, 1, 1) -- Fade effect off
		love.graphics.setFont(font)
		fonts('comic', 24)
		-- Debug output

		if drawTransition then
			transition:draw()
		end	
		
		fonts('comic', 16)
		love.graphics.print(" FPS: ".. love.timer.getFPS()) --..'\n ≈RAM:'..math.floor((love.graphics.getStats().texturememory + collectgarbage 'count')/1048576) .. 'MB', 0, 0, 9999
		fonts('comic', 24)
		
		lovesize.finish()
		love.graphics.setCanvas()
		if globalShader then
			love.graphics.setShader(globalShader)
		end
		if screenRadian == 0 then
			love.graphics.draw(globalCanvas, 0, 0, 0)
		else
			love.graphics.draw(globalCanvas, 1280/2, 720/2, screenRadian, 1, 1, 1280/2, 720/2)
		end
		graphics.screenBase(love.graphics.getWidth(), love.graphics.getHeight())
		love.graphics.setShader()

		
		fonts('comic', 16)
		for i,v in pairs(printBuffer) do
			love.graphics.print(v.print, 0, (i + 1) * 18)
		end
		if fpsAdd and #fpsAdd > 0 then
			love.graphics.setColor(1,1,0)
			love.graphics.print(table.concat(fpsAdd, '\n'), 0, 32)
			love.graphics.setColor(1,1,1)
		end
	else
		love.graphics.setColor(.4, .4, .4)
		love.graphics.setFont(loadFont)
		love.graphics.print("Loading...", 1280 - loadFont:getWidth 'Loading...', 720 - loadFont:getHeight())
	end
	--if settings.showDebug then
	--	love.graphics.print(status.getDebugStr(settings.showDebug), 5, 5, nil, 0.5, 0.5)
	--end
end

local utf8 = require("utf8")

local function error_printer(msg, layer)
	print((debug.traceback("Error: " .. tostring(msg), 1+(layer or 1)):gsub("\n[^\n]+$", "")))
end

function love.errorhandler(msg)
	msg = tostring(msg)

	error_printer(msg, 2)

	if not love.window or not love.graphics or not love.event then
		return
	end

	if not love.graphics.isCreated() or not love.window.isOpen() then
		local success, status = pcall(love.window.setMode, 800, 600)
		if not success or not status then
			return
		end
	end

	-- Reset state.
	if love.mouse then
		love.mouse.setVisible(true)
		love.mouse.setGrabbed(false)
		love.mouse.setRelativeMode(false)
		if love.mouse.isCursorSupported() then
			love.mouse.setCursor()
		end
	end
	if love.joystick then
		-- Stop all joystick vibrations.
		for i,v in ipairs(love.joystick.getJoysticks()) do
			v:setVibration()
		end
	end
	if love.audio then love.audio.stop() end

	love.graphics.reset()
	local font = love.graphics.setNewFont(14)

	love.graphics.setColor(1, 1, 1)

	local trace = debug.traceback()

	love.graphics.origin()

	local sanitizedmsg = {}
	for char in msg:gmatch(utf8.charpattern) do
		table.insert(sanitizedmsg, char)
	end
	sanitizedmsg = table.concat(sanitizedmsg)

	local err = {}

	table.insert(err, "Error:\n")
	table.insert(err, sanitizedmsg)

	if #sanitizedmsg ~= #msg then
		table.insert(err, "Invalid UTF-8 string in error message.")
	end

	table.insert(err, "\n")

	for l in trace:gmatch("(.-)\n") do
		if not l:match("boot.lua") then
			l = l:gsub("stack traceback:", "Traceback\n")
			table.insert(err, l)
		end
	end

	local p = table.concat(err, "\n")

	p = p:gsub("\t", "")
	p = p:gsub("%[string \"(.-)\"%]", "%1")

	local hi = love.graphics.newImage 'images/error.png'
	hi:setFilter(getAA(false))
	local function draw()
		if not love.graphics.isActive() then return end
		local pos = 70
		love.graphics.push()
		love.graphics.scale(1.5, 1.5)
		love.graphics.draw(hi)
		love.graphics.pop()

		love.graphics.printf(p, pos, pos, love.graphics.getWidth() - pos)
		love.graphics.present()
	end

	local time = os.date'*t'
	if not love.filesystem.getInfo 'crashes' then love.filesystem.createDirectory 'crashes' end
	love.filesystem.write('crashes/'..table.concat({time.year, time.month, time.hour, time.min, time.sec}, '-')..'.txt', p)
	p = p..[[

A copy of this crash log has been saved in your NSO folder!

Please report this error on www.github.com/mayo78/vsdave-switch

Press B/A/Start or tap to close the game
	]]..errorData

	return function()
		love.event.pump()
		for e, a, b, c in love.event.poll() do
			if e == "quit" then
				return 1
			elseif e == "keypressed" and a == "escape" then
				return 1
			elseif e == "keypressed" and a == "c" and love.keyboard.isDown("lctrl", "rctrl") then
				copyToClipboard()
			elseif e == "gamepadpressed" and love._os == "NX" and (b == "b" or b == "a" or "start") then
				return 1
			elseif e == "touchpressed" then
				if love._os == "NX" then
					return 1
				end
				local name = love.window.getTitle()
				if #name == 0 or name == "Untitled" then name = "Game" end
				local buttons = {"OK", "Cancel"}
				if love.system then
					buttons[3] = "Copy to clipboard"
				end
				local pressed = love.window.showMessageBox("Quit "..name.."?", "", buttons)
				if pressed == 1 then
					return 1
				elseif pressed == 3 then
					copyToClipboard()
				end
			end
		end

		draw()

		if love.timer then
			love.timer.sleep(0.1)
		end
	end

end