--this is the file that is the most "ported" from haxe, so all credits go to the person who wrote the really long array
local function new_Person(name, type, socials)
	return {
		name = name,
		type = type,
		socials = socials,
		desc = lm.string['credit_'..name]
	}
end
local function new_Social(social, url)
	return {
		social = social,
		url = url
	}
end
local CreditsType = {
	Dev = 'Developers',
	Translator = 'Translators',
	Contributor = 'Contributors',
	BetaTester = 'Beta Testers',
	SpecialThanks = 'Special Thanks'
}
local CreditsImage
local peopleInCredits = 
{
	--//Developers //
   new_Person("MoldyGH", CreditsType.Dev,
   {
	  new_Social('youtube', 'https://www.youtube.com/channel/UCHIvkOUDfbMCv-BEIPGgpmA'), 
	  new_Social('twitter', 'https://twitter.com/moldy_gh'),
	  new_Social('soundcloud', 'https://soundcloud.com/moldygh')
   }),
  
   new_Person("MissingTextureMan101", CreditsType.Dev,
   {
	  new_Social('youtube', 'https://www.youtube.com/channel/UCCJna2KG54d1604L2lhZINQ'),
	  new_Social('twitter', 'https://twitter.com/OfficialMTM101'),
	  new_Social('twitch', 'https://www.twitch.tv/missingtextureman101'),
	  new_Social('gamebanana', 'https://gamebanana.com/members/1665049')
   }),
   
   new_Person("rapparep lol", CreditsType.Dev,
   {
	  new_Social('youtube', 'https://www.youtube.com/channel/UCKfdkmcdFftv4pFWr0Bh45A'),
	  new_Social('twitter', 'https://twitter.com/rappareplol')
   }),

   new_Person("TheBuilderXD", CreditsType.Dev,
   {
	  new_Social('youtube', 'https://www.youtube.com/user/99percentMember'),
	  new_Social('twitter', 'https://twitter.com/TheBuilderXD')
   }),

   new_Person("Erizur", CreditsType.Dev,
   {
	  new_Social('youtube', 'https://www.youtube.com/channel/UCdCAaQzt9yOGfFM0gJDJ4bQ'),
	  new_Social('twitter', 'https://twitter.com/am_erizur')
   }),
   
   new_Person("T5mpler", CreditsType.Dev,
   {
	  new_Social('youtube', 'https://www.youtube.com/channel/UCgNoOsE_NDjH6ac4umyADrw'),
	  new_Social('twitter', 'https://twitter.com/RealT5mpler'),
	  new_Social('soundcloud', 'https://soundcloud.com/t5mpler')
   }),
   new_Person("Zmac", CreditsType.Dev,
   {
	  new_Social('youtube', 'https://www.youtube.com/channel/UCl50Xru1nLBENuLiQBt6VRg')
   }),
   new_Person("pointy", CreditsType.Dev,
   {
	  new_Social('youtube', 'https://www.youtube.com/channel/UCRKMTB-VvZlXig4gChk5jtg'),
	  new_Social('twitter', 'https://twitter.com/PointyyESM')
   }),
   new_Person("Billy Bobbo", CreditsType.Dev,
   {
	  new_Social('youtube', 'https://www.youtube.com/channel/UCWbxUPrpRb3lWFHULkmR0IQ'),
	  new_Social('twitter', 'https://twitter.com/BillyBobboLOL')
   }),

   --//Translators //
   
   new_Person("dani", CreditsType.Translator,
   {
	  new_Social('youtube', 'https://youtube.com/channel/UCzCcYbUwbtSJcAQH0IZl-pA'),
	  new_Social('twitter', 'https://twitter.com/danicheese99')
   }),
   
   new_Person("Aizakku", CreditsType.Translator,
   {
	  new_Social('youtube', 'https://www.youtube.com/channel/UCmSCR85PlhbHGHm-wxiA6sA'),
	  new_Social('twitter', 'https://twitter.com/ItsAizakku')
   }),
   
   new_Person("Soulegal", CreditsType.Translator,
   {
		 new_Social('youtube', 'https://www.youtube.com/channel/UC7VSf4ITAMN83hL3zQbqt3w'),
		 new_Social('twitter', 'https://twitter.com/nickstwt')
   }),
   
   --//Contributors //
   new_Person("Steph45", CreditsType.Contributor,
   {
	  new_Social('youtube', 'https://www.youtube.com/channel/UClb4YjR8i74G-ue2nyiH2DQ')
   }),
   new_Person("evdial", CreditsType.Contributor,
   {

   }),
   new_Person("wugalex", CreditsType.Contributor,
   {
	  
   }),
   new_Person("Jukebox", CreditsType.Contributor,
   {
	  new_Social('twitter', 'https://twitter.com/Juk3b0x_'),
	  new_Social('youtube', 'https://www.youtube.com/channel/UCwA3jnG5cu3toaVCOhc-Tqw'),
   }),
   
   new_Person("Oxygen", CreditsType.Contributor,
   {
	  new_Social('soundcloud', 'https://soundcloud.com/oxygendude2000'),
	  new_Social('twitter', 'https://twitter.com/oxygenboi2000'),
	  new_Social('youtube', 'https://youtube.com/channel/UCgTW7cQcfqduIqlu-bSZGZg')
   }),
   new_Person("Alexander Cooper 19", CreditsType.Contributor,
   {
	  new_Social('youtube', 'https://www.youtube.com/channel/UCNz20AHJq41rkBUsq8RmUfQ'),
	  new_Social('twitter', 'https://twitter.com/Zander_cooper19')
   }),
   new_Person("Aadsta", CreditsType.Contributor,
   {
	  new_Social('twitter', 'https://twitter.com/FullNameDeTrain')
   }),
   new_Person("Top 10 Awesome", CreditsType.Contributor,
   {
	  new_Social('youtube', 'https://www.youtube.com/c/Top10Awesome')
   }),
   new_Person("Sky!", CreditsType.Contributor,
   {  
	  new_Social ('youtube', 'https://www.youtube.com/c/Grantare'),
   }),
   new_Person("Ruby", CreditsType.Contributor,
   {  
	  new_Social ('youtube', 'https://youtube.com/c/RubysArt_'),
	  new_Social ('twitter', 'https://twitter.com/RubysArt_')
   }),
   new_Person("Lancey", CreditsType.Contributor,
   {  
	  new_Social('youtube', 'https://youtube.com/c/Lancey170'),
	  new_Social('twitter', 'https://twitter.com/Lancey170')
   }),
   new_Person("Cup", CreditsType.Contributor,
   {  
	  new_Social('youtube', 'https://youtube.com/channel/UCEeVFDTzxe2K8dMng_7YU7A'),
   }),
   new_Person("ShiftyTM", CreditsType.Contributor,
   {  
	  new_Social('youtube', 'https://youtube.com/channel/UC8NHfjpy6tNWgnM7889S1Ew'),
   }),
   
   new_Person("Paraso", CreditsType.Contributor,
   {  

   }),
   new_Person("SAMMYPIGZY", CreditsType.Contributor,
   {  
	  new_Social('youtube', 'https://www.youtube.com/channel/UCVbNlXsQ-9WA2WcN8u2se_Q'),
	  new_Social('twitter', 'https://twitter.com/TH3_R34L_D34L')
   }),
   
--   new_Person("R34LD34L", CreditsType.Contributor,
--   {  

--   }),
   
   new_Person("Devianator", CreditsType.Contributor,
   {
	  new_Social('youtube', 'https://www.youtube.com/channel/UCcaYOWO98UIsJ54t_aV6JHw'),
	  new_Social('twitter', 'https://twitter.com/devianator404')
   }),
   
   new_Person("sk0rbias", CreditsType.Contributor,
   {
	  new_Social('youtube', 'https://www.youtube.com/channel/UCTz8DmuC85UN_nspzp3d_VA'),
	  new_Social('twitter', 'https://twitter.com/sk0rbias')
   }),
   new_Person("Your mom", CreditsType.Contributor,
   {  
	  new_Social('youtube', 'https://www.youtube.com/channel/UCeYxPL7ClfwXOOrpbtqJ13g'),
   }),

   new_Person("sibottle", CreditsType.Contributor,
   {  
	  new_Social('youtube', 'https://www.youtube.com/channel/UCqFkjwmaYlnVXwLMw3_AXLA'),
   }),

   new_Person("chromasen", CreditsType.Contributor,
   {
	  new_Social('youtube', 'https://www.youtube.com/channel/UCgGk4oZt3We-ktkEOV9HY1Q'),
   }),

   --//Beta Testers //
   new_Person("letsy", CreditsType.BetaTester,
   {
	  new_Social('youtube', 'https://www.youtube.com/channel/UCPsNWR6RYLRvpDZinADtJ8w'),
	  new_Social('twitter', 'https://twitter.com/Iesty19'),
	--  new_Social('discord', 'ietsy#5140')
   }),
   new_Person("wildy", CreditsType.BetaTester,
   {
	  new_Social('youtube', 'https://www.youtube.com/channel/UCrUhQeLDv7lpZifWfPr4uGQ'),
	  new_Social('twitter', 'https://twitter.com/wildythomas1233')
	  
   }),

   new_Person("peejeada", CreditsType.BetaTester,
   {
	  new_Social('twitter', 'https://twitter.com/tailsmaster1')
   }),
   
   new_Person("bendygaming_1", CreditsType.BetaTester,
   {
	  new_Social('youtube', 'https://www.youtube.com/channel/UCDgAtfpjDW1F2LAk6LzgavA')
   }),
   new_Person("YourAverageMental", CreditsType.BetaTester,
   {
	  new_Social('youtube', 'https://www.youtube.com/channel/UCDgAtfpjDW1F2LAk6LzgavA')
   }),
   new_Person("vex", CreditsType.BetaTester,
   {
	  new_Social('twitter', 'https://twitter.com/vex________')
   }),
   new_Person("xml", CreditsType.BetaTester,
   {
	  new_Social('youtube', 'https://www.youtube.com/channel/UCL5UPJDEFDZLo4D62pcmIBQ'),
	  new_Social('twitter', 'https://twitter.com/AstrayFile')
   }),
   
   new_Person("ztgds", CreditsType.BetaTester,
   {
	  new_Social('youtube', 'https://www.youtube.com/channel/UCUmuZE0RPjvUhB036T6omfQ')
   }),
   new_Person("ashtonyes", CreditsType.BetaTester,
   {
	  new_Social('youtube', 'https://www.youtube.com/channel/UCQkB-JEx7OGdOUxPzcgUkkQ'),
	  new_Social('gamebanana', 'https://gamebanana.com/members/1943292')
   }),
   new_Person("Silver Escaper", CreditsType.BetaTester,
   {
	  new_Social('youtube', 'https://www.youtube.com/channel/UCP9McVE9T5K3pzum48-m6Tg'),
	  new_Social('roblox', 'https://www.roblox.com/users/2546405173/profile'),
	--  new_Social('discord', 'Silver Escaper#8220')
   }),

   new_Person("TrustVVorthy", CreditsType.BetaTester,
   {
	  new_Social('youtube', 'https://www.youtube.com/channel/UC_lJmvYgeAwzcYaeYXlZ7vg')
   }),
   
   new_Person("Gorbini", CreditsType.BetaTester,
   {
	  new_Social("youtube", 'https://www.youtube.com/channel/UC1u46mYMoecfO04dm-9Djjg')
   }),

   new_Person("Log Man", CreditsType.BetaTester,
   {
	  new_Social('twitter', 'https://twitter.com/LogManLoggy'),
	  new_Social('youtube', 'https://www.youtube.com/channel/UCnGg-cLnXuQNfSzIq6xF8hw'),
   }),

   new_Person("Mooncakeez", CreditsType.BetaTester, 
   {
	  new_Social('youtube', 'https://www.youtube.com/channel/UC6lOrY3AkmXWFpaLHwlP-5A')
   }),
   
   new_Person("Foxnap", CreditsType.BetaTester,
   {
	  new_Social("youtube", 'https://www.youtube.com/channel/UCFMq8C3d6QvZlzR8vBBnITg'),
	  new_Social('twitter', 'https://twitter.com/Foxnap2')
   }),
	--   MISSING IMAGE REMIND ME TO FIX LATER
	--   new_Person("lotuswaterz", CreditsType.BetaTester,
	--   {
	--	  new_Social('youtube', 'https://www.youtube.com/channel/UCf0Y-SfRxhrVnggHwwz1CnA'),
	--	  new_Social('twitter', 'https://twitter.com/NIHIILISTIC'),
	--   }),

   new_Person("mantis", CreditsType.BetaTester,
   {
	--  new_Social('discord', 'mantis#6969')
   }),
   
   new_Person("ArturSef", CreditsType.BetaTester, 
   {  
	  new_Social('gamebanana', 'https://gamebanana.com/members/1766076')
   }),
   
   new_Person("normal", CreditsType.BetaTester,
   {
	  new_Social('youtube', 'https://www.youtube.com/channel/UC21TRNz6llg8a6-ur4dSBtw'),
	  new_Social('roblox', 'https://www.roblox.com/users/1368920745')
   }),

   new_Person("Rendurse", CreditsType.BetaTester,
   {
	  new_Social('twitter', 'https://twitter.com/RendurseDev')
   }),
   new_Person("Lordryan1999", CreditsType.BetaTester,
   {
	  new_Social('youtube', 'https://www.youtube.com/channel/UCEdSlV8RvVnEd8w_yQz-Feg'),
	  new_Social('twitter', 'https://twitter.com/lr1999_baldi')
   }),
   new_Person("Vanquiler", CreditsType.BetaTester,
   {
	  new_Social('discord', 'Vanquiler#3026'),
	  new_Social('twitch', 'https://www.twitch.tv/vanquiler'),
	  new_Social('roblox', 'https://www.roblox.com/users/1505830747')
   }),
   new_Person("Villezen", CreditsType.BetaTester,
   {
	  new_Social('youtube', 'https://www.youtube.com/c/Villezen')
   }),
   new_Person("TecheVent", CreditsType.BetaTester,
   {
	  new_Social('youtube', 'https://www.youtube.com/c/Villezen')
   }),
   new_Person("miko", CreditsType.BetaTester,
   {
	  new_Social('youtube', 'https://www.youtube.com/channel/UC3mIybwSekVs5VEJSe2yjog')
   }),
   new_Person("Cotiles", CreditsType.BetaTester,
   {
	  new_Social('twitter', 'https://twitter.com/Ctiles1'),
	  new_Social('youtube', 'https://www.youtube.com/channel/UClNnrTqtgzAQ16w4_eC7rwA'),
   }),
   --//Special Thanks //
	new_Person("You!", CreditsType.SpecialThanks, {})
}

local personIndex, socialIndex
local inSocial, canMove

local weirdAlpha

local border, bg

local coolY

local curPerson

local seperators = {}
do
	local lastType
	for i,v in ipairs(peopleInCredits) do
		if lastType ~= v.type then
			--print('adding new thing', lastType, v.type, i)
			table.insert(seperators, i - 1)
			lastType = v.type
		end
	end
	--print(table.concat(seperators, ', '))
end

local function change(how)
	personIndex = personIndex + how
	if personIndex > #peopleInCredits then personIndex = 1
	elseif personIndex < 1 then personIndex = #peopleInCredits 
	end
	coolY[1] = 100 * personIndex
	local lastType
	for i,v in pairs(peopleInCredits) do
		if i > personIndex then break
		elseif lastType ~= v.type then
			lastType = v.type
			coolY[1] = coolY[1] + 128
		end
	end
	curPerson = peopleInCredits[personIndex]
end

local scrolling = false
local logo, logoAlpha

return {
	enter = function(self, _, doScrolling)
		scrolling = doScrolling or false
		--scrolling = true
		personIndex, socialIndex = 1, 1
		coolY = {0, 0}
		canMove = not scrolling
		inSocial = false
		weirdAlpha = {0}
		for i,v in ipairs(peopleInCredits) do
			v.sprite = graphics.newImage(paths.image('dave/title/credits/icons/'..v.type..'/'..(v.name:gsub('!', '')):lower()))
			v.sprite.x = ((#v.name)/2 * 16) + v.sprite.width - 24
			v.sprite.y = (100 * i) + 64
			for _,v in pairs(v.socials) do
				v.sprite = graphics.newImage(paths.image('dave/title/credits/socialMedia/'..v.social))
			end
		end
		CreditsImage = {}
		for k,v in pairs(CreditsType) do
			CreditsImage[v] = graphics.newImage(paths.image('dave/title/credits/titles/'..v:lower()))
		end
		bg = graphics.newImage(paths.image(funkin.randomBG()))
		if not scrolling then
			border = graphics.newImage(paths.image('dave/title/CoolOverlay'))
			change(0)
		else
			logoAlpha = {0}
			logo = graphics:newAnimatedSprite('dave/title/logoBumpin', {{name = 'logo bumpin', anim = 'idle', loops = true}}, 'idle', true)
			love.audio.stop()
			local hi = paths.music 'creditsTheme'
			hi:play()
			coolY[2] = -230
			Timer.tween(hi:getDuration 'seconds' - 10.5, coolY, {[2] = peopleInCredits[#peopleInCredits].sprite.y + 1010}, nil, function()
				Timer.tween(5.6, logoAlpha, {1}, 'in-quad', function()
					Timer.after(hi:getDuration 'seconds' - hi:tell 'seconds', function()
						save.save.seenCredits = true
						save.writeSave()
						paths.music 'theend':play()
						switchState(menuSelect)
					end)
				end)
			end)
		end
	end,
	update = function(self, dt)
		if canMove then
			if not inSocial then
				if controls.pressed.down then
					change(1)
				elseif controls.pressed.up then
					change(-1)
				elseif controls.pressed.confirm then
					socialIndex = 1
					inSocial = true
					canMove = false
					Timer.tween(0.25, weirdAlpha, {1}, nil, function()
						canMove = true
					end)
				elseif controls.pressed.back then
					switchState(menuSelect)
				end
			else
				if controls.pressed.down then
					socialIndex = socialIndex + 1
					if socialIndex > #curPerson.socials then socialIndex = 1 end
				elseif controls.pressed.up then
					socialIndex = socialIndex - 1
					if socialIndex < 1 then socialIndex = #curPerson.socials end
				elseif controls.pressed.confirm and #curPerson.socials > 0 then
					love.system.openURL(curPerson.socials[socialIndex].url)
				elseif controls.pressed.back then
					inSocial = false
					Timer.tween(0.25, weirdAlpha, {0})
				end
			end
		end
		if not scrolling then
			coolY[2] = lerp(coolY[2], coolY[1], dt * 30)
		else
			if controls.down.confirm then
				paths.music 'creditsTheme':setPitch(10)
				for _=1,9 do
					Timer.update(dt)
				end
			else
				paths.music'creditsTheme':setPitch(1)
			end
		end
	end,
	draw = function(self)
		local myAlpha = 1 - weirdAlpha[1]
		love.graphics.push()
		love.graphics.translate(S_HALF_WIDTH, S_HALF_HEIGHT)
		if not scrolling then
			graphics.setColor(0, 1, 0)
		else
			graphics.setColor(0.25, 0.25, 0.25)
		end
		--love.graphics.push()
		--love.graphics.scale(lovesize.reverseAspectScale)
		bg:draw()
		--love.graphics.pop()
		if not scrolling then
			border:draw()
		end
		graphics.setColor(1, 1, 1)
		if scrolling and logoAlpha[1] > 0 then
			graphics.setColor(1, 1, 1, logoAlpha[1])
			logo:draw()
		end
		--fonts('comic', 32)
		love.graphics.translate(0, -coolY[2] - 32) --finally putting this function to good use
		local lastType
		local offset = 0
		for i,v in pairs(peopleInCredits) do
			if lastType ~= v.type then
				offset = offset + 1
				lastType = v.type
				if not scrolling then
					graphics.setColor(1, 1, 1, myAlpha)
					CreditsImage[v.type].x = ((#v.type)/2 * 32) + 104
					CreditsImage[v.type].y = v.sprite.y + 32
					CreditsImage[v.type]:draw()
				end
				fonts('comic', 64)
				printfOutline(v.type, -curFont:getWidth(v.type)/2, v.sprite.y, nil, {depth = 0.15, alpha = myAlpha, color = scrolling and {1, 0, 1} or {1, 1, 1}})
				fonts('comic', 32)
				love.graphics.translate(0, 128) --x2
			end
			printfOutline(v.name, -curFont:getWidth(v.name)/2, v.sprite.y, nil, {alpha = myAlpha, color =  ((i == personIndex and not scrolling) and {1, 1, 0} or nil)})
			graphics.setColor(1, 1, 1, myAlpha)
			if not scrolling then
				v.sprite:draw()
			end
		end
		love.graphics.pop()
		love.graphics.push()
		if inSocial then
			graphics.setColor(0, 0, 0, weirdAlpha[1] * 0.5)
			love.graphics.rectangle('fill', 0, 0, GAMESIZE.width, GAMESIZE.height)
			love.graphics.translate(S_HALF_WIDTH, 0)
			printfOutline(curPerson.name, -curFont:getWidth(curPerson.name)/2, 64, nil, {alpha = weirdAlpha[1]})
			printfOutline(curPerson.desc, -curFont:getWidth(curPerson.desc)/2, 128, nil, {alpha = weirdAlpha[1]})
			love.graphics.translate(0, 128)
			for i,v in ipairs(curPerson.socials) do
				love.graphics.translate(0, 128)
				graphics.setColor(1, 1, 1, (socialIndex == i and 1 or 0.5) * weirdAlpha[1])
				v.sprite:draw()
			end
		end
		love.graphics.pop()
	end,
	leave = function(self)
		Timer.clear()
	end
}