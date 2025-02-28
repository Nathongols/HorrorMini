local level1 = require('playableLevel1')

local function newStage()
    print("ran?")
    local selection = love.math.random(1,1)

    if selection == 1 then
        level1.generateLvl1()
    end

end

local function updateMenu()

end


return setmetatable({ new = newStage}, { __call = function(_, ...) return newStage(...) end })
