--lua

local controls = {
	'up',
	'left',
	'down',
	'right'
}
local keys = {pressed = {}, held = {}, released = {}}
for k,t in pairs(keys) do
	local mt = {__index = function(a, b, c) return k..' '..b end}
	setmetatable(t, mt)
end

print(keys.pressed.up)