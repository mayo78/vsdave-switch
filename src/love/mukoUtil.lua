local u = {}
local scaleX = 960/480
local scaleY = 720/360
u.scaleX, u.scaleY = scaleX, scaleY
function u:getX(x)
	return x * scaleX
end
function u:getY(y)
	return -y * scaleY
end

return u