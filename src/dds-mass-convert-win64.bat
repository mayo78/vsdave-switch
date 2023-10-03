@echo off

rem --------------------------------------------------------------------------------
rem this isn't a man made file! ai is taking over ! noooooooooooooooooo
rem --------------------------------------------------------------------------------

set texconv=%CD%\bin\texconv\texconv.exe

pushd love\images\png

if exist ..\dds rmdir ..\dds /q /s

echo Converting...

@REM  go to the files.lua file and uncomment the batch script section, run the program and copy and paste the output until the popd thing at the bottom

mkdir ..\dds\images\png
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\images\png -srgb -y images\png\blank.png
rename ..\dds\images\png\blank.DDS blank.dds
mkdir ..\dds\images\png
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\images\png -srgb -y images\png\boyfriend.png
rename ..\dds\images\png\boyfriend.DDS boyfriend.dds
mkdir ..\dds\characters\cool
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\characters\cool -srgb -y characters\cool\bf.png
rename ..\dds\characters\cool\bf.DDS bf.dds
mkdir ..\dds\dave
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave -srgb -y dave\alphabet.png
rename ..\dds\dave\alphabet.DDS alphabet.dds
mkdir ..\dds\dave\backgrounds\backyard
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\backyard -srgb -y dave\backgrounds\backyard\beardude.png
rename ..\dds\dave\backgrounds\backyard\beardude.DDS beardude.dds
mkdir ..\dds\dave\backgrounds\backyard
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\backyard -srgb -y dave\backgrounds\backyard\gates.png
rename ..\dds\dave\backgrounds\backyard\gates.DDS gates.dds
mkdir ..\dds\dave\backgrounds\backyard
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\backyard -srgb -y dave\backgrounds\backyard\grill.png
rename ..\dds\dave\backgrounds\backyard\grill.DDS grill.dds
mkdir ..\dds\dave\backgrounds\backyard
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\backyard -srgb -y dave\backgrounds\backyard\hills.png
rename ..\dds\dave\backgrounds\backyard\hills.DDS hills.dds
mkdir ..\dds\dave\backgrounds\backyard
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\backyard -srgb -y dave\backgrounds\backyard\house.png
rename ..\dds\dave\backgrounds\backyard\house.DDS house.dds
mkdir ..\dds\dave\backgrounds\backyard
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\backyard -srgb -y dave\backgrounds\backyard\supergrass.png
rename ..\dds\dave\backgrounds\backyard\supergrass.DDS supergrass.dds
mkdir ..\dds\dave\backgrounds\bedroom
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\bedroom -srgb -y dave\backgrounds\bedroom\bed.png
rename ..\dds\dave\backgrounds\bedroom\bed.DDS bed.dds
mkdir ..\dds\dave\backgrounds\bedroom
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\bedroom -srgb -y dave\backgrounds\bedroom\bg.png
rename ..\dds\dave\backgrounds\bedroom\bg.DDS bg.dds
mkdir ..\dds\dave\backgrounds\bedroom\night
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\bedroom\night -srgb -y dave\backgrounds\bedroom\night\bed.png
rename ..\dds\dave\backgrounds\bedroom\night\bed.DDS bed.dds
mkdir ..\dds\dave\backgrounds\bedroom\night
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\bedroom\night -srgb -y dave\backgrounds\bedroom\night\bg.png
rename ..\dds\dave\backgrounds\bedroom\night\bg.DDS bg.dds
mkdir ..\dds\dave\backgrounds\bedroom\night
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\bedroom\night -srgb -y dave\backgrounds\bedroom\night\ruby.png
rename ..\dds\dave\backgrounds\bedroom\night\ruby.DDS ruby.dds
mkdir ..\dds\dave\backgrounds\bedroom
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\bedroom -srgb -y dave\backgrounds\bedroom\ruby.png
rename ..\dds\dave\backgrounds\bedroom\ruby.DDS ruby.dds
mkdir ..\dds\dave\backgrounds\bedroom
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\bedroom -srgb -y dave\backgrounds\bedroom\sky.png
rename ..\dds\dave\backgrounds\bedroom\sky.DDS sky.dds
mkdir ..\dds\dave\backgrounds\bedroom
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\bedroom -srgb -y dave\backgrounds\bedroom\tristansitting.png
rename ..\dds\dave\backgrounds\bedroom\tristansitting.DDS tristansitting.dds
mkdir ..\dds\dave\backgrounds\bedroom
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\bedroom -srgb -y dave\backgrounds\bedroom\tv.png
rename ..\dds\dave\backgrounds\bedroom\tv.DDS tv.dds
mkdir ..\dds\dave\backgrounds\charselect
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\charselect -srgb -y dave\backgrounds\charselect\behindgrass.png
rename ..\dds\dave\backgrounds\charselect\behindgrass.DDS behindgrass.dds
mkdir ..\dds\dave\backgrounds\charselect
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\charselect -srgb -y dave\backgrounds\charselect\frontgrass.png
rename ..\dds\dave\backgrounds\charselect\frontgrass.DDS frontgrass.dds
mkdir ..\dds\dave\backgrounds\charselect
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\charselect -srgb -y dave\backgrounds\charselect\gateleft.png
rename ..\dds\dave\backgrounds\charselect\gateleft.DDS gateleft.dds
mkdir ..\dds\dave\backgrounds\charselect
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\charselect -srgb -y dave\backgrounds\charselect\gateright.png
rename ..\dds\dave\backgrounds\charselect\gateright.DDS gateright.dds
mkdir ..\dds\dave\backgrounds\charselect
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\charselect -srgb -y dave\backgrounds\charselect\grass.png
rename ..\dds\dave\backgrounds\charselect\grass.DDS grass.dds
mkdir ..\dds\dave\backgrounds\charselect
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\charselect -srgb -y dave\backgrounds\charselect\hills.png
rename ..\dds\dave\backgrounds\charselect\hills.DDS hills.dds
mkdir ..\dds\dave\backgrounds\charselect
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\charselect -srgb -y dave\backgrounds\charselect\house.png
rename ..\dds\dave\backgrounds\charselect\house.DDS house.dds
mkdir ..\dds\dave\backgrounds\dave-house
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\dave-house -srgb -y dave\backgrounds\dave-house\gate.png
rename ..\dds\dave\backgrounds\dave-house\gate.DDS gate.dds
mkdir ..\dds\dave\backgrounds\dave-house
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\dave-house -srgb -y dave\backgrounds\dave-house\grass bg.png
rename ..\dds\dave\backgrounds\dave-house\grass bg.DDS grass bg.dds
mkdir ..\dds\dave\backgrounds\dave-house
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\dave-house -srgb -y dave\backgrounds\dave-house\grass.png
rename ..\dds\dave\backgrounds\dave-house\grass.DDS grass.dds
mkdir ..\dds\dave\backgrounds\dave-house
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\dave-house -srgb -y dave\backgrounds\dave-house\hills.png
rename ..\dds\dave\backgrounds\dave-house\hills.DDS hills.dds
mkdir ..\dds\dave\backgrounds\dave-house
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\dave-house -srgb -y dave\backgrounds\dave-house\icantbelieveihavetoclarifythis.png
rename ..\dds\dave\backgrounds\dave-house\icantbelieveihavetoclarifythis.DDS icantbelieveihavetoclarifythis.dds
mkdir ..\dds\dave\backgrounds\dave-house
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\dave-house -srgb -y dave\backgrounds\dave-house\land.png
rename ..\dds\dave\backgrounds\dave-house\land.DDS land.dds
mkdir ..\dds\dave\backgrounds\dave-house\night
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\dave-house\night -srgb -y dave\backgrounds\dave-house\night\gate.png
rename ..\dds\dave\backgrounds\dave-house\night\gate.DDS gate.dds
mkdir ..\dds\dave\backgrounds\dave-house\night
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\dave-house\night -srgb -y dave\backgrounds\dave-house\night\grass bg.png
rename ..\dds\dave\backgrounds\dave-house\night\grass bg.DDS grass bg.dds
mkdir ..\dds\dave\backgrounds\dave-house\night
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\dave-house\night -srgb -y dave\backgrounds\dave-house\night\grass.png
rename ..\dds\dave\backgrounds\dave-house\night\grass.DDS grass.dds
mkdir ..\dds\dave\backgrounds\dave-house\night
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\dave-house\night -srgb -y dave\backgrounds\dave-house\night\hills.png
rename ..\dds\dave\backgrounds\dave-house\night\hills.DDS hills.dds
mkdir ..\dds\dave\backgrounds\farm
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\farm -srgb -y dave\backgrounds\farm\baldo.png
rename ..\dds\dave\backgrounds\farm\baldo.DDS baldo.dds
mkdir ..\dds\dave\backgrounds\farm
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\farm -srgb -y dave\backgrounds\farm\cornbag.png
rename ..\dds\dave\backgrounds\farm\cornbag.DDS cornbag.dds
mkdir ..\dds\dave\backgrounds\farm
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\farm -srgb -y dave\backgrounds\farm\cornfence.png
rename ..\dds\dave\backgrounds\farm\cornfence.DDS cornfence.dds
mkdir ..\dds\dave\backgrounds\farm
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\farm -srgb -y dave\backgrounds\farm\cornfence2.png
rename ..\dds\dave\backgrounds\farm\cornfence2.DDS cornfence2.dds
mkdir ..\dds\dave\backgrounds\farm
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\farm -srgb -y dave\backgrounds\farm\funfarmhouse.png
rename ..\dds\dave\backgrounds\farm\funfarmhouse.DDS funfarmhouse.dds
mkdir ..\dds\dave\backgrounds\farm
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\farm -srgb -y dave\backgrounds\farm\gm_flatgrass.png
rename ..\dds\dave\backgrounds\farm\gm_flatgrass.DDS gm_flatgrass.dds
mkdir ..\dds\dave\backgrounds\farm
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\farm -srgb -y dave\backgrounds\farm\grass lands.png
rename ..\dds\dave\backgrounds\farm\grass lands.DDS grass lands.dds
mkdir ..\dds\dave\backgrounds\farm
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\farm -srgb -y dave\backgrounds\farm\orangey hills.png
rename ..\dds\dave\backgrounds\farm\orangey hills.DDS orangey hills.dds
mkdir ..\dds\dave\backgrounds\farm
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\farm -srgb -y dave\backgrounds\farm\picnic_towel_thing.png
rename ..\dds\dave\backgrounds\farm\picnic_towel_thing.DDS picnic_towel_thing.dds
mkdir ..\dds\dave\backgrounds\farm
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\farm -srgb -y dave\backgrounds\farm\popeye.png
rename ..\dds\dave\backgrounds\farm\popeye.DDS popeye.dds
mkdir ..\dds\dave\backgrounds\farm
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\farm -srgb -y dave\backgrounds\farm\sign.png
rename ..\dds\dave\backgrounds\farm\sign.DDS sign.dds
mkdir ..\dds\dave\backgrounds\festival
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\festival -srgb -y dave\backgrounds\festival\backgrass.png
rename ..\dds\dave\backgrounds\festival\backgrass.DDS backgrass.dds
mkdir ..\dds\dave\backgrounds\festival
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\festival -srgb -y dave\backgrounds\festival\corn.png
rename ..\dds\dave\backgrounds\festival\corn.DDS corn.dds
mkdir ..\dds\dave\backgrounds\festival
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\festival -srgb -y dave\backgrounds\festival\cornglow.png
rename ..\dds\dave\backgrounds\festival\cornglow.DDS cornglow.dds
mkdir ..\dds\dave\backgrounds\festival
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\festival -srgb -y dave\backgrounds\festival\crowd.png
rename ..\dds\dave\backgrounds\festival\crowd.DDS crowd.dds
mkdir ..\dds\dave\backgrounds\festival
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\festival -srgb -y dave\backgrounds\festival\farmhouse.png
rename ..\dds\dave\backgrounds\festival\farmhouse.DDS farmhouse.dds
mkdir ..\dds\dave\backgrounds\festival
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\festival -srgb -y dave\backgrounds\festival\frontgrass.png
rename ..\dds\dave\backgrounds\festival\frontgrass.DDS frontgrass.dds
mkdir ..\dds\dave\backgrounds\festival
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\festival -srgb -y dave\backgrounds\festival\generalglow.png
rename ..\dds\dave\backgrounds\festival\generalglow.DDS generalglow.dds
mkdir ..\dds\dave\backgrounds\festival
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\festival -srgb -y dave\backgrounds\festival\gm_flatgrass.png
rename ..\dds\dave\backgrounds\festival\gm_flatgrass.DDS gm_flatgrass.dds
mkdir ..\dds\dave\backgrounds\festival
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\festival -srgb -y dave\backgrounds\festival\hills.png
rename ..\dds\dave\backgrounds\festival\hills.DDS hills.dds
mkdir ..\dds\dave\backgrounds\festival\maincrowd
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\festival\maincrowd -srgb -y dave\backgrounds\festival\maincrowd\bambi.png
rename ..\dds\dave\backgrounds\festival\maincrowd\bambi.DDS bambi.dds
mkdir ..\dds\dave\backgrounds\festival\maincrowd
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\festival\maincrowd -srgb -y dave\backgrounds\festival\maincrowd\dave.png
rename ..\dds\dave\backgrounds\festival\maincrowd\dave.DDS dave.dds
mkdir ..\dds\dave\backgrounds\festival\maincrowd
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\festival\maincrowd -srgb -y dave\backgrounds\festival\maincrowd\tristan.png
rename ..\dds\dave\backgrounds\festival\maincrowd\tristan.DDS tristan.dds
mkdir ..\dds\dave\backgrounds\festival\scaredcrowd
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\festival\scaredcrowd -srgb -y dave\backgrounds\festival\scaredcrowd\ball.png
rename ..\dds\dave\backgrounds\festival\scaredcrowd\ball.DDS ball.dds
mkdir ..\dds\dave\backgrounds\festival\scaredcrowd
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\festival\scaredcrowd -srgb -y dave\backgrounds\festival\scaredcrowd\bambi.png
rename ..\dds\dave\backgrounds\festival\scaredcrowd\bambi.DDS bambi.dds
mkdir ..\dds\dave\backgrounds\festival\scaredcrowd
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\festival\scaredcrowd -srgb -y dave\backgrounds\festival\scaredcrowd\bimpe.png
rename ..\dds\dave\backgrounds\festival\scaredcrowd\bimpe.DDS bimpe.dds
mkdir ..\dds\dave\backgrounds\festival\scaredcrowd
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\festival\scaredcrowd -srgb -y dave\backgrounds\festival\scaredcrowd\maldo.png
rename ..\dds\dave\backgrounds\festival\scaredcrowd\maldo.DDS maldo.dds
mkdir ..\dds\dave\backgrounds\festival\scaredcrowd
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\festival\scaredcrowd -srgb -y dave\backgrounds\festival\scaredcrowd\memes kids.png
rename ..\dds\dave\backgrounds\festival\scaredcrowd\memes kids.DDS memes kids.dds
mkdir ..\dds\dave\backgrounds\festival\scaredcrowd
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\festival\scaredcrowd -srgb -y dave\backgrounds\festival\scaredcrowd\muko.png
rename ..\dds\dave\backgrounds\festival\scaredcrowd\muko.DDS muko.dds
mkdir ..\dds\dave\backgrounds\festival\scaredcrowd
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\festival\scaredcrowd -srgb -y dave\backgrounds\festival\scaredcrowd\ruby man.png
rename ..\dds\dave\backgrounds\festival\scaredcrowd\ruby man.DDS ruby man.dds
mkdir ..\dds\dave\backgrounds\festival\scaredcrowd
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\festival\scaredcrowd -srgb -y dave\backgrounds\festival\scaredcrowd\tristan.png
rename ..\dds\dave\backgrounds\festival\scaredcrowd\tristan.DDS tristan.dds
mkdir ..\dds\dave\backgrounds
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds -srgb -y dave\backgrounds\gm_house5.png
rename ..\dds\dave\backgrounds\gm_house5.DDS gm_house5.dds
mkdir ..\dds\dave\backgrounds
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds -srgb -y dave\backgrounds\inside_house.png
rename ..\dds\dave\backgrounds\inside_house.DDS inside_house.dds
mkdir ..\dds\dave\backgrounds\office
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\office -srgb -y dave\backgrounds\office\backfloor.png
rename ..\dds\dave\backgrounds\office\backfloor.DDS backfloor.dds
mkdir ..\dds\dave\backgrounds\office
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\office -srgb -y dave\backgrounds\office\door.png
rename ..\dds\dave\backgrounds\office\door.DDS door.dds
mkdir ..\dds\dave\backgrounds\office
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\office -srgb -y dave\backgrounds\office\floor.png
rename ..\dds\dave\backgrounds\office\floor.DDS floor.dds
mkdir ..\dds\dave\backgrounds\office
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\office -srgb -y dave\backgrounds\office\frontwall.png
rename ..\dds\dave\backgrounds\office\frontwall.DDS frontwall.dds
mkdir ..\dds\dave\backgrounds
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds -srgb -y dave\backgrounds\rapbattle.png
rename ..\dds\dave\backgrounds\rapbattle.DDS rapbattle.dds
mkdir ..\dds\dave\backgrounds\shared
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\shared -srgb -y dave\backgrounds\shared\sky.png
rename ..\dds\dave\backgrounds\shared\sky.DDS sky.dds
mkdir ..\dds\dave\backgrounds\shared
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\shared -srgb -y dave\backgrounds\shared\sky_festival.png
rename ..\dds\dave\backgrounds\shared\sky_festival.DDS sky_festival.dds
mkdir ..\dds\dave\backgrounds\shared
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\shared -srgb -y dave\backgrounds\shared\sky_night.png
rename ..\dds\dave\backgrounds\shared\sky_night.DDS sky_night.dds
mkdir ..\dds\dave\backgrounds\shared
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\shared -srgb -y dave\backgrounds\shared\sky_space.png
rename ..\dds\dave\backgrounds\shared\sky_space.DDS sky_space.dds
mkdir ..\dds\dave\backgrounds\shared
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\shared -srgb -y dave\backgrounds\shared\sky_sunrise.png
rename ..\dds\dave\backgrounds\shared\sky_sunrise.DDS sky_sunrise.dds
mkdir ..\dds\dave\backgrounds\shared
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\shared -srgb -y dave\backgrounds\shared\sky_sunset.png
rename ..\dds\dave\backgrounds\shared\sky_sunset.DDS sky_sunset.dds
mkdir ..\dds\dave\backgrounds\stage
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\stage -srgb -y dave\backgrounds\stage\stage_light.png
rename ..\dds\dave\backgrounds\stage\stage_light.DDS stage_light.dds
mkdir ..\dds\dave\backgrounds\stage
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\stage -srgb -y dave\backgrounds\stage\stageback.png
rename ..\dds\dave\backgrounds\stage\stageback.DDS stageback.dds
mkdir ..\dds\dave\backgrounds\stage
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\stage -srgb -y dave\backgrounds\stage\stagecurtains.png
rename ..\dds\dave\backgrounds\stage\stagecurtains.DDS stagecurtains.dds
mkdir ..\dds\dave\backgrounds\stage
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\stage -srgb -y dave\backgrounds\stage\stagefront.png
rename ..\dds\dave\backgrounds\stage\stagefront.DDS stagefront.dds
mkdir ..\dds\dave\backgrounds
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds -srgb -y dave\backgrounds\stfu.png
rename ..\dds\dave\backgrounds\stfu.DDS stfu.dds
mkdir ..\dds\dave\backgrounds
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds -srgb -y dave\backgrounds\terminal.png
rename ..\dds\dave\backgrounds\terminal.DDS terminal.dds
mkdir ..\dds\dave\backgrounds\void
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\void -srgb -y dave\backgrounds\void\cheater.png
rename ..\dds\dave\backgrounds\void\cheater.DDS cheater.dds
mkdir ..\dds\dave\backgrounds\void\exbongo
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\void\exbongo -srgb -y dave\backgrounds\void\exbongo\circle.png
rename ..\dds\dave\backgrounds\void\exbongo\circle.DDS circle.dds
mkdir ..\dds\dave\backgrounds\void\exbongo
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\void\exbongo -srgb -y dave\backgrounds\void\exbongo\exbongo.png
rename ..\dds\dave\backgrounds\void\exbongo\exbongo.DDS exbongo.dds
mkdir ..\dds\dave\backgrounds\void\exbongo
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\void\exbongo -srgb -y dave\backgrounds\void\exbongo\place.png
rename ..\dds\dave\backgrounds\void\exbongo\place.DDS place.dds
mkdir ..\dds\dave\backgrounds\void\exploit
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\void\exploit -srgb -y dave\backgrounds\void\exploit\broken_expunged_chain.png
rename ..\dds\dave\backgrounds\void\exploit\broken_expunged_chain.DDS broken_expunged_chain.dds
mkdir ..\dds\dave\backgrounds\void\exploit
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\void\exploit -srgb -y dave\backgrounds\void\exploit\cheater glitch.png
rename ..\dds\dave\backgrounds\void\exploit\cheater glitch.DDS cheater glitch.dds
mkdir ..\dds\dave\backgrounds\void\exploit
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\void\exploit -srgb -y dave\backgrounds\void\exploit\creepyroom.png
rename ..\dds\dave\backgrounds\void\exploit\creepyroom.DDS creepyroom.dds
mkdir ..\dds\dave\backgrounds\void\exploit
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\void\exploit -srgb -y dave\backgrounds\void\exploit\expunged_chains.png
rename ..\dds\dave\backgrounds\void\exploit\expunged_chains.DDS expunged_chains.dds
mkdir ..\dds\dave\backgrounds\void\exploit
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\void\exploit -srgb -y dave\backgrounds\void\exploit\glitchy_cheating_2.png
rename ..\dds\dave\backgrounds\void\exploit\glitchy_cheating_2.DDS glitchy_cheating_2.dds
mkdir ..\dds\dave\backgrounds\void\exploit
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\void\exploit -srgb -y dave\backgrounds\void\exploit\glitchyunfairbg.png
rename ..\dds\dave\backgrounds\void\exploit\glitchyunfairbg.DDS glitchyunfairbg.dds
mkdir ..\dds\dave\backgrounds\void\interdimensions
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\void\interdimensions -srgb -y dave\backgrounds\void\interdimensions\2dinterdimensionvoid.png
rename ..\dds\dave\backgrounds\void\interdimensions\2dinterdimensionvoid.DDS 2dinterdimensionvoid.dds
mkdir ..\dds\dave\backgrounds\void\interdimensions
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\void\interdimensions -srgb -y dave\backgrounds\void\interdimensions\darkspace.png
rename ..\dds\dave\backgrounds\void\interdimensions\darkspace.DDS darkspace.dds
mkdir ..\dds\dave\backgrounds\void\interdimensions
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\void\interdimensions -srgb -y dave\backgrounds\void\interdimensions\hexagon.png
rename ..\dds\dave\backgrounds\void\interdimensions\hexagon.DDS hexagon.dds
mkdir ..\dds\dave\backgrounds\void\interdimensions
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\void\interdimensions -srgb -y dave\backgrounds\void\interdimensions\interdimensionvoid.png
rename ..\dds\dave\backgrounds\void\interdimensions\interdimensionvoid.DDS interdimensionvoid.dds
mkdir ..\dds\dave\backgrounds\void\interdimensions\nimbi
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\void\interdimensions\nimbi -srgb -y dave\backgrounds\void\interdimensions\nimbi\nimbi.png
rename ..\dds\dave\backgrounds\void\interdimensions\nimbi\nimbi.DDS nimbi.dds
mkdir ..\dds\dave\backgrounds\void\interdimensions\nimbi
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\void\interdimensions\nimbi -srgb -y dave\backgrounds\void\interdimensions\nimbi\nimbi_land.png
rename ..\dds\dave\backgrounds\void\interdimensions\nimbi\nimbi_land.DDS nimbi_land.dds
mkdir ..\dds\dave\backgrounds\void\interdimensions\nimbi
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\void\interdimensions\nimbi -srgb -y dave\backgrounds\void\interdimensions\nimbi\nimbivoid.png
rename ..\dds\dave\backgrounds\void\interdimensions\nimbi\nimbivoid.DDS nimbivoid.dds
mkdir ..\dds\dave\backgrounds\void\interdimensions\nimbi
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\void\interdimensions\nimbi -srgb -y dave\backgrounds\void\interdimensions\nimbi\sign.png
rename ..\dds\dave\backgrounds\void\interdimensions\nimbi\sign.DDS sign.dds
mkdir ..\dds\dave\backgrounds\void\interdimensions
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\void\interdimensions -srgb -y dave\backgrounds\void\interdimensions\spike.png
rename ..\dds\dave\backgrounds\void\interdimensions\spike.DDS spike.dds
mkdir ..\dds\dave\backgrounds\void
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\void -srgb -y dave\backgrounds\void\redsky.png
rename ..\dds\dave\backgrounds\void\redsky.DDS redsky.dds
mkdir ..\dds\dave\backgrounds\void
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\void -srgb -y dave\backgrounds\void\redsky_insanity.png
rename ..\dds\dave\backgrounds\void\redsky_insanity.DDS redsky_insanity.dds
mkdir ..\dds\dave\backgrounds\void
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\void -srgb -y dave\backgrounds\void\scarybg.png
rename ..\dds\dave\backgrounds\void\scarybg.DDS scarybg.dds
mkdir ..\dds\dave\backgrounds
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds -srgb -y dave\backgrounds\wedcape_from_cali_backlground.png
rename ..\dds\dave\backgrounds\wedcape_from_cali_backlground.DDS wedcape_from_cali_backlground.dds
mkdir ..\dds\dave
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave -srgb -y dave\badcorn.png
rename ..\dds\dave\badcorn.DDS badcorn.dds
mkdir ..\dds\dave\bambi
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\bambi -srgb -y dave\bambi\angry_bambi.png
rename ..\dds\dave\bambi\angry_bambi.DDS angry_bambi.dds
mkdir ..\dds\dave\bambi
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\bambi -srgb -y dave\bambi\bambi_death.png
rename ..\dds\dave\bambi\bambi_death.DDS bambi_death.dds
mkdir ..\dds\dave\bambi
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\bambi -srgb -y dave\bambi\bambimaddddd.png
rename ..\dds\dave\bambi\bambimaddddd.DDS bambimaddddd.dds
mkdir ..\dds\dave\bambi
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\bambi -srgb -y dave\bambi\bambiremake.png
rename ..\dds\dave\bambi\bambiremake.DDS bambiremake.dds
mkdir ..\dds\dave\bambi
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\bambi -srgb -y dave\bambi\fuckbi.png
rename ..\dds\dave\bambi\fuckbi.DDS fuckbi.dds
mkdir ..\dds\dave\bambi
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\bambi -srgb -y dave\bambi\im_gonna_break_me_phone.png
rename ..\dds\dave\bambi\im_gonna_break_me_phone.DDS im_gonna_break_me_phone.dds
mkdir ..\dds\dave
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave -srgb -y dave\blank.png
rename ..\dds\dave\blank.DDS blank.dds
mkdir ..\dds\dave\california
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\california -srgb -y dave\california\1000miles.png
rename ..\dds\dave\california\1000miles.DDS 1000miles.dds
mkdir ..\dds\dave\california
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\california -srgb -y dave\california\1500miles.png
rename ..\dds\dave\california\1500miles.DDS 1500miles.dds
mkdir ..\dds\dave\california
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\california -srgb -y dave\california\500miles.png
rename ..\dds\dave\california\500miles.DDS 500miles.dds
mkdir ..\dds\dave\california
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\california -srgb -y dave\california\geor gea.png
rename ..\dds\dave\california\geor gea.DDS geor gea.dds
mkdir ..\dds\dave\california
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\california -srgb -y dave\california\georgiagrass.png
rename ..\dds\dave\california\georgiagrass.DDS georgiagrass.dds
mkdir ..\dds\dave\california
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\california -srgb -y dave\california\georgialol.png
rename ..\dds\dave\california\georgialol.DDS georgialol.dds
mkdir ..\dds\dave\california
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\california -srgb -y dave\california\georgiarails.png
rename ..\dds\dave\california\georgiarails.DDS georgiarails.dds
mkdir ..\dds\dave\california
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\california -srgb -y dave\california\georgiatrees1.png
rename ..\dds\dave\california\georgiatrees1.DDS georgiatrees1.dds
mkdir ..\dds\dave\california
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\california -srgb -y dave\california\georgiatrees2.png
rename ..\dds\dave\california\georgiatrees2.DDS georgiatrees2.dds
mkdir ..\dds\dave\california
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\california -srgb -y dave\california\leavingcalifornia.png
rename ..\dds\dave\california\leavingcalifornia.DDS leavingcalifornia.dds
mkdir ..\dds\dave\california
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\california -srgb -y dave\california\moldygh.png
rename ..\dds\dave\california\moldygh.DDS moldygh.dds
mkdir ..\dds\dave\california
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\california -srgb -y dave\california\train.png
rename ..\dds\dave\california\train.DDS train.dds
mkdir ..\dds\dave\california
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\california -srgb -y dave\california\welcometogeorgia.png
rename ..\dds\dave\california\welcometogeorgia.DDS welcometogeorgia.dds
mkdir ..\dds\dave
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave -srgb -y dave\charSelect.png
rename ..\dds\dave\charSelect.DDS charSelect.dds
mkdir ..\dds\dave\characters
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\characters -srgb -y dave\characters\3d_bf.png
rename ..\dds\dave\characters\3d_bf.DDS 3d_bf.dds
mkdir ..\dds\dave\characters
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\characters -srgb -y dave\characters\3d_gf.png
rename ..\dds\dave\characters\3d_gf.DDS 3d_gf.dds
mkdir ..\dds\dave\characters
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\characters -srgb -y dave\characters\baldiinroof.png
rename ..\dds\dave\characters\baldiinroof.DDS baldiinroof.dds
mkdir ..\dds\dave\characters
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\characters -srgb -y dave\characters\boyfriend.png
rename ..\dds\dave\characters\boyfriend.DDS boyfriend.dds
mkdir ..\dds\dave\characters
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\characters -srgb -y dave\characters\cool_bf.png
rename ..\dds\dave\characters\cool_bf.DDS cool_bf.dds
mkdir ..\dds\dave\characters
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\characters -srgb -y dave\characters\cool_gf.png
rename ..\dds\dave\characters\cool_gf.DDS cool_gf.dds
mkdir ..\dds\dave\characters
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\characters -srgb -y dave\characters\dont_go_snooping_where_youre_not_supposed_to.png
rename ..\dds\dave\characters\dont_go_snooping_where_youre_not_supposed_to.DDS dont_go_snooping_where_youre_not_supposed_to.dds
mkdir ..\dds\dave\characters
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\characters -srgb -y dave\characters\exbungo.png
rename ..\dds\dave\characters\exbungo.DDS exbungo.dds
mkdir ..\dds\dave\characters
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\characters -srgb -y dave\characters\gf_assets.png
rename ..\dds\dave\characters\gf_assets.DDS gf_assets.dds
mkdir ..\dds\dave\characters
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\characters -srgb -y dave\characters\im_gonna_tornader_you_away.png
rename ..\dds\dave\characters\im_gonna_tornader_you_away.DDS im_gonna_tornader_you_away.dds
mkdir ..\dds\dave\dave\characters
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\dave\characters -srgb -y dave\dave\characters\dave_3d.png
rename ..\dds\dave\dave\characters\dave_3d.DDS dave_3d.dds
mkdir ..\dds\dave\dave\characters
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\dave\characters -srgb -y dave\dave\characters\dave_3d_dead.png
rename ..\dds\dave\dave\characters\dave_3d_dead.DDS dave_3d_dead.dds
mkdir ..\dds\dave\dave\characters
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\dave\characters -srgb -y dave\dave\characters\dave_awesome.png
rename ..\dds\dave\dave\characters\dave_awesome.DDS dave_awesome.dds
mkdir ..\dds\dave\dave\characters
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\dave\characters -srgb -y dave\dave\characters\dave_dead.png
rename ..\dds\dave\dave\characters\dave_dead.DDS dave_dead.dds
mkdir ..\dds\dave\dave\characters
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\dave\characters -srgb -y dave\dave\characters\dave_insanity_lol.png
rename ..\dds\dave\dave\characters\dave_insanity_lol.DDS dave_insanity_lol.dds
mkdir ..\dds\dave\dave\characters
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\dave\characters -srgb -y dave\dave\characters\dave_sheet.png
rename ..\dds\dave\dave\characters\dave_sheet.DDS dave_sheet.dds
mkdir ..\dds\dave\dave\characters
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\dave\characters -srgb -y dave\dave\characters\davefriend.png
rename ..\dds\dave\dave\characters\davefriend.DDS davefriend.dds
mkdir ..\dds\dave\dave\characters
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\dave\characters -srgb -y dave\dave\characters\thecoolerdave.png
rename ..\dds\dave\dave\characters\thecoolerdave.DDS thecoolerdave.dds
mkdir ..\dds\dave\dave\characters
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\dave\characters -srgb -y dave\dave\characters\tristan_dead.png
rename ..\dds\dave\dave\characters\tristan_dead.DDS tristan_dead.dds
mkdir ..\dds\dave\dave
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\dave -srgb -y dave\dave\e.png
rename ..\dds\dave\dave\e.DDS e.dds
mkdir ..\dds\dave\dave\endings
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\dave\endings -srgb -y dave\dave\endings\badending.png
rename ..\dds\dave\dave\endings\badending.DDS badending.dds
mkdir ..\dds\dave\dave\endings
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\dave\endings -srgb -y dave\dave\endings\bruh.png
rename ..\dds\dave\dave\endings\bruh.DDS bruh.dds
mkdir ..\dds\dave\dave\endings
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\dave\endings -srgb -y dave\dave\endings\cheater_lol.png
rename ..\dds\dave\dave\endings\cheater_lol.DDS cheater_lol.dds
mkdir ..\dds\dave\dave\endings
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\dave\endings -srgb -y dave\dave\endings\goodending.png
rename ..\dds\dave\dave\endings\goodending.DDS goodending.dds
mkdir ..\dds\dave\dave\endings
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\dave\endings -srgb -y dave\dave\endings\rtxx_ending.png
rename ..\dds\dave\dave\endings\rtxx_ending.DDS rtxx_ending.dds
mkdir ..\dds\dave\dave\endings
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\dave\endings -srgb -y dave\dave\endings\unfunnyending.png
rename ..\dds\dave\dave\endings\unfunnyending.DDS unfunnyending.dds
mkdir ..\dds\dave\dave\endings
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\dave\endings -srgb -y dave\dave\endings\vomit_ending.png
rename ..\dds\dave\dave\endings\vomit_ending.DDS vomit_ending.dds
mkdir ..\dds\dave\dave
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\dave -srgb -y dave\dave\peejeadadasketchye.png
rename ..\dds\dave\dave\peejeadadasketchye.DDS peejeadadasketchye.dds
mkdir ..\dds\dave\dave
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\dave -srgb -y dave\dave\placeholderstory.png
rename ..\dds\dave\dave\placeholderstory.DDS placeholderstory.dds
mkdir ..\dds\dave\dave\secret
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\dave\secret -srgb -y dave\dave\secret\scary.png
rename ..\dds\dave\dave\secret\scary.DDS scary.dds
mkdir ..\dds\dave\dave\secret
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\dave\secret -srgb -y dave\dave\secret\youactuallythoughttherewasasecrethere.png
rename ..\dds\dave\dave\secret\youactuallythoughttherewasasecrethere.DDS youactuallythoughttherewasasecrethere.dds
mkdir ..\dds\dave\dave
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\dave -srgb -y dave\dave\secret song cover.png
rename ..\dds\dave\dave\secret song cover.DDS secret song cover.dds
mkdir ..\dds\dave\dave
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\dave -srgb -y dave\dave\tristan.png
rename ..\dds\dave\dave\tristan.DDS tristan.dds
mkdir ..\dds\dave\dave
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\dave -srgb -y dave\dave\tristan_dead.png
rename ..\dds\dave\dave\tristan_dead.DDS tristan_dead.dds
mkdir ..\dds\dave\dave
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\dave -srgb -y dave\dave\tristan_golden.png
rename ..\dds\dave\dave\tristan_golden.DDS tristan_golden.dds
mkdir ..\dds\dave\dave
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\dave -srgb -y dave\dave\tristan_golden_death.png
rename ..\dds\dave\dave\tristan_golden_death.DDS tristan_golden_death.dds
mkdir ..\dds\dave\dave
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\dave -srgb -y dave\dave\tristan_golden_glowing.png
rename ..\dds\dave\dave\tristan_golden_glowing.DDS tristan_golden_glowing.dds
mkdir ..\dds\dave\dave
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\dave -srgb -y dave\dave\tristanhairflipped.png
rename ..\dds\dave\dave\tristanhairflipped.DDS tristanhairflipped.dds
mkdir ..\dds\dave
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave -srgb -y dave\dave_house.png
rename ..\dds\dave\dave_house.DDS dave_house.dds
mkdir ..\dds\dave\dialogue\bambi
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\dialogue\bambi -srgb -y dave\dialogue\bambi\bambi_annoyed.png
rename ..\dds\dave\dialogue\bambi\bambi_annoyed.DDS bambi_annoyed.dds
mkdir ..\dds\dave\dialogue\bambi
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\dialogue\bambi -srgb -y dave\dialogue\bambi\bambi_bevel.png
rename ..\dds\dave\dialogue\bambi\bambi_bevel.DDS bambi_bevel.dds
mkdir ..\dds\dave\dialogue\bambi
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\dialogue\bambi -srgb -y dave\dialogue\bambi\bambi_bevel_mad.png
rename ..\dds\dave\dialogue\bambi\bambi_bevel_mad.DDS bambi_bevel_mad.dds
mkdir ..\dds\dave\dialogue\bambi
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\dialogue\bambi -srgb -y dave\dialogue\bambi\bambi_normal.png
rename ..\dds\dave\dialogue\bambi\bambi_normal.DDS bambi_normal.dds
mkdir ..\dds\dave\dialogue\bambi
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\dialogue\bambi -srgb -y dave\dialogue\bambi\bambi_splitathon.png
rename ..\dds\dave\dialogue\bambi\bambi_splitathon.DDS bambi_splitathon.dds
mkdir ..\dds\dave\dialogue\bambi
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\dialogue\bambi -srgb -y dave\dialogue\bambi\bambi_upset.png
rename ..\dds\dave\dialogue\bambi\bambi_upset.DDS bambi_upset.dds
mkdir ..\dds\dave\dialogue\bf
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\dialogue\bf -srgb -y dave\dialogue\bf\bf_confused.png
rename ..\dds\dave\dialogue\bf\bf_confused.DDS bf_confused.dds
mkdir ..\dds\dave\dialogue\bf
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\dialogue\bf -srgb -y dave\dialogue\bf\bf_happy.png
rename ..\dds\dave\dialogue\bf\bf_happy.DDS bf_happy.dds
mkdir ..\dds\dave\dialogue\bf
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\dialogue\bf -srgb -y dave\dialogue\bf\bf_ready.png
rename ..\dds\dave\dialogue\bf\bf_ready.DDS bf_ready.dds
mkdir ..\dds\dave\dialogue\bf
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\dialogue\bf -srgb -y dave\dialogue\bf\bf_upset.png
rename ..\dds\dave\dialogue\bf\bf_upset.DDS bf_upset.dds
mkdir ..\dds\dave\dialogue\dave
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\dialogue\dave -srgb -y dave\dialogue\dave\dave_3d_festival.png
rename ..\dds\dave\dialogue\dave\dave_3d_festival.DDS dave_3d_festival.dds
mkdir ..\dds\dave\dialogue\dave
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\dialogue\dave -srgb -y dave\dialogue\dave\dave_3d_scared.png
rename ..\dds\dave\dialogue\dave\dave_3d_scared.DDS dave_3d_scared.dds
mkdir ..\dds\dave\dialogue\dave
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\dialogue\dave -srgb -y dave\dialogue\dave\dave_annoyed.png
rename ..\dds\dave\dialogue\dave\dave_annoyed.DDS dave_annoyed.dds
mkdir ..\dds\dave\dialogue\dave
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\dialogue\dave -srgb -y dave\dialogue\dave\dave_erm.png
rename ..\dds\dave\dialogue\dave\dave_erm.DDS dave_erm.dds
mkdir ..\dds\dave\dialogue\dave
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\dialogue\dave -srgb -y dave\dialogue\dave\dave_festival_exhausted.png
rename ..\dds\dave\dialogue\dave\dave_festival_exhausted.DDS dave_festival_exhausted.dds
mkdir ..\dds\dave\dialogue\dave
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\dialogue\dave -srgb -y dave\dialogue\dave\dave_festival_happy.png
rename ..\dds\dave\dialogue\dave\dave_festival_happy.DDS dave_festival_happy.dds
mkdir ..\dds\dave\dialogue\dave
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\dialogue\dave -srgb -y dave\dialogue\dave\dave_festival_tired.png
rename ..\dds\dave\dialogue\dave\dave_festival_tired.DDS dave_festival_tired.dds
mkdir ..\dds\dave\dialogue\dave
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\dialogue\dave -srgb -y dave\dialogue\dave\dave_furious.png
rename ..\dds\dave\dialogue\dave\dave_furious.DDS dave_furious.dds
mkdir ..\dds\dave\dialogue\dave
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\dialogue\dave -srgb -y dave\dialogue\dave\dave_happy.png
rename ..\dds\dave\dialogue\dave\dave_happy.DDS dave_happy.dds
mkdir ..\dds\dave\dialogue\dave
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\dialogue\dave -srgb -y dave\dialogue\dave\dave_phone.png
rename ..\dds\dave\dialogue\dave\dave_phone.DDS dave_phone.dds
mkdir ..\dds\dave\dialogue\dave
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\dialogue\dave -srgb -y dave\dialogue\dave\dave_postmaze.png
rename ..\dds\dave\dialogue\dave\dave_postmaze.DDS dave_postmaze.dds
mkdir ..\dds\dave\dialogue\dave
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\dialogue\dave -srgb -y dave\dialogue\dave\dave_scared.png
rename ..\dds\dave\dialogue\dave\dave_scared.DDS dave_scared.dds
mkdir ..\dds\dave\dialogue\dave
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\dialogue\dave -srgb -y dave\dialogue\dave\dave_shocked.png
rename ..\dds\dave\dialogue\dave\dave_shocked.DDS dave_shocked.dds
mkdir ..\dds\dave\dialogue\dave
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\dialogue\dave -srgb -y dave\dialogue\dave\dave_splitathon.png
rename ..\dds\dave\dialogue\dave\dave_splitathon.DDS dave_splitathon.dds
mkdir ..\dds\dave\dialogue\gf
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\dialogue\gf -srgb -y dave\dialogue\gf\gf_cheer.png
rename ..\dds\dave\dialogue\gf\gf_cheer.DDS gf_cheer.dds
mkdir ..\dds\dave\dialogue\gf
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\dialogue\gf -srgb -y dave\dialogue\gf\gf_confused.png
rename ..\dds\dave\dialogue\gf\gf_confused.DDS gf_confused.dds
mkdir ..\dds\dave\dialogue\gf
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\dialogue\gf -srgb -y dave\dialogue\gf\gf_happy.png
rename ..\dds\dave\dialogue\gf\gf_happy.DDS gf_happy.dds
mkdir ..\dds\dave\dialogue\gf
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\dialogue\gf -srgb -y dave\dialogue\gf\gf_what.png
rename ..\dds\dave\dialogue\gf\gf_what.DDS gf_what.dds
mkdir ..\dds\dave\dialogue\joker
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\dialogue\joker -srgb -y dave\dialogue\joker\joker_happy.png
rename ..\dds\dave\dialogue\joker\joker_happy.DDS joker_happy.dds
mkdir ..\dds\dave\dialogue\tristan
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\dialogue\tristan -srgb -y dave\dialogue\tristan\tristan_content.png
rename ..\dds\dave\dialogue\tristan\tristan_content.DDS tristan_content.dds
mkdir ..\dds\dave\dialogue\tristan
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\dialogue\tristan -srgb -y dave\dialogue\tristan\tristan_festival_content.png
rename ..\dds\dave\dialogue\tristan\tristan_festival_content.DDS tristan_festival_content.dds
mkdir ..\dds\dave\dialogue\tristan
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\dialogue\tristan -srgb -y dave\dialogue\tristan\tristan_irritated.png
rename ..\dds\dave\dialogue\tristan\tristan_irritated.DDS tristan_irritated.dds
mkdir ..\dds\dave\dialogue\tristan
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\dialogue\tristan -srgb -y dave\dialogue\tristan\tristan_sad.png
rename ..\dds\dave\dialogue\tristan\tristan_sad.DDS tristan_sad.dds
mkdir ..\dds\dave
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave -srgb -y dave\dumbstatic.png
rename ..\dds\dave\dumbstatic.DDS dumbstatic.dds
mkdir ..\dds\dave\expunged
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\expunged -srgb -y dave\expunged\bambi_3d_death.png
rename ..\dds\dave\expunged\bambi_3d_death.DDS bambi_3d_death.dds
mkdir ..\dds\dave\expunged
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\expunged -srgb -y dave\expunged\bangus.png
rename ..\dds\dave\expunged\bangus.DDS bangus.dds
mkdir ..\dds\dave\expunged
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\expunged -srgb -y dave\expunged\cheating.png
rename ..\dds\dave\expunged\cheating.DDS cheating.dds
mkdir ..\dds\dave\expunged
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\expunged -srgb -y dave\expunged\expungedfinal.png
rename ..\dds\dave\expunged\expungedfinal.DDS expungedfinal.dds
mkdir ..\dds\dave\expunged
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\expunged -srgb -y dave\expunged\unfair_bambi.png
rename ..\dds\dave\expunged\unfair_bambi.DDS unfair_bambi.dds
mkdir ..\dds\dave\expunged
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\expunged -srgb -y dave\expunged\you need to help me.png
rename ..\dds\dave\expunged\you need to help me.DDS you need to help me.dds
mkdir ..\dds\dave\festival
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\festival -srgb -y dave\festival\bambi_shredder.png
rename ..\dds\dave\festival\bambi_shredder.DDS bambi_shredder.dds
mkdir ..\dds\dave\festival
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\festival -srgb -y dave\festival\dave_festival.png
rename ..\dds\dave\festival\dave_festival.DDS dave_festival.dds
mkdir ..\dds\dave\festival
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\festival -srgb -y dave\festival\dave_festival_3d.png
rename ..\dds\dave\festival\dave_festival_3d.DDS dave_festival_3d.dds
mkdir ..\dds\dave\festival\shredder
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\festival\shredder -srgb -y dave\festival\shredder\bambi_spot.png
rename ..\dds\dave\festival\shredder\bambi_spot.DDS bambi_spot.dds
mkdir ..\dds\dave\festival\shredder
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\festival\shredder -srgb -y dave\festival\shredder\boyfriend_spot.png
rename ..\dds\dave\festival\shredder\boyfriend_spot.DDS boyfriend_spot.dds
mkdir ..\dds\dave\festival\shredder
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\festival\shredder -srgb -y dave\festival\shredder\ch_highway.png
rename ..\dds\dave\festival\shredder\ch_highway.DDS ch_highway.dds
mkdir ..\dds\dave\festival
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\festival -srgb -y dave\festival\tristan_festival.png
rename ..\dds\dave\festival\tristan_festival.DDS tristan_festival.dds
mkdir ..\dds\dave\festival
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\festival -srgb -y dave\festival\tristan_festival_playable.png
rename ..\dds\dave\festival\tristan_festival_playable.DDS tristan_festival_playable.dds
mkdir ..\dds\dave\fivenights
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\fivenights -srgb -y dave\fivenights\btn_doorclosed.png
rename ..\dds\dave\fivenights\btn_doorclosed.DDS btn_doorclosed.dds
mkdir ..\dds\dave\fivenights
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\fivenights -srgb -y dave\fivenights\btn_dooropen.png
rename ..\dds\dave\fivenights\btn_dooropen.DDS btn_dooropen.dds
mkdir ..\dds\dave\fivenights
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\fivenights -srgb -y dave\fivenights\dave_fnaf.png
rename ..\dds\dave\fivenights\dave_fnaf.DDS dave_fnaf.dds
mkdir ..\dds\dave\fivenights
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\fivenights -srgb -y dave\fivenights\deathstatic.png
rename ..\dds\dave\fivenights\deathstatic.DDS deathstatic.dds
mkdir ..\dds\dave\fivenights
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\fivenights -srgb -y dave\fivenights\nofriend.png
rename ..\dds\dave\fivenights\nofriend.DDS nofriend.dds
mkdir ..\dds\dave\fivenights
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\fivenights -srgb -y dave\fivenights\nofriend_dead.png
rename ..\dds\dave\fivenights\nofriend_dead.DDS nofriend_dead.dds
mkdir ..\dds\dave\fivenights
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\fivenights -srgb -y dave\fivenights\nofriendjumpscare.png
rename ..\dds\dave\fivenights\nofriendjumpscare.DDS nofriendjumpscare.dds
mkdir ..\dds\dave\fivenights
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\fivenights -srgb -y dave\fivenights\powermeter.png
rename ..\dds\dave\fivenights\powermeter.DDS powermeter.dds
mkdir ..\dds\dave\fivenights
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\fivenights -srgb -y dave\fivenights\powermeter_2.png
rename ..\dds\dave\fivenights\powermeter_2.DDS powermeter_2.dds
mkdir ..\dds\dave\funny
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\funny -srgb -y dave\funny\0.png
rename ..\dds\dave\funny\0.DDS 0.dds
mkdir ..\dds\dave\funny
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\funny -srgb -y dave\funny\1.png
rename ..\dds\dave\funny\1.DDS 1.dds
mkdir ..\dds\dave\funny
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\funny -srgb -y dave\funny\2.png
rename ..\dds\dave\funny\2.DDS 2.dds
mkdir ..\dds\dave\funny
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\funny -srgb -y dave\funny\3.png
rename ..\dds\dave\funny\3.DDS 3.dds
mkdir ..\dds\dave\funny
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\funny -srgb -y dave\funny\5.png
rename ..\dds\dave\funny\5.DDS 5.dds
mkdir ..\dds\dave\funny
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\funny -srgb -y dave\funny\99 #26981.png
rename ..\dds\dave\funny\99 #26981.DDS 99 #26981.dds
mkdir ..\dds\dave\funny
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\funny -srgb -y dave\funny\99.png
rename ..\dds\dave\funny\99.DDS 99.dds
mkdir ..\dds\dave
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave -srgb -y dave\glitch.png
rename ..\dds\dave\glitch.DDS glitch.dds
mkdir ..\dds\dave
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave -srgb -y dave\healthbar.png
rename ..\dds\dave\healthbar.DDS healthbar.dds
mkdir ..\dds\dave\icons
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\icons -srgb -y dave\icons\baldi.png
rename ..\dds\dave\icons\baldi.DDS baldi.dds
mkdir ..\dds\dave\icons
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\icons -srgb -y dave\icons\bambi-3d-pixel.png
rename ..\dds\dave\icons\bambi-3d-pixel.DDS bambi-3d-pixel.dds
mkdir ..\dds\dave\icons
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\icons -srgb -y dave\icons\bambi-angey.png
rename ..\dds\dave\icons\bambi-angey.DDS bambi-angey.dds
mkdir ..\dds\dave\icons
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\icons -srgb -y dave\icons\bambi-joke-mad.png
rename ..\dds\dave\icons\bambi-joke-mad.DDS bambi-joke-mad.dds
mkdir ..\dds\dave\icons
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\icons -srgb -y dave\icons\bambi-joke.png
rename ..\dds\dave\icons\bambi-joke.DDS bambi-joke.dds
mkdir ..\dds\dave\icons
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\icons -srgb -y dave\icons\bambi-loser.png
rename ..\dds\dave\icons\bambi-loser.DDS bambi-loser.dds
mkdir ..\dds\dave\icons
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\icons -srgb -y dave\icons\bambi-new.png
rename ..\dds\dave\icons\bambi-new.DDS bambi-new.dds
mkdir ..\dds\dave\icons
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\icons -srgb -y dave\icons\bambi-old.png
rename ..\dds\dave\icons\bambi-old.DDS bambi-old.dds
mkdir ..\dds\dave\icons
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\icons -srgb -y dave\icons\bambi-recursed.png
rename ..\dds\dave\icons\bambi-recursed.DDS bambi-recursed.dds
mkdir ..\dds\dave\icons
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\icons -srgb -y dave\icons\bambi-shredder.png
rename ..\dds\dave\icons\bambi-shredder.DDS bambi-shredder.dds
mkdir ..\dds\dave\icons
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\icons -srgb -y dave\icons\bambi-splitathon.png
rename ..\dds\dave\icons\bambi-splitathon.DDS bambi-splitathon.dds
mkdir ..\dds\dave\icons
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\icons -srgb -y dave\icons\bambi-unfair-pixel.png
rename ..\dds\dave\icons\bambi-unfair-pixel.DDS bambi-unfair-pixel.dds
mkdir ..\dds\dave\icons
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\icons -srgb -y dave\icons\bambi.png
rename ..\dds\dave\icons\bambi.DDS bambi.dds
mkdir ..\dds\dave\icons
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\icons -srgb -y dave\icons\bf-cool.png
rename ..\dds\dave\icons\bf-cool.DDS bf-cool.dds
mkdir ..\dds\dave\icons
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\icons -srgb -y dave\icons\bf-old.png
rename ..\dds\dave\icons\bf-old.DDS bf-old.dds
mkdir ..\dds\dave\icons
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\icons -srgb -y dave\icons\bf-pixel.png
rename ..\dds\dave\icons\bf-pixel.DDS bf-pixel.dds
mkdir ..\dds\dave\icons
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\icons -srgb -y dave\icons\bf.png
rename ..\dds\dave\icons\bf.DDS bf.dds
mkdir ..\dds\dave\icons
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\icons -srgb -y dave\icons\dave-3d-recursed-pixel.png
rename ..\dds\dave\icons\dave-3d-recursed-pixel.DDS dave-3d-recursed-pixel.dds
mkdir ..\dds\dave\icons
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\icons -srgb -y dave\icons\dave-angey-pixel.png
rename ..\dds\dave\icons\dave-angey-pixel.DDS dave-angey-pixel.dds
mkdir ..\dds\dave\icons
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\icons -srgb -y dave\icons\dave-annoyed.png
rename ..\dds\dave\icons\dave-annoyed.DDS dave-annoyed.dds
mkdir ..\dds\dave\icons
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\icons -srgb -y dave\icons\dave-awesome.png
rename ..\dds\dave\icons\dave-awesome.DDS dave-awesome.dds
mkdir ..\dds\dave\icons
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\icons -srgb -y dave\icons\dave-cool.png
rename ..\dds\dave\icons\dave-cool.DDS dave-cool.dds
mkdir ..\dds\dave\icons
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\icons -srgb -y dave\icons\dave-festival-3d-pixel.png
rename ..\dds\dave\icons\dave-festival-3d-pixel.DDS dave-festival-3d-pixel.dds
mkdir ..\dds\dave\icons
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\icons -srgb -y dave\icons\dave-festival.png
rename ..\dds\dave\icons\dave-festival.DDS dave-festival.dds
mkdir ..\dds\dave\icons
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\icons -srgb -y dave\icons\dave-fnaf.png
rename ..\dds\dave\icons\dave-fnaf.DDS dave-fnaf.dds
mkdir ..\dds\dave\icons
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\icons -srgb -y dave\icons\dave-splitathon.png
rename ..\dds\dave\icons\dave-splitathon.DDS dave-splitathon.dds
mkdir ..\dds\dave\icons
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\icons -srgb -y dave\icons\dave.png
rename ..\dds\dave\icons\dave.DDS dave.dds
mkdir ..\dds\dave\icons
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\icons -srgb -y dave\icons\davefriend.png
rename ..\dds\dave\icons\davefriend.DDS davefriend.dds
mkdir ..\dds\dave\icons
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\icons -srgb -y dave\icons\exbungo-pixel.png
rename ..\dds\dave\icons\exbungo-pixel.DDS exbungo-pixel.dds
mkdir ..\dds\dave\icons
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\icons -srgb -y dave\icons\exclusive-bf-pixel.png
rename ..\dds\dave\icons\exclusive-bf-pixel.DDS exclusive-bf-pixel.dds
mkdir ..\dds\dave\icons
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\icons -srgb -y dave\icons\expunged-pixel.png
rename ..\dds\dave\icons\expunged-pixel.DDS expunged-pixel.dds
mkdir ..\dds\dave\icons
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\icons -srgb -y dave\icons\face.png
rename ..\dds\dave\icons\face.DDS face.dds
mkdir ..\dds\dave\icons
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\icons -srgb -y dave\icons\gf.png
rename ..\dds\dave\icons\gf.DDS gf.dds
mkdir ..\dds\dave\icons
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\icons -srgb -y dave\icons\moldy.png
rename ..\dds\dave\icons\moldy.DDS moldy.dds
mkdir ..\dds\dave\icons
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\icons -srgb -y dave\icons\nofriend.png
rename ..\dds\dave\icons\nofriend.DDS nofriend.dds
mkdir ..\dds\dave\icons
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\icons -srgb -y dave\icons\playrobot-shadow.png
rename ..\dds\dave\icons\playrobot-shadow.DDS playrobot-shadow.dds
mkdir ..\dds\dave\icons
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\icons -srgb -y dave\icons\playrobot.png
rename ..\dds\dave\icons\playrobot.DDS playrobot.dds
mkdir ..\dds\dave\icons
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\icons -srgb -y dave\icons\recurser.png
rename ..\dds\dave\icons\recurser.DDS recurser.dds
mkdir ..\dds\dave\icons
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\icons -srgb -y dave\icons\tb-funny-man.png
rename ..\dds\dave\icons\tb-funny-man.DDS tb-funny-man.dds
mkdir ..\dds\dave\icons
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\icons -srgb -y dave\icons\tb-recursed.png
rename ..\dds\dave\icons\tb-recursed.DDS tb-recursed.dds
mkdir ..\dds\dave\icons
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\icons -srgb -y dave\icons\terminal.png
rename ..\dds\dave\icons\terminal.DDS terminal.dds
mkdir ..\dds\dave\icons
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\icons -srgb -y dave\icons\the-duo.png
rename ..\dds\dave\icons\the-duo.DDS the-duo.dds
mkdir ..\dds\dave\icons
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\icons -srgb -y dave\icons\tristan-festival-playable.png
rename ..\dds\dave\icons\tristan-festival-playable.DDS tristan-festival-playable.dds
mkdir ..\dds\dave\icons
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\icons -srgb -y dave\icons\tristan-festival.png
rename ..\dds\dave\icons\tristan-festival.DDS tristan-festival.dds
mkdir ..\dds\dave\icons
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\icons -srgb -y dave\icons\tristan-golden-glowing.png
rename ..\dds\dave\icons\tristan-golden-glowing.DDS tristan-golden-glowing.dds
mkdir ..\dds\dave\icons
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\icons -srgb -y dave\icons\tristan-golden.png
rename ..\dds\dave\icons\tristan-golden.DDS tristan-golden.dds
mkdir ..\dds\dave\icons
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\icons -srgb -y dave\icons\tristan-opponent.png
rename ..\dds\dave\icons\tristan-opponent.DDS tristan-opponent.dds
mkdir ..\dds\dave\icons
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\icons -srgb -y dave\icons\tristan-recursed.png
rename ..\dds\dave\icons\tristan-recursed.DDS tristan-recursed.dds
mkdir ..\dds\dave\icons
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\icons -srgb -y dave\icons\tristan.png
rename ..\dds\dave\icons\tristan.DDS tristan.dds
mkdir ..\dds\dave\jerald
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\jerald -srgb -y dave\jerald\jerald.png
rename ..\dds\dave\jerald\jerald.DDS jerald.dds
mkdir ..\dds\dave\joke
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\joke -srgb -y dave\joke\amog.png
rename ..\dds\dave\joke\amog.DDS amog.dds
mkdir ..\dds\dave\joke
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\joke -srgb -y dave\joke\bambi-joke-mad.png
rename ..\dds\dave\joke\bambi-joke-mad.DDS bambi-joke-mad.dds
mkdir ..\dds\dave\joke
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\joke -srgb -y dave\joke\bambi-joke.png
rename ..\dds\dave\joke\bambi-joke.DDS bambi-joke.dds
mkdir ..\dds\dave\joke
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\joke -srgb -y dave\joke\cutscene.png
rename ..\dds\dave\joke\cutscene.DDS cutscene.dds
mkdir ..\dds\dave\joke
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\joke -srgb -y dave\joke\iminthegame.png
rename ..\dds\dave\joke\iminthegame.DDS iminthegame.dds
mkdir ..\dds\dave\joke
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\joke -srgb -y dave\joke\puppy_princess.png
rename ..\dds\dave\joke\puppy_princess.DDS puppy_princess.dds
mkdir ..\dds\dave\joke
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\joke -srgb -y dave\joke\secret mod leak.png
rename ..\dds\dave\joke\secret mod leak.DDS secret mod leak.dds
mkdir ..\dds\dave\joke
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\joke -srgb -y dave\joke\sem_timtmmulo.png
rename ..\dds\dave\joke\sem_timtmmulo.DDS sem_timtmmulo.dds
mkdir ..\dds\dave\math
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\math -srgb -y dave\math\baldi_mathgame_sheet.png
rename ..\dds\dave\math\baldi_mathgame_sheet.DDS baldi_mathgame_sheet.dds
mkdir ..\dds\dave\math\buttons
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\math\buttons -srgb -y dave\math\buttons\-.png
rename ..\dds\dave\math\buttons\-.DDS -.dds
mkdir ..\dds\dave\math\buttons
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\math\buttons -srgb -y dave\math\buttons\-_select.png
rename ..\dds\dave\math\buttons\-_select.DDS -_select.dds
mkdir ..\dds\dave\math\buttons
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\math\buttons -srgb -y dave\math\buttons\0.png
rename ..\dds\dave\math\buttons\0.DDS 0.dds
mkdir ..\dds\dave\math\buttons
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\math\buttons -srgb -y dave\math\buttons\0_select.png
rename ..\dds\dave\math\buttons\0_select.DDS 0_select.dds
mkdir ..\dds\dave\math\buttons
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\math\buttons -srgb -y dave\math\buttons\1.png
rename ..\dds\dave\math\buttons\1.DDS 1.dds
mkdir ..\dds\dave\math\buttons
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\math\buttons -srgb -y dave\math\buttons\1_select.png
rename ..\dds\dave\math\buttons\1_select.DDS 1_select.dds
mkdir ..\dds\dave\math\buttons
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\math\buttons -srgb -y dave\math\buttons\2.png
rename ..\dds\dave\math\buttons\2.DDS 2.dds
mkdir ..\dds\dave\math\buttons
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\math\buttons -srgb -y dave\math\buttons\2_select.png
rename ..\dds\dave\math\buttons\2_select.DDS 2_select.dds
mkdir ..\dds\dave\math\buttons
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\math\buttons -srgb -y dave\math\buttons\3.png
rename ..\dds\dave\math\buttons\3.DDS 3.dds
mkdir ..\dds\dave\math\buttons
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\math\buttons -srgb -y dave\math\buttons\3_select.png
rename ..\dds\dave\math\buttons\3_select.DDS 3_select.dds
mkdir ..\dds\dave\math\buttons
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\math\buttons -srgb -y dave\math\buttons\4.png
rename ..\dds\dave\math\buttons\4.DDS 4.dds
mkdir ..\dds\dave\math\buttons
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\math\buttons -srgb -y dave\math\buttons\4_select.png
rename ..\dds\dave\math\buttons\4_select.DDS 4_select.dds
mkdir ..\dds\dave\math\buttons
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\math\buttons -srgb -y dave\math\buttons\5.png
rename ..\dds\dave\math\buttons\5.DDS 5.dds
mkdir ..\dds\dave\math\buttons
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\math\buttons -srgb -y dave\math\buttons\5_select.png
rename ..\dds\dave\math\buttons\5_select.DDS 5_select.dds
mkdir ..\dds\dave\math\buttons
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\math\buttons -srgb -y dave\math\buttons\6.png
rename ..\dds\dave\math\buttons\6.DDS 6.dds
mkdir ..\dds\dave\math\buttons
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\math\buttons -srgb -y dave\math\buttons\6_select.png
rename ..\dds\dave\math\buttons\6_select.DDS 6_select.dds
mkdir ..\dds\dave\math\buttons
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\math\buttons -srgb -y dave\math\buttons\7.png
rename ..\dds\dave\math\buttons\7.DDS 7.dds
mkdir ..\dds\dave\math\buttons
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\math\buttons -srgb -y dave\math\buttons\7_select.png
rename ..\dds\dave\math\buttons\7_select.DDS 7_select.dds
mkdir ..\dds\dave\math\buttons
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\math\buttons -srgb -y dave\math\buttons\8.png
rename ..\dds\dave\math\buttons\8.DDS 8.dds
mkdir ..\dds\dave\math\buttons
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\math\buttons -srgb -y dave\math\buttons\8_select.png
rename ..\dds\dave\math\buttons\8_select.DDS 8_select.dds
mkdir ..\dds\dave\math\buttons
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\math\buttons -srgb -y dave\math\buttons\9.png
rename ..\dds\dave\math\buttons\9.DDS 9.dds
mkdir ..\dds\dave\math\buttons
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\math\buttons -srgb -y dave\math\buttons\9_select.png
rename ..\dds\dave\math\buttons\9_select.DDS 9_select.dds
mkdir ..\dds\dave\math\buttons
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\math\buttons -srgb -y dave\math\buttons\c.png
rename ..\dds\dave\math\buttons\c.DDS c.dds
mkdir ..\dds\dave\math\buttons
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\math\buttons -srgb -y dave\math\buttons\c_select.png
rename ..\dds\dave\math\buttons\c_select.DDS c_select.dds
mkdir ..\dds\dave\math\buttons
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\math\buttons -srgb -y dave\math\buttons\ok.png
rename ..\dds\dave\math\buttons\ok.DDS ok.dds
mkdir ..\dds\dave\math\buttons
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\math\buttons -srgb -y dave\math\buttons\ok_select.png
rename ..\dds\dave\math\buttons\ok_select.DDS ok_select.dds
mkdir ..\dds\dave\math
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\math -srgb -y dave\math\check.png
rename ..\dds\dave\math\check.DDS check.dds
mkdir ..\dds\dave\math
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\math -srgb -y dave\math\cursorsprite.png
rename ..\dds\dave\math\cursorsprite.DDS cursorsprite.dds
mkdir ..\dds\dave\math
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\math -srgb -y dave\math\x.png
rename ..\dds\dave\math\x.DDS x.dds
mkdir ..\dds\dave\math
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\math -srgb -y dave\math\yctp.png
rename ..\dds\dave\math\yctp.DDS yctp.dds
mkdir ..\dds\dave\notes
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\notes -srgb -y dave\notes\note_assets.png
rename ..\dds\dave\notes\note_assets.DDS note_assets.dds
mkdir ..\dds\dave\notes
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\notes -srgb -y dave\notes\note_assets_3d.png
rename ..\dds\dave\notes\note_assets_3d.DDS note_assets_3d.dds
mkdir ..\dds\dave\notes
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\notes -srgb -y dave\notes\note_assets_shape.png
rename ..\dds\dave\notes\note_assets_shape.DDS note_assets_shape.dds
mkdir ..\dds\dave\notes
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\notes -srgb -y dave\notes\note_gh.png
rename ..\dds\dave\notes\note_gh.DDS note_gh.dds
mkdir ..\dds\dave\notes
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\notes -srgb -y dave\notes\note_phone.png
rename ..\dds\dave\notes\note_phone.DDS note_phone.dds
mkdir ..\dds\dave\notes
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\notes -srgb -y dave\notes\note_phonealt.png
rename ..\dds\dave\notes\note_phonealt.DDS note_phonealt.dds
mkdir ..\dds\dave\notes
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\notes -srgb -y dave\notes\note_recursed.png
rename ..\dds\dave\notes\note_recursed.DDS note_recursed.dds
mkdir ..\dds\dave\notes
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\notes -srgb -y dave\notes\notegh_assets.png
rename ..\dds\dave\notes\notegh_assets.DDS notegh_assets.dds
mkdir ..\dds\dave\notes
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\notes -srgb -y dave\notes\omgtop10awesomehi.png
rename ..\dds\dave\notes\omgtop10awesomehi.DDS omgtop10awesomehi.dds
mkdir ..\dds\dave\pauseAlt
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\pauseAlt -srgb -y dave\pauseAlt\davelol.png
rename ..\dds\dave\pauseAlt\davelol.DDS davelol.dds
mkdir ..\dds\dave\pauseAlt
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\pauseAlt -srgb -y dave\pauseAlt\pausebg.png
rename ..\dds\dave\pauseAlt\pausebg.DDS pausebg.dds
mkdir ..\dds\dave\pauseAlt
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\pauseAlt -srgb -y dave\pauseAlt\pauseui.png
rename ..\dds\dave\pauseAlt\pauseui.DDS pauseui.dds
mkdir ..\dds\dave\playrobot
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\playrobot -srgb -y dave\playrobot\playbot.png
rename ..\dds\dave\playrobot\playbot.DDS playbot.dds
mkdir ..\dds\dave\playrobot
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\playrobot -srgb -y dave\playrobot\playrobot_shadow.png
rename ..\dds\dave\playrobot\playrobot_shadow.DDS playrobot_shadow.dds
mkdir ..\dds\dave\recursed
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\recursed -srgb -y dave\recursed\bambiscroll.png
rename ..\dds\dave\recursed\bambiscroll.DDS bambiscroll.dds
mkdir ..\dds\dave\recursed\characters
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\recursed\characters -srgb -y dave\recursed\characters\bambi_recursed.png
rename ..\dds\dave\recursed\characters\bambi_recursed.DDS bambi_recursed.dds
mkdir ..\dds\dave\recursed\characters
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\recursed\characters -srgb -y dave\recursed\characters\dave_3d_recursed.png
rename ..\dds\dave\recursed\characters\dave_3d_recursed.DDS dave_3d_recursed.dds
mkdir ..\dds\dave\recursed\characters
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\recursed\characters -srgb -y dave\recursed\characters\dave_3d_recursed_dead.png
rename ..\dds\dave\recursed\characters\dave_3d_recursed_dead.DDS dave_3d_recursed_dead.dds
mkdir ..\dds\dave\recursed\characters
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\recursed\characters -srgb -y dave\recursed\characters\dave_recursed.png
rename ..\dds\dave\recursed\characters\dave_recursed.DDS dave_recursed.dds
mkdir ..\dds\dave\recursed\characters
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\recursed\characters -srgb -y dave\recursed\characters\stop_looking_at_the_files.png
rename ..\dds\dave\recursed\characters\stop_looking_at_the_files.DDS stop_looking_at_the_files.dds
mkdir ..\dds\dave\recursed\characters
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\recursed\characters -srgb -y dave\recursed\characters\tristanrecursed.png
rename ..\dds\dave\recursed\characters\tristanrecursed.DDS tristanrecursed.dds
mkdir ..\dds\dave\recursed
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\recursed -srgb -y dave\recursed\darksky.png
rename ..\dds\dave\recursed\darksky.DDS darksky.dds
mkdir ..\dds\dave\recursed
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\recursed -srgb -y dave\recursed\davescroll.png
rename ..\dds\dave\recursed\davescroll.DDS davescroll.dds
mkdir ..\dds\dave\recursed
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\recursed -srgb -y dave\recursed\gold_pieces_but_not_broken.png
rename ..\dds\dave\recursed\gold_pieces_but_not_broken.DDS gold_pieces_but_not_broken.dds
mkdir ..\dds\dave\recursed
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\recursed -srgb -y dave\recursed\noteicon.png
rename ..\dds\dave\recursed\noteicon.DDS noteicon.dds
mkdir ..\dds\dave\recursed
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\recursed -srgb -y dave\recursed\recursed_bf.png
rename ..\dds\dave\recursed\recursed_bf.DDS recursed_bf.dds
mkdir ..\dds\dave\recursed
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\recursed -srgb -y dave\recursed\recursedx.png
rename ..\dds\dave\recursed\recursedx.DDS recursedx.dds
mkdir ..\dds\dave\recursed
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\recursed -srgb -y dave\recursed\recurser.png
rename ..\dds\dave\recursed\recurser.DDS recurser.dds
mkdir ..\dds\dave\recursed
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\recursed -srgb -y dave\recursed\timericon.png
rename ..\dds\dave\recursed\timericon.DDS timericon.dds
mkdir ..\dds\dave\recursed
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\recursed -srgb -y dave\recursed\tristanscroll.png
rename ..\dds\dave\recursed\tristanscroll.DDS tristanscroll.dds
mkdir ..\dds\dave\songcreators
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\songcreators -srgb -y dave\songcreators\aadsta.png
rename ..\dds\dave\songcreators\aadsta.DDS aadsta.dds
mkdir ..\dds\dave\songcreators
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\songcreators -srgb -y dave\songcreators\alexander cooper 19.png
rename ..\dds\dave\songcreators\alexander cooper 19.DDS alexander cooper 19.dds
mkdir ..\dds\dave\songcreators
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\songcreators -srgb -y dave\songcreators\archwk.png
rename ..\dds\dave\songcreators\archwk.DDS archwk.dds
mkdir ..\dds\dave\songcreators
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\songcreators -srgb -y dave\songcreators\deadshadow & pixelgh.png
rename ..\dds\dave\songcreators\deadshadow & pixelgh.DDS deadshadow & pixelgh.dds
mkdir ..\dds\dave\songcreators
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\songcreators -srgb -y dave\songcreators\moldygh.png
rename ..\dds\dave\songcreators\moldygh.DDS moldygh.dds
mkdir ..\dds\dave\songcreators
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\songcreators -srgb -y dave\songcreators\none.png
rename ..\dds\dave\songcreators\none.DDS none.dds
mkdir ..\dds\dave\songcreators
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\songcreators -srgb -y dave\songcreators\oxygen.png
rename ..\dds\dave\songcreators\oxygen.DDS oxygen.dds
mkdir ..\dds\dave\songcreators
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\songcreators -srgb -y dave\songcreators\ruby.png
rename ..\dds\dave\songcreators\ruby.DDS ruby.dds
mkdir ..\dds\dave\songcreators
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\songcreators -srgb -y dave\songcreators\sibottle.png
rename ..\dds\dave\songcreators\sibottle.DDS sibottle.dds
mkdir ..\dds\dave\songcreators
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\songcreators -srgb -y dave\songcreators\th3r34ld34l.png
rename ..\dds\dave\songcreators\th3r34ld34l.DDS th3r34ld34l.dds
mkdir ..\dds\dave\songcreators
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\songcreators -srgb -y dave\songcreators\top 10 awesome.png
rename ..\dds\dave\songcreators\top 10 awesome.DDS top 10 awesome.dds
mkdir ..\dds\dave\songcreators
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\songcreators -srgb -y dave\songcreators\whoareyou.png
rename ..\dds\dave\songcreators\whoareyou.DDS whoareyou.dds
mkdir ..\dds\dave\songcreators
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\songcreators -srgb -y dave\songcreators\your mom.png
rename ..\dds\dave\songcreators\your mom.DDS your mom.dds
mkdir ..\dds\dave\songheadings
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\songheadings -srgb -y dave\songheadings\3d-daveheading.png
rename ..\dds\dave\songheadings\3d-daveheading.DDS 3d-daveheading.dds
mkdir ..\dds\dave\songheadings
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\songheadings -srgb -y dave\songheadings\bambiheading.png
rename ..\dds\dave\songheadings\bambiheading.DDS bambiheading.dds
mkdir ..\dds\dave\songheadings
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\songheadings -srgb -y dave\songheadings\bevelheading.png
rename ..\dds\dave\songheadings\bevelheading.DDS bevelheading.dds
mkdir ..\dds\dave\songheadings
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\songheadings -srgb -y dave\songheadings\botheading.png
rename ..\dds\dave\songheadings\botheading.DDS botheading.dds
mkdir ..\dds\dave\songheadings
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\songheadings -srgb -y dave\songheadings\californiaheading.png
rename ..\dds\dave\songheadings\californiaheading.DDS californiaheading.dds
mkdir ..\dds\dave\songheadings
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\songheadings -srgb -y dave\songheadings\cheatingheading.png
rename ..\dds\dave\songheadings\cheatingheading.DDS cheatingheading.dds
mkdir ..\dds\dave\songheadings
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\songheadings -srgb -y dave\songheadings\daveheading.png
rename ..\dds\dave\songheadings\daveheading.DDS daveheading.dds
mkdir ..\dds\dave\songheadings
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\songheadings -srgb -y dave\songheadings\expungedheading.png
rename ..\dds\dave\songheadings\expungedheading.DDS expungedheading.dds
mkdir ..\dds\dave\songheadings
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\songheadings -srgb -y dave\songheadings\festivalheading.png
rename ..\dds\dave\songheadings\festivalheading.DDS festivalheading.dds
mkdir ..\dds\dave\songheadings
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\songheadings -srgb -y dave\songheadings\fnafheading.png
rename ..\dds\dave\songheadings\fnafheading.DDS fnafheading.dds
mkdir ..\dds\dave\songheadings
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\songheadings -srgb -y dave\songheadings\fnfengeading.png
rename ..\dds\dave\songheadings\fnfengeading.DDS fnfengeading.dds
mkdir ..\dds\dave\songheadings
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\songheadings -srgb -y dave\songheadings\glitchheading.png
rename ..\dds\dave\songheadings\glitchheading.DDS glitchheading.dds
mkdir ..\dds\dave\songheadings
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\songheadings -srgb -y dave\songheadings\interdimensionalheading.png
rename ..\dds\dave\songheadings\interdimensionalheading.DDS interdimensionalheading.dds
mkdir ..\dds\dave\songheadings
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\songheadings -srgb -y dave\songheadings\kabungaheading.png
rename ..\dds\dave\songheadings\kabungaheading.DDS kabungaheading.dds
mkdir ..\dds\dave\songheadings
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\songheadings -srgb -y dave\songheadings\recursedheading.png
rename ..\dds\dave\songheadings\recursedheading.DDS recursedheading.dds
mkdir ..\dds\dave\songheadings
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\songheadings -srgb -y dave\songheadings\secretleakheading.png
rename ..\dds\dave\songheadings\secretleakheading.DDS secretleakheading.dds
mkdir ..\dds\dave\songheadings
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\songheadings -srgb -y dave\songheadings\somethingheading.png
rename ..\dds\dave\songheadings\somethingheading.DDS somethingheading.dds
mkdir ..\dds\dave\songheadings
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\songheadings -srgb -y dave\songheadings\splitathonheading.png
rename ..\dds\dave\songheadings\splitathonheading.DDS splitathonheading.dds
mkdir ..\dds\dave\songheadings
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\songheadings -srgb -y dave\songheadings\tristanheading.png
rename ..\dds\dave\songheadings\tristanheading.DDS tristanheading.dds
mkdir ..\dds\dave\songheadings
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\songheadings -srgb -y dave\songheadings\unfairheading.png
rename ..\dds\dave\songheadings\unfairheading.DDS unfairheading.dds
mkdir ..\dds\dave\splitathon
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\splitathon -srgb -y dave\splitathon\splitathon_bambi.png
rename ..\dds\dave\splitathon\splitathon_bambi.DDS splitathon_bambi.dds
mkdir ..\dds\dave\splitathon
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\splitathon -srgb -y dave\splitathon\splitathon_dave.png
rename ..\dds\dave\splitathon\splitathon_dave.DDS splitathon_dave.dds
mkdir ..\dds\dave
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave -srgb -y dave\spotlight.png
rename ..\dds\dave\spotlight.DDS spotlight.dds
mkdir ..\dds\dave
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave -srgb -y dave\timebar.png
rename ..\dds\dave\timebar.DDS timebar.dds
mkdir ..\dds\dave\title
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title -srgb -y dave\title\arrowleft_idle.png
rename ..\dds\dave\title\arrowleft_idle.DDS arrowleft_idle.dds
mkdir ..\dds\dave\title
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title -srgb -y dave\title\arrowleft_pressed.png
rename ..\dds\dave\title\arrowleft_pressed.DDS arrowleft_pressed.dds
mkdir ..\dds\dave\title
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title -srgb -y dave\title\arrowright_idle.png
rename ..\dds\dave\title\arrowright_idle.DDS arrowright_idle.dds
mkdir ..\dds\dave\title
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title -srgb -y dave\title\arrowright_pressed.png
rename ..\dds\dave\title\arrowright_pressed.DDS arrowright_pressed.dds
mkdir ..\dds\dave\title\backgrounds
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\backgrounds -srgb -y dave\title\backgrounds\aadsta.png
rename ..\dds\dave\title\backgrounds\aadsta.DDS aadsta.dds
mkdir ..\dds\dave\title\backgrounds
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\backgrounds -srgb -y dave\title\backgrounds\artiztgmer.png
rename ..\dds\dave\title\backgrounds\artiztgmer.DDS artiztgmer.dds
mkdir ..\dds\dave\title\backgrounds
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\backgrounds -srgb -y dave\title\backgrounds\deltakastel.png
rename ..\dds\dave\title\backgrounds\deltakastel.DDS deltakastel.dds
mkdir ..\dds\dave\title\backgrounds
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\backgrounds -srgb -y dave\title\backgrounds\deltakastel2.png
rename ..\dds\dave\title\backgrounds\deltakastel2.DDS deltakastel2.dds
mkdir ..\dds\dave\title\backgrounds
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\backgrounds -srgb -y dave\title\backgrounds\deltakastel3.png
rename ..\dds\dave\title\backgrounds\deltakastel3.DDS deltakastel3.dds
mkdir ..\dds\dave\title\backgrounds
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\backgrounds -srgb -y dave\title\backgrounds\deltakastel4.png
rename ..\dds\dave\title\backgrounds\deltakastel4.DDS deltakastel4.dds
mkdir ..\dds\dave\title\backgrounds
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\backgrounds -srgb -y dave\title\backgrounds\deltakastel5.png
rename ..\dds\dave\title\backgrounds\deltakastel5.DDS deltakastel5.dds
mkdir ..\dds\dave\title\backgrounds
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\backgrounds -srgb -y dave\title\backgrounds\diamond man.png
rename ..\dds\dave\title\backgrounds\diamond man.DDS diamond man.dds
mkdir ..\dds\dave\title\backgrounds
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\backgrounds -srgb -y dave\title\backgrounds\jukebox.png
rename ..\dds\dave\title\backgrounds\jukebox.DDS jukebox.dds
mkdir ..\dds\dave\title\backgrounds
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\backgrounds -srgb -y dave\title\backgrounds\kiazu.png
rename ..\dds\dave\title\backgrounds\kiazu.DDS kiazu.dds
mkdir ..\dds\dave\title\backgrounds
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\backgrounds -srgb -y dave\title\backgrounds\lancey.png
rename ..\dds\dave\title\backgrounds\lancey.DDS lancey.dds
mkdir ..\dds\dave\title\backgrounds
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\backgrounds -srgb -y dave\title\backgrounds\mamakotomi.png
rename ..\dds\dave\title\backgrounds\mamakotomi.DDS mamakotomi.dds
mkdir ..\dds\dave\title\backgrounds
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\backgrounds -srgb -y dave\title\backgrounds\mantis.png
rename ..\dds\dave\title\backgrounds\mantis.DDS mantis.dds
mkdir ..\dds\dave\title\backgrounds
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\backgrounds -srgb -y dave\title\backgrounds\mepperpint.png
rename ..\dds\dave\title\backgrounds\mepperpint.DDS mepperpint.dds
mkdir ..\dds\dave\title\backgrounds
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\backgrounds -srgb -y dave\title\backgrounds\morie.png
rename ..\dds\dave\title\backgrounds\morie.DDS morie.dds
mkdir ..\dds\dave\title\backgrounds
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\backgrounds -srgb -y dave\title\backgrounds\neon.png
rename ..\dds\dave\title\backgrounds\neon.DDS neon.dds
mkdir ..\dds\dave\title\backgrounds\nostalgia
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\backgrounds\nostalgia -srgb -y dave\title\backgrounds\nostalgia\1.png
rename ..\dds\dave\title\backgrounds\nostalgia\1.DDS 1.dds
mkdir ..\dds\dave\title\backgrounds\nostalgia
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\backgrounds\nostalgia -srgb -y dave\title\backgrounds\nostalgia\2.png
rename ..\dds\dave\title\backgrounds\nostalgia\2.DDS 2.dds
mkdir ..\dds\dave\title\backgrounds\nostalgia
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\backgrounds\nostalgia -srgb -y dave\title\backgrounds\nostalgia\3.png
rename ..\dds\dave\title\backgrounds\nostalgia\3.DDS 3.dds
mkdir ..\dds\dave\title\backgrounds\nostalgia
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\backgrounds\nostalgia -srgb -y dave\title\backgrounds\nostalgia\4.png
rename ..\dds\dave\title\backgrounds\nostalgia\4.DDS 4.dds
mkdir ..\dds\dave\title\backgrounds\nostalgia
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\backgrounds\nostalgia -srgb -y dave\title\backgrounds\nostalgia\5.png
rename ..\dds\dave\title\backgrounds\nostalgia\5.DDS 5.dds
mkdir ..\dds\dave\title\backgrounds\nostalgia
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\backgrounds\nostalgia -srgb -y dave\title\backgrounds\nostalgia\6.png
rename ..\dds\dave\title\backgrounds\nostalgia\6.DDS 6.dds
mkdir ..\dds\dave\title\backgrounds\nostalgia
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\backgrounds\nostalgia -srgb -y dave\title\backgrounds\nostalgia\7.png
rename ..\dds\dave\title\backgrounds\nostalgia\7.DDS 7.dds
mkdir ..\dds\dave\title\backgrounds\nostalgia
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\backgrounds\nostalgia -srgb -y dave\title\backgrounds\nostalgia\8.png
rename ..\dds\dave\title\backgrounds\nostalgia\8.DDS 8.dds
mkdir ..\dds\dave\title\backgrounds
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\backgrounds -srgb -y dave\title\backgrounds\onuko.png
rename ..\dds\dave\title\backgrounds\onuko.DDS onuko.dds
mkdir ..\dds\dave\title\backgrounds
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\backgrounds -srgb -y dave\title\backgrounds\ps.png
rename ..\dds\dave\title\backgrounds\ps.DDS ps.dds
mkdir ..\dds\dave\title\backgrounds
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\backgrounds -srgb -y dave\title\backgrounds\ramzgaming.png
rename ..\dds\dave\title\backgrounds\ramzgaming.DDS ramzgaming.dds
mkdir ..\dds\dave\title\backgrounds
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\backgrounds -srgb -y dave\title\backgrounds\ricee_png.png
rename ..\dds\dave\title\backgrounds\ricee_.DDS ricee_.dds
mkdir ..\dds\dave\title\backgrounds
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\backgrounds -srgb -y dave\title\backgrounds\sk0rbias.png
rename ..\dds\dave\title\backgrounds\sk0rbias.DDS sk0rbias.dds
mkdir ..\dds\dave\title\backgrounds
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\backgrounds -srgb -y dave\title\backgrounds\swagnotrllythemod.png
rename ..\dds\dave\title\backgrounds\swagnotrllythemod.DDS swagnotrllythemod.dds
mkdir ..\dds\dave\title\backgrounds
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\backgrounds -srgb -y dave\title\backgrounds\zombought.png
rename ..\dds\dave\title\backgrounds\zombought.DDS zombought.dds
mkdir ..\dds\dave\title
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title -srgb -y dave\title\charselectguide.png
rename ..\dds\dave\title\charselectguide.DDS charselectguide.dds
mkdir ..\dds\dave\title
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title -srgb -y dave\title\checkeredbg.png
rename ..\dds\dave\title\checkeredbg.DDS checkeredbg.dds
mkdir ..\dds\dave\title
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title -srgb -y dave\title\cooloverlay.png
rename ..\dds\dave\title\cooloverlay.DDS cooloverlay.dds
mkdir ..\dds\dave\title\credits\icons\beta testers
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\credits\icons\beta testers -srgb -y dave\title\credits\icons\beta testers\artursef.png
rename ..\dds\dave\title\credits\icons\beta testers\artursef.DDS artursef.dds
mkdir ..\dds\dave\title\credits\icons\beta testers
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\credits\icons\beta testers -srgb -y dave\title\credits\icons\beta testers\ashtonyes.png
rename ..\dds\dave\title\credits\icons\beta testers\ashtonyes.DDS ashtonyes.dds
mkdir ..\dds\dave\title\credits\icons\beta testers
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\credits\icons\beta testers -srgb -y dave\title\credits\icons\beta testers\bendygaming_1.png
rename ..\dds\dave\title\credits\icons\beta testers\bendygaming_1.DDS bendygaming_1.dds
mkdir ..\dds\dave\title\credits\icons\beta testers
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\credits\icons\beta testers -srgb -y dave\title\credits\icons\beta testers\cotiles.png
rename ..\dds\dave\title\credits\icons\beta testers\cotiles.DDS cotiles.dds
mkdir ..\dds\dave\title\credits\icons\beta testers
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\credits\icons\beta testers -srgb -y dave\title\credits\icons\beta testers\foxnap.png
rename ..\dds\dave\title\credits\icons\beta testers\foxnap.DDS foxnap.dds
mkdir ..\dds\dave\title\credits\icons\beta testers
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\credits\icons\beta testers -srgb -y dave\title\credits\icons\beta testers\gorbini.png
rename ..\dds\dave\title\credits\icons\beta testers\gorbini.DDS gorbini.dds
mkdir ..\dds\dave\title\credits\icons\beta testers
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\credits\icons\beta testers -srgb -y dave\title\credits\icons\beta testers\letsy.png
rename ..\dds\dave\title\credits\icons\beta testers\letsy.DDS letsy.dds
mkdir ..\dds\dave\title\credits\icons\beta testers
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\credits\icons\beta testers -srgb -y dave\title\credits\icons\beta testers\log man.png
rename ..\dds\dave\title\credits\icons\beta testers\log man.DDS log man.dds
mkdir ..\dds\dave\title\credits\icons\beta testers
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\credits\icons\beta testers -srgb -y dave\title\credits\icons\beta testers\lordryan1999.png
rename ..\dds\dave\title\credits\icons\beta testers\lordryan1999.DDS lordryan1999.dds
mkdir ..\dds\dave\title\credits\icons\beta testers
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\credits\icons\beta testers -srgb -y dave\title\credits\icons\beta testers\mantis.png
rename ..\dds\dave\title\credits\icons\beta testers\mantis.DDS mantis.dds
mkdir ..\dds\dave\title\credits\icons\beta testers
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\credits\icons\beta testers -srgb -y dave\title\credits\icons\beta testers\miko.png
rename ..\dds\dave\title\credits\icons\beta testers\miko.DDS miko.dds
mkdir ..\dds\dave\title\credits\icons\beta testers
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\credits\icons\beta testers -srgb -y dave\title\credits\icons\beta testers\mooncakeez.png
rename ..\dds\dave\title\credits\icons\beta testers\mooncakeez.DDS mooncakeez.dds
mkdir ..\dds\dave\title\credits\icons\beta testers
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\credits\icons\beta testers -srgb -y dave\title\credits\icons\beta testers\nihilistt.png
rename ..\dds\dave\title\credits\icons\beta testers\nihilistt.DDS nihilistt.dds
mkdir ..\dds\dave\title\credits\icons\beta testers
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\credits\icons\beta testers -srgb -y dave\title\credits\icons\beta testers\normal.png
rename ..\dds\dave\title\credits\icons\beta testers\normal.DDS normal.dds
mkdir ..\dds\dave\title\credits\icons\beta testers
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\credits\icons\beta testers -srgb -y dave\title\credits\icons\beta testers\peejeada.png
rename ..\dds\dave\title\credits\icons\beta testers\peejeada.DDS peejeada.dds
mkdir ..\dds\dave\title\credits\icons\beta testers
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\credits\icons\beta testers -srgb -y dave\title\credits\icons\beta testers\rendurse.png
rename ..\dds\dave\title\credits\icons\beta testers\rendurse.DDS rendurse.dds
mkdir ..\dds\dave\title\credits\icons\beta testers
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\credits\icons\beta testers -srgb -y dave\title\credits\icons\beta testers\silver escaper.png
rename ..\dds\dave\title\credits\icons\beta testers\silver escaper.DDS silver escaper.dds
mkdir ..\dds\dave\title\credits\icons\beta testers
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\credits\icons\beta testers -srgb -y dave\title\credits\icons\beta testers\stev.png
rename ..\dds\dave\title\credits\icons\beta testers\stev.DDS stev.dds
mkdir ..\dds\dave\title\credits\icons\beta testers
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\credits\icons\beta testers -srgb -y dave\title\credits\icons\beta testers\techevent.png
rename ..\dds\dave\title\credits\icons\beta testers\techevent.DDS techevent.dds
mkdir ..\dds\dave\title\credits\icons\beta testers
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\credits\icons\beta testers -srgb -y dave\title\credits\icons\beta testers\trustvvorthy.png
rename ..\dds\dave\title\credits\icons\beta testers\trustvvorthy.DDS trustvvorthy.dds
mkdir ..\dds\dave\title\credits\icons\beta testers
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\credits\icons\beta testers -srgb -y dave\title\credits\icons\beta testers\vanquiler.png
rename ..\dds\dave\title\credits\icons\beta testers\vanquiler.DDS vanquiler.dds
mkdir ..\dds\dave\title\credits\icons\beta testers
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\credits\icons\beta testers -srgb -y dave\title\credits\icons\beta testers\vex.png
rename ..\dds\dave\title\credits\icons\beta testers\vex.DDS vex.dds
mkdir ..\dds\dave\title\credits\icons\beta testers
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\credits\icons\beta testers -srgb -y dave\title\credits\icons\beta testers\villezen.png
rename ..\dds\dave\title\credits\icons\beta testers\villezen.DDS villezen.dds
mkdir ..\dds\dave\title\credits\icons\beta testers
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\credits\icons\beta testers -srgb -y dave\title\credits\icons\beta testers\weednose.png
rename ..\dds\dave\title\credits\icons\beta testers\weednose.DDS weednose.dds
mkdir ..\dds\dave\title\credits\icons\beta testers
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\credits\icons\beta testers -srgb -y dave\title\credits\icons\beta testers\wildy.png
rename ..\dds\dave\title\credits\icons\beta testers\wildy.DDS wildy.dds
mkdir ..\dds\dave\title\credits\icons\beta testers
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\credits\icons\beta testers -srgb -y dave\title\credits\icons\beta testers\xml.png
rename ..\dds\dave\title\credits\icons\beta testers\xml.DDS xml.dds
mkdir ..\dds\dave\title\credits\icons\beta testers
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\credits\icons\beta testers -srgb -y dave\title\credits\icons\beta testers\youraveragemental.png
rename ..\dds\dave\title\credits\icons\beta testers\youraveragemental.DDS youraveragemental.dds
mkdir ..\dds\dave\title\credits\icons\beta testers
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\credits\icons\beta testers -srgb -y dave\title\credits\icons\beta testers\ztgds.png
rename ..\dds\dave\title\credits\icons\beta testers\ztgds.DDS ztgds.dds
mkdir ..\dds\dave\title\credits\icons\contributors
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\credits\icons\contributors -srgb -y dave\title\credits\icons\contributors\Cup.png
rename ..\dds\dave\title\credits\icons\contributors\Cup.DDS Cup.dds
mkdir ..\dds\dave\title\credits\icons\contributors
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\credits\icons\contributors -srgb -y dave\title\credits\icons\contributors\ShiftyTM.png
rename ..\dds\dave\title\credits\icons\contributors\ShiftyTM.DDS ShiftyTM.dds
mkdir ..\dds\dave\title\credits\icons\contributors
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\credits\icons\contributors -srgb -y dave\title\credits\icons\contributors\aadsta.png
rename ..\dds\dave\title\credits\icons\contributors\aadsta.DDS aadsta.dds
mkdir ..\dds\dave\title\credits\icons\contributors
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\credits\icons\contributors -srgb -y dave\title\credits\icons\contributors\alexander cooper 19.png
rename ..\dds\dave\title\credits\icons\contributors\alexander cooper 19.DDS alexander cooper 19.dds
mkdir ..\dds\dave\title\credits\icons\contributors
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\credits\icons\contributors -srgb -y dave\title\credits\icons\contributors\chromasen.png
rename ..\dds\dave\title\credits\icons\contributors\chromasen.DDS chromasen.dds
mkdir ..\dds\dave\title\credits\icons\contributors
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\credits\icons\contributors -srgb -y dave\title\credits\icons\contributors\devianator.png
rename ..\dds\dave\title\credits\icons\contributors\devianator.DDS devianator.dds
mkdir ..\dds\dave\title\credits\icons\contributors
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\credits\icons\contributors -srgb -y dave\title\credits\icons\contributors\evdial.png
rename ..\dds\dave\title\credits\icons\contributors\evdial.DDS evdial.dds
mkdir ..\dds\dave\title\credits\icons\contributors
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\credits\icons\contributors -srgb -y dave\title\credits\icons\contributors\jukebox.png
rename ..\dds\dave\title\credits\icons\contributors\jukebox.DDS jukebox.dds
mkdir ..\dds\dave\title\credits\icons\contributors
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\credits\icons\contributors -srgb -y dave\title\credits\icons\contributors\lancey.png
rename ..\dds\dave\title\credits\icons\contributors\lancey.DDS lancey.dds
mkdir ..\dds\dave\title\credits\icons\contributors
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\credits\icons\contributors -srgb -y dave\title\credits\icons\contributors\oxygen.png
rename ..\dds\dave\title\credits\icons\contributors\oxygen.DDS oxygen.dds
mkdir ..\dds\dave\title\credits\icons\contributors
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\credits\icons\contributors -srgb -y dave\title\credits\icons\contributors\paraso.png
rename ..\dds\dave\title\credits\icons\contributors\paraso.DDS paraso.dds
mkdir ..\dds\dave\title\credits\icons\contributors
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\credits\icons\contributors -srgb -y dave\title\credits\icons\contributors\r34ld34l.png
rename ..\dds\dave\title\credits\icons\contributors\r34ld34l.DDS r34ld34l.dds
mkdir ..\dds\dave\title\credits\icons\contributors
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\credits\icons\contributors -srgb -y dave\title\credits\icons\contributors\ruby.png
rename ..\dds\dave\title\credits\icons\contributors\ruby.DDS ruby.dds
mkdir ..\dds\dave\title\credits\icons\contributors
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\credits\icons\contributors -srgb -y dave\title\credits\icons\contributors\sammypigzy.png
rename ..\dds\dave\title\credits\icons\contributors\sammypigzy.DDS sammypigzy.dds
mkdir ..\dds\dave\title\credits\icons\contributors
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\credits\icons\contributors -srgb -y dave\title\credits\icons\contributors\sibottle.png
rename ..\dds\dave\title\credits\icons\contributors\sibottle.DDS sibottle.dds
mkdir ..\dds\dave\title\credits\icons\contributors
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\credits\icons\contributors -srgb -y dave\title\credits\icons\contributors\sk0rbias.png
rename ..\dds\dave\title\credits\icons\contributors\sk0rbias.DDS sk0rbias.dds
mkdir ..\dds\dave\title\credits\icons\contributors
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\credits\icons\contributors -srgb -y dave\title\credits\icons\contributors\sky.png
rename ..\dds\dave\title\credits\icons\contributors\sky.DDS sky.dds
mkdir ..\dds\dave\title\credits\icons\contributors
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\credits\icons\contributors -srgb -y dave\title\credits\icons\contributors\steph45.png
rename ..\dds\dave\title\credits\icons\contributors\steph45.DDS steph45.dds
mkdir ..\dds\dave\title\credits\icons\contributors
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\credits\icons\contributors -srgb -y dave\title\credits\icons\contributors\top 10 awesome.png
rename ..\dds\dave\title\credits\icons\contributors\top 10 awesome.DDS top 10 awesome.dds
mkdir ..\dds\dave\title\credits\icons\contributors
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\credits\icons\contributors -srgb -y dave\title\credits\icons\contributors\wugalex.png
rename ..\dds\dave\title\credits\icons\contributors\wugalex.DDS wugalex.dds
mkdir ..\dds\dave\title\credits\icons\contributors
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\credits\icons\contributors -srgb -y dave\title\credits\icons\contributors\your mom.png
rename ..\dds\dave\title\credits\icons\contributors\your mom.DDS your mom.dds
mkdir ..\dds\dave\title\credits\icons\contributors
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\credits\icons\contributors -srgb -y dave\title\credits\icons\contributors\youraveragemental.png
rename ..\dds\dave\title\credits\icons\contributors\youraveragemental.DDS youraveragemental.dds
mkdir ..\dds\dave\title\credits\icons\developers
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\credits\icons\developers -srgb -y dave\title\credits\icons\developers\billy bobbo.png
rename ..\dds\dave\title\credits\icons\developers\billy bobbo.DDS billy bobbo.dds
mkdir ..\dds\dave\title\credits\icons\developers
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\credits\icons\developers -srgb -y dave\title\credits\icons\developers\erizur.png
rename ..\dds\dave\title\credits\icons\developers\erizur.DDS erizur.dds
mkdir ..\dds\dave\title\credits\icons\developers
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\credits\icons\developers -srgb -y dave\title\credits\icons\developers\missingtextureman101.png
rename ..\dds\dave\title\credits\icons\developers\missingtextureman101.DDS missingtextureman101.dds
mkdir ..\dds\dave\title\credits\icons\developers
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\credits\icons\developers -srgb -y dave\title\credits\icons\developers\moldygh.png
rename ..\dds\dave\title\credits\icons\developers\moldygh.DDS moldygh.dds
mkdir ..\dds\dave\title\credits\icons\developers
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\credits\icons\developers -srgb -y dave\title\credits\icons\developers\pointy.png
rename ..\dds\dave\title\credits\icons\developers\pointy.DDS pointy.dds
mkdir ..\dds\dave\title\credits\icons\developers
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\credits\icons\developers -srgb -y dave\title\credits\icons\developers\rapparep lol.png
rename ..\dds\dave\title\credits\icons\developers\rapparep lol.DDS rapparep lol.dds
mkdir ..\dds\dave\title\credits\icons\developers
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\credits\icons\developers -srgb -y dave\title\credits\icons\developers\t5mpler.png
rename ..\dds\dave\title\credits\icons\developers\t5mpler.DDS t5mpler.dds
mkdir ..\dds\dave\title\credits\icons\developers
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\credits\icons\developers -srgb -y dave\title\credits\icons\developers\thebuilderxd.png
rename ..\dds\dave\title\credits\icons\developers\thebuilderxd.DDS thebuilderxd.dds
mkdir ..\dds\dave\title\credits\icons\developers
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\credits\icons\developers -srgb -y dave\title\credits\icons\developers\zmac.png
rename ..\dds\dave\title\credits\icons\developers\zmac.DDS zmac.dds
mkdir ..\dds\dave\title\credits\icons\special thanks
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\credits\icons\special thanks -srgb -y dave\title\credits\icons\special thanks\you.png
rename ..\dds\dave\title\credits\icons\special thanks\you.DDS you.dds
mkdir ..\dds\dave\title\credits\icons\translators
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\credits\icons\translators -srgb -y dave\title\credits\icons\translators\aizakku.png
rename ..\dds\dave\title\credits\icons\translators\aizakku.DDS aizakku.dds
mkdir ..\dds\dave\title\credits\icons\translators
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\credits\icons\translators -srgb -y dave\title\credits\icons\translators\dani.png
rename ..\dds\dave\title\credits\icons\translators\dani.DDS dani.dds
mkdir ..\dds\dave\title\credits\icons\translators
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\credits\icons\translators -srgb -y dave\title\credits\icons\translators\soulegal.png
rename ..\dds\dave\title\credits\icons\translators\soulegal.DDS soulegal.dds
mkdir ..\dds\dave\title\credits\socialmedia
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\credits\socialmedia -srgb -y dave\title\credits\socialmedia\discord.png
rename ..\dds\dave\title\credits\socialmedia\discord.DDS discord.dds
mkdir ..\dds\dave\title\credits\socialmedia
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\credits\socialmedia -srgb -y dave\title\credits\socialmedia\gamebanana.png
rename ..\dds\dave\title\credits\socialmedia\gamebanana.DDS gamebanana.dds
mkdir ..\dds\dave\title\credits\socialmedia
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\credits\socialmedia -srgb -y dave\title\credits\socialmedia\roblox.png
rename ..\dds\dave\title\credits\socialmedia\roblox.DDS roblox.dds
mkdir ..\dds\dave\title\credits\socialmedia
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\credits\socialmedia -srgb -y dave\title\credits\socialmedia\soundcloud.png
rename ..\dds\dave\title\credits\socialmedia\soundcloud.DDS soundcloud.dds
mkdir ..\dds\dave\title\credits\socialmedia
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\credits\socialmedia -srgb -y dave\title\credits\socialmedia\twitch.png
rename ..\dds\dave\title\credits\socialmedia\twitch.DDS twitch.dds
mkdir ..\dds\dave\title\credits\socialmedia
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\credits\socialmedia -srgb -y dave\title\credits\socialmedia\twitter.png
rename ..\dds\dave\title\credits\socialmedia\twitter.DDS twitter.dds
mkdir ..\dds\dave\title\credits\socialmedia
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\credits\socialmedia -srgb -y dave\title\credits\socialmedia\youtube.png
rename ..\dds\dave\title\credits\socialmedia\youtube.DDS youtube.dds
mkdir ..\dds\dave\title\credits\titles
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\credits\titles -srgb -y dave\title\credits\titles\beta testers.png
rename ..\dds\dave\title\credits\titles\beta testers.DDS beta testers.dds
mkdir ..\dds\dave\title\credits\titles
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\credits\titles -srgb -y dave\title\credits\titles\contributors.png
rename ..\dds\dave\title\credits\titles\contributors.DDS contributors.dds
mkdir ..\dds\dave\title\credits\titles
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\credits\titles -srgb -y dave\title\credits\titles\developers.png
rename ..\dds\dave\title\credits\titles\developers.DDS developers.dds
mkdir ..\dds\dave\title\credits\titles
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\credits\titles -srgb -y dave\title\credits\titles\special thanks.png
rename ..\dds\dave\title\credits\titles\special thanks.DDS special thanks.dds
mkdir ..\dds\dave\title\credits\titles
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\credits\titles -srgb -y dave\title\credits\titles\translators.png
rename ..\dds\dave\title\credits\titles\translators.DDS translators.dds
mkdir ..\dds\dave\title
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title -srgb -y dave\title\flixel_intro.png
rename ..\dds\dave\title\flixel_intro.DDS flixel_intro.dds
mkdir ..\dds\dave\title
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title -srgb -y dave\title\fnafengine.png
rename ..\dds\dave\title\fnafengine.DDS fnafengine.dds
mkdir ..\dds\dave\title
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title -srgb -y dave\title\fnfengine.png
rename ..\dds\dave\title\fnfengine.DDS fnfengine.dds
mkdir ..\dds\dave\title
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title -srgb -y dave\title\gfdancetitle.png
rename ..\dds\dave\title\gfdancetitle.DDS gfdancetitle.dds
mkdir ..\dds\dave\title
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title -srgb -y dave\title\gridtemplate.png
rename ..\dds\dave\title\gridtemplate.DDS gridtemplate.dds
mkdir ..\dds\dave\title
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title -srgb -y dave\title\healthbar-3d.png
rename ..\dds\dave\title\healthbar-3d.DDS healthbar-3d.dds
mkdir ..\dds\dave\title
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title -srgb -y dave\title\healthbar.png
rename ..\dds\dave\title\healthbar.DDS healthbar.dds
mkdir ..\dds\dave\title
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title -srgb -y dave\title\logo.png
rename ..\dds\dave\title\logo.DDS logo.dds
mkdir ..\dds\dave\title
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title -srgb -y dave\title\logobumpin.png
rename ..\dds\dave\title\logobumpin.DDS logobumpin.dds
mkdir ..\dds\dave\title
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title -srgb -y dave\title\logobumpinexpunged.png
rename ..\dds\dave\title\logobumpinexpunged.DDS logobumpinexpunged.dds
mkdir ..\dds\dave\title
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title -srgb -y dave\title\main_menu_icons.png
rename ..\dds\dave\title\main_menu_icons.DDS main_menu_icons.dds
mkdir ..\dds\dave\title\mainmenu
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\mainmenu -srgb -y dave\title\mainmenu\eye.png
rename ..\dds\dave\title\mainmenu\eye.DDS eye.dds
mkdir ..\dds\dave\title\mainmenu
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\mainmenu -srgb -y dave\title\mainmenu\select_thing.png
rename ..\dds\dave\title\mainmenu\select_thing.DDS select_thing.dds
mkdir ..\dds\dave\title
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title -srgb -y dave\title\menu_big_icons.png
rename ..\dds\dave\title\menu_big_icons.DDS menu_big_icons.dds
mkdir ..\dds\dave\title\packs
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\packs -srgb -y dave\title\packs\dave.png
rename ..\dds\dave\title\packs\dave.DDS dave.dds
mkdir ..\dds\dave\title\packs
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\packs -srgb -y dave\title\packs\extras.png
rename ..\dds\dave\title\packs\extras.DDS extras.dds
mkdir ..\dds\dave\title\packs
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\packs -srgb -y dave\title\packs\joke.png
rename ..\dds\dave\title\packs\joke.DDS joke.dds
mkdir ..\dds\dave\title\packs
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\packs -srgb -y dave\title\packs\terminal.png
rename ..\dds\dave\title\packs\terminal.DDS terminal.dds
mkdir ..\dds\dave\title\packs
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\packs -srgb -y dave\title\packs\uhoh.png
rename ..\dds\dave\title\packs\uhoh.DDS uhoh.dds
mkdir ..\dds\dave\title\storymenu
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\storymenu -srgb -y dave\title\storymenu\week0.png
rename ..\dds\dave\title\storymenu\week0.DDS week0.dds
mkdir ..\dds\dave\title\storymenu
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\storymenu -srgb -y dave\title\storymenu\week1.png
rename ..\dds\dave\title\storymenu\week1.DDS week1.dds
mkdir ..\dds\dave\title\storymenu
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\storymenu -srgb -y dave\title\storymenu\week2.png
rename ..\dds\dave\title\storymenu\week2.DDS week2.dds
mkdir ..\dds\dave\title\storymenu
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\storymenu -srgb -y dave\title\storymenu\week3.png
rename ..\dds\dave\title\storymenu\week3.DDS week3.dds
mkdir ..\dds\dave\title\storymenu
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\storymenu -srgb -y dave\title\storymenu\week4.png
rename ..\dds\dave\title\storymenu\week4.DDS week4.dds
mkdir ..\dds\dave\title\storymenu
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\storymenu -srgb -y dave\title\storymenu\week5.png
rename ..\dds\dave\title\storymenu\week5.DDS week5.dds
mkdir ..\dds\dave\title\storymenu
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\storymenu -srgb -y dave\title\storymenu\weekquestionmark.png
rename ..\dds\dave\title\storymenu\weekquestionmark.DDS weekquestionmark.dds
mkdir ..\dds\dave\title
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title -srgb -y dave\title\transition.png
rename ..\dds\dave\title\transition.DDS transition.dds
mkdir ..\dds\dave\title\weekbanners
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\weekbanners -srgb -y dave\title\weekbanners\bamboi.png
rename ..\dds\dave\title\weekbanners\bamboi.DDS bamboi.dds
mkdir ..\dds\dave\title\weekbanners
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\weekbanners -srgb -y dave\title\weekbanners\davehouse.png
rename ..\dds\dave\title\weekbanners\davehouse.DDS davehouse.dds
mkdir ..\dds\dave\title\weekbanners
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\weekbanners -srgb -y dave\title\weekbanners\festival.png
rename ..\dds\dave\title\weekbanners\festival.DDS festival.dds
mkdir ..\dds\dave\title\weekbanners
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\weekbanners -srgb -y dave\title\weekbanners\masterweek.png
rename ..\dds\dave\title\weekbanners\masterweek.DDS masterweek.dds
mkdir ..\dds\dave\title\weekbanners
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\weekbanners -srgb -y dave\title\weekbanners\masterweekquestion.png
rename ..\dds\dave\title\weekbanners\masterweekquestion.DDS masterweekquestion.dds
mkdir ..\dds\dave\title\weekbanners
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\weekbanners -srgb -y dave\title\weekbanners\splitathon.png
rename ..\dds\dave\title\weekbanners\splitathon.DDS splitathon.dds
mkdir ..\dds\dave\title\weekbanners
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\weekbanners -srgb -y dave\title\weekbanners\warmup.png
rename ..\dds\dave\title\weekbanners\warmup.DDS warmup.dds
mkdir ..\dds\dave
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave -srgb -y dave\titleenter.png
rename ..\dds\dave\titleenter.DDS titleenter.dds
mkdir ..\dds\dave\ui\3d
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\ui\3d -srgb -y dave\ui\3d\bad.png
rename ..\dds\dave\ui\3d\bad.DDS bad.dds
mkdir ..\dds\dave\ui\3d
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\ui\3d -srgb -y dave\ui\3d\combo.png
rename ..\dds\dave\ui\3d\combo.DDS combo.dds
mkdir ..\dds\dave\ui\3d
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\ui\3d -srgb -y dave\ui\3d\good.png
rename ..\dds\dave\ui\3d\good.DDS good.dds
mkdir ..\dds\dave\ui\3d
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\ui\3d -srgb -y dave\ui\3d\num0.png
rename ..\dds\dave\ui\3d\num0.DDS num0.dds
mkdir ..\dds\dave\ui\3d
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\ui\3d -srgb -y dave\ui\3d\num1.png
rename ..\dds\dave\ui\3d\num1.DDS num1.dds
mkdir ..\dds\dave\ui\3d
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\ui\3d -srgb -y dave\ui\3d\num2.png
rename ..\dds\dave\ui\3d\num2.DDS num2.dds
mkdir ..\dds\dave\ui\3d
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\ui\3d -srgb -y dave\ui\3d\num3.png
rename ..\dds\dave\ui\3d\num3.DDS num3.dds
mkdir ..\dds\dave\ui\3d
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\ui\3d -srgb -y dave\ui\3d\num4.png
rename ..\dds\dave\ui\3d\num4.DDS num4.dds
mkdir ..\dds\dave\ui\3d
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\ui\3d -srgb -y dave\ui\3d\num5.png
rename ..\dds\dave\ui\3d\num5.DDS num5.dds
mkdir ..\dds\dave\ui\3d
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\ui\3d -srgb -y dave\ui\3d\num6.png
rename ..\dds\dave\ui\3d\num6.DDS num6.dds
mkdir ..\dds\dave\ui\3d
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\ui\3d -srgb -y dave\ui\3d\num7.png
rename ..\dds\dave\ui\3d\num7.DDS num7.dds
mkdir ..\dds\dave\ui\3d
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\ui\3d -srgb -y dave\ui\3d\num8.png
rename ..\dds\dave\ui\3d\num8.DDS num8.dds
mkdir ..\dds\dave\ui\3d
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\ui\3d -srgb -y dave\ui\3d\num9.png
rename ..\dds\dave\ui\3d\num9.DDS num9.dds
mkdir ..\dds\dave\ui\3d
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\ui\3d -srgb -y dave\ui\3d\shit.png
rename ..\dds\dave\ui\3d\shit.DDS shit.dds
mkdir ..\dds\dave\ui\3d
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\ui\3d -srgb -y dave\ui\3d\sick.png
rename ..\dds\dave\ui\3d\sick.DDS sick.dds
mkdir ..\dds\dave\ui
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\ui -srgb -y dave\ui\backspace.png
rename ..\dds\dave\ui\backspace.DDS backspace.dds
mkdir ..\dds\dave\ui
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\ui -srgb -y dave\ui\bad.png
rename ..\dds\dave\ui\bad.DDS bad.dds
mkdir ..\dds\dave\ui
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\ui -srgb -y dave\ui\combo.png
rename ..\dds\dave\ui\combo.DDS combo.dds
mkdir ..\dds\dave\ui
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\ui -srgb -y dave\ui\doorwarning.png
rename ..\dds\dave\ui\doorwarning.DDS doorwarning.dds
mkdir ..\dds\dave\ui\glitch
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\ui\glitch -srgb -y dave\ui\glitch\glitchSwitch.png
rename ..\dds\dave\ui\glitch\glitchSwitch.DDS glitchSwitch.dds
mkdir ..\dds\dave\ui
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\ui -srgb -y dave\ui\go.png
rename ..\dds\dave\ui\go.DDS go.dds
mkdir ..\dds\dave\ui
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\ui -srgb -y dave\ui\go1.png
rename ..\dds\dave\ui\go1.DDS go1.dds
mkdir ..\dds\dave\ui
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\ui -srgb -y dave\ui\go_glitch.png
rename ..\dds\dave\ui\go_glitch.DDS go_glitch.dds
mkdir ..\dds\dave\ui
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\ui -srgb -y dave\ui\good.png
rename ..\dds\dave\ui\good.DDS good.dds
mkdir ..\dds\dave\ui
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\ui -srgb -y dave\ui\grafix.png
rename ..\dds\dave\ui\grafix.DDS grafix.dds
mkdir ..\dds\dave\ui
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\ui -srgb -y dave\ui\hellthbar.png
rename ..\dds\dave\ui\hellthbar.DDS hellthbar.dds
mkdir ..\dds\dave\ui
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\ui -srgb -y dave\ui\lose.png
rename ..\dds\dave\ui\lose.DDS lose.dds
mkdir ..\dds\dave\ui
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\ui -srgb -y dave\ui\num0.png
rename ..\dds\dave\ui\num0.DDS num0.dds
mkdir ..\dds\dave\ui
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\ui -srgb -y dave\ui\num1.png
rename ..\dds\dave\ui\num1.DDS num1.dds
mkdir ..\dds\dave\ui
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\ui -srgb -y dave\ui\num2.png
rename ..\dds\dave\ui\num2.DDS num2.dds
mkdir ..\dds\dave\ui
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\ui -srgb -y dave\ui\num3.png
rename ..\dds\dave\ui\num3.DDS num3.dds
mkdir ..\dds\dave\ui
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\ui -srgb -y dave\ui\num4.png
rename ..\dds\dave\ui\num4.DDS num4.dds
mkdir ..\dds\dave\ui
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\ui -srgb -y dave\ui\num5.png
rename ..\dds\dave\ui\num5.DDS num5.dds
mkdir ..\dds\dave\ui
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\ui -srgb -y dave\ui\num6.png
rename ..\dds\dave\ui\num6.DDS num6.dds
mkdir ..\dds\dave\ui
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\ui -srgb -y dave\ui\num7.png
rename ..\dds\dave\ui\num7.DDS num7.dds
mkdir ..\dds\dave\ui
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\ui -srgb -y dave\ui\num8.png
rename ..\dds\dave\ui\num8.DDS num8.dds
mkdir ..\dds\dave\ui
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\ui -srgb -y dave\ui\num9.png
rename ..\dds\dave\ui\num9.DDS num9.dds
mkdir ..\dds\dave\ui
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\ui -srgb -y dave\ui\particlelol.png
rename ..\dds\dave\ui\particlelol.DDS particlelol.dds
mkdir ..\dds\dave\ui
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\ui -srgb -y dave\ui\particlelollarge.png
rename ..\dds\dave\ui\particlelollarge.DDS particlelollarge.dds
mkdir ..\dds\dave\ui
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\ui -srgb -y dave\ui\ready.png
rename ..\dds\dave\ui\ready.DDS ready.dds
mkdir ..\dds\dave\ui
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\ui -srgb -y dave\ui\ready1.png
rename ..\dds\dave\ui\ready1.DDS ready1.dds
mkdir ..\dds\dave\ui
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\ui -srgb -y dave\ui\restart.png
rename ..\dds\dave\ui\restart.DDS restart.dds
mkdir ..\dds\dave\ui
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\ui -srgb -y dave\ui\set.png
rename ..\dds\dave\ui\set.DDS set.dds
mkdir ..\dds\dave\ui
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\ui -srgb -y dave\ui\set1.png
rename ..\dds\dave\ui\set1.DDS set1.dds
mkdir ..\dds\dave\ui
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\ui -srgb -y dave\ui\shapenotewarning.png
rename ..\dds\dave\ui\shapenotewarning.DDS shapenotewarning.dds
mkdir ..\dds\dave\ui
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\ui -srgb -y dave\ui\shit.png
rename ..\dds\dave\ui\shit.DDS shit.dds
mkdir ..\dds\dave\ui
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\ui -srgb -y dave\ui\sick.png
rename ..\dds\dave\ui\sick.DDS sick.dds
mkdir ..\dds\dave\ui
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\ui -srgb -y dave\ui\speech_bubble_talking.png
rename ..\dds\dave\ui\speech_bubble_talking.DDS speech_bubble_talking.dds
mkdir ..\dds\dave\ui
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\ui -srgb -y dave\ui\spr_start_sprites_0.png
rename ..\dds\dave\ui\spr_start_sprites_0.DDS spr_start_sprites_0.dds
mkdir ..\dds\dave\ui
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\ui -srgb -y dave\ui\spr_start_sprites_1.png
rename ..\dds\dave\ui\spr_start_sprites_1.DDS spr_start_sprites_1.dds
mkdir ..\dds\dave\ui
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\ui -srgb -y dave\ui\spr_start_sprites_2.png
rename ..\dds\dave\ui\spr_start_sprites_2.DDS spr_start_sprites_2.dds
mkdir ..\dds\dave
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave -srgb -y dave\vignette.png
rename ..\dds\dave\vignette.DDS vignette.dds
mkdir ..\dds\dave\weeb
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\weeb -srgb -y dave\weeb\bfpixel.png
rename ..\dds\dave\weeb\bfpixel.DDS bfpixel.dds
mkdir ..\dds\dave\weeb
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\weeb -srgb -y dave\weeb\bfpixelsdead.png
rename ..\dds\dave\weeb\bfpixelsdead.DDS bfpixelsdead.dds
mkdir ..\dds\dave\weeb
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\weeb -srgb -y dave\weeb\gfpixel.png
rename ..\dds\dave\weeb\gfpixel.DDS gfpixel.dds
mkdir ..\dds\images\png
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\images\png -srgb -y images\png\davecutscene.png
rename ..\dds\images\png\davecutscene.DDS davecutscene.dds
mkdir ..\dds\images\png
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\images\png -srgb -y images\png\gf_assets.png
rename ..\dds\images\png\gf_assets.DDS gf_assets.dds
mkdir ..\dds\mazeCutscene
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\mazeCutscene -srgb -y mazeCutscene\layer1.png
rename ..\dds\mazeCutscene\layer1.DDS layer1.dds
mkdir ..\dds\mazeCutscene
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\mazeCutscene -srgb -y mazeCutscene\layer2.png
rename ..\dds\mazeCutscene\layer2.DDS layer2.dds
mkdir ..\dds\mazeCutscene
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\mazeCutscene -srgb -y mazeCutscene\layer3.png
rename ..\dds\mazeCutscene\layer3.DDS layer3.dds
mkdir ..\dds\mazeCutscene
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\mazeCutscene -srgb -y mazeCutscene\layer4.png
rename ..\dds\mazeCutscene\layer4.DDS layer4.dds
mkdir ..\dds\menu
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\menu -srgb -y menu\fnf_main_menu_assets.png
rename ..\dds\menu\fnf_main_menu_assets.DDS fnf_main_menu_assets.dds
mkdir ..\dds\menu
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\menu -srgb -y menu\girlfriend-title.png
rename ..\dds\menu\girlfriend-title.DDS girlfriend-title.dds
mkdir ..\dds\menu
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\menu -srgb -y menu\logo.png
rename ..\dds\menu\logo.DDS logo.dds
mkdir ..\dds\menu
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\menu -srgb -y menu\menubg.png
rename ..\dds\menu\menubg.DDS menubg.dds
mkdir ..\dds\menu\storymenu
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\menu\storymenu -srgb -y menu\storymenu\campaign_menu_ui_assets.png
rename ..\dds\menu\storymenu\campaign_menu_ui_assets.DDS campaign_menu_ui_assets.dds
mkdir ..\dds\menu\storymenu
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\menu\storymenu -srgb -y menu\storymenu\campaign_menu_ui_characters.png
rename ..\dds\menu\storymenu\campaign_menu_ui_characters.DDS campaign_menu_ui_characters.dds
mkdir ..\dds\menu\storymenu
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\menu\storymenu -srgb -y menu\storymenu\week0.png
rename ..\dds\menu\storymenu\week0.DDS week0.dds
mkdir ..\dds\menu\storymenu
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\menu\storymenu -srgb -y menu\storymenu\week1.png
rename ..\dds\menu\storymenu\week1.DDS week1.dds
mkdir ..\dds\menu\storymenu
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\menu\storymenu -srgb -y menu\storymenu\week2.png
rename ..\dds\menu\storymenu\week2.DDS week2.dds
mkdir ..\dds\menu\storymenu
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\menu\storymenu -srgb -y menu\storymenu\week3.png
rename ..\dds\menu\storymenu\week3.DDS week3.dds
mkdir ..\dds\menu\storymenu
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\menu\storymenu -srgb -y menu\storymenu\week4.png
rename ..\dds\menu\storymenu\week4.DDS week4.dds
mkdir ..\dds\menu\storymenu
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\menu\storymenu -srgb -y menu\storymenu\week5.png
rename ..\dds\menu\storymenu\week5.DDS week5.dds
mkdir ..\dds\menu\storymenu
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\menu\storymenu -srgb -y menu\storymenu\week6.png
rename ..\dds\menu\storymenu\week6.DDS week6.dds
mkdir ..\dds\menu\storymenu
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\menu\storymenu -srgb -y menu\storymenu\weekmenu.png
rename ..\dds\menu\storymenu\weekmenu.DDS weekmenu.dds
mkdir ..\dds\menu
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\menu -srgb -y menu\title-bg.png
rename ..\dds\menu\title-bg.DDS title-bg.dds
mkdir ..\dds\menu
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\menu -srgb -y menu\titleenter.png
rename ..\dds\menu\titleenter.DDS titleenter.dds
mkdir ..\dds\muko\cameras\buttons
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\muko\cameras\buttons -srgb -y muko\cameras\buttons\cam_01.png
rename ..\dds\muko\cameras\buttons\cam_01.DDS cam_01.dds
mkdir ..\dds\muko\cameras\buttons
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\muko\cameras\buttons -srgb -y muko\cameras\buttons\cam_02.png
rename ..\dds\muko\cameras\buttons\cam_02.DDS cam_02.dds
mkdir ..\dds\muko\cameras\buttons
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\muko\cameras\buttons -srgb -y muko\cameras\buttons\cam_03.png
rename ..\dds\muko\cameras\buttons\cam_03.DDS cam_03.dds
mkdir ..\dds\muko\cameras\buttons
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\muko\cameras\buttons -srgb -y muko\cameras\buttons\cam_04.png
rename ..\dds\muko\cameras\buttons\cam_04.DDS cam_04.dds
mkdir ..\dds\muko\cameras\buttons
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\muko\cameras\buttons -srgb -y muko\cameras\buttons\cam_05.png
rename ..\dds\muko\cameras\buttons\cam_05.DDS cam_05.dds
mkdir ..\dds\muko\cameras\characters\dave
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\muko\cameras\characters\dave -srgb -y muko\cameras\characters\dave\dave_bar.png
rename ..\dds\muko\cameras\characters\dave\dave_bar.DDS dave_bar.dds
mkdir ..\dds\muko\cameras\characters\dave
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\muko\cameras\characters\dave -srgb -y muko\cameras\characters\dave\diner_dave.png
rename ..\dds\muko\cameras\characters\dave\diner_dave.DDS diner_dave.dds
mkdir ..\dds\muko\cameras\characters\dave
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\muko\cameras\characters\dave -srgb -y muko\cameras\characters\dave\stage_just_dave.png
rename ..\dds\muko\cameras\characters\dave\stage_just_dave.DDS stage_just_dave.dds
mkdir ..\dds\muko\cameras\characters\mix
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\muko\cameras\characters\mix -srgb -y muko\cameras\characters\mix\diner_mix.png
rename ..\dds\muko\cameras\characters\mix\diner_mix.DDS diner_mix.dds
mkdir ..\dds\muko\cameras\characters\mix
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\muko\cameras\characters\mix -srgb -y muko\cameras\characters\mix\kitchen_mix.png
rename ..\dds\muko\cameras\characters\mix\kitchen_mix.DDS kitchen_mix.dds
mkdir ..\dds\muko\cameras\characters\muko
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\muko\cameras\characters\muko -srgb -y muko\cameras\characters\muko\diner_just_muko.png
rename ..\dds\muko\cameras\characters\muko\diner_just_muko.DDS diner_just_muko.dds
mkdir ..\dds\muko\cameras\characters\muko
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\muko\cameras\characters\muko -srgb -y muko\cameras\characters\muko\muko_bar.png
rename ..\dds\muko\cameras\characters\muko\muko_bar.DDS muko_bar.dds
mkdir ..\dds\muko\cameras\characters\scott
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\muko\cameras\characters\scott -srgb -y muko\cameras\characters\scott\lounge_travis_only.png
rename ..\dds\muko\cameras\characters\scott\lounge_travis_only.DDS lounge_travis_only.dds
mkdir ..\dds\muko\cameras\characters\scott
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\muko\cameras\characters\scott -srgb -y muko\cameras\characters\scott\scott_generic.png
rename ..\dds\muko\cameras\characters\scott\scott_generic.DDS scott_generic.dds
mkdir ..\dds\muko\cameras\characters\tiktok
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\muko\cameras\characters\tiktok -srgb -y muko\cameras\characters\tiktok\kitchen_tiktok.png
rename ..\dds\muko\cameras\characters\tiktok\kitchen_tiktok.DDS kitchen_tiktok.dds
mkdir ..\dds\muko\cameras
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\muko\cameras -srgb -y muko\cameras\diner.png
rename ..\dds\muko\cameras\diner.DDS diner.dds
mkdir ..\dds\muko\cameras
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\muko\cameras -srgb -y muko\cameras\hall.png
rename ..\dds\muko\cameras\hall.DDS hall.dds
mkdir ..\dds\muko\cameras
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\muko\cameras -srgb -y muko\cameras\kitchen.png
rename ..\dds\muko\cameras\kitchen.DDS kitchen.dds
mkdir ..\dds\muko\cameras
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\muko\cameras -srgb -y muko\cameras\lounge.png
rename ..\dds\muko\cameras\lounge.DDS lounge.dds
mkdir ..\dds\muko\cameras
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\muko\cameras -srgb -y muko\cameras\map.png
rename ..\dds\muko\cameras\map.DDS map.dds
mkdir ..\dds\muko\cameras
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\muko\cameras -srgb -y muko\cameras\stage_empty.png
rename ..\dds\muko\cameras\stage_empty.DDS stage_empty.dds
mkdir ..\dds\muko\jumpscares
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\muko\jumpscares -srgb -y muko\jumpscares\dave.png
rename ..\dds\muko\jumpscares\dave.DDS dave.dds
mkdir ..\dds\muko\jumpscares
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\muko\jumpscares -srgb -y muko\jumpscares\mix.png
rename ..\dds\muko\jumpscares\mix.DDS mix.dds
mkdir ..\dds\muko\jumpscares
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\muko\jumpscares -srgb -y muko\jumpscares\muko.png
rename ..\dds\muko\jumpscares\muko.DDS muko.dds
mkdir ..\dds\muko\jumpscares
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\muko\jumpscares -srgb -y muko\jumpscares\scott.png
rename ..\dds\muko\jumpscares\scott.DDS scott.dds
mkdir ..\dds\muko\jumpscares
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\muko\jumpscares -srgb -y muko\jumpscares\tiktok.png
rename ..\dds\muko\jumpscares\tiktok.DDS tiktok.dds
mkdir ..\dds\muko\office
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\muko\office -srgb -y muko\office\canera_thing.png
rename ..\dds\muko\office\canera_thing.DDS canera_thing.dds
mkdir ..\dds\muko\office
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\muko\office -srgb -y muko\office\close_door.png
rename ..\dds\muko\office\close_door.DDS close_door.dds
mkdir ..\dds\muko\office
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\muko\office -srgb -y muko\office\cursor.png
rename ..\dds\muko\office\cursor.DDS cursor.dds
mkdir ..\dds\muko\office
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\muko\office -srgb -y muko\office\office.png
rename ..\dds\muko\office\office.DDS office.dds
mkdir ..\dds\muko\office
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\muko\office -srgb -y muko\office\open_door.png
rename ..\dds\muko\office\open_door.DDS open_door.dds
mkdir ..\dds\muko\office
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\muko\office -srgb -y muko\office\tiktok.png
rename ..\dds\muko\office\tiktok.DDS tiktok.dds
mkdir ..\dds\muko\office
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\muko\office -srgb -y muko\office\tiktok_bright.png
rename ..\dds\muko\office\tiktok_bright.DDS tiktok_bright.dds
mkdir ..\dds\muko\office
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\muko\office -srgb -y muko\office\tiktoksong.png
rename ..\dds\muko\office\tiktoksong.DDS tiktoksong.dds
mkdir ..\dds\muko\office
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\muko\office -srgb -y muko\office\usage.png
rename ..\dds\muko\office\usage.DDS usage.dds
mkdir ..\dds\muko\screens
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\muko\screens -srgb -y muko\screens\6am.png
rename ..\dds\muko\screens\6am.DDS 6am.dds
mkdir ..\dds\muko\screens
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\muko\screens -srgb -y muko\screens\allmax.png
rename ..\dds\muko\screens\allmax.DDS allmax.dds
mkdir ..\dds\muko\screens
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\muko\screens -srgb -y muko\screens\final.png
rename ..\dds\muko\screens\final.DDS final.dds
mkdir ..\dds\muko\shared
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\muko\shared -srgb -y muko\shared\camera.png
rename ..\dds\muko\shared\camera.DDS camera.dds
mkdir ..\dds\muko\shared
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\muko\shared -srgb -y muko\shared\camera2.png
rename ..\dds\muko\shared\camera2.DDS camera2.dds
mkdir ..\dds\muko\shared
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\muko\shared -srgb -y muko\shared\muko_anger.png
rename ..\dds\muko\shared\muko_anger.DDS muko_anger.dds
mkdir ..\dds\muko\shared
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\muko\shared -srgb -y muko\shared\muko_scary.png
rename ..\dds\muko\shared\muko_scary.DDS muko_scary.dds
mkdir ..\dds\muko\title
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\muko\title -srgb -y muko\title\canera_thing.png
rename ..\dds\muko\title\canera_thing.DDS canera_thing.dds
mkdir ..\dds\muko\title
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\muko\title -srgb -y muko\title\canera_thing2.png
rename ..\dds\muko\title\canera_thing2.DDS canera_thing2.dds
mkdir ..\dds\muko\title
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\muko\title -srgb -y muko\title\logo.png
rename ..\dds\muko\title\logo.DDS logo.dds
mkdir ..\dds\muko\title
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\muko\title -srgb -y muko\title\start.png
rename ..\dds\muko\title\start.DDS start.dds
mkdir ..\dds\muko\title
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\muko\title -srgb -y muko\title\start_hit.png
rename ..\dds\muko\title\start_hit.DDS start_hit.dds
mkdir ..\dds\switch
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\switch -srgb -y switch\portraits.png
rename ..\dds\switch\portraits.DDS portraits.dds
mkdir ..\dds\week1
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\week1 -srgb -y week1\curtains.png
rename ..\dds\week1\curtains.DDS curtains.dds
mkdir ..\dds\week1
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\week1 -srgb -y week1\daddy-dearest.png
rename ..\dds\week1\daddy-dearest.DDS daddy-dearest.dds
mkdir ..\dds\week1
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\week1 -srgb -y week1\stage-back.png
rename ..\dds\week1\stage-back.DDS stage-back.dds
mkdir ..\dds\week1
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\week1 -srgb -y week1\stage-front.png
rename ..\dds\week1\stage-front.DDS stage-front.dds


popd

pause