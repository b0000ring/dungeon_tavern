local Sprite = {}

function Sprite:new()
  local newObj = {}

  self.__index = self
  return setmetatable(newObj, self)
end

return Sprite