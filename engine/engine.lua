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
    -- control:init()
end

-- load resources
function engine:load()
  self.loading = true
  function love.load()

  end
end

-- independent engine update cycle
-- func is game logic callback
-- should return data to render
function engine:update(func)
  function love.update(dt)
    local data

    if self.loading then
      function love.draw()
        love.graphics.print('loading', 400, 300)
      end
      return
    end

    data = func()
    function love.draw()
      love.graphics.print(data..' '..dt, 400, 300)
    end
  end
end

function engine:quit()
  love.event.quit()
end

return engine