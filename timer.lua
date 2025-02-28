local Node = require('node')


local function newTimer(args)
    local new = Node(args)

    new.current_time = 30
    G.O_Timer = new

    return new
end

local function updateTimer(dt)
    if G.O_Timer then
        G.O_Timer.current_time = G.O_Timer.current_time - dt
    end
end

local function drawTimer()
    local font = love.graphics.newFont(60)
    love.graphics.setFont(font)

    if G.O_Timer then
        love.graphics.print(G.O_Timer.current_time, G.O_Timer.pos.x, G.O_Timer.pos.y, 0, 1, 1)
    end
end

--allows the ability to call Object() and get newObject() 
--note the export of the draw function
return setmetatable( { new = newTimer, update = updateTimer, draw = drawTimer}, {__call = function ( _,...) return newTimer( ... ) end })
