ESX = nil
local Keys = {
  ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
  ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
  ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
  ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
  ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
  ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
  ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
  ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
  ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}
--[[GET ESX OBJ DATA --VERY IMPORTANT]]
Citizen.CreateThread(function()
  while ESX == nil do
  TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
  Citizen.Wait(0)
  end
end)
--[[END GET ESX OBJ DATA]]
Citizen.CreateThread(function()
--variables
vehprices = {

  --{name = "Forklift", costs = 9500, description = {}, model = "forklift"},
  {name = "Blista", costs = 9600, description = {}, model = "blista"},
  {name = "Blista Compact", costs = 15000, description = {}, model = "blista2"},
  {name = "Monkey Blista", costs = 12000, description = {}, model = "blista3"},
  {name = "Brioso R/A", costs = 18000, description = {}, model = "brioso"},
  {name = "Dilettante", costs = 10000, description = {}, model = "Dilettante"},
  {name = "Futo", costs = 10000, description = {}, model = "futo"},
  {name = "Issi", costs = 15000, description = {}, model = "issi2"},
  {name = "Issi Classic", costs = 28000, description = {}, model = "issi3"},
  {name = "Panto", costs = 15000, description = {}, model = "panto"},
  {name = "Prairie", costs = 12000, description = {}, model = "prairie"},
  {name = "Rhapsody", costs = 12000, description = {}, model = "rhapsody"},

  {name = "Cognoscenti Cabrio", costs = 110000, description = {}, model = "cogcabrio"},
  {name = "Exemplar",	costs = 95000, description = {}, model = "exemplar"},
  {name = "F620", costs = 115000, description = {}, model = "f620"},
  {name = "Felon", costs = 95000, description = {}, model = "felon"},
  {name = "Felon GT", costs = 100000, description = {}, model = "felon2"},
  {name = "Jackal", costs = 85000, description = {}, model = "jackal"},
  {name = "Oracle", costs = 65000, description = {}, model = "oracle2"},
  {name = "Oracle XS", costs = 70000, description = {}, model = "oracle"},
  {name = "Sentinel", costs = 75000, description = {}, model = "sentinel2"},
  {name = "Sentinel XS", costs = 80000, description = {}, model = "sentinel"},
  {name = "Windsor", costs = 100000, description = {}, model = "windsor"},
  {name = "Windsor Drop", costs = 105000, description = {}, model = "windsor2"},
  {name = "Zion", costs = 60000, description = {}, model = "zion"},
  {name = "Zion Cabrio", costs = 65000, description = {}, model = "zion2"},

  {name = "9F", costs = 140000, description = {}, model = "ninef"},
  {name = "9F Cabrio", costs = 145000, description = {}, model = "ninef2"},
  {name = "Alpha", costs = 100000, description = {}, model = "alpha"},
  {name = "Banshee", costs = 130000, description = {}, model = "banshee"},
  {name = "Bestia GTS", costs = 150000, description = {}, model = "bestiagts"},
  {name = "Buffalo", costs = 35000, description = {}, model = "buffalo"},
  {name = "Buffalo S", costs = 50000, description = {}, model = "buffalo2"},
  {name = "Sprunk Buffalo", costs = 65000, description = {}, model = "buffalo3"},
  {name = "Carbonizzare", costs = 160000, description = {}, model = "carbonizzare"},
  {name = "Comet", costs = 140000, description = {}, model = "comet2"},
  {name = "Comet Retro Custom", costs = 145000, description = {}, model = "comet3"},
  --{name = "Comet SR", costs = 195000, description = {}, model = "comet5"},
  {name = "Coquette", costs = 130000, description = {}, model = "coquette"},
  {name = "Drift Tampa", costs = 270000, description = {}, model = "tampa2"},
  {name = "Elegy Retro Custom", costs = 150000, description = {}, model = "elegy"},
  {name = "Elegy RH8", costs = 115000, description = {}, model = "elegy2"},
  {name = "Feltzer", costs = 120000, description = {}, model = "feltzer2"},
  {name = "Flash GT", costs = 245000, description = {}, model = "flashgt"},
  {name = "Furore GT", costs = 100000, description = {}, model = "furoregt"},
  {name = "Fusilade", costs = 40000, description = {}, model = "fusilade"},
  --{name = "GB200", costs = 999999, description = {}, model = "gb200"},
  --{name = "Hotring Sabre", costs = 999999, description = {}, model = "hotring"},
  {name = "Jester", costs = 2500000, description = {}, model = "jester"},
  {name = "Jester (Racecar)", costs = 2950000, description = {}, model = "jester2"},
  {name = "Jester Classic", costs = 180000, description = {}, model = "jester3"},
  --{name = "Khamelion", costs = 999999, description = {}, model = "khamelion"},
  {name = "Kuruma", costs = 195000, description = {}, model = "kuruma"},
  {name = "Lynx", costs = 125000, description = {}, model = "lynx"},
  {name = "Massacro", costs = 170000, description = {}, model = "massacro"},
  {name = "Massacro (Racecar)", costs = 185000, description = {}, model = "massacro2"},
  --{name = "Neon", costs = 999999, description = {}, model = "neon"},
  {name = "Omnis", costs = 200000, description = {}, model = "omnis"},
  --{name = "Pariah", costs = 999999, description = {}, model = "pariah"},
  {name = "Penumbra", costs = 25000, description = {}, model = "penumbra"},
  {name = "Raiden", costs = 145000, description = {}, model = "raiden"},
  {name = "Rapid GT", costs = 135000, description = {}, model = "rapidgt"},
  {name = "Rapid GT Convertible", costs = 140000, description = {}, model = "rapidgt2"},
  {name = "Raptor", costs = 175000, description = {}, model = "raptor"},
  --{name = "Revolter", costs = 999999, description = {}, model = "revolter"},
  {name = "Ruston", costs = 1950000, description = {}, model = "ruston"},
  {name = "Schafter V12", costs = 125000, description = {}, model = "schafter3"},
  {name = "Schafter LWB", costs = 130000, description = {}, model = "schafter4"},
  {name = "Schwartzer", costs = 145000, description = {}, model = "schwarzer"},
  --{name = "Seven-70", costs = 999999, description = {}, model = "seven70"},
  {name = "Sentinel Classic", costs = 115000, description = {}, model = "sentinel3"},
  {name = "Specter", costs = 165000, description = {}, model = "specter"},
  {name = "Specter Custom", costs = 185000, description = {}, model = "specter2"},
  {name = "Sultan", costs = 95000, description = {}, model = "sultan"},
  {name = "Surano", costs = 120000, description = {}, model = "surano"},
  {name = "Tropos", costs = 210000, description = {}, model = "tropos"},
  {name = "Verlierer", costs = 175000, description = {}, model = "verlierer2"},

  --{name = "190z", costs = 999999, description = {}, model = "z190"},
  {name = "Casco", costs = 95000, description = {}, model = "casco"},
  {name = "Cheburek", costs = 65000, description = {}, model = "cheburek"},
  {name = "Cheetah Classic", costs = 350000, description = {}, model = "cheetah2"},
  {name = "Coquette Classic", costs = 125000, description = {}, model = "coquette2"},
  {name = "Deluxo", costs = 400000, description = {}, model = "deluxo"},
  --{name = "Fagaloa", costs = 999999, description = {}, model = "fagaloa"},
  --{name = "GT500", costs = 999999, description = {}, model = "gt500"},
  --{name = "Infernus Classic", costs = 999999, description = {}, model = "infernus2"},
  {name = "JB 700", costs = 200000, description = {}, model = "jb700"},
  {name = "Mamba", costs = 4250000, description = {}, model = "mamba"},
  --{name = "Michelli GT", costs = 999999, description = {}, model = "michelli"},
  {name = "Monroe", costs = 445000, description = {}, model = "monroe"},
  {name = "Peyote", costs = 65000, description = {}, model = "peyote"},
  {name = "Pigalle", costs = 40000, description = {}, model = "pigalle"},
  {name = "Rapid GT Classic", costs = 375000, description = {}, model = "rapidgt3"},
  --{name = "Retinue", costs = 315000, description = {}, model = "retinue"},
  --{name = "Savestra", costs = 999999, description = {}, model = "savestra"},
  {name = "Stinger", costs = 190000, description = {}, model = "stinger"},
  {name = "Stinger GT", costs = 205000, description = {}, model = "stingergt"},
  {name = "Stirling GT", costs = 200000, description = {}, model = "feltzer3"},
  --{name = "Torero", costs = 999999, description = {}, model = "torero"},
  --{name = "Turismo Classic", costs = 999999, description = {}, model = "turismo2"},
  --{name = "Viseris", costs = 999999, description = {}, model = "viseris"},
  {name = "Z-Type", costs = 300000, description = {}, model = "ztype"},

  --{name = "RAMP BUGGY", costs = 7550000, description = {}, model = "DUNE4"},
  {name = "811", costs = 1350000, description = {}, model = "pfister811"},
  {name = "Adder", costs = 3000000, description = {}, model = "adder"},
  --{name = "Autarch", costs = 999999, description = {}, model = "autarch"},
  {name = "Banshee 900R", costs = 300000, description = {}, model = "banshee2"},
  {name = "Bullet", costs = 170000, description = {}, model = "bullet"},
  {name = "Cheetah", costs = 280000, description = {}, model = "cheetah"},
  --{name = "Cyclone", costs = 999999, description = {}, model = "cyclone"},
  {name = "Entity XF", costs = 450000, description = {}, model = "entityxf"},
  --{name = "Entity XXR", costs = 999999, description = {}, model = "entity2"},
  {name = "ETR1", costs = 199500, description = {}, model = "sheava"},
  {name = "FMJ", costs = 1750000, description = {}, model = "fmj"},
  --{name = "GP1", costs = 999999, description = {}, model = "gp1"}, --1400000
  {name = "Infernus", costs = 230000, description = {}, model = "infernus"},
  {name = "Itali GTB", costs = 198000, description = {}, model = "italigtb"},
  {name = "Itali GTB Custom", costs = 212000, description = {}, model = "italigtb2"},
  {name = "Nero", costs = 10000000, description = {}, model = "nero"},
  {name = "Nero Custom", costs = 10550000, description = {}, model = "nero2"},
  {name = "Osiris", costs = 1950000, description = {}, model = "osiris"},
  {name = "Penetrator", costs = 255000, description = {}, model = "penetrator"},
  {name = "RE-7B", costs = 3475000, description = {}, model = "le7b"},
  {name = "Reaper", costs = 1595000, description = {}, model = "reaper"},
  --{name = "SC1", costs = 999999, description = {}, model = "sc1"},
  {name = "Sultan RS", costs = 180000, description = {}, model = "sultanrs"},
  {name = "T20", costs = 2200000, description = {}, model = "t20"},
  --{name = "Taipan", costs = 999999, description = {}, model = "taipan"},
  --{name = "Tempesta", costs = 999999, description = {}, model = "tempesta"}, --1150000
  --{name = "Tezeract", costs = 999999, description = {}, model = "tezeract"},
  {name = "Turismo R", costs = 700000, description = {}, model = "turismor"},
  --{name = "Tyrant", costs = 999999, description = {}, model = "tyrant"},
  {name = "Tyrus", costs = 2550000, description = {}, model = "tyrus"},
  {name = "Vacca", costs = 220000, description = {}, model = "vacca"},
  {name = "Vagner", costs = 2540000, description = {}, model = "vagner"},
  --{name = "Visione", costs = 999999, description = {}, model = "visione"}, --1890000
  {name = "Voltic", costs = 150000, description = {}, model = "voltic"},
  {name = "XA-21", costs = 1880000, description = {}, model = "xa21"},
  {name = "X80 Proto", costs = 2700000, description = {}, model = "prototipo"},
  {name = "Zentorno", costs = 725000, description = {}, model = "zentorno"},

  {name = "Blade", costs = 100000, description = {}, model = "blade"},
  {name = "Buccaneer", costs = 29000, description = {}, model = "buccaneer"},
  {name = "Buccaneer Custom", costs = 95000, description = {}, model = "buccaneer2"},
  {name = "Chino", costs = 90000, description = {}, model = "chino"},
  {name = "Chino Custom", costs = 95000, description = {}, model = "chino2"},
  {name = "Coquette BlackFin", costs = 220000, description = {}, model = "coquette3"},
  {name = "Dominator", costs = 45000, description = {}, model = "dominator"},
  {name = "Pisswasser Dominator", costs = 55000, description = {}, model = "dominator2"},
  {name = "Dominator GTX", costs = 210000, description = {}, model = "dominator3"},
  {name = "Dukes", costs = 40000, description = {}, model = "dukes"},
  {name = "Ellie", costs = 190000, description = {}, model = "ellie"},
  {name = "Faction", costs = 30000, description = {}, model = "faction"},
  {name = "Faction Custom", costs = 85000, description = {}, model = "faction2"},
  {name = "Faction Custom Donk", costs = 90000, description = {}, model = "faction3"},
  {name = "Franken Strange", costs = 225000, description = {}, model = "btype2"},
  {name = "Gauntlet", costs = 32000, description = {}, model = "gauntlet"},
  {name = "Redwood Gauntlet", costs = 40000, description = {}, model = "gauntlet2"},
  {name = "Hermes", costs = 125000, description = {}, model = "hermes"},
  {name = "Hotknife", costs = 100000, description = {}, model = "hotknife"},
  {name = "Hustler", costs = 95000, description = {}, model = "hustler"},
  {name = "Manana", costs = 50000, description = {}, model = "manana"},
  {name = "Nightshade", costs = 185000, description = {}, model = "nightshade"},
  {name = "Phoenix", costs = 155000, description = {}, model = "phoenix"},
  {name = "Picador", costs = 9000, description = {}, model = "picador"},
  {name = "Rat-Loader", costs = 47500, description = {}, model = "ratloader"},
  {name = "Rat-Truck", costs = 57500, description = {}, model = "ratloader2"},
  {name = "Roosevelt", costs = 245000, description = {}, model = "btype"},
  {name = "Roosevelt Valor", costs = 275000, description = {}, model = "btype3"},
  {name = "Ruiner", costs = 115000, description = {}, model = "ruiner"},
  {name = "Sabre Turbo", costs = 15000, description = {}, model = "sabregt"},
  {name = "Sabre Turbo Custom", costs = 25000, description = {}, model = "sabregt2"},
  {name = "Slamvan", costs = 95000, description = {}, model = "slamvan"},
  {name = "Slamvan Custom", costs = 125000, description = {}, model = "slamvan3"},
  {name = "Slamvan (Lost)", costs = 120000, description = {}, model = "slamvan2"},
  {name = "Stallion", costs = 145000, description = {}, model = "stalion"},
  {name = "BurgerShot Stallion", costs = 310000, description = {}, model = "stalion2"},
  {name = "Tampa", costs = 60000, description = {}, model = "tampa"},
  {name = "Tornado", costs = 20000, description = {}, model = "tornado"},
  {name = "Tornado Convertible", costs = 25000, description = {}, model = "tornado2"},
  {name = "Tornado (Worn)", costs = 15000, description = {}, model = "tornado3"},
  {name = "Tornado (Mariachi)", costs = 10000, description = {}, model = "tornado4"},
  {name = "Tornado Custom", costs = 92000, description = {}, model = "tornado5"},
  {name = "Tulip", costs = 112000, description = {}, model = "tulip"},
  {name = "Vigero", costs = 21000, description = {}, model = "vigero"},
  {name = "Virgo", costs = 35000, description = {}, model = "virgo"},
  {name = "Virgo Classic", costs = 50000, description = {}, model = "virgo3"},
  {name = "Virgo Classic Custom", costs = 80000, description = {}, model = "virgo2"},
  {name = "Voodoo", costs = 65000, description = {}, model = "voodoo2"},
  {name = "Voodoo Custom", costs = 80000, description = {}, model = "voodoo"},

  {name = "Bison", costs = 30000, description = {}, model = "bison"},
  {name = "Bison Work Truck", costs = 35000, description = {}, model = "bison3"},
  {name = "Bobcat XL", costs = 23000, description = {}, model = "bobcatxl"},
  {name = "Contender", costs = 145000, description = {}, model = "contender"},
  {name = "Dubsta 6x6", costs = 200000, description = {}, model = "dubsta3"},
  --{name = "Duneloader", costs = 999999, description = {}, model = "dloader"},
  {name = "Guardian", costs = 145000, description = {}, model = "guardian"},
  {name = "Kamacho", costs = 175000, description = {}, model = "kamacho"},
  {name = "Rancher XL", costs = 15500, description = {}, model = "rancherxl"},
  {name = "Rebel", costs = 15000, description = {}, model = "rebel2"},
  {name = "Rusty Rebel", costs = 4500, description = {}, model = "rebel"},
  --{name = "Riata", costs = 999999, description = {}, model = "riata"},
  --{name = "Sadler", costs = 999999, description = {}, model = "sadler"},
  --{name = "Scrap Truck", costs = 999999, description = {}, model = "scrap"},
  {name = "Sandking XL", costs = 50000, description = {}, model = "sandking"},
  {name = "Sandking SWB", costs = 45000, description = {}, model = "sandking2"},
  --{name = "Yosemite", costs = 999999, description = {}, model = "yosemite"},
  
  --{name = "WASTELANDER", costs = 95000, description = {}, model = "WASTELANDER"},
  {name = "Bifta", costs = 45000, description = {}, model = "bifta"},
  {name = "Blazer", costs = 20000, description = {}, model = "blazer"},
  {name = "Blazer Street", costs = 22000, description = {}, model = "blazer4"},
  --{name = "Blazer Hot Rod", costs = 999999, description = {}, model = "blazer3"},	-- 22000
  {name = "Bodhi", costs = 14500, description = {}, model = "bodhi2"},
  {name = "Brawler", costs = 200000, description = {}, model = "brawler"},
  {name = "Bunker Caddy", costs = 6500, description = {}, model = "caddy3"},
  {name = "Caddy", costs = 2250, description = {}, model = "caddy"},
  {name = "Caddy II", costs = 2250, description = {}, model = "caddy2"},
  {name = "Comet Safari", costs = 195000, description = {}, model = "comet4"},
  {name = "Desert Raid", costs = 550000, description = {}, model = "trophytruck2"},	-- 550000
  {name = "Dune Buggy", costs = 20000, description = {}, model = "dune"},
  {name = "Dune Truck", costs = 2050000, description = {}, model = "rallytruck"},
  --{name = "Fieldmaster", costs = 999999, description = {}, model = "tractor2"},	-- 5000
  {name = "Injection", costs = 45000, description = {}, model = "bfinjection"},
  {name = "Kalahari", costs = 95000, description = {}, model = "kalahari"},
  {name = "Lawn Mower", costs = 3500, description = {}, model = "mower"},
  {name = "Liberator", costs = 7900000, description = {}, model = "monster"},
  {name = "Marshall", costs = 7900000, description = {}, model = "marshall"},
  {name = "Merryweather Mesa", costs = 225000, description = {}, model = "mesa3"},
  {name = "Space Docker", costs = 1450000, description = {}, model = "dune2"},
  {name = "Trophy Truck", costs = 550000, description = {}, model = "trophytruck"},

  {name = "Baller", costs = 30000, description = {}, model = "baller"},
  {name = "Baller 2nd Gen", costs = 55000, description = {}, model = "baller2"},
  {name = "Baller LE", costs = 125000, description = {}, model = "baller3"},
  {name = "Baller LE LWB", costs = 145000, description = {}, model = "baller4"},
  {name = "BeeJay XL", costs = 25000, description = {}, model = "bjxl"},
  {name = "Cavalcade", costs = 35000, description = {}, model = "cavalcade"},
  {name = "Cavalcade 2nd Gen", costs = 65000, description = {}, model = "cavalcade2"},	-- 45000
  {name = "Dubsta", costs = 85000, description = {}, model = "dubsta"},
  --{name = "Dubsta II", costs = 999999, description = {}, model = "dubsta2"},	-- 85000
  --{name = "FQ 2", costs = 999999, description = {}, model = "fq2"},
  {name = "Granger", costs = 30000, description = {}, model = "granger"},
  --{name = "Gresley", costs = 999999, description = {}, model = "gresley"},
  --{name = "Habanero", costs = 999999, description = {}, model = "habanero"},
  {name = "Huntley S", costs = 80000, description = {}, model = "huntley"},
  {name = "Landstalker", costs = 58000, description = {}, model = "landstalker"},
  --{name = "Mesa", costs = 999999, description = {}, model = "mesa"},
  {name = "Patriot", costs = 105000, description = {}, model = "patriot"},
  {name = "Radius", costs = 32000, description = {}, model = "radi"},
  {name = "Rocoto", costs = 65000, description = {}, model = "rocoto"},
  {name = "Seminole", costs = 25000, description = {}, model = "seminole"},
  {name = "Toros", costs = 165000, description = {}, model = "toros"},
  --{name = "Serrano", costs = 999999, description = {}, model = "serrano"},
  --{name = "Streiter", costs = 999999, description = {}, model = "streiter"},
  {name = "XLS", costs = 55000, description = {}, model = "xls"},

  {name = "Boxville", costs = 25000, description = {}, model = "boxville"},
  {name = "Burrito", costs = 55000, description = {}, model = "burrito3"},
  {name = "Burrito (Lost)", costs = 65000, description = {}, model = "gburrito"},
  {name = "Gang Burrito", costs = 65000, description = {}, model = "gburrito2"},
  --{name = "Camper", costs = 999999, description = {}, model = "camper"},
  {name = "Clown Van", costs = 45000, description = {}, model = "speedo2"},
  {name = "Journey", costs = 25000, description = {}, model = "journey"},
  {name = "Minivan", costs = 10000, description = {}, model = "minivan"},
  {name = "Minivan Custom", costs = 65000, description = {}, model = "minivan2"},
  {name = "Moonbeam", costs = 85000, description = {}, model = "moonbeam"},
  {name = "Moonbeam Custom", costs = 95000, description = {}, model = "moonbeam2"},
  {name = "Paradise", costs = 35000, description = {}, model = "paradise"},
  {name = "Pony (SOTW)", costs = 45000, description = {}, model = "pony2"},
  {name = "Rumpo", costs = 13000, description = {}, model = "rumpo"},
  {name = "Rumpo II", costs = 13500, description = {}, model = "rumpo2"},
  {name = "Rumpo Custom", costs = 125000, description = {}, model = "rumpo3"},
  --{name = "Speedo", costs = 999999, description = {}, model = "speedo"},
  {name = "Surfer", costs = 5000, description = {}, model = "surfer"},
  {name = "Rusty Surfer", costs = 5000, description = {}, model = "surfer2"},	-- 5000
  {name = "Taco Truck", costs = 14500, description = {}, model = "taco"},
  {name = "Youga", costs = 16000, description = {}, model = "youga"},
  {name = "Youga Classic", costs = 8000, description = {}, model = "youga2"},

  {name = "Asea", costs = 10000, description = {}, model = "asea"},
  {name = "Asterope", costs = 15000, description = {}, model = "asterope"},
  {name = "Cognoscenti 55", costs = 85000, description = {}, model = "cog55"},
  {name = "Emperor", costs = 30000, description = {}, model = "emperor"},
  {name = "Rusty Emperor", costs = 27000, description = {}, model = "emperor2"}, -- 15000
  {name = "Fugitive", costs = 24000, description = {}, model = "fugitive"},
  {name = "Glendale", costs = 20000, description = {}, model = "glendale"},
  {name = "Ingot", costs = 9000, description = {}, model = "ingot"},
  {name = "Intruder", costs = 16000, description = {}, model = "intruder"},
  {name = "Lurcher", costs = 130000, description = {}, model = "lurcher"},	-- 110000
  {name = "Premier", costs = 10000, description = {}, model = "premier"},
  {name = "Primo", costs = 10100, description = {}, model = "primo"},
  {name = "Primo Custom", costs = 19500, description = {}, model = "primo2"},
  {name = "Regina", costs = 8000, description = {}, model = "regina"},
  {name = "Romero Hearse", costs = 125000, description = {}, model = "romero"},
  {name = "Schafter", costs = 65000, description = {}, model = "schafter2"},
  {name = "Stanier", costs = 10000, description = {}, model = "stanier"},
  {name = "Stratum", costs = 10000, description = {}, model = "stratum"},
  {name = "Stretch", costs = 30000, description = {}, model = "stretch"},
  {name = "Super Diamond", costs = 90000, description = {}, model = "superd"},
  {name = "Surge", costs = 38000, description = {}, model = "surge"},
  {name = "Tailgater", costs = 60000, description = {}, model = "tailgater"},
  {name = "Warrener", costs = 22000, description = {}, model = "warrener"},
  {name = "Washington", costs = 25000, description = {}, model = "washington"},

  {name = "Akuma", costs = 43000, description = {}, model = "akuma"},
  {name = "Bati 801", costs = 102000, description = {}, model = "bati"},
  {name = "Bati 801RR", costs = 125000, description = {}, model = "bati2"},
  {name = "Carbon RS", costs = 32000, description = {}, model = "carbonrs"},
  {name = "Defiler", costs = 65000, description = {}, model = "defiler"},
  {name = "Diablous", costs = 95000, description = {}, model = "diablous"},
  {name = "Diablous Custom", costs = 115000, description = {}, model = "diablous2"},
	{name = "Double T", costs = 63000, description = {}, model = "double"},
  {name = "Esskey", costs = 78500, description = {}, model = "esskey"},
  {name = "FCR 1000", costs = 87200, description = {}, model = "fcr"},
  {name = "FCR 1000 Custom", costs = 99500, description = {}, model = "fcr2"},
  {name = "Hakuchou", costs = 175000, description = {}, model = "hakuchou"},
  {name = "Hakuchou Drag", costs = 650000, description = {}, model = "hakuchou2"},
  {name = "Lectro", costs = 70000, description = {}, model = "lectro"},
  {name = "Nemesis", costs = 51000, description = {}, model = "nemesis"},
  {name = "PCJ 600", costs = 47000, description = {}, model = "pcj"},
  {name = "Ruffian", costs = 50000, description = {}, model = "ruffian"},
  {name = "Shotaro", costs = 1200000, description = {}, model = "shotaro"},
  {name = "Thrust", costs = 60000, description = {}, model = "thrust"},
  {name = "Vader", costs = 29000, description = {}, model = "vader"},
  {name = "Vindicator", costs = 210000, description = {}, model = "vindicator"},
  {name = "Vortex", costs = 92000, description = {}, model = "vortex"},

  {name = "Avarus", costs = 88000, description = {}, model = "avarus"},
  {name = "Bagger", costs = 55000, description = {}, model = "bagger"},
  {name = "Chimera", costs = 100000, description = {}, model = "chimera"},
  {name = "Daemon", costs = 56000, description = {}, model = "daemon"},
  {name = "Daemon Custom", costs = 65000, description = {}, model = "daemon2"},
  {name = "Gargoyle", costs = 120000, description = {}, model = "gargoyle"},
  {name = "Hexer", costs = 43000, description = {}, model = "hexer"},
  {name = "Innovation", costs = 100000, description = {}, model = "innovation"},
  {name = "Nightblade", costs = 95200, description = {}, model = "nightblade"},
  {name = "Rat Bike", costs = 15000, description = {}, model = "ratbike"},
  {name = "Sanctus", costs = 280000, description = {}, model = "sanctus"},
  {name = "Sovereign", costs = 60000, description = {}, model = "sovereign"},
  {name = "Wolfsbane", costs = 75000, description = {}, model = "wolfsbane"},
  {name = "Zombie Bobber", costs = 103000, description = {}, model = "zombiea"},
  {name = "Zombie Chopper", costs = 110000, description = {}, model = "zombieb"},

  {name = "BF400", costs = 35000, description = {}, model = "bf400"},
  {name = "Cliffhanger", costs = 90000, description = {}, model = "cliffhanger"},
  {name = "Enduro", costs = 75000, description = {}, model = "enduro"},
  {name = "Faggio", costs = 4000, description = {}, model = "faggio2"},
  {name = "Faggio Sport", costs = 5000, description = {}, model = "faggio"},
  {name = "Faggio Mod", costs = 6500, description = {}, model = "faggio3"},
  {name = "Manchez", costs = 40000, description = {}, model = "manchez"},
  {name = "Sanchez", costs = 20000, description = {}, model = "sanchez2"},
  {name = "Sanchez Livery", costs = 22000, description = {}, model = "sanchez"},

  {name = "BMX", costs = 800, description = {}, model = "bmx"},
  {name = "Cruiser", costs = 950, description = {}, model = "cruiser"},
  {name = "Fixter", costs = 150, description = {}, model = "fixter"},
  {name = "Scorcher", costs = 1000, description = {}, model = "scorcher"},
  {name = "Whippet Race Bike", costs = 1750, description = {}, model = "tribike"},
}


local vehicleList = { "Rusty Surfer", "Faggio", "Rusty Rebel", "Surfer", "Faggio Sport", "Faggio Mod", "Regina", "Youga Classic", "Ingot", "Picador", "Primo Custom", "Blista", "Asea", "Dilettante", "Futo", "Minivan", "Premier", "Stanier", "Stratum", "Primo", "Monkey Blista", "Rhapsody", "Rumpo", "Rumpo II", "Bodhi", "Taco Van", "Asterope", "Issi", "Panto", "Prairie", "Ratbike", "Rebel", "Sabre Turbo", "Rancher XL", "Intruder", "Youga", "Brioso R/A", "Blazer", "Blazer Sport", "Dune Buggy", "Glendale", "Sanchez", "Tornado", "Vigero", "Warrener", "Bobcat XL", "Fugitive", "Beejay XL", "Blista Compact", "Boxville", "Journey", "Penumbra", "Sabre GT", "Seminole", "Washington", "Issi Classic", "Buccaneer", "Vader", "Baller", "Bison", "Emperor", "Faction", "Granger", "Stretch", "Carbon RS", "Gaunlet", "Radius", "Buffalo", "Burrito", "Cavalcade", "Paradise", "Virgo", "Surge", "Dukes", "Fuslade", "Pigalle", "Akuma", "Hexer", "Bifta", "Clown Van", "Dominator", "Injection", "PCJ-600", "Buffalo S", "Manana", "Ruffian", "Sandking", "Nemesis", "Bagger", "Baller 2nd Gen", "XLS", "Daemon", "Rat Truck", "Landstalker", "Sovereign", "Tailgator", "Tampa", "Zion", "Double T", "Cheburek", "Custom Minivan", "Daemon DLC", "Gang Burrito", "Oracle", "Peyote", "Rocoto", "Schafter", "Zion Cabrio", "Lectro", "Oracle XS", "Custom Voodoo", "Enduro", "Sentinel", "Wolfsbane", "Esskey", "Custom Virgo", "Huntley S", "Sentinel XS", "Custom Faction", "Dubsta", "Jackal", "Mesa", "FCR1000", "Avarus", "Chino", "Cliffhanger", "Custom Moonbeam", "Super Diamond", "Tornado Custom", "Vortex", "Casco", "Chino Custom", "Diablous", "Exemplar", "Felon", "Hustler", "Kalahari", "Slamvan", "Sultan", "Nightblade", "FCR1000 Custom", "Alpha", "Blade", "Chimera", "Felon GT", "Furore GT", "Hotknife", "Innovation", "Windsor", "Bati 801", "Zombie Bobber", "Patriot", "Windsor Drop", "Tornado Hot Rod", "Cognoscenti Cabrio", "Zombie Chopper", "Tulip", "Diablous Custom", "Elegy", "F620", "Sentinel Classic", "Suiner", "Feltzer", "Gargoyle", "Surano", "Baller LE", "Bati 801RR", "Coquette Classic", "Hermes", "Lynx", "Romeo Hearse", "Rumpo3", "Schafter V12", "Slamvan Custom", "Banshee", "Coquette", "Rapid GT", "9F", "Comet", "Rapid GT Convertible", "9F Cabrio", "Baller LWB", "Comet Retro Custom", "Contender", "Guardian", "Spacedocker", "Raiden", "Schwartzer", "Bestia GTS", "Elegy Retro Custom", "Voltic", "Phoenix", "Carbonizzare", "Sprunk Buffalo", "Bullet", "Massacro", "Hakuchou", "Kamacho", "Raptor", "Verkierer", "Jester Classic", "Sultan RS", "Massacro (Racecar)", "Nightshade", "Specter V2", "Ellie", "Stinger", "Comet Safari", "Flash GT", "Karuma", "Itali GT", "ETRI", "Brawler", "Bubsta 6x6", "JB 700", "Omnis", "Stirling GT", "Stinger GT", "Toros", "Tropos", "Vapid Dominator GTX", "Vindicator", "Coquette BlackFin", "Tyrus", "Franken Strange", "Merryweather Mesa", "Infernus", "Roosevelt Valor", "Penetrator", "Drift Tampa", "Roosevelt Valor Custom", "Cheetah", "Sanctus", "Banshee 900R", "Z-Type", "Burgershot Stalion", "Cheetah Classic", "Rapid GT Classic", "Deluxo", "Manroe", "Entity XF", "Trophy Truck", "Hakuchou Drag", "Turismo R", "Zentorno", "Shotaro", "Pfister811", "Reaper", "FMJ", "XA 21", "Osiris", "Ruston", "Dune Truck", "T20", "Jester", "Vagner", "X80 Proto", "Jester (Racecar)", "Adder", "RE-7B", "Mamba", "American Dream", "American Dream V2", "Nero Custom" }
local playerPed = GetPlayerPed(-1)
local hl = "amb@world_human_hammering@male@base" -- hammering with base
local wl = "amb@world_human_welding@male@base" -- welding with base
local el = "missminuteman_1ig_2" -- electrocute with tasered_2
local kl = "amb@medic@standing@tendtodead@idle_a" -- kneeling with idle_a
local hl_a = "base"
local wl_a = "base"
local el_a = "tasered_2"
local kl_a = "idle_a"
local knife = "WEAPON_KNIFE"
local wrench = "WEAPON_WRENCH"
local bottle = "WEAPON_BOTTLE"
local knuckle = "WEAPON_KNUCKLE"
local hammer = "WEAPON_HAMMER"
local welding_prop = "WORLD_HUMAN_WELDING"
local hammer_prop = "WORLD_HUMAN_HAMMERING"
local active = 0
local chance = 0
local vehicleChance = 0
local currentHealth = 0
local platenum = 0
local vehicleName = ""
local ep_loc = { { x = 1629.76, y = 2563.87, z = 45.56 } }
local lp_loc = { { x = 1628.30, y = 2651.11, z = 45.82 } }
local h_loc = { { x = 1591.72, y = 2559.50, z = 55.19 } }

local info = AddBlipForCoord(1629.76, 2563.87, 45.56)
SetBlipSprite(info, 446)
SetBlipDisplay(info, 2)
SetBlipScale(info, 1.0)
SetBlipColour(info, 1)
SetBlipAsShortRange(info, true)
BeginTextCommandSetBlipName("STRING")
AddTextComponentString("Electrical Repair")
EndTextCommandSetBlipName(info)

local info2 = AddBlipForCoord(1628.30, 2651.11, 45.82)
SetBlipSprite(info2, 446)
SetBlipDisplay(info2, 2)
SetBlipScale(info2, 1.0)
SetBlipColour(info2, 49)
SetBlipAsShortRange(info2, true)
BeginTextCommandSetBlipName("STRING")
AddTextComponentString("License Plate")
EndTextCommandSetBlipName(info2)

function drawText(text)
  SetTextFont(0)
  SetTextProportional(1)
  SetTextScale(0.0, 0.6)
  SetTextColour(255, 255, 255, 255)
  SetTextDropshadow(0, 0, 0, 0, 255)
  SetTextEdge(0, 0, 0, 0, 255)
  SetTextDropShadow()
  SetTextOutline()
  SetTextEntry("STRING")
  AddTextComponentString(text)
  DrawText(0.35, 0.85) --position
end

--REQUEST ANIMATION LIBRARIES
RequestAnimDict(hl) --hammer lib
RequestAnimDict(wl) --welding lib
RequestAnimDict(el) --electrocute lib
RequestAnimDict(kl) --kneel lib
while not HasAnimDictLoaded(hl, wl, el, kl) do --if library does not exist
  Citizen.Wait(100)
end
while true do --if library exists
  Citizen.Wait(0)


  --[[MAINTENANCE JOB]]
  for k, v in pairs(ep_loc) do
    local x, y, z = table.unpack(GetEntityCoords(playerPed, true)) --set ped x,y,z coords
    if (GetDistanceBetweenCoords(x, y, z, v.x, v.y, v.z, false) < 200.0) then
      DrawMarker(1, v.x, v.y, v.z - 2.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.5, 1.5, 2.0 + 0.5, 66, 176, 244, 500, false, false, 2, false, false, false, false)
    end
    distance = GetDistanceBetweenCoords(x, y, z, v.x, v.y, v.z, true)
    distance = math.ceil(distance)
    if distance <= 1 then
      --[[SetTextFont(0)
      SetTextProportional(1)
      SetTextScale(0.0, 0.6)
      SetTextColour(255, 255, 255, 255)
      SetTextDropshadow(0, 0, 0, 0, 255)
      SetTextEdge(0, 0, 0, 0, 255)
      SetTextDropShadow()
      SetTextOutline()
      SetTextEntry("STRING")
      AddTextComponentString("Press ~y~E~s~ to repair electric panel")
      DrawText(0.35, 0.85)]]
      drawText("This displays text from the function")
      if IsControlJustPressed(1, Keys["E"]) then
        TaskPlayAnim(playerPed, wl, wl_a, 8.0, 8.0, 5000, 1, 1, true, true, true)
        TaskStartScenarioInPlace(playerPed, welding_prop, 0, false)
        chance = math.floor(math.random(1, 3))
        if chance <= 2 then
          Citizen.Wait(5000)
          exports.pNotify:SendNotification({text = "Electric panel has been repaired.", type = "info", timeout = 5000, layout = "centerRight"})
          Citizen.Wait(1500)
          TriggerServerEvent("prisonworkjob")
          ClearPedTasks(playerPed)
          Citizen.Wait(3500)
        elseif chance == 3 then
          TaskPlayAnim(playerPed, el, el_a, 8.0, 8.0, 5000, 1, 1, true, true, true)
          Citizen.Wait(7500)
          currentHealth = GetEntityHealth(playerPed)
          SetEntityHealth(playerPed, currentHealth - 20)
          exports.pNotify:SendNotification({text = "You've been shocked, rest for a few seconds..", type = "info", timeout = 3500, layout = "centerRight"})
          ClearPedTasks(playerPed)
          Citizen.Wait(3500)
        end --end if chance
      end --end Key Press
    end -- end distance check
  end -- for loop



  --[[LICENSE PLATE JOB]]
  for k, v in pairs(lp_loc) do
    local x, y, z = table.unpack(GetEntityCoords(playerPed, true)) --set ped x,y,z coords
    if (GetDistanceBetweenCoords(x, y, z, v.x, v.y, v.z, false) < 200.0) then
      DrawMarker(1, v.x, v.y, v.z - 2.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.5, 1.5, 2.0 + 0.5, 66, 176, 244, 500, false, false, 2, false, false, false, false)
    end
    distance = GetDistanceBetweenCoords(x, y, z, v.x, v.y, v.z, true)
    distance = math.ceil(distance)
    if distance <= 1 then
      SetTextFont(0)
      SetTextProportional(1)
      SetTextScale(0.0, 0.6)
      SetTextColour(255, 255, 255, 255)
      SetTextDropshadow(0, 0, 0, 0, 255)
      SetTextEdge(0, 0, 0, 0, 255)
      SetTextDropShadow()
      SetTextOutline()
      SetTextEntry("STRING")
      AddTextComponentString("Press ~y~E~s~ to make license plate")
      DrawText(0.35, 0.85)
      if IsControlPressed(1, Keys["E"]) then
        TaskPlayAnim(playerPed, hl, hl_a, 8.0, 8.0, 5000, 1, 1, true, true, true)
        TaskStartScenarioInPlace(playerPed, hammer_prop, 0, false)
        chance = math.floor(math.random(1, 3))
        vehicleChance = math.floor(math.random(1, 264))
        vehicleName = vehicleList[vehicleChance]
        if chance <= 2 then
          Citizen.Wait(5000)
          exports.pNotify:SendNotification({text = "License Plate created for a <font color='#FFFF00'>" .. vehicleName .. "</font>.", type = "info", timeout = 5000, layout = "centerRight"})
          Citizen.Wait(1500)
          TriggerServerEvent("prisonworkjob")
          ClearPedTasks(playerPed)
          Citizen.Wait(3500)
        elseif chance == 3 then
          Citizen.Wait(5000)
          exports.pNotify:SendNotification({text = "Machine press is broken, wait <font color='#FF2F2F'>10</font> seconds for rebooting sequence..", type = "info", timeout = 9000, layout = "centerRight"})
          ClearPedTasks(playerPed)
          Citizen.Wait(10000)
          exports.pNotify:SendNotification({text = "Machine press has been repaired, sorta.", type = "info", timeout = 5000, layout = "centerRight"})
        end --end if chance
        ClearPedTasks(playerPed)
      end --end Key Press
    end -- end distance check
  end -- for loop



  --[[HIDDEN WEAPON]]
    for k, v in pairs(h_loc) do
      local x, y, z = table.unpack(GetEntityCoords(playerPed, true)) --set ped x,y,z coords
      if (GetDistanceBetweenCoords(x, y, z, v.x, v.y, v.z, false) < 200.0) then
        DrawMarker(1, v.x, v.y, v.z - 2.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.5, 1.5, 2.0 + 0.5, 244, 66, 66, 500, false, false, 2, false, false, false, false)
      end
      distance = GetDistanceBetweenCoords(x, y, z, v.x, v.y, v.z, true)
      distance = math.ceil(distance)
      if distance <= 1 then
        SetTextFont(0)
        SetTextProportional(1)
        SetTextScale(0.0, 0.6)
        SetTextColour(255, 255, 255, 255)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(0, 0, 0, 0, 255)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        AddTextComponentString("Press ~y~E~s~ to search AC Unit")
        DrawText(0.35, 0.85)
        if (IsControlPressed(1, Keys["E"]) and active < 1) then
          TaskPlayAnim(playerPed, kl, kl_a, 8.0, 8.0, - 1, 50, 0, true, true, true)
          Wait(3500)
          ClearPedTasks(playerPed)
          chance = math.floor(math.random(1, 50))
          if (chance <= 5 ) then
            exports.pNotify:SendNotification({text = "Just some old chewing gum wrappers and dead rodents..", type = "info", timeout = 8000, layout = "centerRight"})
            ClearPedTasks(playerPed)
          elseif (chance > 5 and chance <= 10) then
            GiveWeaponToPed(playerPed, knife, 20, false, false)
            exports.pNotify:SendNotification({text = "You found a hidden knife..", type = "info", timeout = 8000, layout = "centerRight"})
            ClearPedTasks(playerPed)
            active = 1
          elseif (chance > 10 and chance <= 20) then
            GiveWeaponToPed(playerPed, bottle, 20, false, false)
            exports.pNotify:SendNotification({text = "You found a hidden bottle..", type = "info", timeout = 8000, layout = "centerRight"})
            ClearPedTasks(playerPed)
            active = 1
          elseif (chance > 20 and chance <= 30) then
            GiveWeaponToPed(playerPed, knuckle, 20, false, false)
            exports.pNotify:SendNotification({text = "You found hidden brass knuckles..", type = "info", timeout = 8000, layout = "centerRight"})
            ClearPedTasks(playerPed)
            active = 1
          elseif (chance > 30 and chance <= 40) then
            GiveWeaponToPed(playerPed, hammer, 20, false, false)
            exports.pNotify:SendNotification({text = "You found a hidden hammer..", type = "info", timeout = 8000, layout = "centerRight"})
            ClearPedTasks(playerPed)
            active = 1
          elseif chance > 40 then
            GiveWeaponToPed(playerPed, wrench, 20, false, false)
            exports.pNotify:SendNotification({text = "You found a hidden wrench..", type = "info", timeout = 8000, layout = "centerRight"})
            ClearPedTasks(playerPed)
            active = 1
          end --end if
        end --end Key Press
        if (IsControlPressed(1, Keys["E"]) and active > 0) then
          TaskPlayAnim(playerPed, kl, kl_a, 8.0, 8.0, - 1, 50, 0, true, true, true)
          Citizen.Wait(3500)
          exports.pNotify:SendNotification({text = "Just some old chewing gum wrappers and dead rodents..", type = "info", timeout = 8000, layout = "centerRight"})
          ClearPedTasks(playerPed)
        end --end if
      end -- end distance check
    end -- for loop




    --[[CHECK IF VEHICLE HAS TRUNK
    local lastveh = GetVehiclePedIsIn(playerPed, false) --gets vehicle player is currently in
    local trunkbone = GetEntityBoneIndexByName(lastveh, "boot") --checks if boot is found in bone index
    if IsControlPressed(1, Keys["C"]) then --press C to check for boot/trunk
      if (trunkbone == -1) then
        exports.pNotify:SendNotification({text = "This vehicles does not have a trunk", type = "info", timeout = 8000, layout = "centerRight"})
      else 
        exports.pNotify:SendNotification({text = "This vehicles does have a trunk", type = "info", timeout = 8000, layout = "centerRight"})
      end
    end]]
    
    if IsControlJustPressed(1, Keys["C"]) and IsControlPressed(1, Keys["LEFTSHIFT"]) then
      for _,v in pairs(vehprices) do
        local hasTrunk = false
        local veh = CreateVehicle(v.model, 0.0, 0.0, 0.0, 0.0 ,true, false) --model hash(string), x(float), y(float), z(float), heading(float), isNetwork (bool), thisScriptCheck (bool)

        if (GetEntityBoneIndexByName(veh, "boot") ~= nil) then
          hasTrunk = true
        end
        
        SetEntityAsMissionEntity(veh, true, true)
        Wait(500)
        DeleteVehicle(veh) 
        file = io.open("trunks.txt", "w")
        file:write("{name = " .. v.name .. ", costs = " .. v.costs .. ", description = {}, model = " .. v.model .. ", hasTrunk = " .. hasTrunk .. "},") 
        file:close()
        print(str = string.format("Name: %s, trunk: %s", v.name, hasTrunk))
        Wait(1000)
      end
    end

end -- end Citizen.CreateThread while loop
end) --end Citizen.CreateThread