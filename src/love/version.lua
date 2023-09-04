--you can compare versions that are like: 0.1.0 and do stuff like ver1 > ver2 :)
local l = {}
function l:fromString(str)
	if str == '0.1-alpha.1' then --oops
		print('oops')
		str = '0.0.1' 
	end
    local hi = str:split '.'
    return self:new(tonumber(hi[1]), tonumber(hi[2]), tonumber(hi[3])) --bit lazy but ok
end
function l:new(...)
	local ver = {raw = {...}}
	local mt = {}
	mt.__name = function()
		return table.concat(ver.raw, '.')
	end
	mt.__tostring = function()
		return mt.__name()
	end
	setmetatable(ver, mt)
	return ver
end
function l:lessThan(a, b)
	for i,v in ipairs(a.raw) do
		if b.raw[i] > v then
			return true
		end
	end
end
function l:equalTo(a, b)
	for i,v in ipairs(a.raw) do
		if b.raw[i] ~= v then
			return false
		end
	end
	return true
end
function l:greaterThan(a, b)
	for i,v in ipairs(b.raw) do
		if a.raw[i] > v then
			return true
		end
	end
end
return l;