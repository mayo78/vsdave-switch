--ram stuff
local l = {}
local imageCache = {}
local audioCache = {}
local dumpExclude = {
	['music/menu/menu'] = true,
	['images/blank'] = true,
	['dave/title/transition'] = true,
}

l.stage = ''
function l.week(week)
	return love.filesystem.load('weekFiles/'..week..'.lua')()
end

function l.image(key)
	key = key:lower()
	if imageCache[key] then
		return imageCache[key]
	else
		--print('need to make a  new guy!', key)
		imageCache[key] = love.graphics.newImage(graphics.imagePath(key))
		return imageCache[key]
	end
end

function l.character(key)
	key = key:lower()
	return l.json('characters/'..key)
end

function l.json(key)
	local json = files[(key..'.json'):lower()]
	if not json then 
		print('json not found' .. key) 
		return nil
	end
	return table.copy(json), (key..'.json'):lower()
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
	if terminalModChart == CharacterFunnyEffect.Tristan then return l.music('songs/'..song:lower()..'/Voices-Tristan', 'stream') end
	return l.music('songs/'..song:lower()..'/Voices', 'stream')
end

function l.dialogue(key)
	local langPath = 'locale/'..lm.language..'/data/dialogue/'..key..'.txt'
	if love.filesystem.getInfo(langPath) then return love.filesystem.read(langPath) end
	local path = 'data/dialogue/'..key..'.txt'
	if love.filesystem.getInfo(path) then return love.filesystem.read(path) end
end
--simple whatever you call this lol
function l.clearCache(only)
	if not only or only == 'image' then
		for k,i in pairs(imageCache) do
			if not dumpExclude[k] then
				i:release()
				i = nil
				imageCache[k] = nil
			--else
			--	print('not douing', k)
			end
		end
	end
	if not only or only == 'audio' then
		for k,i in pairs(audioCache) do
			if not dumpExclude[k] then
				i:release()
				i = nil
				audioCache[k] = nil
			--else
			--	print('not doing', k)
			end
		end
	end
end

return l;