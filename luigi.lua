local Drawable = require('drawable')


local function newLuigi(args)
    local new = Drawable(args)
    
    new.dir = {x = love.math.random(-100, 100), y = love.math.random(-100,100)}
    new.pos = { x = love.math.random(110, 600), y = love.math.random(50, 310) }
    new.isLuigi = false
    print(new.dir.x, new.dir.y)
    G.O_Luigis[new.id] = new

    return new
end

local function clickLuigi()

end

local function updateLuigi()
    local screenX, screenY = Canvas:getDimensions()
    for id, obj in pairs(G.O_Luigis) do

        -- if G.Input.mouse1Pressed == true then
        --     local mouseWorldX, mouseWorldY = G.Input.screenToWorld(G.Input.mouseX, G.Input.mouseY)
        --     if mouseWorldX >= obj.pos.x and mouseWorldX <= obj.pos.x + 32 and mouseWorldY >= obj.pos.y and mouseWorldY <= obj.pos.y + 32 then
        --         print("Clicked on Luigi!")
        --     end
        -- end
        --Normalize direction
        obj.dir = lmath.vec2.normalize(obj.dir)

        if obj.pos.x > screenX-40 then
            obj.dir.x = -obj.dir.x
        elseif obj.pos.x < 110 then
            obj.dir.x = -obj.dir.x
        end
        if obj.pos.y > screenY-50 then
            obj.dir.y = -obj.dir.y
        elseif obj.pos.y < 50 then
            obj.dir.y = -obj.dir.y
        end
        obj.pos.x = obj.pos.x + obj.dir.x
        obj.pos.y = obj.pos.y + obj.dir.y
    end 
end


--allows the ability to call Object() and get newObject() 
--note the export of the draw function
return setmetatable( { new = newLuigi, update = updateLuigi}, {__call = function ( _,...) return newLuigi( ... ) end })
