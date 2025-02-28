local Drawable = require('drawable')


local function newDoctor(args)
    local new = Drawable(args)

    new.id = "doctor"
    G.O_Doctor = new

    return new
end

local function updateDoctor(dt)
end

local function drawDoctor()
    if G.O_Doctor then 
        local offsetX, offsetY = G.O_Doctor.spriteW/2, G.O_Doctor.spriteH/2
        Canvas:setCanvas("viewport") 
        love.graphics.clear(0.1,0,0,1)
        love.graphics.draw(G.O_Doctor.sprite, G.O_Doctor.pos.x, G.O_Doctor.pos.y, 0, G.O_Doctor.scale.x, G.O_Doctor.scale.y, offsetX, offsetY)
        Canvas:setCanvas("main")
    end
end



--allows the ability to call Object() and get newObject() 
--note the export of the draw function
return setmetatable( { new = newDoctor, update = updateDoctor, draw = drawDoctor}, {__call = function ( _,...) return newDoctor( ... ) end })
