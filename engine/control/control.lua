local mouse = require('engine/control/mouse')

local control = {}

function control:init()

end

-- getting all input here
function control:update()
  mouse:check()
end

return control