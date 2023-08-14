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

return function()
	local gameLeft
	local gameDown
	local gameUp
	local gameRight
	--too lazy to make this better lol!
	if love.system.getOS() == "NX" then
		gameLeft = {}
		gameDown = {}
		gameUp = {}
		gameRight = {}
		if settings.shoulderControls then
			table.insert(gameLeft, "axis:triggerleft+")
			table.insert(gameDown, "button:leftshoulder")
			table.insert(gameUp, "button:rightshoulder")
			table.insert(gameRight, "axis:triggerright+")
		else
			table.insert(gameLeft, "button:dpleft")
			table.insert(gameLeft, "button:x")
			
			table.insert(gameDown, "button:dpdown")
			table.insert(gameDown, "button:a")
			
			table.insert(gameUp, "button:dpup")
			table.insert(gameUp, "button:y")
			
			table.insert(gameRight, "button:dpright")
			table.insert(gameRight, "button:b")
		end
		switchController = love.joystick.getJoysticks()[1]
		return baton.new {
			controls = {
				left = {"key:left", "axis:leftx-", "button:dpleft"},
				down = {"key:down", "axis:lefty+", "button:dpdown"},
				up = {"key:up", "axis:lefty-", "button:dpup"},
				right = {"key:right", "axis:leftx+", "button:dpright"},
				confirm = {"key:return", "button:a"},
				back = {"key:escape", "button:b"},
				pause = {"key:return", "button:start"},

				gameLeft = gameLeft,
				gameDown = gameDown,
				gameUp = gameUp,
				gameRight = gameRight,
				gameBack = {"key:escape"},
				gameFive = {"key:space", settings.shoulderControls and "button:a" or "axis:triggerright+"}
			},
			joystick = love.joystick.getJoysticks()[1]
		}
	else
		gameLeft = {"key:"..settings.gameLeft[1], "key:"..settings.gameLeft[2]} --cmon WHY WASNT IT LIKE THIS IT WAS SO EASY!!!!!!
		gameDown = {"key:"..settings.gameDown[1], "key:"..settings.gameDown[2]}
		gameUp = {"key:"..settings.gameUp[1], "key:"..settings.gameUp[2]}
		gameRight = {"key:"..settings.gameRight[1], "key:"..settings.gameRight[2]}
		if settings.shoulderControls then
			table.insert(gameLeft, "axis:triggerleft+")
			table.insert(gameDown, "button:leftshoulder")
			table.insert(gameUp, "button:rightshoulder")
			table.insert(gameRight, "axis:triggerright+")
		else
			table.insert(gameLeft, "button:dpleft")
			table.insert(gameLeft, "button:x")
			
			table.insert(gameDown, "button:dpdown")
			table.insert(gameDown, "button:a")
			
			table.insert(gameUp, "button:dpup")
			table.insert(gameUp, "button:y")
			
			table.insert(gameRight, "button:dpright")
			table.insert(gameRight, "button:b")
		end
		switchController = love.joystick.getJoysticks()[1]
		return baton.new {
			controls = {
				left = {"key:left", "axis:leftx-", "button:dpleft"},
				down = {"key:down", "axis:lefty+", "button:dpdown"},
				up = {"key:up", "axis:lefty-", "button:dpup"},
				right = {"key:right", "axis:leftx+", "button:dpright"},
				confirm = {"key:return", "button:a"},
				back = {"key:escape", "button:b"},
				pause = {"key:return", "button:start"},

				gameLeft = gameLeft,
				gameDown = gameDown,
				gameUp = gameUp,
				gameRight = gameRight,
				gameBack = {"key:escape", "button:start"},
				gameFive = {"key:space", settings.shoulderControls and "button:a" or "axis:triggerright+"}
			},
			joystick = love.joystick.getJoysticks()[1]
		}
	end
end