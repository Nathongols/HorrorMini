local level1 = require('playableLevel1')
local ui = require('cooked_ui')

local states = {S_PLAY = "PLAYING",
                S_LOAD_LEVEL = "LOADLEVEL",
                S_DELETE_LEVEL = "DELETELEVEL",
                S_MAINMENU = "MAINMENU",
                S_PAUSED = "PAUSED"

}

local curState = states.S_MAINMENU




local function main_menu()
    local args = {
        type = "button",
        sprite = love.graphics.newImage('resources/dr.png'),
        x = 300,
        y = 150
    }
    ui.new(args)
end

local function new_stage()
    print("ran?")
    local selection = love.math.random(1,1)

    if selection == 1 then
        level1.generateLvl1()
    end

end

local function init_scene()
    main_menu()
end

local function scene_update()
    if ui then
        ui.update()
    end
end

local function draw_scene()

    --ui.update()
    if ui then
        ui.draw()
    end

    if curState == states.S_MAINMENU then
        
    end
end




return setmetatable({ new = init_scene, draw = draw_scene, update = scene_update,}, { __call = function(_, ...) return new_stage(...) end })
