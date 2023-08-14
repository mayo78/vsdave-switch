function onCreatePost()
  setGraphicSize('dad', toInt((getProperty('dad.width') * 1.3) / 1.02))
  
  initLuaShader('GlitchShader')
  makeLuaSprite('camShader')
  setSpriteShader('camShader', 'GlitchShader')
  makeGraphic("camShader", screenWidth, screenHeight)
  addHaxeLibrary("ShaderFilter", "openfl.filters")
	-- runHaxeCode([[
	-- 	game.camHUD.setFilters([new ShaderFilter(game.getLuaObject("camShader").shader)]);
	-- ]])
end
elapsedTime = 0
function onUpdate(elapsed)
  elapsedTime = elapsedTime + elapsed
  setShaderFloat('camShader', 'uTime', elapsedTime)
end
function toInt(num)
  addHaxeLibrary('Std')
  if type(num) ~= 'number' then
    debugPrint('idiot number needed in toInt function')
    return 0;
  end
  return runHaxeCode('return Std.int('..tostring(num)..');')
end