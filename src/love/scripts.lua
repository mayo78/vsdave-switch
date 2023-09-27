--just for fun
local s = {scripts = {}}
function s:newScript(name)
	if not name:endsWith '.lua' then name = name..'.lua' end
	local ok, chunk, err = pcall(love.filesystem.load, name) -- load the chunk safely
	if not ok    then  return false, "Failed loading code: "..chunk  end
	if not chunk then  return false, "Failed reading file: "..err    end

	local ok, value = pcall(chunk) -- execute the chunk safely
	if not ok then  return false, "Failed calling chunk: "..tostring(value)  end

	return true, value -- success!
end
function s:runScript(name)
	local success, script = self:newScript(name)
	if not success then 
		print('Cannot load script', name)
	else
		local hi = self
		function script:_call(func, ...)
			if self[func] then 
				local ok, value = pcall(self[func], ...)
				if not ok then
					print('Script error: '..tostring(value))
					hi.scripts[self._name] = nil
				else
					return value
				end
			end
		end
		script._name = name
		script:_call 'onCreate'
	end
end
function s:clear()
	for k,v in pairs(self.scripts) do
		v:_call 'onDestroy'
		self.scripts[k] = nil
	end
end
function s:call(func, ...)
	local ret
	for k,v in pairs(self.scripts) do
		local _ret = v:_call(func, ...)
		if _ret then ret = _ret end
		v:_call('onCall', func, ...)
	end
	return ret
end

return s