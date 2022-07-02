local mouse = {
  primary_down = false,
  is_drag = false,
  x = nil,
  y = nil
}

function mouse:drag()
  print('drag')
  local x = love.mouse.getX()
  local y = love.mouse.getY()
  local dirx = self.x - x
  local diry = self.y - y
  mediator:call('control.mouse.drag', {x = dirx, y = diry})
end

function mouse:click()
  print('click')
end

function mouse:check()
  local is_primary_down = love.mouse.isDown(1)
  local x = love.mouse.getX()
  local y = love.mouse.getY()
  if not self.x then
    self.x = x
  end
  if not self.y then 
    self.y = y
  end
  if is_primary_down and self.primary_down then
    if x ~= self.x or y ~= self.y then
      -- drag
      mouse:drag()
    end
  end
  if not is_primary_down and self.primary_down then
    -- click
    mouse:click()
    self.primary_down = false
    self.is_drag = false
    self.x = nil
    self.y = nil
  end
  if is_primary_down and not self.primary_down then
    -- mouse down
    print('mouse down')
    self.primary_down = true
  end
  self.x = x
  self.y = y
end

return mouse