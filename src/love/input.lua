bindableKeys = { --bindable keys
	"axis:leftx-", "button:dpleft", "axis:triggerleft+",
	"axis:lefty+", "button:dpdown", "button:leftshoulder",
	"axis:lefty-", "button:dpup", "button:rightshoulder",
	"axis:leftx+", "button:dpright", "axis:triggerright+",
	"button:a", "button:b", "button:x", "button:y"
}
return function()
	switchController = love.joystick.getJoysticks()[1]
	controlList = table.copy(settings.controls)
	for i,v in pairs{
		left = {"key:left", "axis:leftx-", "button:dpleft"},
		down = {"key:down", "axis:lefty+", "button:dpdown"},
		up = {"key:up", "axis:lefty-", "button:dpup"},
		right = {"key:right", "axis:leftx+", "button:dpright"},
		pause = {"key:return", "button:start"},
		select = {"button:back"},

		mukoUp = {"key:w", "axis:righty-"},
		mukoLeft = {"key:a", "axis:rightx-"},
		mukoDown = {"key:s", "axis:righty+"},
		mukoRight = {"key:d", "axis:rightx+"},
		mukoClick = {"key:x", "button:rightstick"},
		gameBack = {"key:escape"},

		a = {"button:b", "key:a"}, --lol!
		b = {"button:a", "key:b"},
	} do
		if not controlList[i] then --if you know what you are doing then you can remap stuff like directions if you wanted to for some reason
			controlList[i] = v
		end
	end
	--print('FUCK', controlList.gameFive, controlList.gameFive[3])
	for _,control in pairs(bindableKeys) do controlList[control] = {control} end
	return baton.new {
		controls = controlList,
		joystick = love.joystick.getJoysticks()[1]
	}
end, bindableKeys