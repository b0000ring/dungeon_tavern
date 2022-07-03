local MAX_ZOOM = 5
local MIN_ZOOM = 1

local camera = {
  x = 0,
  y = 0,
  zoom = 1
}

function camera:move(dir) 
  print('action')
  local dirx = dir.x
  local diry = dir.y
  print(dirx..' '..diry)
  -- check if possible to move camera here
  self.x = self.x + dirx
  self.y = self.y + diry
end

function camera:set_zoom(direction)
  local new_value = self.zoom - direction
  if new_value >= MIN_ZOOM and new_value <= MAX_ZOOM then
    self.zoom = new_value
  end
end

mediator:subscribe('control.mouse.drag', 'camera', function(d) camera:move(d) end)
mediator:subscribe('control.mouse.wheelmoved', 'camera', function(direction) camera:set_zoom(direction) end)

return camera