local sizes = {8, 16, 24, 32, 48, 64, 72, 128}
local fonts = {}
local function add(font, size)
	fonts[font][size] = love.graphics.newFont("fonts/"..font..".ttf", size)
end
for _,font in pairs{'comic', 'vcr'} do
	fonts[font] = {}
	for _,size in ipairs(sizes) do
		add(font, size)
	end
end
return {function(font, size)
	if not fonts[font] then fonts[font] = {} end
	if not fonts[font][size] then 
		add(font, size)
	end
	curFont = fonts[font][size]
	love.graphics.setFont(fonts[font][size])
	return fonts[font][size]
end, fonts['comic'][24]} --default font