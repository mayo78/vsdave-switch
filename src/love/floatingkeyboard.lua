--in its out lua file since its kinda big
local KEYSIZE = 72
--copied from flxkey
local ANY = -2;
local NONE = -1;
local A = 65;
local B = 66;
local C = 67;
local D = 68;
local E = 69;
local F = 70;
local G = 71;
local H = 72;
local I = 73;
local J = 74;
local K = 75;
local L = 76;
local M = 77;
local N = 78;
local O = 79;
local P = 80;
local Q = 81;
local R = 82;
local S = 83;
local T = 84;
local U = 85;
local V = 86;
local W = 87;
local X = 88;
local Y = 89;
local Z = 90;
local ZERO = 48;
local ONE = 49;
local TWO = 50;
local THREE = 51;
local FOUR = 52;
local FIVE = 53;
local SIX = 54;
local SEVEN = 55;
local EIGHT = 56;
local NINE = 57;
local PAGEUP = 33;
local PAGEDOWN = 34;
local HOME = 36;
local END = 35;
local INSERT = 45;
local ESCAPE = 27;
local MINUS = 189;
local EQUALS = 187;
local DELETE = 46;
local BACKSPACE = 8;
local LBRACKET = 219;
local RBRACKET = 221;
local BACKSLASH = 220;
local CAPSLOCK = 20;
local SCROLL_LOCK = 145;
local NUMLOCK = 144;
local SEMICOLON = 186;
local QUOTE = 222;
local ENTER = 13;
local SHIFT = 16;
local COMMA = 188;
local PERIOD = 190;
local SLASH = 191;
local GRAVEACCENT = 192;
local CONTROL = 17;
local ALT = 18;
local SPACE = 32;
local UP = 38;
local DOWN = 40;
local LEFT = 37;
local RIGHT = 39;
local TAB = 9;
local WINDOWS = 15;
local MENU = 302;
local PRINTSCREEN = 301;
local BREAK = 19;
local F1 = 112;
local F2 = 113;
local F3 = 114;
local F4 = 115;
local F5 = 116;
local F6 = 117;
local F7 = 118;
local F8 = 119;
local F9 = 120;
local F10 = 121;
local F11 = 122;
local F12 = 123;
local NUMPADZERO = 96;
local NUMPADONE = 97;
local NUMPADTWO = 98;
local NUMPADTHREE = 99;
local NUMPADFOUR = 100;
local NUMPADFIVE = 101;
local NUMPADSIX = 102;
local NUMPADSEVEN = 103;
local NUMPADEIGHT = 104;
local NUMPADNINE = 105;
local NUMPADMINUS = 109;
local NUMPADPLUS = 107;
local NUMPADPERIOD = 110;
local NUMPADMULTIPLY = 106;
local NUMPADSLASH = 111;

local function key(id, string, left, right, up, down, alt)
	return {
		id = id,
		name = tostring(string),
		left = left or NONE,
		right = right or NONE,
		up = up or NONE,
		down = down or NONE,
		alt = tostring(alt or string:upper())
	}
end
local keys = {
	--NONE = key(-1, 'none'),
	A = key(A, 'a', NONE, S, Q, Z),
	B = key(B, 'b', V, N, G, SPACE),
	C = key(C, 'c', X, V, D, SPACE),
	D = key(D, 'd', S, F, E, C),
	E = key(E, 'e', W, R, THREE, D),
	F = key(F, 'f', D, G, R, V),
	G = key(G, 'g', F, H, T, B),
	H = key(H, 'h', G, J, Y, N),
	I = key(I, 'i', U, O, EIGHT, K),
	J = key(J, 'j', H, K, U, M),
	K = key(K, 'k', J, L, I, COMMA),
	L = key(L, 'l', K, SEMICOLON, O, PERIOD),
	M = key(M, 'm', N, COMMA, K, SPACE),
	N = key(N, 'n', B, M, H, SPACE),
	O = key(O, 'o', I, P, NINE, L),
	P = key(P, 'p', O, LBRACKET, ZERO, SEMICOLON),
	Q = key(Q, 'q', TAB, W, ONE, A),
	R = key(R, 'r', E, T, FOUR, F),
	S = key(S, 's', A, D, W, X),
	T = key(T, 't', R, Y, FIVE, G),
	U = key(U, 'u', Y, I, SEVEN, J),
	V = key(V, 'v', C, B, F, SPACE),
	W = key(W, 'w', Q, E, TWO, S),
	X = key(X, 'x', Z, C, S, SPACE),
	Y = key(Y, 'y', T, U, SIX, H),
	Z = key(Z, 'z', SHIFT, X, A, SPACE),
	ZERO = key(ZERO, 0, NINE, MINUS, F10, P, ')'),
	ONE = key(ONE, 1, GRAVEACCENT, TWO, F1, Q, '!'),
	TWO = key(TWO, 2, ONE, THREE, F2, W, '@'),
	THREE = key(THREE, 3, TWO, FOUR, F3, E, '#'),
	FOUR = key(FOUR, 4, THREE, FIVE, F4, R, '$'),
	FIVE = key(FIVE, 5, FOUR, SIX, F5, T, '%'),
	SIX = key(SIX, 6, FIVE, SEVEN, F6, Y, '^'),
	SEVEN = key(SEVEN, 7, SIX, EIGHT, F7, U, '&'),
	EIGHT = key(EIGHT, 8, SEVEN, NINE, F8, I, '*'),
	NINE = key(NINE, 9, EIGHT, ZERO, F9, O, '('),
	ESCAPE = key(ESCAPE, 'escape', NONE, F1, NONE, GRAVEACCENT),
	MINUS = key(MINUS, '-', ZERO, EQUALS, F11, LBRACKET, '_'),
	EQUALS = key(EQUALS, '=', MINUS, BACKSPACE, F11, RBRACKET, '+'),
	BACKSPACE = key(BACKSPACE, '<==', EQUALS, NONE, F12, BACKSLASH),
	LBRACKET = key(LBRACKET, '[', P, RBRACKET, MINUS, QUOTE, '{'),
	RBRACKET = key(RBRACKET, ']', LBRACKET, BACKSLASH, EQUALS, ENTER, '}'),
	BACKSLASH = key(BACKSLASH, '\\', RBRACKET, NONE, BACKSPACE, ENTER, '|'),
	SEMICOLON = key(SEMICOLON, ';', L, QUOTE, P, SLASH, ':'),
	QUOTE = key(QUOTE, "'", SEMICOLON, ENTER, LBRACKET, NONE, '"'),
	ENTER = key(ENTER, 'enter', QUOTE, NONE, RBRACKET, NONE),
	SHIFT = key(SHIFT, 'shift', NONE, Z, CAPSLOCK, CONTROL),
	COMMA = key(COMMA, ',', M, PERIOD, K, SPACE, '<'),
	PERIOD = key(PERIOD, '.', COMMA, SLASH, L, SPACE, '>'),
	SLASH = key(SLASH, '/', PERIOD, NONE, SEMICOLON, SPACE),
	GRAVEACCENT = key(GRAVEACCENT, '`', NONE, ONE, ESCAPE, TAB, '~'),
	SPACE = key(SPACE, ' ', NONE, NONE, B, NONE),
}
local NEWLINE = 'nl'
local layout = {
	ESCAPE,NEWLINE,
	GRAVEACCENT,ONE,TWO,THREE,FOUR,FIVE,SIX,SEVEN,EIGHT,NINE,ZERO,MINUS,EQUALS,BACKSPACE,NEWLINE,
	Q,W,E,R,T,Y,U,I,O,P,LBRACKET,RBRACKET,BACKSLASH,NEWLINE,
	A,S,D,F,G,H,J,K,L,SEMICOLON,QUOTE,ENTER,NEWLINE,
	SHIFT,Z,X,C,V,B,N,M,COMMA,PERIOD,SLASH,NEWLINE,
	SPACE
}

local function so(scale, offset) return {scale=scale or point(1,1),offset=offset or point()} end
local transforms = {
	ESCAPE = so(point(1, 0.6)),
	Q = so(nil, point(KEYSIZE * 1.1, 0)),
	A = so(nil, point(KEYSIZE * 1.2, 0)),
	SHIFT = so(point(2, 1), point((-KEYSIZE*2)+(KEYSIZE+2))),
	SPACE = so(point(10, 1), point(-KEYSIZE*7, 0)),
	default = so(),
	Z = so(nil, point(KEYSIZE)),
	ENTER = so(point(2,1), point(-KEYSIZE))
}

local keyIdMap = {}

for i,v in pairs(keys) do
	v.NAMEID = i
	keyIdMap[v.id] = v
end
return function() 
	local curKey = keys.Q
	local shiftMode = false
	local lastKey
	local lastactive = false
	local pressed
	local canjustpressed = true
	local justpressed
	local permashift = false
	return {
		pressKey = function(self, curKey)
			if curKey.id == SHIFT then
				if permashift then 
					permashift = false
					shiftMode = false
				elseif shiftMode then permashift = true
				else shiftMode = not shiftMode
				end
			else
				if self.onKey then self.onKey(curKey, shiftMode) end
				if not permashift then
					shiftMode = false
				end
			end
			--print('pressed key', curKey.name)
		end,
		active = false,
		update = function(self)
			if self.active ~= lastactive then
				lastactive = self.active
				return
			end
			if not self.active then return end
			if curKey.id ~= SPACE then
				if controls.pressed.left and keyIdMap[curKey.left] then
					lastKey = curKey
					curKey = keyIdMap[curKey.left]
				elseif controls.pressed.right and keyIdMap[curKey.right] then
					lastKey = curKey
					curKey = keyIdMap[curKey.right]
				elseif controls.pressed.up and keyIdMap[curKey.up] then
					lastKey = curKey
					curKey = keyIdMap[curKey.up]
				elseif controls.pressed.down and keyIdMap[curKey.down] then
					lastKey = curKey
					curKey = keyIdMap[curKey.down]
				end
			elseif controls.pressed.up then
				curKey, lastKey = lastKey, curKey
			end
			if controls.pressed.confirm then
				self:pressKey(curKey)
			elseif controls.pressed.back then
				self:pressKey(keys.BACKSPACE)
			elseif controls.pressed['button:y'] then
				self:pressKey(keys.SPACE)
			end
			justpressed = false
			local md = love.mouse.isDown(1)
			if not md and pressed then
				canjustpressed = true
			end
			pressed = md
			if pressed and canjustpressed then
				canjustpressed = false
				local mx, my = love.mouse.getPosition()
				local x,y = self.x,self.y
				local lastKey
				for i,v in pairs(layout) do
					if v == NEWLINE then
						local t = (lastKey and transforms[keyIdMap[lastKey].NAMEID]) or transforms.default
						y = y + ((KEYSIZE*t.scale.y)+2) + t.offset.y
						x = self.x
					else
						local t = transforms[keyIdMap[v].NAMEID] or transforms.default
						x = x + ((KEYSIZE*t.scale.x)+2) + t.offset.x
						local width,height = KEYSIZE*t.scale.x, KEYSIZE*t.scale.y
						if mx > x and mx < x + width and my > y and my < y + height then
							curKey = keyIdMap[v]
							self:pressKey(curKey)
						end
						lastKey = v
					end
				end
			end
		end,
		x = 0,
		y = 0,
		draw = function(self)
			love.graphics.push()
			love.graphics.translate(self.x, self.y)
			local x,y = 0,0
			fonts('comic', 16)
			local lastKey
			for _,v in pairs(layout) do
				if v == NEWLINE then
					local t = (lastKey and transforms[keyIdMap[lastKey].NAMEID]) or transforms.default
					y = y + ((KEYSIZE*t.scale.y)+2) + t.offset.y
					x = 0
				else
					local t = transforms[keyIdMap[v].NAMEID] or transforms.default
					x = x + ((KEYSIZE*t.scale.x)+2) + t.offset.x
					if v == SHIFT and permashift then
						love.graphics.setColor(0.4,0.4,0.4, 0.75)
					elseif v == curKey.id then
						love.graphics.setColor(0.7,0.7,0.7, 0.75)
					else
						love.graphics.setColor(1,1,1, 0.75)
					end
					love.graphics.rectangle('fill', x,y, KEYSIZE * t.scale.x, KEYSIZE * t.scale.y)
					love.graphics.setColor(0,0,0, 0.75)
					local str = shiftMode and keyIdMap[v].alt or keyIdMap[v].name
					--errorData = errorData..'{'..tostring(v)..', '..tostring(str)..', '..keys.ESCAPE.string..'}'
					love.graphics.print(str, x+(KEYSIZE/2)-(curFont:getWidth(str)/2), y+((KEYSIZE*t.scale.y)/2)-(curFont:getHeight()/2))
					lastKey = v
				end
			end
			love.graphics.pop()
		end,
	}
end