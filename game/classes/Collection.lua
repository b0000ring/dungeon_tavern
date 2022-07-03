local Collection = {}

function Collection:new()
  local newObj = {}

  self.__index = self
  return setmetatable(newObj, self)
end

return Collection