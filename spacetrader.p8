pico-8 cartridge // http://www.pico-8.com
version 41
__lua__
--spacetrader
--by 

--Game
currentmodule="starmap"
currentsystem=""
targetsystem=""
health=0
fuel=0
credits=0

starfield={["alphekka"]={["name"]="alphekka", ["x"]=40, ["y"]=438, connections={[0]="acrux" ,[1]="fomalhaut" ,[2]="agena" }},["bellatrix"]={["name"]="bellatrix", ["x"]=16, ["y"]=123, connections={[0]="betelgeuse" ,[1]="procyon" }},["acamar"]={["name"]="acamar", ["x"]=143, ["y"]=331, connections={[0]="hadar" ,[1]="shedir" }},["kruger 60"]={["name"]="kruger 60", ["x"]=180, ["y"]=50, connections={[0]="alpheratz" ,[1]="kocab" ,[2]="polaris" ,[3]="mirphak" }},["groombridge 1830"]={["name"]="groombridge 1830", ["x"]=481, ["y"]=494, connections={[0]="saiph" ,[1]="alcor" }},["enif"]={["name"]="enif", ["x"]=354, ["y"]=501, connections={[0]="etamin" }},["proxima"]={["name"]="proxima", ["x"]=296, ["y"]=505, connections={[0]="alderamin" ,[1]="etamin" }},["barnard's star"]={["name"]="barnard's star", ["x"]=1, ["y"]=349, connections={[0]="arcturus" }},["caph"]={["name"]="caph", ["x"]=442, ["y"]=256, connections={[0]="adhara" ,[1]="sirius" ,[2]="rasalhague" ,[3]="alnath" }},["alphard"]={["name"]="alphard", ["x"]=50, ["y"]=214, connections={[0]="alnilam" ,[1]="vindemiatrix" ,[2]="deneb" }},["achernar"]={["name"]="achernar", ["x"]=339, ["y"]=408, connections={[0]="almaak" ,[1]="zaurak" ,[2]="red rectangle" }},["altair"]={["name"]="altair", ["x"]=104, ["y"]=36, connections={[0]="mizar" ,[1]="alpheratz" ,[2]="kocab" ,[3]="cor caroli" }},["albireo"]={["name"]="albireo", ["x"]=264, ["y"]=262, connections={[0]="aldebaran" ,[1]="sadalmelik" ,[2]="sadalmelik" }},["thuban"]={["name"]="thuban", ["x"]=363, ["y"]=185, connections={[0]="pollux" ,[1]="sirius" }},["menkar"]={["name"]="menkar", ["x"]=458, ["y"]=441, connections={[0]="van maanen 2" ,[1]="rigil kent" ,[2]="alcor" }},["scheat"]={["name"]="scheat", ["x"]=124, ["y"]=178, connections={[0]="nihal" ,[1]="spica" }},["saiph"]={["name"]="saiph", ["x"]=435, ["y"]=501, connections={[0]="groombridge 1830" ,[1]="van maanen 2" ,[2]="alcor" }},["markab"]={["name"]="markab", ["x"]=188, ["y"]=268, connections={[0]="sadalmelik" ,[1]="mira" }},["alioth"]={["name"]="alioth", ["x"]=120, ["y"]=457, connections={[0]="algieba" ,[1]="regulus" ,[2]="rasalgethi" }},["alnair"]={["name"]="alnair", ["x"]=321, ["y"]=261, connections={[0]="izar" ,[1]="algol" ,[2]="aldebaran" }},["alnilam"]={["name"]="alnilam", ["x"]=75, ["y"]=250, connections={[0]="alphard" ,[1]="capella" ,[2]="kaus australis" }},["sadalmelik"]={["name"]="sadalmelik", ["x"]=214, ["y"]=258, connections={[0]="markab" ,[1]="mira" ,[2]="albireo" ,[3]="albireo" }},["alhena"]={["name"]="alhena", ["x"]=276, ["y"]=121, connections={[0]="alcyone" ,[1]="tarazed" ,[2]="cyg x-1" }},["pollux"]={["name"]="pollux", ["x"]=327, ["y"]=162, connections={[0]="thuban" ,[1]="pleione" }},["mirach"]={["name"]="mirach", ["x"]=145, ["y"]=114, connections={[0]="kocab" ,[1]="ankaa" ,[2]="polaris" ,[3]="alnitak" }},["phad"]={["name"]="phad", ["x"]=276, ["y"]=364, connections={[0]="kapteyn's star" }},["mizar"]={["name"]="mizar", ["x"]=63, ["y"]=32, connections={[0]="altair" ,[1]="betelgeuse" ,[2]="alshain" }},["alpheratz"]={["name"]="alpheratz", ["x"]=139, ["y"]=34, connections={[0]="kruger 60" ,[1]="altair" ,[2]="kocab" ,[3]="cor caroli" }},["nunki"]={["name"]="nunki", ["x"]=505, ["y"]=245, connections={[0]="rasalhague" ,[1]="alnath" }},["izar"]={["name"]="izar", ["x"]=288, ["y"]=212, connections={[0]="alnair" }},["kocab"]={["name"]="kocab", ["x"]=136, ["y"]=68, connections={[0]="kruger 60" ,[1]="altair" ,[2]="mirach" ,[3]="alpheratz" ,[4]="polaris" ,[5]="alnitak" }},["acrux"]={["name"]="acrux", ["x"]=4, ["y"]=470, connections={[0]="alphekka" ,[1]="babcock's star" ,[2]="fomalhaut" }},["vega"]={["name"]="vega", ["x"]=183, ["y"]=498, connections={[0]="algieba" }},["ankaa"]={["name"]="ankaa", ["x"]=176, ["y"]=163, connections={[0]="mirach" ,[1]="campbell's star" ,[2]="nihal" ,[3]="spica" }},["vindemiatrix"]={["name"]="vindemiatrix", ["x"]=18, ["y"]=242, connections={[0]="alphard" ,[1]="capella" }},["alcyone"]={["name"]="alcyone", ["x"]=294, ["y"]=83, connections={[0]="alhena" ,[1]="mintaka" ,[2]="cyg x-1" }},["shedir"]={["name"]="shedir", ["x"]=100, ["y"]=382, connections={[0]="regulus" ,[1]="agena" ,[2]="acamar" }},["betelgeuse"]={["name"]="betelgeuse", ["x"]=49, ["y"]=77, connections={[0]="bellatrix" ,[1]="mizar" ,[2]="procyon" }},["dubhe"]={["name"]="dubhe", ["x"]=448, ["y"]=165, connections={[0]="unukalhai" ,[1]="hamal" ,[2]="3c 273" }},["babcock's star"]={["name"]="babcock's star", ["x"]=36, ["y"]=510, connections={[0]="acrux" ,[1]="canopus" }},["alshain"]={["name"]="alshain", ["x"]=38, ["y"]=7, connections={[0]="mizar" }},["castor"]={["name"]="castor", ["x"]=381, ["y"]=22, connections={[0]="denebola" ,[1]="shaula" }},["fomalhaut"]={["name"]="fomalhaut", ["x"]=19, ["y"]=442, connections={[0]="alphekka" ,[1]="acrux" }},["canopus"]={["name"]="canopus", ["x"]=68, ["y"]=510, connections={[0]="babcock's star" }},["adhara"]={["name"]="adhara", ["x"]=411, ["y"]=275, connections={[0]="caph" ,[1]="luyten's star" ,[2]="alnath" ,[3]="arneb" }},["luyten's star"]={["name"]="luyten's star", ["x"]=382, ["y"]=317, connections={[0]="adhara" ,[1]="algol" ,[2]="red rectangle" ,[3]="red rectangle" }},["diphda"]={["name"]="diphda", ["x"]=506, ["y"]=170, connections={[0]="hamal" }},["polaris"]={["name"]="polaris", ["x"]=154, ["y"]=88, connections={[0]="kruger 60" ,[1]="mirach" ,[2]="kocab" ,[3]="mirphak" ,[4]="alnitak" }},["antares"]={["name"]="antares", ["x"]=489, ["y"]=88, connections={[0]="rigel" }},["mirphak"]={["name"]="mirphak", ["x"]=200, ["y"]=78, connections={[0]="kruger 60" ,[1]="polaris" ,[2]="cyg x-1" }},["pleione"]={["name"]="pleione", ["x"]=359, ["y"]=119, connections={[0]="pollux" ,[1]="3c 273" }},["procyon"]={["name"]="procyon", ["x"]=50, ["y"]=107, connections={[0]="bellatrix" ,[1]="betelgeuse" ,[2]="algenib" }},["megrez"]={["name"]="megrez", ["x"]=469, ["y"]=367, connections={[0]="sheliak" }},["sirius"]={["name"]="sirius", ["x"]=398, ["y"]=212, connections={[0]="caph" ,[1]="thuban" ,[2]="arneb" }},["unukalhai"]={["name"]="unukalhai", ["x"]=415, ["y"]=162, connections={[0]="dubhe" ,[1]="3c 273" }},["rasalhague"]={["name"]="rasalhague", ["x"]=480, ["y"]=233, connections={[0]="caph" ,[1]="nunki" ,[2]="alnath" }},["campbell's star"]={["name"]="campbell's star", ["x"]=205, ["y"]=150, connections={[0]="ankaa" ,[1]="spica" ,[2]="cyg x-1" }},["nihal"]={["name"]="nihal", ["x"]=144, ["y"]=172, connections={[0]="scheat" ,[1]="ankaa" ,[2]="spica" }},["denebola"]={["name"]="denebola", ["x"]=395, ["y"]=48, connections={[0]="castor" ,[1]="shaula" }},["capella"]={["name"]="capella", ["x"]=46, ["y"]=268, connections={[0]="alnilam" ,[1]="vindemiatrix" ,[2]="kaus australis" }},["alderamin"]={["name"]="alderamin", ["x"]=282, ["y"]=474, connections={[0]="proxima" ,[1]="zaurak" }},["van maanen 2"]={["name"]="van maanen 2", ["x"]=418, ["y"]=471, connections={[0]="menkar" ,[1]="saiph" ,[2]="alcor" }},["algieba"]={["name"]="algieba", ["x"]=139, ["y"]=484, connections={[0]="alioth" ,[1]="vega" ,[2]="rasalgethi" }},["merak"]={["name"]="merak", ["x"]=163, ["y"]=405, connections={[0]="regulus" ,[1]="alkaid" }},["alnath"]={["name"]="alnath", ["x"]=459, ["y"]=227, connections={[0]="caph" ,[1]="nunki" ,[2]="adhara" ,[3]="rasalhague" }},["almaak"]={["name"]="almaak", ["x"]=360, ["y"]=416, connections={[0]="achernar" ,[1]="zaurak" ,[2]="red rectangle" ,[3]="rigil kent" ,[4]="rigil kent" }},["hadar"]={["name"]="hadar", ["x"]=100, ["y"]=307, connections={[0]="acamar" ,[1]="kaus australis" }},["alnitak"]={["name"]="alnitak", ["x"]=121, ["y"]=107, connections={[0]="mirach" ,[1]="kocab" ,[2]="polaris" }},["mira"]={["name"]="mira", ["x"]=192, ["y"]=243, connections={[0]="markab" ,[1]="sadalmelik" ,[2]="spica" }},["regulus"]={["name"]="regulus", ["x"]=117, ["y"]=409, connections={[0]="alioth" ,[1]="shedir" ,[2]="merak" ,[3]="agena" ,[4]="rasalgethi" }},["rigil kent"]={["name"]="rigil kent", ["x"]=421, ["y"]=420, connections={[0]="menkar" ,[1]="alcor" ,[2]="sheliak" ,[3]="almaak" ,[4]="almaak" }},["hamal"]={["name"]="hamal", ["x"]=471, ["y"]=152, connections={[0]="dubhe" ,[1]="diphda" ,[2]="rigel" }},["shaula"]={["name"]="shaula", ["x"]=426, ["y"]=66, connections={[0]="castor" ,[1]="denebola" ,[2]="3c 273" }},["deneb"]={["name"]="deneb", ["x"]=25, ["y"]=186, connections={[0]="alphard" ,[1]="algenib" }},["zaurak"]={["name"]="zaurak", ["x"]=315, ["y"]=432, connections={[0]="achernar" ,[1]="alderamin" ,[2]="almaak" ,[3]="etamin" }},["spica"]={["name"]="spica", ["x"]=172, ["y"]=188, connections={[0]="scheat" ,[1]="ankaa" ,[2]="campbell's star" ,[3]="nihal" ,[4]="mira" }},["algol"]={["name"]="algol", ["x"]=347, ["y"]=294, connections={[0]="alnair" ,[1]="luyten's star" ,[2]="kapteyn's star" ,[3]="arneb" }},["alkaid"]={["name"]="alkaid", ["x"]=192, ["y"]=388, connections={[0]="merak" }},["cor caroli"]={["name"]="cor caroli", ["x"]=129, ["y"]=4, connections={[0]="altair" ,[1]="alpheratz" }},["tarazed"]={["name"]="tarazed", ["x"]=264, ["y"]=155, connections={[0]="alhena" ,[1]="cyg x-1" }},["agena"]={["name"]="agena", ["x"]=73, ["y"]=389, connections={[0]="alphekka" ,[1]="shedir" ,[2]="regulus" ,[3]="rasalgethi" ,[4]="arcturus" }},["mintaka"]={["name"]="mintaka", ["x"]=263, ["y"]=40, connections={[0]="alcyone" }},["red rectangle"]={["name"]="red rectangle", ["x"]=349, ["y"]=376, connections={[0]="achernar" ,[1]="almaak" ,[2]="luyten's star" ,[3]="luyten's star" }},["rasalgethi"]={["name"]="rasalgethi", ["x"]=92, ["y"]=438, connections={[0]="alioth" ,[1]="algieba" ,[2]="regulus" ,[3]="agena" }},["rigel"]={["name"]="rigel", ["x"]=496, ["y"]=112, connections={[0]="antares" ,[1]="hamal" }},["alcor"]={["name"]="alcor", ["x"]=438, ["y"]=461, connections={[0]="groombridge 1830" ,[1]="menkar" ,[2]="saiph" ,[3]="van maanen 2" ,[4]="rigil kent" }},["arcturus"]={["name"]="arcturus", ["x"]=30, ["y"]=385, connections={[0]="barnard's star" ,[1]="agena" }},["kapteyn's star"]={["name"]="kapteyn's star", ["x"]=298, ["y"]=318, connections={[0]="phad" ,[1]="algol" ,[2]="aldebaran" }},["aldebaran"]={["name"]="aldebaran", ["x"]=283, ["y"]=294, connections={[0]="albireo" ,[1]="alnair" ,[2]="kapteyn's star" }},["algenib"]={["name"]="algenib", ["x"]=67, ["y"]=152, connections={[0]="procyon" ,[1]="deneb" }},["cyg x-1"]={["name"]="cyg x-1", ["x"]=248, ["y"]=123, connections={[0]="alhena" ,[1]="alcyone" ,[2]="mirphak" ,[3]="campbell's star" ,[4]="tarazed" }},["sheliak"]={["name"]="sheliak", ["x"]=441, ["y"]=389, connections={[0]="megrez" ,[1]="rigil kent" }},["kaus australis"]={["name"]="kaus australis", ["x"]=79, ["y"]=299, connections={[0]="alnilam" ,[1]="capella" ,[2]="hadar" }},["etamin"]={["name"]="etamin", ["x"]=341, ["y"]=479, connections={[0]="enif" ,[1]="proxima" ,[2]="zaurak" }},["arneb"]={["name"]="arneb", ["x"]=384, ["y"]=247, connections={[0]="adhara" ,[1]="sirius" ,[2]="algol" }},["3c 273"]={["name"]="3c 273", ["x"]=399, ["y"]=124, connections={[0]="dubhe" ,[1]="pleione" ,[2]="unukalhai" ,[3]="shaula" }}}



function _init()
end

function _update()
   cls(0)
   if(currentmodule=="starmap") then
     updatestarmap()
   elseif(currentmodule=="fighting") then
     updatefighting()
   elseif(currentmodule=="solarsystem") then
     updatesolarsystem()
   elseif(currentmodule=="asteroidmining") then
     updateasteroidmining()
   elseif(currentmodule=="starbase") then
     updatestarbase()
   elseif(currentmodule=="market") then
     updatemarket()
   elseif(currentmodule=="planet") then
     updateplanet()
   elseif(currentmodule=="city") then
     updatecity()
   elseif(currentmodule=="quests") then
     updatequests()
   end     
end

function _draw()
   if(currentmodule=="starmap") then
     drawstarmap()
   elseif(currentmodule=="fighting") then
     drawfighting()
   elseif(currentmodule=="solarsystem") then
     drawsolarsystem()
   elseif(currentmodule=="asteroidmining") then
     drawasteroidmining()
   elseif(currentmodule=="starbase") then
     drawstarbase()
   elseif(currentmodule=="market") then
     drawmarket()
   elseif(currentmodule=="planet") then
     drawplanet()
   elseif(currentmodule=="city") then
     drawcity()
   elseif(currentmodule=="quests") then
     drawquests()
   end
end

--Globals
function updentity()
end

function drwentity()
end

--Starmap
function drawstarmap()
end

function updatestarmap()
end

--Fighting
function updatefighting()
end

function drawfighting()
end

--SolarSystem
function updatesolarsystem()
end

function drawsolarsystem()
end

--AsteroidMining
function updateasteroidmining()
end

function drawasteroidmining()
end

--Starbase
function updatestarbase()
end

function drawstarbase()
end

--Market
function updatemarket()
end

function drawmarket()
end

--Planet
function updateplanet()
end

function drawplanet()
end

--City
function updatecity()
end

function drawcity()
end

--Quests
function updatequests()
end

function drawquests()
end

__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
