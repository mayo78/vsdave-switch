--a bit messy and i think there can only be one of each shader at a time but there never needs to be more
local s = {}
local shaders = {} --not the module btw
local GLITCH_FRAG = [[
	#pragma header
	//uniform float tx, ty; // x,y waves phase

	//modified version of the wave shader to create weird garbled corruption like messes
	uniform float uTime = 0;

	/**
	* How fast the waves move over time
	*/
	uniform float uSpeed = 2;

	/**
	* Number of waves over time
	*/
	uniform float uFrequency = 5;

	/**
	* How much the pixels are going to stretch over the waves
	*/
	uniform float uWaveAmplitude = 0.1;

	vec2 sineWave(vec2 pt)
	{
		float x = 0.0;
		float y = 0.0;

		float offsetX = sin(pt.y * uFrequency + uTime * uSpeed) * (uWaveAmplitude / pt.x * pt.y);
		float offsetY = sin(pt.x * uFrequency - uTime * uSpeed) * (uWaveAmplitude / pt.y * pt.x);
		pt.x += offsetX; // * (pt.y - 1.0); // <- Uncomment to stop bottom part of the screen from moving
		pt.y += offsetY;

		return vec2(pt.x + x, pt.y + y);
	}

	vec4 effect(vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords)
	{
		vec2 uv = sineWave(texture_coords);
		vec4 coolCol = texture2D(texture, uv);
		coolCol.w *= color.w;
		return coolCol;
	}

]]
function s:GLITCH(waveAmp, waveFreq, waveSpeed)
	local hi = {shader = love.graphics.newShader(GLITCH_FRAG), time = 0}
	hi.shader:send('uSpeed', waveSpeed or 2)
	hi.shader:send('uFrequency', waveFreq or 5)
	hi.shader:send('uWaveAmplitude', waveAmp or 0.1)
	hi.time = 0
	hi.active = true
	table.insert(shaders, hi)
	return hi.shader
end
local EYESORE_FRAG = [[
	#pragma header
    uniform float uampmul;

    //modified version of the wave shader to create weird garbled corruption like messes
    uniform float uTime;
    
    /**
     * How fast the waves move over time
     */
    uniform float uSpeed;
    
    /**
     * Number of waves over time
     */
    uniform float uFrequency;

    uniform bool uEnabled;
    
    /**
     * How much the pixels are going to stretch over the waves
     */
    uniform float uWaveAmplitude;

    vec4 sineWave(vec4 pt, vec2 pos)
    {
        if (uampmul > 0.0)
        {
            float offsetX = sin(pt.y * uFrequency + uTime * uSpeed);
            float offsetY = sin(pt.x * (uFrequency * 2.0) - (uTime / 2.0) * uSpeed);
            float offsetZ = sin(pt.z * (uFrequency / 2.0) + (uTime / 3.0) * uSpeed);
            pt.x = mix(pt.x,sin(pt.x / 2.0 * pt.y + (5.0 * offsetX) * pt.z),uWaveAmplitude * uampmul);
            pt.y = mix(pt.y,sin(pt.y / 3.0 * pt.z + (2.0 * offsetZ) - pt.x),uWaveAmplitude * uampmul);
            pt.z = mix(pt.z,sin(pt.z / 6.0 * (pt.x * offsetY) - (50.0 * offsetZ) * (pt.z * offsetX)),uWaveAmplitude * uampmul);
        }
        return vec4(pt.x, pt.y, pt.z, pt.w);
    }

	vec4 effect(vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords)
	{
        vec2 uv = texture_coords;
        return color * sineWave(texture2D(texture, uv),uv);
    }
]]
function s:EYESORE()
	local hi = {shader = love.graphics.newShader(EYESORE_FRAG), time = 0, enabled = false}
	local wtf = 0
	hi.shader:send('uSpeed', waveSpeed or 1)
	hi.shader:send('uFrequency', waveFreq or 1)
	hi.shader:send('uWaveAmplitude', waveAmp or 0.5)
	hi.shader:send('uampmul', 0)
	hi.time = love.math.random(-100, 100)
	hi.active = true
	function hi:update(dt)
		if self.enabled then
			wtf = 1
		elseif wtf > 0 then
			wtf = wtf - dt/2
			if wtf < 0 then wtf = 0 end
		end
		hi.shader:send('uampmul', wtf)
	end
	function hi:die()
		hi.shader:send('uampmul', 0)
	end
	table.insert(shaders, hi)
	return hi
end
local REPEAT_FRAG = [[
	#pragma header

	float alpha;
	uniform float uTime;

	vec4 effect(vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords) {
		vec2 st = texture_coords.xy / vec2(1280, 720);

		st *= 1.05; // size each shitter
		st.x += uTime / 4;
		st.y -= uTime / 4;
		st = fract(st); // Wrap around 1.0
		
		alpha = uTime / -10;
		
		vec4 awesome = texture2D(texture, st);
		
		if(awesome.w != 0) //didnt work how i wanted it to but it looked cooler so
		{
			awesome.w = alpha;
		}
		return awesome;
	}
]]
function s:REPEAT()
	local hi = {shader = love.graphics.newShader(REPEAT_FRAG), time = 0, enabled = false}
	hi.shader:send('uTime', 0)
	table.insert(shaders, hi)
	return hi
end
local BLOCKED_FRAG = [[
	#pragma header

    // ---- gllock required fields -----------------------------------------------------------------------------------------
    #define RATE 0.75
    
    uniform float uTime;
    uniform float end;
    uniform vec2 screenSize;
    // ---------------------------------------------------------------------------------------------------------------------
    
    float rand(vec2 co){
      return fract(sin(dot(co.xy ,vec2(12.9898,78.233))) * 43758.5453) * 2.0 - 1.0;
    }
    
    float offset(float blocks, vec2 uv) {
      float shaderTime = uTime*RATE;
      return rand(vec2(shaderTime, floor(uv.y * blocks)));
    }
    
	vec4 effect(vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords) {
      vec2 uv = texture_coords;
      vec4 coolCol = texture2D(texture, uv);
      coolCol.r = texture2D(texture, uv + vec2(offset(64.0, uv) * 0.03, 0.0)).r * color.r;
      coolCol.g = texture2D(texture, uv + vec2(offset(64.0, uv) * 0.03 * 0.16666666, 0.0)).g * color.g;
      coolCol.b = texture2D(texture, uv + vec2(offset(64.0, uv) * 0.03, 0.0)).b * color.b;
	  coolCol.w = texture2D(texture, uv).w * color.w;
	  return coolCol;
    }
]]
function s:BLOCKED(waveAmp, waveFreq, waveSpeed)
	local hi = {shader = love.graphics.newShader(BLOCKED_FRAG), time = 0, enabled = false}
	hi.time = 0
	hi.active = true
	table.insert(shaders, hi)
	return hi.shader
end
function s:update(dt)
	for _,shader in pairs(shaders) do
		if shader.active and (not statePaused or shader.forceUpdate) then 
			shader.time = shader.time + dt
			shader.shader:send('uTime', shader.time)
			if shader.update then shader:update(dt) end
		end
	end
end
function s:clear()
	for k,shader in pairs(shaders) do
		shader.active = false
		shader.time = 0
		shader.forceUpdate = false
		shader.shader:send('uTime', 0)
		if shader.die then shader:die() end
		shader.shader:release()
		table.clear(shader)
		shaders[k] = nil
	end
end
return s;