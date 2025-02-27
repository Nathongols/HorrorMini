local Node = require('node')

--Drawable component used to render sprites
--extends node
local function newDrawable(args)
    local new = Node(args)
    
    --Transform
    new.sprite = args.sprite --or love.graphics.newImage('resources/red.png')
    new.spriteW, new.spriteH = new.sprite:getDimensions()
    
    --Bind new to Global PLayer instance 
    --Currently there can only be one Player
    G.O_Drawables[new.id] = new

    return new
end


local function drawDrawable()
    for id, obj in pairs(G.O_Drawables) do
        local offsetX, offsetY = obj.spriteW/2, obj.spriteH/2
        love.graphics.draw(obj.sprite, obj.pos.x, obj.pos.y, 0, obj.scale.x, obj.scale.y, offsetX, offsetY)
    end
end


--allows the ability to call Object() and get newObject() 
--note the export of the draw function
return setmetatable( { new = newDrawable, draw = drawDrawable}, {__call = function ( _,...) return newDrawable( ... ) end })
