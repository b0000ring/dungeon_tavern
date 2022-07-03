local map = require('game/map')
local collection = require('game/classes/Collection')

local state = {
  -- global game state data
  map = map
  -- collection of pickable objects 
  items = Collection:new()
  -- collection of static objects (like torches, bushes, decorations)
  static = Collection:new()
  -- collection of triggers (move points, effect zones etc.)
  triggers = Collection:new()
}

return state