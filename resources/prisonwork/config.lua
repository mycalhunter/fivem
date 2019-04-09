Config = {}
Config.DrawDistance = 1000.0

Config.PublicZones = {
  EnterBuilding = {
    Pos   = { x = 1394.8719482422, y = 1141.9404296875, z = 114.62250518799 },
    Size  = {x = 1.5, y = 1.5, z = 1.0},
    Color = {r = 0, g = 0, b = 0},
    Marker= 0,
    Blip  = false,
    Name  = "Name",
    Type  = "teleport",
    Hint  = "Press ~INPUT_PICKUP~ to go out.",
    Teleport = { x = 1397.0953369141, y = 1141.6251220703, z = 114.33366394043 }
  },

  ExitBuilding = {
    Pos   = { x = 1397.0953369141, y = 1141.6251220703, z = 114.33366394043 }, -- marker entrada
    Size  = {x = 1.5, y = 1.5, z = 1.0},
    Color = {r = 0, g = 0, b = 0},
    Marker= 0,
    Blip  = false,
    Name  = "Name",
    Type  = "teleport",
    Hint  = "Press ~INPUT_PICKUP~ to go out.",
    Teleport = { x = 1394.8719482422, y = 1141.9404296875, z = 114.62250518799 }, -- onde spawna depois de entrar
  },
}