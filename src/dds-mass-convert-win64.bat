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
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\images\png -srgb -y images\png\GF_assets.png
rename ..\dds\images\png\GF_assets.DDS GF_assets.dds
mkdir ..\dds\images\png
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\images\png -srgb -y images\png\boyfriend.png
rename ..\dds\images\png\boyfriend.DDS boyfriend.dds
mkdir ..\dds\dave\backgrounds\backyard
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\backyard -srgb -y dave\backgrounds\backyard\bearDude.png
rename ..\dds\dave\backgrounds\backyard\bearDude.DDS bearDude.dds
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
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\bedroom -srgb -y dave\backgrounds\bedroom\TristanSitting.png
rename ..\dds\dave\backgrounds\bedroom\TristanSitting.DDS TristanSitting.dds
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
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\bedroom -srgb -y dave\backgrounds\bedroom\tv.png
rename ..\dds\dave\backgrounds\bedroom\tv.DDS tv.dds
mkdir ..\dds\dave\backgrounds\charSelect
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\charSelect -srgb -y dave\backgrounds\charSelect\behindGrass.png
rename ..\dds\dave\backgrounds\charSelect\behindGrass.DDS behindGrass.dds
mkdir ..\dds\dave\backgrounds\charSelect
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\charSelect -srgb -y dave\backgrounds\charSelect\frontGrass.png
rename ..\dds\dave\backgrounds\charSelect\frontGrass.DDS frontGrass.dds
mkdir ..\dds\dave\backgrounds\charSelect
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\charSelect -srgb -y dave\backgrounds\charSelect\gateLeft.png
rename ..\dds\dave\backgrounds\charSelect\gateLeft.DDS gateLeft.dds
mkdir ..\dds\dave\backgrounds\charSelect
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\charSelect -srgb -y dave\backgrounds\charSelect\gateRight.png
rename ..\dds\dave\backgrounds\charSelect\gateRight.DDS gateRight.dds
mkdir ..\dds\dave\backgrounds\charSelect
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\charSelect -srgb -y dave\backgrounds\charSelect\grass.png
rename ..\dds\dave\backgrounds\charSelect\grass.DDS grass.dds
mkdir ..\dds\dave\backgrounds\charSelect
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\charSelect -srgb -y dave\backgrounds\charSelect\hills.png
rename ..\dds\dave\backgrounds\charSelect\hills.DDS hills.dds
mkdir ..\dds\dave\backgrounds\charSelect
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\charSelect -srgb -y dave\backgrounds\charSelect\house.png
rename ..\dds\dave\backgrounds\charSelect\house.DDS house.dds
mkdir ..\dds\dave\backgrounds\dave-house
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\dave-house -srgb -y dave\backgrounds\dave-house\ICANTBELIEVEIHAVETOCLARIFYTHIS.png
rename ..\dds\dave\backgrounds\dave-house\ICANTBELIEVEIHAVETOCLARIFYTHIS.DDS ICANTBELIEVEIHAVETOCLARIFYTHIS.dds
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
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\farm -srgb -y dave\backgrounds\farm\cornFence.png
rename ..\dds\dave\backgrounds\farm\cornFence.DDS cornFence.dds
mkdir ..\dds\dave\backgrounds\farm
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\farm -srgb -y dave\backgrounds\farm\cornFence2.png
rename ..\dds\dave\backgrounds\farm\cornFence2.DDS cornFence2.dds
mkdir ..\dds\dave\backgrounds\farm
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\farm -srgb -y dave\backgrounds\farm\cornbag.png
rename ..\dds\dave\backgrounds\farm\cornbag.DDS cornbag.dds
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
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\festival -srgb -y dave\backgrounds\festival\backGrass - Copy.png
rename ..\dds\dave\backgrounds\festival\backGrass - Copy.DDS backGrass - Copy.dds
mkdir ..\dds\dave\backgrounds\festival
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\festival -srgb -y dave\backgrounds\festival\backGrass.png
rename ..\dds\dave\backgrounds\festival\backGrass.DDS backGrass.dds
mkdir ..\dds\dave\backgrounds\festival
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\festival -srgb -y dave\backgrounds\festival\corn.png
rename ..\dds\dave\backgrounds\festival\corn.DDS corn.dds
mkdir ..\dds\dave\backgrounds\festival
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\festival -srgb -y dave\backgrounds\festival\cornGlow.png
rename ..\dds\dave\backgrounds\festival\cornGlow.DDS cornGlow.dds
mkdir ..\dds\dave\backgrounds\festival
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\festival -srgb -y dave\backgrounds\festival\crowd.png
rename ..\dds\dave\backgrounds\festival\crowd.DDS crowd.dds
mkdir ..\dds\dave\backgrounds\festival
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\festival -srgb -y dave\backgrounds\festival\farmHouse.png
rename ..\dds\dave\backgrounds\festival\farmHouse.DDS farmHouse.dds
mkdir ..\dds\dave\backgrounds\festival
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\festival -srgb -y dave\backgrounds\festival\frontGrass.png
rename ..\dds\dave\backgrounds\festival\frontGrass.DDS frontGrass.dds
mkdir ..\dds\dave\backgrounds\festival
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\festival -srgb -y dave\backgrounds\festival\generalGlow.png
rename ..\dds\dave\backgrounds\festival\generalGlow.DDS generalGlow.dds
mkdir ..\dds\dave\backgrounds\festival
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\festival -srgb -y dave\backgrounds\festival\gm_flatgrass.png
rename ..\dds\dave\backgrounds\festival\gm_flatgrass.DDS gm_flatgrass.dds
mkdir ..\dds\dave\backgrounds\festival
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\festival -srgb -y dave\backgrounds\festival\hills.png
rename ..\dds\dave\backgrounds\festival\hills.DDS hills.dds
mkdir ..\dds\dave\backgrounds\festival\mainCrowd
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\festival\mainCrowd -srgb -y dave\backgrounds\festival\mainCrowd\bambi.png
rename ..\dds\dave\backgrounds\festival\mainCrowd\bambi.DDS bambi.dds
mkdir ..\dds\dave\backgrounds\festival\mainCrowd
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\festival\mainCrowd -srgb -y dave\backgrounds\festival\mainCrowd\dave.png
rename ..\dds\dave\backgrounds\festival\mainCrowd\dave.DDS dave.dds
mkdir ..\dds\dave\backgrounds\festival\mainCrowd
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\festival\mainCrowd -srgb -y dave\backgrounds\festival\mainCrowd\tristan.png
rename ..\dds\dave\backgrounds\festival\mainCrowd\tristan.DDS tristan.dds
mkdir ..\dds\dave\backgrounds\festival\scaredCrowd
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\festival\scaredCrowd -srgb -y dave\backgrounds\festival\scaredCrowd\ball.png
rename ..\dds\dave\backgrounds\festival\scaredCrowd\ball.DDS ball.dds
mkdir ..\dds\dave\backgrounds\festival\scaredCrowd
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\festival\scaredCrowd -srgb -y dave\backgrounds\festival\scaredCrowd\bambi.png
rename ..\dds\dave\backgrounds\festival\scaredCrowd\bambi.DDS bambi.dds
mkdir ..\dds\dave\backgrounds\festival\scaredCrowd
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\festival\scaredCrowd -srgb -y dave\backgrounds\festival\scaredCrowd\bimpe.png
rename ..\dds\dave\backgrounds\festival\scaredCrowd\bimpe.DDS bimpe.dds
mkdir ..\dds\dave\backgrounds\festival\scaredCrowd
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\festival\scaredCrowd -srgb -y dave\backgrounds\festival\scaredCrowd\maldo.png
rename ..\dds\dave\backgrounds\festival\scaredCrowd\maldo.DDS maldo.dds
mkdir ..\dds\dave\backgrounds\festival\scaredCrowd
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\festival\scaredCrowd -srgb -y dave\backgrounds\festival\scaredCrowd\memes kids.png
rename ..\dds\dave\backgrounds\festival\scaredCrowd\memes kids.DDS memes kids.dds
mkdir ..\dds\dave\backgrounds\festival\scaredCrowd
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\festival\scaredCrowd -srgb -y dave\backgrounds\festival\scaredCrowd\muko.png
rename ..\dds\dave\backgrounds\festival\scaredCrowd\muko.DDS muko.dds
mkdir ..\dds\dave\backgrounds\festival\scaredCrowd
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\festival\scaredCrowd -srgb -y dave\backgrounds\festival\scaredCrowd\ruby man.png
rename ..\dds\dave\backgrounds\festival\scaredCrowd\ruby man.DDS ruby man.dds
mkdir ..\dds\dave\backgrounds\festival\scaredCrowd
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\festival\scaredCrowd -srgb -y dave\backgrounds\festival\scaredCrowd\tristan.png
rename ..\dds\dave\backgrounds\festival\scaredCrowd\tristan.DDS tristan.dds
mkdir ..\dds\dave\backgrounds
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds -srgb -y dave\backgrounds\gm_house5.png
rename ..\dds\dave\backgrounds\gm_house5.DDS gm_house5.dds
mkdir ..\dds\dave\backgrounds\office
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\office -srgb -y dave\backgrounds\office\backFloor.png
rename ..\dds\dave\backgrounds\office\backFloor.DDS backFloor.dds
mkdir ..\dds\dave\backgrounds\office
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\office -srgb -y dave\backgrounds\office\door.png
rename ..\dds\dave\backgrounds\office\door.DDS door.dds
mkdir ..\dds\dave\backgrounds\office
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\office -srgb -y dave\backgrounds\office\floor.png
rename ..\dds\dave\backgrounds\office\floor.DDS floor.dds
mkdir ..\dds\dave\backgrounds\office
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\office -srgb -y dave\backgrounds\office\frontWall.png
rename ..\dds\dave\backgrounds\office\frontWall.DDS frontWall.dds
mkdir ..\dds\dave\backgrounds
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds -srgb -y dave\backgrounds\rapBattle.png
rename ..\dds\dave\backgrounds\rapBattle.DDS rapBattle.dds
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
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\void\exbongo -srgb -y dave\backgrounds\void\exbongo\Circle.png
rename ..\dds\dave\backgrounds\void\exbongo\Circle.DDS Circle.dds
mkdir ..\dds\dave\backgrounds\void\exbongo
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\void\exbongo -srgb -y dave\backgrounds\void\exbongo\Exbongo.png
rename ..\dds\dave\backgrounds\void\exbongo\Exbongo.DDS Exbongo.dds
mkdir ..\dds\dave\backgrounds\void\exbongo
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\void\exbongo -srgb -y dave\backgrounds\void\exbongo\Place.png
rename ..\dds\dave\backgrounds\void\exbongo\Place.DDS Place.dds
mkdir ..\dds\dave\backgrounds\void\exploit
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\void\exploit -srgb -y dave\backgrounds\void\exploit\broken_expunged_chain.png
rename ..\dds\dave\backgrounds\void\exploit\broken_expunged_chain.DDS broken_expunged_chain.dds
mkdir ..\dds\dave\backgrounds\void\exploit
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\void\exploit -srgb -y dave\backgrounds\void\exploit\cheater GLITCH.png
rename ..\dds\dave\backgrounds\void\exploit\cheater GLITCH.DDS cheater GLITCH.dds
mkdir ..\dds\dave\backgrounds\void\exploit
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\void\exploit -srgb -y dave\backgrounds\void\exploit\creepyRoom.png
rename ..\dds\dave\backgrounds\void\exploit\creepyRoom.DDS creepyRoom.dds
mkdir ..\dds\dave\backgrounds\void\exploit
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\void\exploit -srgb -y dave\backgrounds\void\exploit\expunged_chains.png
rename ..\dds\dave\backgrounds\void\exploit\expunged_chains.DDS expunged_chains.dds
mkdir ..\dds\dave\backgrounds\void\exploit
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\void\exploit -srgb -y dave\backgrounds\void\exploit\glitchyUnfairBG.png
rename ..\dds\dave\backgrounds\void\exploit\glitchyUnfairBG.DDS glitchyUnfairBG.dds
mkdir ..\dds\dave\backgrounds\void\exploit
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\void\exploit -srgb -y dave\backgrounds\void\exploit\glitchy_cheating_2.png
rename ..\dds\dave\backgrounds\void\exploit\glitchy_cheating_2.DDS glitchy_cheating_2.dds
mkdir ..\dds\dave\backgrounds\void\interdimensions
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\void\interdimensions -srgb -y dave\backgrounds\void\interdimensions\2DinterdimensionVoid.png
rename ..\dds\dave\backgrounds\void\interdimensions\2DinterdimensionVoid.DDS 2DinterdimensionVoid.dds
mkdir ..\dds\dave\backgrounds\void\interdimensions
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\void\interdimensions -srgb -y dave\backgrounds\void\interdimensions\darkSpace.png
rename ..\dds\dave\backgrounds\void\interdimensions\darkSpace.DDS darkSpace.dds
mkdir ..\dds\dave\backgrounds\void\interdimensions
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\void\interdimensions -srgb -y dave\backgrounds\void\interdimensions\hexagon.png
rename ..\dds\dave\backgrounds\void\interdimensions\hexagon.DDS hexagon.dds
mkdir ..\dds\dave\backgrounds\void\interdimensions
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\void\interdimensions -srgb -y dave\backgrounds\void\interdimensions\interdimensionVoid.png
rename ..\dds\dave\backgrounds\void\interdimensions\interdimensionVoid.DDS interdimensionVoid.dds
mkdir ..\dds\dave\backgrounds\void\interdimensions\nimbi
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\void\interdimensions\nimbi -srgb -y dave\backgrounds\void\interdimensions\nimbi\nimbi.png
rename ..\dds\dave\backgrounds\void\interdimensions\nimbi\nimbi.DDS nimbi.dds
mkdir ..\dds\dave\backgrounds\void\interdimensions\nimbi
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\void\interdimensions\nimbi -srgb -y dave\backgrounds\void\interdimensions\nimbi\nimbiVoid.png
rename ..\dds\dave\backgrounds\void\interdimensions\nimbi\nimbiVoid.DDS nimbiVoid.dds
mkdir ..\dds\dave\backgrounds\void\interdimensions\nimbi
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\backgrounds\void\interdimensions\nimbi -srgb -y dave\backgrounds\void\interdimensions\nimbi\nimbi_land.png
rename ..\dds\dave\backgrounds\void\interdimensions\nimbi\nimbi_land.DDS nimbi_land.dds
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
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\bambi -srgb -y dave\bambi\Angry_Bambi.png
rename ..\dds\dave\bambi\Angry_Bambi.DDS Angry_Bambi.dds
mkdir ..\dds\dave\bambi
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\bambi -srgb -y dave\bambi\Bambi_Death.png
rename ..\dds\dave\bambi\Bambi_Death.DDS Bambi_Death.dds
mkdir ..\dds\dave\bambi
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\bambi -srgb -y dave\bambi\bambiRemake.png
rename ..\dds\dave\bambi\bambiRemake.DDS bambiRemake.dds
mkdir ..\dds\dave\bambi
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\bambi -srgb -y dave\bambi\bambimaddddd.png
rename ..\dds\dave\bambi\bambimaddddd.DDS bambimaddddd.dds
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
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\california -srgb -y dave\california\georgiaGrass.png
rename ..\dds\dave\california\georgiaGrass.DDS georgiaGrass.dds
mkdir ..\dds\dave\california
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\california -srgb -y dave\california\georgiaLol.png
rename ..\dds\dave\california\georgiaLol.DDS georgiaLol.dds
mkdir ..\dds\dave\california
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\california -srgb -y dave\california\georgiaRails.png
rename ..\dds\dave\california\georgiaRails.DDS georgiaRails.dds
mkdir ..\dds\dave\california
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\california -srgb -y dave\california\georgiaTrees1.png
rename ..\dds\dave\california\georgiaTrees1.DDS georgiaTrees1.dds
mkdir ..\dds\dave\california
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\california -srgb -y dave\california\georgiaTrees2.png
rename ..\dds\dave\california\georgiaTrees2.DDS georgiaTrees2.dds
mkdir ..\dds\dave\california
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\california -srgb -y dave\california\leavingCalifornia.png
rename ..\dds\dave\california\leavingCalifornia.DDS leavingCalifornia.dds
mkdir ..\dds\dave\california
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\california -srgb -y dave\california\moldygh.png
rename ..\dds\dave\california\moldygh.DDS moldygh.dds
mkdir ..\dds\dave\california
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\california -srgb -y dave\california\train.png
rename ..\dds\dave\california\train.DDS train.dds
mkdir ..\dds\dave\california
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\california -srgb -y dave\california\welcomeToGeorgia.png
rename ..\dds\dave\california\welcomeToGeorgia.DDS welcomeToGeorgia.dds
mkdir ..\dds\dave\characters
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\characters -srgb -y dave\characters\3d_bf.png
rename ..\dds\dave\characters\3d_bf.DDS 3d_bf.dds
mkdir ..\dds\dave\characters
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\characters -srgb -y dave\characters\3d_gf.png
rename ..\dds\dave\characters\3d_gf.DDS 3d_gf.dds
mkdir ..\dds\dave\characters
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\characters -srgb -y dave\characters\BOYFRIEND.png
rename ..\dds\dave\characters\BOYFRIEND.DDS BOYFRIEND.dds
mkdir ..\dds\dave\characters
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\characters -srgb -y dave\characters\BaldiInRoof.png
rename ..\dds\dave\characters\BaldiInRoof.DDS BaldiInRoof.dds
mkdir ..\dds\dave\characters
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\characters -srgb -y dave\characters\Cool_BF.png
rename ..\dds\dave\characters\Cool_BF.DDS Cool_BF.dds
mkdir ..\dds\dave\characters
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\characters -srgb -y dave\characters\Cool_GF.png
rename ..\dds\dave\characters\Cool_GF.DDS Cool_GF.dds
mkdir ..\dds\dave\characters
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\characters -srgb -y dave\characters\DONT_GO_SNOOPING_WHERE_YOURE_NOT_SUPPOSED_TO.png
rename ..\dds\dave\characters\DONT_GO_SNOOPING_WHERE_YOURE_NOT_SUPPOSED_TO.DDS DONT_GO_SNOOPING_WHERE_YOURE_NOT_SUPPOSED_TO.dds
mkdir ..\dds\dave\characters
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\characters -srgb -y dave\characters\GF_assets.png
rename ..\dds\dave\characters\GF_assets.DDS GF_assets.dds
mkdir ..\dds\dave\characters
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\characters -srgb -y dave\characters\IM_GONNA_TORNADER_YOU_AWAY.png
rename ..\dds\dave\characters\IM_GONNA_TORNADER_YOU_AWAY.DDS IM_GONNA_TORNADER_YOU_AWAY.dds
mkdir ..\dds\dave\characters
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\characters -srgb -y dave\characters\exbungo.png
rename ..\dds\dave\characters\exbungo.DDS exbungo.dds
mkdir ..\dds\dave\characters
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\characters -srgb -y dave\characters\noGF.png
rename ..\dds\dave\characters\noGF.DDS noGF.dds
mkdir ..\dds\dave\dave
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\dave -srgb -y dave\dave\SECRET SONG COVER.png
rename ..\dds\dave\dave\SECRET SONG COVER.DDS SECRET SONG COVER.dds
mkdir ..\dds\dave\dave
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\dave -srgb -y dave\dave\TRISTAN.png
rename ..\dds\dave\dave\TRISTAN.DDS TRISTAN.dds
mkdir ..\dds\dave\dave
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\dave -srgb -y dave\dave\TristanHairFlipped.png
rename ..\dds\dave\dave\TristanHairFlipped.DDS TristanHairFlipped.dds
mkdir ..\dds\dave\dave
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\dave -srgb -y dave\dave\Tristan_Dead.png
rename ..\dds\dave\dave\Tristan_Dead.DDS Tristan_Dead.dds
mkdir ..\dds\dave\dave\characters
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\dave\characters -srgb -y dave\dave\characters\Dave_3D.png
rename ..\dds\dave\dave\characters\Dave_3D.DDS Dave_3D.dds
mkdir ..\dds\dave\dave\characters
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\dave\characters -srgb -y dave\dave\characters\Dave_3D_Dead.png
rename ..\dds\dave\dave\characters\Dave_3D_Dead.DDS Dave_3D_Dead.dds
mkdir ..\dds\dave\dave\characters
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\dave\characters -srgb -y dave\dave\characters\Dave_Dead.png
rename ..\dds\dave\dave\characters\Dave_Dead.DDS Dave_Dead.dds
mkdir ..\dds\dave\dave\characters
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\dave\characters -srgb -y dave\dave\characters\Dave_insanity_lol.png
rename ..\dds\dave\dave\characters\Dave_insanity_lol.DDS Dave_insanity_lol.dds
mkdir ..\dds\dave\dave\characters
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\dave\characters -srgb -y dave\dave\characters\Tristan_Dead.png
rename ..\dds\dave\dave\characters\Tristan_Dead.DDS Tristan_Dead.dds
mkdir ..\dds\dave\dave\characters
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\dave\characters -srgb -y dave\dave\characters\dave_awesome.png
rename ..\dds\dave\dave\characters\dave_awesome.DDS dave_awesome.dds
mkdir ..\dds\dave\dave\characters
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\dave\characters -srgb -y dave\dave\characters\dave_sheet.png
rename ..\dds\dave\dave\characters\dave_sheet.DDS dave_sheet.dds
mkdir ..\dds\dave\dave\characters
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\dave\characters -srgb -y dave\dave\characters\davefriend.png
rename ..\dds\dave\dave\characters\davefriend.DDS davefriend.dds
mkdir ..\dds\dave\dave\characters
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\dave\characters -srgb -y dave\dave\characters\thecoolerdave.png
rename ..\dds\dave\dave\characters\thecoolerdave.DDS thecoolerdave.dds
mkdir ..\dds\dave\dave
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\dave -srgb -y dave\dave\e.png
rename ..\dds\dave\dave\e.DDS e.dds
mkdir ..\dds\dave\dave\endings
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\dave\endings -srgb -y dave\dave\endings\badEnding.png
rename ..\dds\dave\dave\endings\badEnding.DDS badEnding.dds
mkdir ..\dds\dave\dave\endings
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\dave\endings -srgb -y dave\dave\endings\bruh.png
rename ..\dds\dave\dave\endings\bruh.DDS bruh.dds
mkdir ..\dds\dave\dave\endings
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\dave\endings -srgb -y dave\dave\endings\cheater_lol.png
rename ..\dds\dave\dave\endings\cheater_lol.DDS cheater_lol.dds
mkdir ..\dds\dave\dave\endings
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\dave\endings -srgb -y dave\dave\endings\goodEnding.png
rename ..\dds\dave\dave\endings\goodEnding.DDS goodEnding.dds
mkdir ..\dds\dave\dave\endings
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\dave\endings -srgb -y dave\dave\endings\rtxx_ending.png
rename ..\dds\dave\dave\endings\rtxx_ending.DDS rtxx_ending.dds
mkdir ..\dds\dave\dave\endings
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\dave\endings -srgb -y dave\dave\endings\unfunnyEnding.png
rename ..\dds\dave\dave\endings\unfunnyEnding.DDS unfunnyEnding.dds
mkdir ..\dds\dave\dave\endings
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\dave\endings -srgb -y dave\dave\endings\vomit_ending.png
rename ..\dds\dave\dave\endings\vomit_ending.DDS vomit_ending.dds
mkdir ..\dds\dave\dave
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\dave -srgb -y dave\dave\peejeadaDASKETCHYE.png
rename ..\dds\dave\dave\peejeadaDASKETCHYE.DDS peejeadaDASKETCHYE.dds
mkdir ..\dds\dave\dave
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\dave -srgb -y dave\dave\placeholderStory.png
rename ..\dds\dave\dave\placeholderStory.DDS placeholderStory.dds
mkdir ..\dds\dave\dave\secret
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\dave\secret -srgb -y dave\dave\secret\scary.png
rename ..\dds\dave\dave\secret\scary.DDS scary.dds
mkdir ..\dds\dave\dave\secret
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\dave\secret -srgb -y dave\dave\secret\youactuallythoughttherewasasecrethere.png
rename ..\dds\dave\dave\secret\youactuallythoughttherewasasecrethere.DDS youactuallythoughttherewasasecrethere.dds
mkdir ..\dds\dave\dave
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\dave -srgb -y dave\dave\tristan_golden.png
rename ..\dds\dave\dave\tristan_golden.DDS tristan_golden.dds
mkdir ..\dds\dave\dave
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\dave -srgb -y dave\dave\tristan_golden_death.png
rename ..\dds\dave\dave\tristan_golden_death.DDS tristan_golden_death.dds
mkdir ..\dds\dave\dave
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\dave -srgb -y dave\dave\tristan_golden_glowing.png
rename ..\dds\dave\dave\tristan_golden_glowing.DDS tristan_golden_glowing.dds
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
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\dialogue\dave -srgb -y dave\dialogue\dave\dave_postMaze.png
rename ..\dds\dave\dialogue\dave\dave_postMaze.DDS dave_postMaze.dds
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
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\expunged -srgb -y dave\expunged\Bambi_3D_Death.png
rename ..\dds\dave\expunged\Bambi_3D_Death.DDS Bambi_3D_Death.dds
mkdir ..\dds\dave\expunged
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\expunged -srgb -y dave\expunged\Cheating.png
rename ..\dds\dave\expunged\Cheating.DDS Cheating.dds
mkdir ..\dds\dave\expunged
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\expunged -srgb -y dave\expunged\ExpungedFinal.png
rename ..\dds\dave\expunged\ExpungedFinal.DDS ExpungedFinal.dds
mkdir ..\dds\dave\expunged
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\expunged -srgb -y dave\expunged\bangus.png
rename ..\dds\dave\expunged\bangus.DDS bangus.dds
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
mkdir ..\dds\dave\fiveNights
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\fiveNights -srgb -y dave\fiveNights\btn_doorClosed.png
rename ..\dds\dave\fiveNights\btn_doorClosed.DDS btn_doorClosed.dds
mkdir ..\dds\dave\fiveNights
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\fiveNights -srgb -y dave\fiveNights\btn_doorOpen.png
rename ..\dds\dave\fiveNights\btn_doorOpen.DDS btn_doorOpen.dds
mkdir ..\dds\dave\fiveNights
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\fiveNights -srgb -y dave\fiveNights\dave_fnaf.png
rename ..\dds\dave\fiveNights\dave_fnaf.DDS dave_fnaf.dds
mkdir ..\dds\dave\fiveNights
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\fiveNights -srgb -y dave\fiveNights\deathStatic.png
rename ..\dds\dave\fiveNights\deathStatic.DDS deathStatic.dds
mkdir ..\dds\dave\fiveNights
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\fiveNights -srgb -y dave\fiveNights\nofriend.png
rename ..\dds\dave\fiveNights\nofriend.DDS nofriend.dds
mkdir ..\dds\dave\fiveNights
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\fiveNights -srgb -y dave\fiveNights\nofriendJumpscare.png
rename ..\dds\dave\fiveNights\nofriendJumpscare.DDS nofriendJumpscare.dds
mkdir ..\dds\dave\fiveNights
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\fiveNights -srgb -y dave\fiveNights\nofriend_Dead.png
rename ..\dds\dave\fiveNights\nofriend_Dead.DDS nofriend_Dead.dds
mkdir ..\dds\dave\fiveNights
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\fiveNights -srgb -y dave\fiveNights\powerMeter.png
rename ..\dds\dave\fiveNights\powerMeter.DDS powerMeter.dds
mkdir ..\dds\dave\fiveNights
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\fiveNights -srgb -y dave\fiveNights\powerMeter_2.png
rename ..\dds\dave\fiveNights\powerMeter_2.DDS powerMeter_2.dds
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
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave -srgb -y dave\healthBar.png
rename ..\dds\dave\healthBar.DDS healthBar.dds
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
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\joke -srgb -y dave\joke\AMOG.png
rename ..\dds\dave\joke\AMOG.DDS AMOG.dds
mkdir ..\dds\dave\joke
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\joke -srgb -y dave\joke\Sem_timtmmulo.png
rename ..\dds\dave\joke\Sem_timtmmulo.DDS Sem_timtmmulo.dds
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
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\joke -srgb -y dave\joke\puppy_princess.png
rename ..\dds\dave\joke\puppy_princess.DDS puppy_princess.dds
mkdir ..\dds\dave\joke
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\joke -srgb -y dave\joke\secret mod leak.png
rename ..\dds\dave\joke\secret mod leak.DDS secret mod leak.dds
mkdir ..\dds\dave\math
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\math -srgb -y dave\math\Baldi_MathGame_Sheet.png
rename ..\dds\dave\math\Baldi_MathGame_Sheet.DDS Baldi_MathGame_Sheet.dds
mkdir ..\dds\dave\math
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\math -srgb -y dave\math\Check.png
rename ..\dds\dave\math\Check.DDS Check.dds
mkdir ..\dds\dave\math
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\math -srgb -y dave\math\CursorSprite.png
rename ..\dds\dave\math\CursorSprite.DDS CursorSprite.dds
mkdir ..\dds\dave\math
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\math -srgb -y dave\math\X.png
rename ..\dds\dave\math\X.DDS X.dds
mkdir ..\dds\dave\math
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\math -srgb -y dave\math\YCTP.png
rename ..\dds\dave\math\YCTP.DDS YCTP.dds
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
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\math\buttons -srgb -y dave\math\buttons\C.png
rename ..\dds\dave\math\buttons\C.DDS C.dds
mkdir ..\dds\dave\math\buttons
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\math\buttons -srgb -y dave\math\buttons\C_select.png
rename ..\dds\dave\math\buttons\C_select.DDS C_select.dds
mkdir ..\dds\dave\math\buttons
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\math\buttons -srgb -y dave\math\buttons\OK.png
rename ..\dds\dave\math\buttons\OK.DDS OK.dds
mkdir ..\dds\dave\math\buttons
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\math\buttons -srgb -y dave\math\buttons\OK_select.png
rename ..\dds\dave\math\buttons\OK_select.DDS OK_select.dds
mkdir ..\dds\dave\notes
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\notes -srgb -y dave\notes\NOTEGH_assets.png
rename ..\dds\dave\notes\NOTEGH_assets.DDS NOTEGH_assets.dds
mkdir ..\dds\dave\notes
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\notes -srgb -y dave\notes\NOTE_assets.png
rename ..\dds\dave\notes\NOTE_assets.DDS NOTE_assets.dds
mkdir ..\dds\dave\notes
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\notes -srgb -y dave\notes\NOTE_assets_3D.png
rename ..\dds\dave\notes\NOTE_assets_3D.DDS NOTE_assets_3D.dds
mkdir ..\dds\dave\notes
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\notes -srgb -y dave\notes\NOTE_assets_Shape.png
rename ..\dds\dave\notes\NOTE_assets_Shape.DDS NOTE_assets_Shape.dds
mkdir ..\dds\dave\notes
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\notes -srgb -y dave\notes\NOTE_gh.png
rename ..\dds\dave\notes\NOTE_gh.DDS NOTE_gh.dds
mkdir ..\dds\dave\notes
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\notes -srgb -y dave\notes\NOTE_phone.png
rename ..\dds\dave\notes\NOTE_phone.DDS NOTE_phone.dds
mkdir ..\dds\dave\notes
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\notes -srgb -y dave\notes\NOTE_phoneAlt.png
rename ..\dds\dave\notes\NOTE_phoneAlt.DDS NOTE_phoneAlt.dds
mkdir ..\dds\dave\notes
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\notes -srgb -y dave\notes\NOTE_recursed.png
rename ..\dds\dave\notes\NOTE_recursed.DDS NOTE_recursed.dds
mkdir ..\dds\dave\notes
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\notes -srgb -y dave\notes\OMGtop10awesomehi.png
rename ..\dds\dave\notes\OMGtop10awesomehi.DDS OMGtop10awesomehi.dds
mkdir ..\dds\dave\pauseAlt
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\pauseAlt -srgb -y dave\pauseAlt\daveLol.png
rename ..\dds\dave\pauseAlt\daveLol.DDS daveLol.dds
mkdir ..\dds\dave\pauseAlt
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\pauseAlt -srgb -y dave\pauseAlt\pauseBG.png
rename ..\dds\dave\pauseAlt\pauseBG.DDS pauseBG.dds
mkdir ..\dds\dave\pauseAlt
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\pauseAlt -srgb -y dave\pauseAlt\pauseUI.png
rename ..\dds\dave\pauseAlt\pauseUI.DDS pauseUI.dds
mkdir ..\dds\dave\playrobot
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\playrobot -srgb -y dave\playrobot\playbot.png
rename ..\dds\dave\playrobot\playbot.DDS playbot.dds
mkdir ..\dds\dave\playrobot
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\playrobot -srgb -y dave\playrobot\playrobot_shadow.png
rename ..\dds\dave\playrobot\playrobot_shadow.DDS playrobot_shadow.dds
mkdir ..\dds\dave\recursed
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\recursed -srgb -y dave\recursed\Recursed_BF.png
rename ..\dds\dave\recursed\Recursed_BF.DDS Recursed_BF.dds
mkdir ..\dds\dave\recursed
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\recursed -srgb -y dave\recursed\Recurser.png
rename ..\dds\dave\recursed\Recurser.DDS Recurser.dds
mkdir ..\dds\dave\recursed
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\recursed -srgb -y dave\recursed\bambiScroll.png
rename ..\dds\dave\recursed\bambiScroll.DDS bambiScroll.dds
mkdir ..\dds\dave\recursed\characters
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\recursed\characters -srgb -y dave\recursed\characters\Bambi_Recursed.png
rename ..\dds\dave\recursed\characters\Bambi_Recursed.DDS Bambi_Recursed.dds
mkdir ..\dds\dave\recursed\characters
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\recursed\characters -srgb -y dave\recursed\characters\Dave_3D_Recursed.png
rename ..\dds\dave\recursed\characters\Dave_3D_Recursed.DDS Dave_3D_Recursed.dds
mkdir ..\dds\dave\recursed\characters
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\recursed\characters -srgb -y dave\recursed\characters\Dave_3D_Recursed_Dead.png
rename ..\dds\dave\recursed\characters\Dave_3D_Recursed_Dead.DDS Dave_3D_Recursed_Dead.dds
mkdir ..\dds\dave\recursed\characters
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\recursed\characters -srgb -y dave\recursed\characters\Dave_Recursed.png
rename ..\dds\dave\recursed\characters\Dave_Recursed.DDS Dave_Recursed.dds
mkdir ..\dds\dave\recursed\characters
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\recursed\characters -srgb -y dave\recursed\characters\STOP_LOOKING_AT_THE_FILES.png
rename ..\dds\dave\recursed\characters\STOP_LOOKING_AT_THE_FILES.DDS STOP_LOOKING_AT_THE_FILES.dds
mkdir ..\dds\dave\recursed\characters
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\recursed\characters -srgb -y dave\recursed\characters\TristanRecursed.png
rename ..\dds\dave\recursed\characters\TristanRecursed.DDS TristanRecursed.dds
mkdir ..\dds\dave\recursed
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\recursed -srgb -y dave\recursed\darkSky.png
rename ..\dds\dave\recursed\darkSky.DDS darkSky.dds
mkdir ..\dds\dave\recursed
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\recursed -srgb -y dave\recursed\daveScroll.png
rename ..\dds\dave\recursed\daveScroll.DDS daveScroll.dds
mkdir ..\dds\dave\recursed
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\recursed -srgb -y dave\recursed\gold_pieces_but_not_broken.png
rename ..\dds\dave\recursed\gold_pieces_but_not_broken.DDS gold_pieces_but_not_broken.dds
mkdir ..\dds\dave\recursed
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\recursed -srgb -y dave\recursed\noteIcon.png
rename ..\dds\dave\recursed\noteIcon.DDS noteIcon.dds
mkdir ..\dds\dave\recursed
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\recursed -srgb -y dave\recursed\recursedX.png
rename ..\dds\dave\recursed\recursedX.DDS recursedX.dds
mkdir ..\dds\dave\recursed
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\recursed -srgb -y dave\recursed\timerIcon.png
rename ..\dds\dave\recursed\timerIcon.DDS timerIcon.dds
mkdir ..\dds\dave\recursed
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\recursed -srgb -y dave\recursed\tristanScroll.png
rename ..\dds\dave\recursed\tristanScroll.DDS tristanScroll.dds
mkdir ..\dds\dave\songCreators
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\songCreators -srgb -y dave\songCreators\Aadsta.png
rename ..\dds\dave\songCreators\Aadsta.DDS Aadsta.dds
mkdir ..\dds\dave\songCreators
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\songCreators -srgb -y dave\songCreators\Alexander Cooper 19.png
rename ..\dds\dave\songCreators\Alexander Cooper 19.DDS Alexander Cooper 19.dds
mkdir ..\dds\dave\songCreators
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\songCreators -srgb -y dave\songCreators\ArchWk.png
rename ..\dds\dave\songCreators\ArchWk.DDS ArchWk.dds
mkdir ..\dds\dave\songCreators
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\songCreators -srgb -y dave\songCreators\DeadShadow & PixelGH.png
rename ..\dds\dave\songCreators\DeadShadow & PixelGH.DDS DeadShadow & PixelGH.dds
mkdir ..\dds\dave\songCreators
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\songCreators -srgb -y dave\songCreators\MoldyGH.png
rename ..\dds\dave\songCreators\MoldyGH.DDS MoldyGH.dds
mkdir ..\dds\dave\songCreators
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\songCreators -srgb -y dave\songCreators\Oxygen.png
rename ..\dds\dave\songCreators\Oxygen.DDS Oxygen.dds
mkdir ..\dds\dave\songCreators
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\songCreators -srgb -y dave\songCreators\Ruby.png
rename ..\dds\dave\songCreators\Ruby.DDS Ruby.dds
mkdir ..\dds\dave\songCreators
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\songCreators -srgb -y dave\songCreators\TH3R34LD34L.png
rename ..\dds\dave\songCreators\TH3R34LD34L.DDS TH3R34LD34L.dds
mkdir ..\dds\dave\songCreators
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\songCreators -srgb -y dave\songCreators\Top 10 Awesome.png
rename ..\dds\dave\songCreators\Top 10 Awesome.DDS Top 10 Awesome.dds
mkdir ..\dds\dave\songCreators
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\songCreators -srgb -y dave\songCreators\Your mom.png
rename ..\dds\dave\songCreators\Your mom.DDS Your mom.dds
mkdir ..\dds\dave\songCreators
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\songCreators -srgb -y dave\songCreators\none.png
rename ..\dds\dave\songCreators\none.DDS none.dds
mkdir ..\dds\dave\songCreators
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\songCreators -srgb -y dave\songCreators\sibottle.png
rename ..\dds\dave\songCreators\sibottle.DDS sibottle.dds
mkdir ..\dds\dave\songCreators
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\songCreators -srgb -y dave\songCreators\whoAreYou.png
rename ..\dds\dave\songCreators\whoAreYou.DDS whoAreYou.dds
mkdir ..\dds\dave\songHeadings
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\songHeadings -srgb -y dave\songHeadings\3D-daveHeading.png
rename ..\dds\dave\songHeadings\3D-daveHeading.DDS 3D-daveHeading.dds
mkdir ..\dds\dave\songHeadings
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\songHeadings -srgb -y dave\songHeadings\bambiHeading.png
rename ..\dds\dave\songHeadings\bambiHeading.DDS bambiHeading.dds
mkdir ..\dds\dave\songHeadings
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\songHeadings -srgb -y dave\songHeadings\bevelHeading.png
rename ..\dds\dave\songHeadings\bevelHeading.DDS bevelHeading.dds
mkdir ..\dds\dave\songHeadings
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\songHeadings -srgb -y dave\songHeadings\botHeading.png
rename ..\dds\dave\songHeadings\botHeading.DDS botHeading.dds
mkdir ..\dds\dave\songHeadings
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\songHeadings -srgb -y dave\songHeadings\californiaHeading.png
rename ..\dds\dave\songHeadings\californiaHeading.DDS californiaHeading.dds
mkdir ..\dds\dave\songHeadings
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\songHeadings -srgb -y dave\songHeadings\cheatingHeading.png
rename ..\dds\dave\songHeadings\cheatingHeading.DDS cheatingHeading.dds
mkdir ..\dds\dave\songHeadings
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\songHeadings -srgb -y dave\songHeadings\daveHeading.png
rename ..\dds\dave\songHeadings\daveHeading.DDS daveHeading.dds
mkdir ..\dds\dave\songHeadings
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\songHeadings -srgb -y dave\songHeadings\expungedHeading.png
rename ..\dds\dave\songHeadings\expungedHeading.DDS expungedHeading.dds
mkdir ..\dds\dave\songHeadings
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\songHeadings -srgb -y dave\songHeadings\festivalHeading.png
rename ..\dds\dave\songHeadings\festivalHeading.DDS festivalHeading.dds
mkdir ..\dds\dave\songHeadings
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\songHeadings -srgb -y dave\songHeadings\fnafHeading.png
rename ..\dds\dave\songHeadings\fnafHeading.DDS fnafHeading.dds
mkdir ..\dds\dave\songHeadings
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\songHeadings -srgb -y dave\songHeadings\fnfengeading.png
rename ..\dds\dave\songHeadings\fnfengeading.DDS fnfengeading.dds
mkdir ..\dds\dave\songHeadings
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\songHeadings -srgb -y dave\songHeadings\glitchHeading.png
rename ..\dds\dave\songHeadings\glitchHeading.DDS glitchHeading.dds
mkdir ..\dds\dave\songHeadings
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\songHeadings -srgb -y dave\songHeadings\interdimensionalHeading.png
rename ..\dds\dave\songHeadings\interdimensionalHeading.DDS interdimensionalHeading.dds
mkdir ..\dds\dave\songHeadings
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\songHeadings -srgb -y dave\songHeadings\kabungaHeading.png
rename ..\dds\dave\songHeadings\kabungaHeading.DDS kabungaHeading.dds
mkdir ..\dds\dave\songHeadings
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\songHeadings -srgb -y dave\songHeadings\recursedHeading.png
rename ..\dds\dave\songHeadings\recursedHeading.DDS recursedHeading.dds
mkdir ..\dds\dave\songHeadings
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\songHeadings -srgb -y dave\songHeadings\secretLeakHeading.png
rename ..\dds\dave\songHeadings\secretLeakHeading.DDS secretLeakHeading.dds
mkdir ..\dds\dave\songHeadings
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\songHeadings -srgb -y dave\songHeadings\somethingHeading.png
rename ..\dds\dave\songHeadings\somethingHeading.DDS somethingHeading.dds
mkdir ..\dds\dave\songHeadings
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\songHeadings -srgb -y dave\songHeadings\splitathonHeading.png
rename ..\dds\dave\songHeadings\splitathonHeading.DDS splitathonHeading.dds
mkdir ..\dds\dave\songHeadings
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\songHeadings -srgb -y dave\songHeadings\tristanHeading.png
rename ..\dds\dave\songHeadings\tristanHeading.DDS tristanHeading.dds
mkdir ..\dds\dave\songHeadings
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\songHeadings -srgb -y dave\songHeadings\unfairHeading.png
rename ..\dds\dave\songHeadings\unfairHeading.DDS unfairHeading.dds
mkdir ..\dds\dave\splitathon
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\splitathon -srgb -y dave\splitathon\Splitathon_Bambi.png
rename ..\dds\dave\splitathon\Splitathon_Bambi.DDS Splitathon_Bambi.dds
mkdir ..\dds\dave\splitathon
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\splitathon -srgb -y dave\splitathon\Splitathon_Dave.png
rename ..\dds\dave\splitathon\Splitathon_Dave.DDS Splitathon_Dave.dds
mkdir ..\dds\dave
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave -srgb -y dave\spotLight.png
rename ..\dds\dave\spotLight.DDS spotLight.dds
mkdir ..\dds\dave
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave -srgb -y dave\timeBar.png
rename ..\dds\dave\timeBar.DDS timeBar.dds
mkdir ..\dds\dave\title
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title -srgb -y dave\title\ArrowLeft_Idle.png
rename ..\dds\dave\title\ArrowLeft_Idle.DDS ArrowLeft_Idle.dds
mkdir ..\dds\dave\title
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title -srgb -y dave\title\ArrowLeft_Pressed.png
rename ..\dds\dave\title\ArrowLeft_Pressed.DDS ArrowLeft_Pressed.dds
mkdir ..\dds\dave\title
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title -srgb -y dave\title\ArrowRight_Idle.png
rename ..\dds\dave\title\ArrowRight_Idle.DDS ArrowRight_Idle.dds
mkdir ..\dds\dave\title
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title -srgb -y dave\title\ArrowRight_Pressed.png
rename ..\dds\dave\title\ArrowRight_Pressed.DDS ArrowRight_Pressed.dds
mkdir ..\dds\dave\title
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title -srgb -y dave\title\CoolOverlay.png
rename ..\dds\dave\title\CoolOverlay.DDS CoolOverlay.dds
mkdir ..\dds\dave\title\backgrounds
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\backgrounds -srgb -y dave\title\backgrounds\Aadsta.png
rename ..\dds\dave\title\backgrounds\Aadsta.DDS Aadsta.dds
mkdir ..\dds\dave\title\backgrounds
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\backgrounds -srgb -y dave\title\backgrounds\ArtiztGmer.png
rename ..\dds\dave\title\backgrounds\ArtiztGmer.DDS ArtiztGmer.dds
mkdir ..\dds\dave\title\backgrounds
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\backgrounds -srgb -y dave\title\backgrounds\DeltaKastel.png
rename ..\dds\dave\title\backgrounds\DeltaKastel.DDS DeltaKastel.dds
mkdir ..\dds\dave\title\backgrounds
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\backgrounds -srgb -y dave\title\backgrounds\DeltaKastel2.png
rename ..\dds\dave\title\backgrounds\DeltaKastel2.DDS DeltaKastel2.dds
mkdir ..\dds\dave\title\backgrounds
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\backgrounds -srgb -y dave\title\backgrounds\DeltaKastel3.png
rename ..\dds\dave\title\backgrounds\DeltaKastel3.DDS DeltaKastel3.dds
mkdir ..\dds\dave\title\backgrounds
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\backgrounds -srgb -y dave\title\backgrounds\DeltaKastel4.png
rename ..\dds\dave\title\backgrounds\DeltaKastel4.DDS DeltaKastel4.dds
mkdir ..\dds\dave\title\backgrounds
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\backgrounds -srgb -y dave\title\backgrounds\DeltaKastel5.png
rename ..\dds\dave\title\backgrounds\DeltaKastel5.DDS DeltaKastel5.dds
mkdir ..\dds\dave\title\backgrounds
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\backgrounds -srgb -y dave\title\backgrounds\Jukebox.png
rename ..\dds\dave\title\backgrounds\Jukebox.DDS Jukebox.dds
mkdir ..\dds\dave\title\backgrounds
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\backgrounds -srgb -y dave\title\backgrounds\Lancey.png
rename ..\dds\dave\title\backgrounds\Lancey.DDS Lancey.dds
mkdir ..\dds\dave\title\backgrounds
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\backgrounds -srgb -y dave\title\backgrounds\Onuko.png
rename ..\dds\dave\title\backgrounds\Onuko.DDS Onuko.dds
mkdir ..\dds\dave\title\backgrounds
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\backgrounds -srgb -y dave\title\backgrounds\SwagnotrllyTheMod.png
rename ..\dds\dave\title\backgrounds\SwagnotrllyTheMod.DDS SwagnotrllyTheMod.dds
mkdir ..\dds\dave\title\backgrounds
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\backgrounds -srgb -y dave\title\backgrounds\diamond man.png
rename ..\dds\dave\title\backgrounds\diamond man.DDS diamond man.dds
mkdir ..\dds\dave\title\backgrounds
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\backgrounds -srgb -y dave\title\backgrounds\kiazu.png
rename ..\dds\dave\title\backgrounds\kiazu.DDS kiazu.dds
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
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\backgrounds -srgb -y dave\title\backgrounds\zombought.png
rename ..\dds\dave\title\backgrounds\zombought.DDS zombought.dds
mkdir ..\dds\dave\title
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title -srgb -y dave\title\charSelectGuide.png
rename ..\dds\dave\title\charSelectGuide.DDS charSelectGuide.dds
mkdir ..\dds\dave\title
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title -srgb -y dave\title\checkeredBG.png
rename ..\dds\dave\title\checkeredBG.DDS checkeredBG.dds
mkdir ..\dds\dave\title\credits\icons\Beta Testers
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\credits\icons\Beta Testers -srgb -y dave\title\credits\icons\Beta Testers\ArturSef.png
rename ..\dds\dave\title\credits\icons\Beta Testers\ArturSef.DDS ArturSef.dds
mkdir ..\dds\dave\title\credits\icons\Beta Testers
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\credits\icons\Beta Testers -srgb -y dave\title\credits\icons\Beta Testers\Cotiles.png
rename ..\dds\dave\title\credits\icons\Beta Testers\Cotiles.DDS Cotiles.dds
mkdir ..\dds\dave\title\credits\icons\Beta Testers
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\credits\icons\Beta Testers -srgb -y dave\title\credits\icons\Beta Testers\Foxnap.png
rename ..\dds\dave\title\credits\icons\Beta Testers\Foxnap.DDS Foxnap.dds
mkdir ..\dds\dave\title\credits\icons\Beta Testers
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\credits\icons\Beta Testers -srgb -y dave\title\credits\icons\Beta Testers\Gorbini.png
rename ..\dds\dave\title\credits\icons\Beta Testers\Gorbini.DDS Gorbini.dds
mkdir ..\dds\dave\title\credits\icons\Beta Testers
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\credits\icons\Beta Testers -srgb -y dave\title\credits\icons\Beta Testers\Log Man.png
rename ..\dds\dave\title\credits\icons\Beta Testers\Log Man.DDS Log Man.dds
mkdir ..\dds\dave\title\credits\icons\Beta Testers
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\credits\icons\Beta Testers -srgb -y dave\title\credits\icons\Beta Testers\Lordryan1999.png
rename ..\dds\dave\title\credits\icons\Beta Testers\Lordryan1999.DDS Lordryan1999.dds
mkdir ..\dds\dave\title\credits\icons\Beta Testers
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\credits\icons\Beta Testers -srgb -y dave\title\credits\icons\Beta Testers\Mooncakeez.png
rename ..\dds\dave\title\credits\icons\Beta Testers\Mooncakeez.DDS Mooncakeez.dds
mkdir ..\dds\dave\title\credits\icons\Beta Testers
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\credits\icons\Beta Testers -srgb -y dave\title\credits\icons\Beta Testers\Rendurse.png
rename ..\dds\dave\title\credits\icons\Beta Testers\Rendurse.DDS Rendurse.dds
mkdir ..\dds\dave\title\credits\icons\Beta Testers
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\credits\icons\Beta Testers -srgb -y dave\title\credits\icons\Beta Testers\Silver Escaper.png
rename ..\dds\dave\title\credits\icons\Beta Testers\Silver Escaper.DDS Silver Escaper.dds
mkdir ..\dds\dave\title\credits\icons\Beta Testers
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\credits\icons\Beta Testers -srgb -y dave\title\credits\icons\Beta Testers\TecheVent.png
rename ..\dds\dave\title\credits\icons\Beta Testers\TecheVent.DDS TecheVent.dds
mkdir ..\dds\dave\title\credits\icons\Beta Testers
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\credits\icons\Beta Testers -srgb -y dave\title\credits\icons\Beta Testers\TrustVVorthy.png
rename ..\dds\dave\title\credits\icons\Beta Testers\TrustVVorthy.DDS TrustVVorthy.dds
mkdir ..\dds\dave\title\credits\icons\Beta Testers
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\credits\icons\Beta Testers -srgb -y dave\title\credits\icons\Beta Testers\Vanquiler.png
rename ..\dds\dave\title\credits\icons\Beta Testers\Vanquiler.DDS Vanquiler.dds
mkdir ..\dds\dave\title\credits\icons\Beta Testers
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\credits\icons\Beta Testers -srgb -y dave\title\credits\icons\Beta Testers\Villezen.png
rename ..\dds\dave\title\credits\icons\Beta Testers\Villezen.DDS Villezen.dds
mkdir ..\dds\dave\title\credits\icons\Beta Testers
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\credits\icons\Beta Testers -srgb -y dave\title\credits\icons\Beta Testers\YourAverageMental.png
rename ..\dds\dave\title\credits\icons\Beta Testers\YourAverageMental.DDS YourAverageMental.dds
mkdir ..\dds\dave\title\credits\icons\Beta Testers
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\credits\icons\Beta Testers -srgb -y dave\title\credits\icons\Beta Testers\ashtonyes.png
rename ..\dds\dave\title\credits\icons\Beta Testers\ashtonyes.DDS ashtonyes.dds
mkdir ..\dds\dave\title\credits\icons\Beta Testers
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\credits\icons\Beta Testers -srgb -y dave\title\credits\icons\Beta Testers\bendygaming_1.png
rename ..\dds\dave\title\credits\icons\Beta Testers\bendygaming_1.DDS bendygaming_1.dds
mkdir ..\dds\dave\title\credits\icons\Beta Testers
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\credits\icons\Beta Testers -srgb -y dave\title\credits\icons\Beta Testers\emiko.png
rename ..\dds\dave\title\credits\icons\Beta Testers\emiko.DDS emiko.dds
mkdir ..\dds\dave\title\credits\icons\Beta Testers
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\credits\icons\Beta Testers -srgb -y dave\title\credits\icons\Beta Testers\letsy.png
rename ..\dds\dave\title\credits\icons\Beta Testers\letsy.DDS letsy.dds
mkdir ..\dds\dave\title\credits\icons\Beta Testers
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\credits\icons\Beta Testers -srgb -y dave\title\credits\icons\Beta Testers\mantis.png
rename ..\dds\dave\title\credits\icons\Beta Testers\mantis.DDS mantis.dds
mkdir ..\dds\dave\title\credits\icons\Beta Testers
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\credits\icons\Beta Testers -srgb -y dave\title\credits\icons\Beta Testers\nihilistt.png
rename ..\dds\dave\title\credits\icons\Beta Testers\nihilistt.DDS nihilistt.dds
mkdir ..\dds\dave\title\credits\icons\Beta Testers
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\credits\icons\Beta Testers -srgb -y dave\title\credits\icons\Beta Testers\normal.png
rename ..\dds\dave\title\credits\icons\Beta Testers\normal.DDS normal.dds
mkdir ..\dds\dave\title\credits\icons\Beta Testers
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\credits\icons\Beta Testers -srgb -y dave\title\credits\icons\Beta Testers\peejeada.png
rename ..\dds\dave\title\credits\icons\Beta Testers\peejeada.DDS peejeada.dds
mkdir ..\dds\dave\title\credits\icons\Beta Testers
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\credits\icons\Beta Testers -srgb -y dave\title\credits\icons\Beta Testers\stev.png
rename ..\dds\dave\title\credits\icons\Beta Testers\stev.DDS stev.dds
mkdir ..\dds\dave\title\credits\icons\Beta Testers
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\credits\icons\Beta Testers -srgb -y dave\title\credits\icons\Beta Testers\vex.png
rename ..\dds\dave\title\credits\icons\Beta Testers\vex.DDS vex.dds
mkdir ..\dds\dave\title\credits\icons\Beta Testers
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\credits\icons\Beta Testers -srgb -y dave\title\credits\icons\Beta Testers\weednose.png
rename ..\dds\dave\title\credits\icons\Beta Testers\weednose.DDS weednose.dds
mkdir ..\dds\dave\title\credits\icons\Beta Testers
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\credits\icons\Beta Testers -srgb -y dave\title\credits\icons\Beta Testers\wildy.png
rename ..\dds\dave\title\credits\icons\Beta Testers\wildy.DDS wildy.dds
mkdir ..\dds\dave\title\credits\icons\Beta Testers
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\credits\icons\Beta Testers -srgb -y dave\title\credits\icons\Beta Testers\xml.png
rename ..\dds\dave\title\credits\icons\Beta Testers\xml.DDS xml.dds
mkdir ..\dds\dave\title\credits\icons\Beta Testers
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\credits\icons\Beta Testers -srgb -y dave\title\credits\icons\Beta Testers\ztgds.png
rename ..\dds\dave\title\credits\icons\Beta Testers\ztgds.DDS ztgds.dds
mkdir ..\dds\dave\title\credits\icons\Contributors
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\credits\icons\Contributors -srgb -y dave\title\credits\icons\Contributors\Aadsta.png
rename ..\dds\dave\title\credits\icons\Contributors\Aadsta.DDS Aadsta.dds
mkdir ..\dds\dave\title\credits\icons\Contributors
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\credits\icons\Contributors -srgb -y dave\title\credits\icons\Contributors\Alexander Cooper 19.png
rename ..\dds\dave\title\credits\icons\Contributors\Alexander Cooper 19.DDS Alexander Cooper 19.dds
mkdir ..\dds\dave\title\credits\icons\Contributors
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\credits\icons\Contributors -srgb -y dave\title\credits\icons\Contributors\BombasticHype.png
rename ..\dds\dave\title\credits\icons\Contributors\BombasticHype.DDS BombasticHype.dds
mkdir ..\dds\dave\title\credits\icons\Contributors
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\credits\icons\Contributors -srgb -y dave\title\credits\icons\Contributors\Devianator.png
rename ..\dds\dave\title\credits\icons\Contributors\Devianator.DDS Devianator.dds
mkdir ..\dds\dave\title\credits\icons\Contributors
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\credits\icons\Contributors -srgb -y dave\title\credits\icons\Contributors\Jukebox.png
rename ..\dds\dave\title\credits\icons\Contributors\Jukebox.DDS Jukebox.dds
mkdir ..\dds\dave\title\credits\icons\Contributors
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\credits\icons\Contributors -srgb -y dave\title\credits\icons\Contributors\Lancey.png
rename ..\dds\dave\title\credits\icons\Contributors\Lancey.DDS Lancey.dds
mkdir ..\dds\dave\title\credits\icons\Contributors
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\credits\icons\Contributors -srgb -y dave\title\credits\icons\Contributors\Oxygen.png
rename ..\dds\dave\title\credits\icons\Contributors\Oxygen.DDS Oxygen.dds
mkdir ..\dds\dave\title\credits\icons\Contributors
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\credits\icons\Contributors -srgb -y dave\title\credits\icons\Contributors\Paraso.png
rename ..\dds\dave\title\credits\icons\Contributors\Paraso.DDS Paraso.dds
mkdir ..\dds\dave\title\credits\icons\Contributors
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\credits\icons\Contributors -srgb -y dave\title\credits\icons\Contributors\Project Tea.png
rename ..\dds\dave\title\credits\icons\Contributors\Project Tea.DDS Project Tea.dds
mkdir ..\dds\dave\title\credits\icons\Contributors
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\credits\icons\Contributors -srgb -y dave\title\credits\icons\Contributors\R34LD34L.png
rename ..\dds\dave\title\credits\icons\Contributors\R34LD34L.DDS R34LD34L.dds
mkdir ..\dds\dave\title\credits\icons\Contributors
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\credits\icons\Contributors -srgb -y dave\title\credits\icons\Contributors\Ruby.png
rename ..\dds\dave\title\credits\icons\Contributors\Ruby.DDS Ruby.dds
mkdir ..\dds\dave\title\credits\icons\Contributors
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\credits\icons\Contributors -srgb -y dave\title\credits\icons\Contributors\SAMMYPIGZY.png
rename ..\dds\dave\title\credits\icons\Contributors\SAMMYPIGZY.DDS SAMMYPIGZY.dds
mkdir ..\dds\dave\title\credits\icons\Contributors
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\credits\icons\Contributors -srgb -y dave\title\credits\icons\Contributors\Steph45.png
rename ..\dds\dave\title\credits\icons\Contributors\Steph45.DDS Steph45.dds
mkdir ..\dds\dave\title\credits\icons\Contributors
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\credits\icons\Contributors -srgb -y dave\title\credits\icons\Contributors\Top 10 Awesome.png
rename ..\dds\dave\title\credits\icons\Contributors\Top 10 Awesome.DDS Top 10 Awesome.dds
mkdir ..\dds\dave\title\credits\icons\Contributors
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\credits\icons\Contributors -srgb -y dave\title\credits\icons\Contributors\Your mom.png
rename ..\dds\dave\title\credits\icons\Contributors\Your mom.DDS Your mom.dds
mkdir ..\dds\dave\title\credits\icons\Contributors
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\credits\icons\Contributors -srgb -y dave\title\credits\icons\Contributors\YourAverageMental.png
rename ..\dds\dave\title\credits\icons\Contributors\YourAverageMental.DDS YourAverageMental.dds
mkdir ..\dds\dave\title\credits\icons\Contributors
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\credits\icons\Contributors -srgb -y dave\title\credits\icons\Contributors\chromasen.png
rename ..\dds\dave\title\credits\icons\Contributors\chromasen.DDS chromasen.dds
mkdir ..\dds\dave\title\credits\icons\Contributors
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\credits\icons\Contributors -srgb -y dave\title\credits\icons\Contributors\evdial.png
rename ..\dds\dave\title\credits\icons\Contributors\evdial.DDS evdial.dds
mkdir ..\dds\dave\title\credits\icons\Contributors
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\credits\icons\Contributors -srgb -y dave\title\credits\icons\Contributors\sibottle.png
rename ..\dds\dave\title\credits\icons\Contributors\sibottle.DDS sibottle.dds
mkdir ..\dds\dave\title\credits\icons\Contributors
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\credits\icons\Contributors -srgb -y dave\title\credits\icons\Contributors\sk0rbias.png
rename ..\dds\dave\title\credits\icons\Contributors\sk0rbias.DDS sk0rbias.dds
mkdir ..\dds\dave\title\credits\icons\Contributors
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\credits\icons\Contributors -srgb -y dave\title\credits\icons\Contributors\wugalex.png
rename ..\dds\dave\title\credits\icons\Contributors\wugalex.DDS wugalex.dds
mkdir ..\dds\dave\title\credits\icons\Developers
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\credits\icons\Developers -srgb -y dave\title\credits\icons\Developers\Billy Bobbo.png
rename ..\dds\dave\title\credits\icons\Developers\Billy Bobbo.DDS Billy Bobbo.dds
mkdir ..\dds\dave\title\credits\icons\Developers
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\credits\icons\Developers -srgb -y dave\title\credits\icons\Developers\Erizur.png
rename ..\dds\dave\title\credits\icons\Developers\Erizur.DDS Erizur.dds
mkdir ..\dds\dave\title\credits\icons\Developers
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\credits\icons\Developers -srgb -y dave\title\credits\icons\Developers\MissingTextureMan101.png
rename ..\dds\dave\title\credits\icons\Developers\MissingTextureMan101.DDS MissingTextureMan101.dds
mkdir ..\dds\dave\title\credits\icons\Developers
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\credits\icons\Developers -srgb -y dave\title\credits\icons\Developers\MoldyGH.png
rename ..\dds\dave\title\credits\icons\Developers\MoldyGH.DDS MoldyGH.dds
mkdir ..\dds\dave\title\credits\icons\Developers
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\credits\icons\Developers -srgb -y dave\title\credits\icons\Developers\T5mpler.png
rename ..\dds\dave\title\credits\icons\Developers\T5mpler.DDS T5mpler.dds
mkdir ..\dds\dave\title\credits\icons\Developers
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\credits\icons\Developers -srgb -y dave\title\credits\icons\Developers\TheBuilderXD.png
rename ..\dds\dave\title\credits\icons\Developers\TheBuilderXD.DDS TheBuilderXD.dds
mkdir ..\dds\dave\title\credits\icons\Developers
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\credits\icons\Developers -srgb -y dave\title\credits\icons\Developers\Zmac.png
rename ..\dds\dave\title\credits\icons\Developers\Zmac.DDS Zmac.dds
mkdir ..\dds\dave\title\credits\icons\Developers
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\credits\icons\Developers -srgb -y dave\title\credits\icons\Developers\pointy.png
rename ..\dds\dave\title\credits\icons\Developers\pointy.DDS pointy.dds
mkdir ..\dds\dave\title\credits\icons\Developers
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\credits\icons\Developers -srgb -y dave\title\credits\icons\Developers\rapparep lol.png
rename ..\dds\dave\title\credits\icons\Developers\rapparep lol.DDS rapparep lol.dds
mkdir ..\dds\dave\title\credits\icons\Special Thanks
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\credits\icons\Special Thanks -srgb -y dave\title\credits\icons\Special Thanks\You!.png
rename ..\dds\dave\title\credits\icons\Special Thanks\You!.DDS You!.dds
mkdir ..\dds\dave\title\credits\icons\Translators
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\credits\icons\Translators -srgb -y dave\title\credits\icons\Translators\Aizakku.png
rename ..\dds\dave\title\credits\icons\Translators\Aizakku.DDS Aizakku.dds
mkdir ..\dds\dave\title\credits\icons\Translators
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\credits\icons\Translators -srgb -y dave\title\credits\icons\Translators\Soulegal.png
rename ..\dds\dave\title\credits\icons\Translators\Soulegal.DDS Soulegal.dds
mkdir ..\dds\dave\title\credits\icons\Translators
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\credits\icons\Translators -srgb -y dave\title\credits\icons\Translators\dani.png
rename ..\dds\dave\title\credits\icons\Translators\dani.DDS dani.dds
mkdir ..\dds\dave\title\credits\socialMedia
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\credits\socialMedia -srgb -y dave\title\credits\socialMedia\discord.png
rename ..\dds\dave\title\credits\socialMedia\discord.DDS discord.dds
mkdir ..\dds\dave\title\credits\socialMedia
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\credits\socialMedia -srgb -y dave\title\credits\socialMedia\gamebanana.png
rename ..\dds\dave\title\credits\socialMedia\gamebanana.DDS gamebanana.dds
mkdir ..\dds\dave\title\credits\socialMedia
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\credits\socialMedia -srgb -y dave\title\credits\socialMedia\roblox.png
rename ..\dds\dave\title\credits\socialMedia\roblox.DDS roblox.dds
mkdir ..\dds\dave\title\credits\socialMedia
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\credits\socialMedia -srgb -y dave\title\credits\socialMedia\soundcloud.png
rename ..\dds\dave\title\credits\socialMedia\soundcloud.DDS soundcloud.dds
mkdir ..\dds\dave\title\credits\socialMedia
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\credits\socialMedia -srgb -y dave\title\credits\socialMedia\twitch.png
rename ..\dds\dave\title\credits\socialMedia\twitch.DDS twitch.dds
mkdir ..\dds\dave\title\credits\socialMedia
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\credits\socialMedia -srgb -y dave\title\credits\socialMedia\twitter.png
rename ..\dds\dave\title\credits\socialMedia\twitter.DDS twitter.dds
mkdir ..\dds\dave\title\credits\socialMedia
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\credits\socialMedia -srgb -y dave\title\credits\socialMedia\youtube.png
rename ..\dds\dave\title\credits\socialMedia\youtube.DDS youtube.dds
mkdir ..\dds\dave\title\credits\titles
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\credits\titles -srgb -y dave\title\credits\titles\Beta Testers.png
rename ..\dds\dave\title\credits\titles\Beta Testers.DDS Beta Testers.dds
mkdir ..\dds\dave\title\credits\titles
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\credits\titles -srgb -y dave\title\credits\titles\Contributors.png
rename ..\dds\dave\title\credits\titles\Contributors.DDS Contributors.dds
mkdir ..\dds\dave\title\credits\titles
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\credits\titles -srgb -y dave\title\credits\titles\Developers.png
rename ..\dds\dave\title\credits\titles\Developers.DDS Developers.dds
mkdir ..\dds\dave\title\credits\titles
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\credits\titles -srgb -y dave\title\credits\titles\Special Thanks.png
rename ..\dds\dave\title\credits\titles\Special Thanks.DDS Special Thanks.dds
mkdir ..\dds\dave\title\credits\titles
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\credits\titles -srgb -y dave\title\credits\titles\Translators.png
rename ..\dds\dave\title\credits\titles\Translators.DDS Translators.dds
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
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title -srgb -y dave\title\gfDanceTitle.png
rename ..\dds\dave\title\gfDanceTitle.DDS gfDanceTitle.dds
mkdir ..\dds\dave\title
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title -srgb -y dave\title\gridTemplate.png
rename ..\dds\dave\title\gridTemplate.DDS gridTemplate.dds
mkdir ..\dds\dave\title
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title -srgb -y dave\title\healthBar-3D.png
rename ..\dds\dave\title\healthBar-3D.DDS healthBar-3D.dds
mkdir ..\dds\dave\title
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title -srgb -y dave\title\healthBar.png
rename ..\dds\dave\title\healthBar.DDS healthBar.dds
mkdir ..\dds\dave\title
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title -srgb -y dave\title\logo.png
rename ..\dds\dave\title\logo.DDS logo.dds
mkdir ..\dds\dave\title
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title -srgb -y dave\title\logoBumpin.png
rename ..\dds\dave\title\logoBumpin.DDS logoBumpin.dds
mkdir ..\dds\dave\title
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title -srgb -y dave\title\logoBumpinExpunged.png
rename ..\dds\dave\title\logoBumpinExpunged.DDS logoBumpinExpunged.dds
mkdir ..\dds\dave\title\mainMenu
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\mainMenu -srgb -y dave\title\mainMenu\Select_Thing.png
rename ..\dds\dave\title\mainMenu\Select_Thing.DDS Select_Thing.dds
mkdir ..\dds\dave\title\mainMenu
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\mainMenu -srgb -y dave\title\mainMenu\eye.png
rename ..\dds\dave\title\mainMenu\eye.DDS eye.dds
mkdir ..\dds\dave\title
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title -srgb -y dave\title\main_menu_icons.png
rename ..\dds\dave\title\main_menu_icons.DDS main_menu_icons.dds
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
mkdir ..\dds\dave\title\weekBanners
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\weekBanners -srgb -y dave\title\weekBanners\DaveHouse.png
rename ..\dds\dave\title\weekBanners\DaveHouse.DDS DaveHouse.dds
mkdir ..\dds\dave\title\weekBanners
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\weekBanners -srgb -y dave\title\weekBanners\bamboi.png
rename ..\dds\dave\title\weekBanners\bamboi.DDS bamboi.dds
mkdir ..\dds\dave\title\weekBanners
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\weekBanners -srgb -y dave\title\weekBanners\festival.png
rename ..\dds\dave\title\weekBanners\festival.DDS festival.dds
mkdir ..\dds\dave\title\weekBanners
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\weekBanners -srgb -y dave\title\weekBanners\masterweek.png
rename ..\dds\dave\title\weekBanners\masterweek.DDS masterweek.dds
mkdir ..\dds\dave\title\weekBanners
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\weekBanners -srgb -y dave\title\weekBanners\masterweekquestion.png
rename ..\dds\dave\title\weekBanners\masterweekquestion.DDS masterweekquestion.dds
mkdir ..\dds\dave\title\weekBanners
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\weekBanners -srgb -y dave\title\weekBanners\splitathon.png
rename ..\dds\dave\title\weekBanners\splitathon.DDS splitathon.dds
mkdir ..\dds\dave\title\weekBanners
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\title\weekBanners -srgb -y dave\title\weekBanners\warmup.png
rename ..\dds\dave\title\weekBanners\warmup.DDS warmup.dds
mkdir ..\dds\dave
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave -srgb -y dave\titleEnter.png
rename ..\dds\dave\titleEnter.DDS titleEnter.dds
mkdir ..\dds\dave\ui\3D
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\ui\3D -srgb -y dave\ui\3D\bad.png
rename ..\dds\dave\ui\3D\bad.DDS bad.dds
mkdir ..\dds\dave\ui\3D
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\ui\3D -srgb -y dave\ui\3D\combo.png
rename ..\dds\dave\ui\3D\combo.DDS combo.dds
mkdir ..\dds\dave\ui\3D
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\ui\3D -srgb -y dave\ui\3D\good.png
rename ..\dds\dave\ui\3D\good.DDS good.dds
mkdir ..\dds\dave\ui\3D
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\ui\3D -srgb -y dave\ui\3D\num0.png
rename ..\dds\dave\ui\3D\num0.DDS num0.dds
mkdir ..\dds\dave\ui\3D
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\ui\3D -srgb -y dave\ui\3D\num1.png
rename ..\dds\dave\ui\3D\num1.DDS num1.dds
mkdir ..\dds\dave\ui\3D
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\ui\3D -srgb -y dave\ui\3D\num2.png
rename ..\dds\dave\ui\3D\num2.DDS num2.dds
mkdir ..\dds\dave\ui\3D
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\ui\3D -srgb -y dave\ui\3D\num3.png
rename ..\dds\dave\ui\3D\num3.DDS num3.dds
mkdir ..\dds\dave\ui\3D
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\ui\3D -srgb -y dave\ui\3D\num4.png
rename ..\dds\dave\ui\3D\num4.DDS num4.dds
mkdir ..\dds\dave\ui\3D
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\ui\3D -srgb -y dave\ui\3D\num5.png
rename ..\dds\dave\ui\3D\num5.DDS num5.dds
mkdir ..\dds\dave\ui\3D
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\ui\3D -srgb -y dave\ui\3D\num6.png
rename ..\dds\dave\ui\3D\num6.DDS num6.dds
mkdir ..\dds\dave\ui\3D
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\ui\3D -srgb -y dave\ui\3D\num7.png
rename ..\dds\dave\ui\3D\num7.DDS num7.dds
mkdir ..\dds\dave\ui\3D
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\ui\3D -srgb -y dave\ui\3D\num8.png
rename ..\dds\dave\ui\3D\num8.DDS num8.dds
mkdir ..\dds\dave\ui\3D
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\ui\3D -srgb -y dave\ui\3D\num9.png
rename ..\dds\dave\ui\3D\num9.DDS num9.dds
mkdir ..\dds\dave\ui\3D
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\ui\3D -srgb -y dave\ui\3D\shit.png
rename ..\dds\dave\ui\3D\shit.DDS shit.dds
mkdir ..\dds\dave\ui\3D
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\ui\3D -srgb -y dave\ui\3D\sick.png
rename ..\dds\dave\ui\3D\sick.DDS sick.dds
mkdir ..\dds\dave\ui
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\ui -srgb -y dave\ui\HELLthBar.png
rename ..\dds\dave\ui\HELLthBar.DDS HELLthBar.dds
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
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\ui -srgb -y dave\ui\doorWarning.png
rename ..\dds\dave\ui\doorWarning.DDS doorWarning.dds
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
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\ui -srgb -y dave\ui\shapeNoteWarning.png
rename ..\dds\dave\ui\shapeNoteWarning.DDS shapeNoteWarning.dds
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
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\weeb -srgb -y dave\weeb\bfPixel.png
rename ..\dds\dave\weeb\bfPixel.DDS bfPixel.dds
mkdir ..\dds\dave\weeb
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\weeb -srgb -y dave\weeb\bfPixelsDEAD.png
rename ..\dds\dave\weeb\bfPixelsDEAD.DDS bfPixelsDEAD.dds
mkdir ..\dds\dave\weeb
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\dave\weeb -srgb -y dave\weeb\gfPixel.png
rename ..\dds\dave\weeb\gfPixel.DDS gfPixel.dds
mkdir ..\dds\menu
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\menu -srgb -y menu\FNF_main_menu_assets.png
rename ..\dds\menu\FNF_main_menu_assets.DDS FNF_main_menu_assets.dds
mkdir ..\dds\menu
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\menu -srgb -y menu\girlfriend-title.png
rename ..\dds\menu\girlfriend-title.DDS girlfriend-title.dds
mkdir ..\dds\menu
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\menu -srgb -y menu\logo.png
rename ..\dds\menu\logo.DDS logo.dds
mkdir ..\dds\menu
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\menu -srgb -y menu\menuBG.png
rename ..\dds\menu\menuBG.DDS menuBG.dds
mkdir ..\dds\menu\storymenu
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\menu\storymenu -srgb -y menu\storymenu\campaign_menu_UI_assets.png
rename ..\dds\menu\storymenu\campaign_menu_UI_assets.DDS campaign_menu_UI_assets.dds
mkdir ..\dds\menu\storymenu
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\menu\storymenu -srgb -y menu\storymenu\campaign_menu_UI_characters.png
rename ..\dds\menu\storymenu\campaign_menu_UI_characters.DDS campaign_menu_UI_characters.dds
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
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\menu\storymenu -srgb -y menu\storymenu\weekMenu.png
rename ..\dds\menu\storymenu\weekMenu.DDS weekMenu.dds
mkdir ..\dds\menu
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\menu -srgb -y menu\title-bg.png
rename ..\dds\menu\title-bg.DDS title-bg.dds
mkdir ..\dds\menu
%texconv% -f DXT5 -m 1 -nologo -o ..\dds\menu -srgb -y menu\titleEnter.png
rename ..\dds\menu\titleEnter.DDS titleEnter.dds
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