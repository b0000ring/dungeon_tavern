local camera = require('engine/render/camera')

local render = {}

-- initialization of graphics renderer
function render:init()

end

function render:grid()
  local cell_val = 50
  for i = 0, 99, 1 do
    love.graphics.line(0, i * cell_val, cell_val * 100 , i * cell_val)
    love.graphics.line(i * cell_val, 0,  i * cell_val, cell_val * 100)
  end
end

-- main render entrance function
-- data is a game state data
function render:all(data)
  love.graphics.scale(camera.zoom)
  love.graphics.translate(-camera.x, -camera.y)
  render:grid()
end

return render