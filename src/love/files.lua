--precahces the tables of every json and xml file, doesnt take that long but should save a bit of time between different whatyevers
local export = {}
local function checkFolder(folder, check, e)
	for _,file in pairs(love.filesystem.getDirectoryItems(folder)) do
		if love.filesystem.getInfo(folder..'/'..file).type ~= 'directory' then
			check(folder, file)
		else 
			checkFolder(folder..'/'..file, check, e)
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
		return true
	end
end)
checkFolder('characters', function(folder, file)
	if file:endsWith('.json') then
		--print('adding this to the list!', folder..'/'..file)
		precachedData[folder..'/'..(file:lower())] = json.decode(love.filesystem.read(folder..'/'..file))
		return true
	end
end)
checkFolder('data', function(folder, file)
	if file:endsWith('.json') then
		--print('adding this to the list!', folder..'/'..file)
		precachedData[folder..'/'..(file:lower())] = json.decode(love.filesystem.read(folder..'/'..file))
		return true
	end
end)
checkFolder('locale', function(folder, file)
	if file:endsWith('.json') then
		--print('adding this to the list!', folder..'/'..file)
		precachedData[folder..'/'..(file:lower())] = json.decode(love.filesystem.read(folder..'/'..file))
		return true
	end
end)
checkFolder('', function(folder, file)
	export[folder:sub(2, #folder)..'/'..file] = file
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
--this was for when i was trying to get this to run on the wii which couldn't tellif a file existed or not so i just had a table of all the files that existed so you could do if fileList["file.png"] then
--local final = 'return {'
--local function yeah(tab)
--	for k,v in pairs(tab) do
--		if not k:startsWith '/' then
--			final = final..'\n["'..k..'"] = [=====['..v..']=====],'
--		end
--	end
--end
--yeah(export)
--final = final..'}'
--love.filesystem.write('rawfiles', final)

return precachedData