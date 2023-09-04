local l = {}
l.language = 'en-US'
function l:reloadLanguage(lang)
	self.language = lang
	self.string = {}
	local lines = paths.read('locale/'..lang..'/textList.txt'):split '\n'
	for _,line in pairs(paths.read('locale/'..lang..'/terminalList.txt'):split '\n') do table.insert(lines, line) end
	for _,line in pairs(lines) do
		if not line:startsWith '//' and #line > 1 then
			local kv = line:split '=='
			if not kv[2] then error('OOOOPS' .. kv[1]) end
			kv[2] = kv[2]:gsub(':linebreak:', '\n')
			self.string[kv[1]] = kv[2]
			--print('found key', kv[1], 'setting it to', kv[2])
		end
	end
end
function l:checkFile(key)
	return love.filesystem.getInfo('locale/'..self.language..'/'..key)
end
local languageData = love.filesystem.read 'locale/languages.txt'
l.languageArray = {}
for _,line in pairs(languageData:split'\n') do
	local hi = line:split ':'
	table.insert(l.languageArray, {
		name = hi[1],
		language = hi[2],
		color = hi[3]
	})
end
return l