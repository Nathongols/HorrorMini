Graph = require "libs.FPSGraph"

local debug = {}

function debug.setup()
    love.window.setTitle("DEBUG")
    love.window.setFullscreen(false)
    love.window.setVSync(false)
    -- TODO fix aspect ratios
    love.window.requestAttention()

    fpsGraph = Graph.createGraph(0, 0)
    drawGraph = Graph.createGraph(0, 80)
    memGraph = Graph.createGraph(0, 160) 

end

function debug.update(time) 
    Graph.updateFPS(fpsGraph, time)
end

function debug.fixedUpdate(time)
    Graph.updateMem(memGraph, time)
    Graph.updateFixedFPS(drawGraph, time)
end

function debug.draw()
    love.graphics.setColor(0, 255, 0)
    Graph.drawGraphs({fpsGraph, memGraph, drawGraph})
    love.graphics.setColor(255, 255, 255)
end

return debug