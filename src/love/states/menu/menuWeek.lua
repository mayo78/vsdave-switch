--[[----------------------------------------------------------------------------
This file is part of Friday Night Funkin' Rewritten

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


local coolWeeks = {
	{funkin.weeks.week0, lm.string.story_tutorial, 'warmup', '_WEEK0'},
	{funkin.weeks.week1, lm.string.story_daveWeek, 'davehouse', '_WEEK1'},
	{funkin.weeks.week2, lm.string.story_bambiWeek, 'bamboi', '_WEEK2'},
	{funkin.weeks.week3, lm.string.story_finale, 'splitathon', '_WEEK3'},
	{funkin.weeks.week4, lm.string.story_festivalWeek, 'festival', '_WEEK4'},
	{funkin.weeks.week5, lm.string.story_masterWeek, 'masterweek', '_WEEK5'}
}
local weekIndex = 1

local banner

local colory
local curColor

local stupid

local butts

local targetButt

local targetScore = 0
local curScore = 49324858

local purpleColor, blueColor

local listText

local selectSound, confirmSound, stupidstupidstupidstupid

local function change(how)
	weekIndex = weekIndex + how
	if weekIndex > #coolWeeks then
		weekIndex = 1
	elseif weekIndex < 1 then
		weekIndex = #coolWeeks
	end
	banner:setImage(paths.image('dave/title/weekbanners/'..coolWeeks[weekIndex][3]))
	--print('MY NWEW COLOLR', coolWeeks[weekIndex][1].color)
	colory = {hex2rgb(colors:get(coolWeeks[weekIndex][1].storyColor))}
	for i,butt in pairs(butts) do
		targetButt[i] = (butt.width*1.25) * (i-weekIndex) + 1280/2
	end
	targetScore = save.highscores[coolWeeks[weekIndex][4]] or 0
	local tab = {}
	for i,song in pairs(coolWeeks[weekIndex][1].songs) do
		local stupid = song[1]:gsub('-', ' ')
		table.insert(tab, stupid)
	end
	listText = table.concat(tab, ' - ')
	if how ~= 0 then 
		selectSound:stop()
		selectSound:play() 
	end
end

local confirmed

local blued = false
local function blueLoop()
	blued = not blued
	Timer.after(0.1, blueLoop)
end

return {
	enter = function(self, previous)
		stupidstupidstupidstupid = true
        selectSound = paths.sound('menu/select')
        confirmSound = paths.sound('menu/confirm')
		confirmed = false
		butts = {}
		targetButt = {}
		for i,w in pairs(coolWeeks) do
			paths.image('dave/title/weekbanners/'..w[3])
			local butt = graphics.newImage(paths.image('dave/title/storymenu/'..w[1]._WEEKNAME))
			butts[i] = butt
			butt.y = 620
			targetButt[i] = (butt.width*1.25) * (i-1) + 1280/2
		end
		banner = graphics.newImage(paths.image('dave/title/weekbanners/'..coolWeeks[weekIndex][3]))
		banner.x, banner.y = banner.width/2, banner.height/2 + 52
		stupid = banner.y - banner.height/2
		purpleColor = {hex2rgb '0xFFe55777'}
		blueColor = {hex2rgb '0xFF33ffff'}
		change(0)
		curColor = table.copy(colory)
	end,

	update = function(self, dt)
		if controls.pressed.right then
			change(1)
		elseif controls.pressed.left then
			change(-1)
		elseif controls.pressed.confirm then
			confirmed = true
			love.audio.play(confirmSound)
			blueLoop()
			local week = coolWeeks[weekIndex]
			curWeek = week[4]
			songIndex = 1
			storyMode = true
			local tab = {}
			for i,song in pairs(coolWeeks[weekIndex][1].songs) do
				print('ADDINGSONG TO SONG LIST', song[1])
				table.insert(tab, song[1]:lower())
			end
			funkin.songList = tab
			funkin.curSong = funkin.songList[1]
			completeScore = 0
			if curWeek == '_WEEK1' then
				switchState(videoState, 'daveCutscene')
			else
				switchState(stage)
			end
		end
		for i=1,3 do
			curColor[i] = lerp(curColor[i], colory[i], dt * 15)
		end
		for i,butt in pairs(butts) do
			butt.x = lerp(butt.x, targetButt[i], dt * 20)
		end
		curScore = math.floor(lerp(curScore, targetScore, 0.4))
	end,

	draw = function(self)
		--print(lm.string.story_tutorial)
		love.graphics.push()
		graphics.setColor(rgb255(curColor[1], curColor[2], curColor[3]))
		love.graphics.rectangle('fill', 0, stupid, banner.width, banner.height)
		graphics.setColor(1, 1, 1)
		banner:draw()
		for i,spr in pairs(butts) do 
			if not blued or (i ~= weekIndex) then
				graphics.setColor(1, 1, 1, (i == weekIndex) and 1 or 0.7)
			elseif blued and (i == weekIndex) then
				graphics.setColor(rgb255(unpack(blueColor)))
			end
			spr:draw() 
		end
		graphics.setColor(1, 1, 1)
		fonts('comic', 36)
		love.graphics.print('SCORE: '..curScore, 10, 0)
		fonts('comic', 32)
		local ay = coolWeeks[weekIndex][2]
		graphics.setColor(1, 1, 1, 0.7)
		love.graphics.print(ay, 1280-#ay*16, 0)
		graphics.setColor(rgb255(unpack(purpleColor)))
		fonts('comic', 28)
		love.graphics.print(lm.string.story_track:upper(), (1280/2) - (#lm.string.story_track/2)*14, stupid + banner.height + 20)
		love.graphics.print(listText, (1280/2) - (#listText/2)*14, stupid + banner.height + 20 + 28)
		love.graphics.pop()
	end,

	leave = function(self)
		table.clear(butts)
		table.clear(targetButt)
		Timer.clear()
		if confirmed then
			love.audio.stop()
		end
	end
}
