require 'globals'

local drawable = require('drawable')
local Luigi = require('luigi')
G.Input = require('input')

function G:init() 
    Canvas:setupScreen(G.CANVAS_WIDTH, G.CANVAS_HEIGHT, SETTINGS.WINDOW.WIDTH, SETTINGS.WINDOW.HEIGHT,
    {fullscreen = true, pixelperfect = true})
    local difficulty = 200
    local rng = love.math.random(difficulty*0.10, difficulty*0.50)

    for i=0, difficulty do
        value = love.math.random(0, 2)
        if i == rng then
            Luigi({ x = 320, y = 180, sprite = love.graphics.newImage('resources/luigi.png') })
        elseif value == 0 then
            Luigi({ x = 320, y = 180, sprite = love.graphics.newImage('resources/mario.png') })
        elseif value == 1 then
            Luigi({ x = 320, y = 180, sprite = love.graphics.newImage('resources/wario.png') })
        elseif value == 2 then
            Luigi({x = 320, y = 180, sprite = love.graphics.newImage('resources/yoshi.png')})
        end
    end

    shader1 = love.graphics.newShader("shaders/crt.glsl")

    Canvas:setupCanvas({
        { name = "shader", shader= shader1},
        { name = "noshader"}
    })
    
end

function G:update(dt)
end

function G:fixedUpdate(dt)
    G.Input:update() 

    Luigi.update()

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
        if ui.delete == true then
            G.U_Select[id] = nil
        end
    end

end

function G:draw()
    Canvas:apply("start")
    -- Canvas:setCanvas("shader")
        love.graphics.clear(0,0,0,1)
        Canvas:setCanvas("shader")
        drawable.draw()

    Canvas:apply("end")
               
end

function G:deinit()
end

