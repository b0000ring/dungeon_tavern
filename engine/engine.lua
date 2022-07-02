local sound = require('engine/sound/sound')
local control = require('engine/control/control')
local render = require('engine/render/render')

local engine = {
  loading = false,
}

-- init base settings and engine parts
function engine:init()
  local settings = {
    resizable = false,
    centered = true,
  }
  love.window.updateMode( 1024, 768, settings )
  love.window.setTitle( 'Dungeon tavern' )

  render:init()
    -- sound:init()
    control:init()
end

-- load resources
function engine:load()
  self.loading = true
  function love.load()
    self.loading = false
  end
end

-- independent engine update cycle
-- func is game logic callback
-- should return data to render
function engine:update(func)
  function love.update(dt)
    local data

    -- checking is initia loading
    if self.loading then
      function love.draw()
        love.graphics.print('loading', 400, 300)
      end
      return
    end
    -- getting data from game logic func
    data = func()
    -- draw the data
    function love.draw()
      render:all(data)
    end
    -- getting input
    control:update()
  end
end

function engine:quit()
  love.event.quit()
end

return engine