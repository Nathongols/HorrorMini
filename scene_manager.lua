
local function newSceneManager()
    
end

return setmetatable({ new = newSceneManager}, { __call = function(_, ...) return newSceneManager(...) end })
