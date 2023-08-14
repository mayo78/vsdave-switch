return {
	print = love.graphics.print,
	printf = love.graphics.printf,
	function new = function(self, x, y, text, limit, alignment, size, lfont, func)
		lfont = lfont or 'fonts/comic.tff'
		size = size or 16
		func = func or self.printf
		return {
			x = x,
			y = y,
			text = text,
			limit = limit,
			alignment = alignment,
			draw = function(self)
				func(self.text, self.x, self.y, self.limit, self.alignment)
			end
		}
	end
}
--unused lol