return function(x,y,w,h)
	local o = {x = x, y = y, width = w, height = h}
	function o:pointOverlap(mx, my)
		return mx > o.x and mx < o.width and my > o.y and my < o.height
	end
	return o
end