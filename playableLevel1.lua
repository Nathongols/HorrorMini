local Luigi = require('luigi')


local function newLevel()

end

local function level1()
    local difficulty = 6
    local rng = math.ceil(love.math.random(difficulty * 0.10, difficulty * 0.50))

    for i = 0, difficulty do
        value = love.math.random(0, 2)
        if i == rng then
            Luigi({ x = 320, y = 180, sprite = love.graphics.newImage('resources/luigi.png'), isLuigi = true })
        elseif value == 0 then
            Luigi({ x = 320, y = 180, sprite = love.graphics.newImage('resources/mario.png') })
        elseif value == 1 then
            Luigi({ x = 320, y = 180, sprite = love.graphics.newImage('resources/wario.png') })
        elseif value == 2 then
            Luigi({ x = 320, y = 180, sprite = love.graphics.newImage('resources/yoshi.png') })
        end
    end

    return level1
end

return setmetatable({ new = newLevel, generateLvl1 = level1 }, { __call = function(_, ...) return newLevel(...) end })
