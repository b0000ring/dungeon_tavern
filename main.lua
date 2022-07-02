local game = require('game/game')
local engine = require('engine/engine')

-- initial starting game point
function start()
  engine:init()
  engine:update(update)
  load()
end

-- resource loading step
function load()
  engine:load()
end


-- continious game cycle
function update()
  
end

-- call before quit game
function quit()
  engine:quit()
end

function sleep(n)
  local t0 = clock()
  while clock() - t0 <= n do end
end

start()
