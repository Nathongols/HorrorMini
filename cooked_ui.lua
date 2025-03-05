local drawable = require('drawable')

local function new_button(args)
    local new = drawable(args)
    new.type = args.type
    new.sprite = args.sprite
    new.pos.x, new.pos.y = args.x, args.y
    G.U_Elements[new.id] = new
    
end

local function new_text(args)
    local new = drawable(args)
    new.type = args.type
    new.sprite = args.sprite
    new.pos.x, new.pos.y = args.x, args.y
    G.U_Elements[new.id] = new
end



local function new_ui(args)
    if (args.type == "button") then
        new_button(args)
    elseif (args.type == "text") then
        new_text(args)
    end
end
-- @param update_button class
local function update_button(u_id, obj)
    if G.Input.mouse1Pressed == true then
        local mouseWorldX, mouseWorldY = G.Input.screenToWorld(G.Input.mouseX, G.Input.mouseY)
        if mouseWorldX >= obj.pos.x and mouseWorldX <= obj.pos.x + obj.spriteW and mouseWorldY >= obj.pos.y and mouseWorldY <= obj.pos.y + obj.spriteH then
            print("clicked")
        end
    end

end

local function update_text(u_id, obj)

end


local function update()
    for u_id, obj in pairs(G.U_Elements) do
        if obj.type == "button" then
            update_button(u_id, obj)

        end
        if obj.type == "text" then
            update_text(u_id, obj)
        end
    end

end


local function draw_button(u_id, obj)
    love.graphics.draw(obj.sprite, obj.pos.x, obj.pos.y)
end

local function draw_text(u_id, obj)
    love.graphics.draw(obj.sprite, obj.pos.x, obj.pos.y)
end

local function draw()
    Canvas:setCanvas("UI")
    for u_id, obj in pairs(G.U_Elements) do
        if obj.type == "button" then
            draw_button(u_id, obj)
        end
        if obj.type == "text" then
            draw_text(u_id, obj)
        end
    end
    Canvas:setCanvas()

end




return setmetatable({ new = new_ui, update = update, draw = draw}, { __call = function(_, ...) return new_ui(...) end })
