local camera = require('engine/render/camera')
local background = require('engine/render/background')

local render = {}

-- initialization of graphics renderer
function render:init()

end

-- loading of entire graphical assets map
function render:load()

end

-- dev func
function render:grid()
  local cell_val = 30
  for i = 0, 100, 1 do
    love.graphics.line(0, i * cell_val, cell_val * 100 , i * cell_val)
    love.graphics.line(i * cell_val, 0,  i * cell_val, cell_val * 100)
  end
end

-- main render entrance function
-- data is a game state data
function render:all(data)
  -- set scale
  love.graphics.scale(camera.zoom)
  -- set camera translate
  love.graphics.translate(-camera.x, -camera.y)
  -- render everything
  render:grid()
end

return render