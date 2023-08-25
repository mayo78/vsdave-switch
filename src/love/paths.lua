--helper functions that shorten stupidly long functions
local l = {};
local cache = {}
local imageCache = {}
local audioCache = {}
local dumpExclude = {
	['music/menu/menu'] = true,
	['sounds/menu/select'] = true,
	['sounds/menu/confirm'] = true,
	['images/blank'] = true,
	['dave/title/transition'] = true,
}

l.stage = ''
function l.week(week)
	return love.filesystem.load('weekFiles/'..week..'.lua')()
end

function l.image(key)
	--print('getting this', key)
	--print('this is the thing', cache[key], imageCache[key])
	key = key:lower()
	if cache[key] then
		return cache[key]
	else 
		cache[key] = love.graphics.newImage(graphics.imagePath(key))
		imageCache[key] = cache[key]
		return cache[key]
	end
end

function l.character(key)
	key = key:lower()
	return l.json('characters/'..key)
end

function l.json(key)
	local json = files[(key..'.json'):lower()]
	if not json then error('json not found' .. key) end
	return json, (key..'.json'):lower()
end

l.read = love.filesystem.read

function l.xml(key)
	key = key:lower()
	if not files['images/png/'..key..'.xml'] then error('xml not fouind dingus!'.. key) end
	return files['images/png/'..key..'.xml']
end

function l.sound(key, whatType)
	return l.audio('sounds/'..key, whatType)
end
l.sounds = l.sound --ffs

function l.music(key, whatType)
	return l.audio('music/'..key, whatType)
end

function l.audio(key, whatType)
	if audioCache[key] then return audioCache[key]
	else
		audioCache[key] = love.audio.newSource(key..'.ogg', whatType or "static")
		return audioCache[key]
	end
end

function l.song(song, diff)
	return l.json('data/charts/'..song).song
end

function l.inst(song)
	return l.music('songs/'..song:lower()..'/Inst', 'stream')
end

function l.voices(song)
	return l.music('songs/'..song:lower()..'/Voices', 'stream')
end

function l.dialogue(key)
	local langPath = 'locale/'..lm.language..'/data/dialogue/'..key..'.txt'
	if love.filesystem.getInfo(langPath) then return love.filesystem.read(langPath) end
	local path = 'data/dialogue/'..key..'.txt'
	if love.filesystem.getInfo(path) then return love.filesystem.read(path) end
end
--simple whatever you call this lol
function l.clearCache()
	for k,i in pairs(imageCache) do
		if not dumpExclude[k] then
			i:release()
			i = nil
			imageCache[k] = nil
			cache[k] = nil
		end
	end
	for k,i in pairs(audioCache) do
		if not dumpExclude[k] then
			i:release()
			i = nil
			audioCache[k] = nil
			cache[k] = nil
		end
	end
end

return l;