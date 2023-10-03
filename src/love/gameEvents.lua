local e = {}
function e:newEvent(_event)
	local event = {}
	local funcs = {}
	function event:add(func, auto)
		funcs[tostring(func)] = func
		if auto then
			return func()
		end
	end
	function event:remove(func)
		funcs[tostring(func)] = nil
	end
	function event:dispatch(...)
		for i,v in pairs(funcs) do
			v(...)
		end
	end
	e[_event] = event
	return event
end

return e