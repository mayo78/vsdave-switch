--[[
Copyright (c) 2010-2013 Matthias Richter

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

Except as contained in this notice, the name(s) of the above copyright holders
shall not be used in advertising or otherwise to promote the sale, use or
other dealings in this Software without prior written authorization.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
]]--

transition = graphics.newImage(paths.image('dave/title/transition'))
transition:getImage():setFilter('nearest', 'nearest')
transition.x = -2146 + 2164/2
transition.y = transition.y + S_HALF_HEIGHT

local function __NULL__() end

 -- default gamestate produces error on every callback
local state_init = setmetatable({leave = __NULL__},
		{__index = function() error("Gamestate not initialized. Use switchState()") end})
local stack = {state_init}
local initialized_states = setmetatable({}, {__mode = "k"})
local state_is_dirty = true

local GS = {}
function GS.new(t) return t or {} end -- constructor - deprecated!

local function change_state(stack_offset, to, ...)
	local pre = stack[#stack]

	-- initialize only on first call
	;(initialized_states[to] or to.init or __NULL__)(to)
	initialized_states[to] = __NULL__

	stack[#stack+stack_offset] = to
	state_is_dirty = true
	return (to.enter or __NULL__)(to, pre, ...)
end

local function snapTransition()
	transition.x = math.floor(transition.x)
end

function GS.switch(to, ...)
	assert(to, "Missing argument: Gamestate to switch to")
	assert(to ~= GS, "Can't call switch with colon operator")
	;(stack[#stack].leave or __NULL__)(stack[#stack])
	return change_state(0, to, ...)
end
initState = true
local transitionTween
function switchState(...)
	if not mukoMode then
		print 'opening the stateeeee'
		drawTransition = true
		if transitionTween then Timer.cancel(transitionTween) end
		local function onComplete()
			drawTransition = false 
			transIn = false
			transitionTween = nil
		end
		if initState then
			initState = false
			transition.x = S_HALF_WIDTH
			transitionTween = Timer.tween(0.5, transition, {x = 1280 + 2164/2}, nil, {after = onComplete, during = snapTransition})
			GS.switch(...)
			return
		end
		local hi = {...}
		transition.x = -2146 + 2164/2
		transOut = true
		transitionTween = Timer.tween(0.5, transition, {x = S_HALF_WIDTH}, nil, {after = function()
			transOut = false
			transition.x = S_HALF_WIDTH
			isLoading = true
			transitionTween = Timer.after(0.000001, function() --make sure the screen is entirely covered
				GS.preleave()
				transIn = true
				isLoading = false
				paths.clearing = true --im going to do it
				paths.clearCache()
				shaders:clear()
				if substate then closeSubstate() end
				screenAngle, screenRadian = 0, 0
				screenInfo = {x=0,y=0,scale=1}
				GS.switch(unpack(hi)) 
				transitionTween = Timer.tween(0.5, transition, {x = 1280 + 2164/2}, nil, {after = onComplete, during = snapTransition})
				paths.clearing = false
			end)
		end, during = snapTransition})
	else
		GS.switch(...)
	end
end

function GS.push(to, ...)
	assert(to, "Missing argument: Gamestate to switch to")
	assert(to ~= GS, "Can't call push with colon operator")
	return change_state(1, to, ...)
end

function GS.pop(...)
	assert(#stack > 1, "No more states to pop!")
	local pre, to = stack[#stack], stack[#stack-1]
	stack[#stack] = nil
	;(pre.leave or __NULL__)(pre)
	state_is_dirty = true
	return (to.resume or __NULL__)(to, pre, ...)
end

function GS.current()
	return stack[#stack]
end

-- XXX: don't overwrite love.errorhandler by default:
--      this callback is different than the other callbacks
--      (see http://love2d.org/wiki/love.errorhandler)
--      overwriting thi callback can result in random crashes (issue #95)
local all_callbacks = { 'draw', 'update' }

-- fetch event callbacks from love.handlers
for k in pairs(love.handlers) do
	all_callbacks[#all_callbacks+1] = k
end

function GS.registerEvents(callbacks)
	local registry = {}
	callbacks = callbacks or all_callbacks
	for _, f in ipairs(callbacks) do
		registry[f] = love[f] or __NULL__
		love[f] = function(...)
			registry[f](...)
			return GS[f](...)
		end
	end
end

-- forward any undefined functions
setmetatable(GS, {__index = function(_, func)
	-- call function only if at least one 'update' was called beforehand
	-- (see issue #46)
	if not state_is_dirty or func == 'update' then
		state_is_dirty = false
		return function(...)
			return (stack[#stack][func] or __NULL__)(stack[#stack], ...)
		end
	end
	return __NULL__
end})

return GS
