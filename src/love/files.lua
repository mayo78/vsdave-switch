--precahces the tables of every json and xml file, doesnt take that long but should save a bit of time between different whatyevers
local function checkFolder(folder, check)
	for _,file in pairs(love.filesystem.getDirectoryItems(folder)) do
		if love.filesystem.getInfo(folder..'/'..file).type ~= 'directory' then
			check(folder, file)
		else 
			checkFolder(folder..'/'..file, check)
		end
	end
end
local precachedData = {}
checkFolder('images/png', function(folder, file)
	if file:endsWith('.xml') then
		--print('adding this to the list!', folder..'/'..file:lower())
		
		local xml = xmlparser.parse(love.filesystem.read(folder..'/'..file))
		local xmlFinal = {}
		for i,c in pairs(xml.children[1].children) do
			--print('hii im ', c.attrs.name)
			table.insert(xmlFinal, c.attrs)
		end
		precachedData[(folder:lower())..'/'..(file:lower())] = xmlFinal
	end
end)
checkFolder('characters', function(folder, file)
	if file:endsWith('.json') then
		--print('adding this to the list!', folder..'/'..file)
		precachedData[folder..'/'..(file:lower())] = json.decode(love.filesystem.read(folder..'/'..file))
	end
end)
checkFolder('data', function(folder, file)
	if file:endsWith('.json') then
		--print('adding this to the list!', folder..'/'..file)
		precachedData[folder..'/'..(file:lower())] = json.decode(love.filesystem.read(folder..'/'..file))
	end
end)
checkFolder('locale', function(folder, file)
	if file:endsWith('.json') then
		--print('adding this to the list!', folder..'/'..file)
		precachedData[folder..'/'..(file:lower())] = json.decode(love.filesystem.read(folder..'/'..file))
	end
end)

--[=[
	
--]= ] --remove the space here to easily uncomment it
local imgs = {}
checkFolder('images/png', function(folder, file)
	if file:endsWith '.png' then
		folder = folder:gsub('images/png/', ''):gsub('/', '\\')
		table.insert(imgs, (([[mkdir ..\dds\]]..folder..[[$NEWLINE%texconv% -f DXT5 -m 1 -nologo -o ..\dds\]]..folder..[[ -srgb -y ]]..(folder..'\\'..file).."\nrename ..\\dds\\"..(folder..'\\'..file:gsub('png', '')).."DDS "..(file:gsub('png', '')).."dds"):gsub('$NEWLINE', '\n')))
	end
end)
print(table.concat(imgs, '\n'))
--]=]

return precachedData