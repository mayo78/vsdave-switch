bindableKeys = { --bindable keys
"axis:leftx-", "button:dpleft", "axis:triggerleft+",
"axis:lefty+", "button:dpdown", "button:leftshoulder",
"axis:lefty-", "button:dpup", "button:rightshoulder",
"axis:leftx+", "button:dpright", "axis:triggerright+",
"button:a", "button:b", "button:x", "button:y"
}
return function()
	switchController = love.joystick.getJoysticks()[1]
	controlList = {
		left = {"key:left", "axis:leftx-", "button:dpleft"},
		down = {"key:down", "axis:lefty+", "button:dpdown"},
		up = {"key:up", "axis:lefty-", "button:dpup"},
		right = {"key:right", "axis:leftx+", "button:dpright"},
		confirm = settings.confirm,
		back = settings.back,
		pause = {"key:return", "button:start"},
		select = {"button:back"},

		a = {"button:b"}, --lol!
		b = {"button:a"},


		gameLeft = settings.gameLeft,
		gameDown = settings.gameDown,
		gameUp = settings.gameUp,
		gameRight = settings.gameRight,
		gameFive = settings.gameFive,
		gameBack = {"key:escape"},

		mukoCams = settings.mukoCams,
		mukoDoor = settings.mukoDoor,
		mukoPrev = settings.mukoPrev,
		mukoNext = settings.mukoNext,

		mukoUp = {"key:w", "axis:righty-"},
		mukoLeft = {"key:a", "axis:rightx-"},
		mukoDown = {"key:s", "axis:righty+"},
		mukoRight = {"key:d", "axis:rightx+"},
		mukoClick = {"key:x", "button:rightstick"},

	}
	--print('FUCK', controlList.gameFive, controlList.gameFive[3])
	for _,control in pairs(bindableKeys) do controlList[control] = {control} end
	return baton.new {
		controls = controlList,
		joystick = love.joystick.getJoysticks()[1]
	}
end, bindableKeys