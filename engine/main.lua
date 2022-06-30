local audio = require('engine/sound/main')
local control = require('engine/control/main')
local render = require('engine/render/main')

local engine = {
  screen = nil
}

function engine:init()
  local settings = {
    resizable = false,
    centered = true,
  }
  love.window.updateMode( 1024, 768, settings )
  love.window.setTitle( 'Dungeon tavern' )
end

function engine:load()
  function love.load()
    render:init()
    audio:init()
    control:init()
  end
end

function engine:update(data)
  function love.update(dt)
    
  end
end

function engine:setInputCallback()
  control:init()
end

function engine:quit()
  love.event.quit()
end

function engine:setScreen(screen)
  self.screen = screen
end

return engine