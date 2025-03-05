require 'globals'

--Node represents an object in the world and holds the positional attributes
local function newNode(args)
    local new = {}
    new.id = G.O_ID
    G.O_ID = G.O_ID + 1
    new.pos = { x = args.x or 0, y = args.y or 0 }
    new.vel = { x = 0, y = 0 }
    new.dir = { x = 0, y = 0 }
    new.scale = { x = args.w or 1, y = args.h or 1}
    new.rot = 0
    new.active = true --for drawing
    new.delete = false --deletion flag

    --add to our global list of Nodes
    G.O_Nodes[new.id] = new

    return new
end

local function updateObject()
    --clean list if object is inactive
    for k, v in pairs(G.O_Nodes) do
    end
end

--Draw all nodes TODO: Refactor into Drawable class
local function drawObject()
    for k, v in pairs(G.O_Nodes) do
        v:draw()
    end
end

return setmetatable( { new = newNode, update = updateObject, draw = drawObject }, {__call = function ( _,...) return newNode( ... ) end })
