local Drawable = require('drawable')


local function newLuigi(args)
    local new = Drawable(args)
    
    local screenX, screenY = Canvas:getDimensions()
    new.dir = {x = love.math.random(-100, 100), y = love.math.random(-100,100)}
    new.pos = { x = love.math.random(0, screenX), y = love.math.random(0, screenY) }
    new.isLuigi = args.isLuigi or false

    G.O_Luigis[new.id] = new

    if new.isLuigi then
        G.O_Wanted = new
    end

    return new
end

local function updateLuigi()
    local screenX, screenY = Canvas:getDimensions()

    if G.Input.mouse1Pressed == true then
        local mouseWorldX, mouseWorldY = G.Input.screenToWorld(G.Input.mouseX, G.Input.mouseY)
        if mouseWorldX >= G.O_Wanted.pos.x - (G.O_Wanted.spriteW / 2 + 5) and mouseWorldX <= G.O_Wanted.pos.x + (G.O_Wanted.spriteW / 2 + 5) and mouseWorldY >= G.O_Wanted.pos.y - (G.O_Wanted.spriteH / 2 + 5) and mouseWorldY <= G.O_Wanted.pos.y + (G.O_Wanted.spriteH / 2 + 5) then
            --do something
            love.event.quit()
        end
    end

    for id, obj in pairs(G.O_Luigis) do

        
        --Normalize direction
        obj.dir = lmath.vec2.normalize(obj.dir)

        if obj.pos.x > screenX then
            obj.dir.x = -obj.dir.x
        elseif obj.pos.x < 0 then
            obj.dir.x = -obj.dir.x
        end
        if obj.pos.y > screenY then
            obj.dir.y = -obj.dir.y
        elseif obj.pos.y < 0 then
            obj.dir.y = -obj.dir.y
        end
        obj.pos.x = obj.pos.x + obj.dir.x
        obj.pos.y = obj.pos.y + obj.dir.y
    end 
end


--allows the ability to call Object() and get newObject() 
--note the export of the draw function
return setmetatable( { new = newLuigi, update = updateLuigi}, {__call = function ( _,...) return newLuigi( ... ) end })
