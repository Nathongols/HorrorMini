require 'globals'

local drawable = require('drawable')
local Luigi = require('luigi')
local stage1 = require('stage1Selector')


local Timer = require('timer')
local Doctor = require('dr')
G.Input = require('input')


local crt = love.graphics.newImage("resources/funny.png")
function G:init() 
    Canvas:setupScreen(G.CANVAS_WIDTH, G.CANVAS_HEIGHT, SETTINGS.WINDOW.WIDTH, SETTINGS.WINDOW.HEIGHT,
    {fullscreen = true, pixelperfect = true})
    --G.UI_State[playable] = playable
    local Stage1 = stage1.new()
    shader1 = love.graphics.newShader("shaders/crt.glsl")
    shader2 = love.graphics.newShader("shaders/viewport.glsl")

    Canvas:setupCanvas({
        { name = "main", width = 640, height = 360},
        { name = "crt", shader= {shader1}, width = 480, height = 360 },
        { name = "viewport", shader = {shader2}, x = 480, y = 20, width = 140, height = 90}
    })

    Timer({x = 500, y = 140})
    local difficulty = 100
    local rng = love.math.random(difficulty*0.10, difficulty*0.50)

    Doctor({ x=70, y=45, w = 1.5, h = 1.5, sprite = love.graphics.newImage('resources/dr.png') })
    --love.event.push()
    
end



function G:update(dt)
    -- shader2:send("time", love.timer.getTime())
end

function G:fixedUpdate(dt)
    G.Input:update() 
   -- menu.update()
    Luigi.update() -- required for game to run    Timer.update(dt)

    -- shader1:send("time", love.timer.getTime())
    G.cleanup()
    
end

-- dereference any node with delete flag
function G.cleanup()
    for o_id, obj in pairs(G.O_Nodes) do
        if obj.delete == true then
            if obj.collider then HC.remove(obj.collider) end
            G.O_Nodes[o_id] = nil
        end
    end

    -- Clean up UI components
    for id, ui in pairs(G.U_Select) do
        G.U_Select[id] = nil
        if ui.delete == true then
        end
    end

end

function G:draw()
    love.graphics.clear(0.1,0.1,0.1,1)
    Canvas:apply("start")
        Luigi.draw()
        Doctor.draw()
        Timer.draw()
    Canvas:apply("end")
    
end

function G:deinit()
end

