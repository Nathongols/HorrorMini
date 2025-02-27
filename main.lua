--Libraries
inspect = require "libs.inspect"
Debug = require "Debug"
--Release = require "release"
Utils = require "utils"
lmath = require "lmath"
HC = require "libs.HC"
Tween = require "libs.tween"
Timer = require "libs.timer"
Canvas = require "libs.push"

require "globals"
require "game"


function love.run()    
    if love.load then love.load(love.arg.parseGameArguments(arg), arg) end

    -- Workaround for macOS RNG issues
    if jit and jit.os == "OSX" then
        math.randomseed(os.time())
        math.random(); math.random()
    end

    if love.timer then love.timer.step() end

    local dt = 0
    local dt_smooth = 1/100

    local run_time = 0
    local fixed_dt = 1/60        -- your fixed update timestep
    local accumulator = 0
    local current_time = love.timer.getTime()

    return function()
        run_time = love.timer.getTime()

        if love.event and G then
            love.event.pump()
            for name, a, b, c, d, e, f in love.event.poll() do
                if name == "quit" then
                    if not love.quit or not love.quit() then
                        return a or 0
                    end
                end
                love.handlers[name](a, b, c, d, e, f)
            end
        end

        -- Calculate elapsed time and accumulate it.
        local new_time = love.timer.getTime()

        local frame_dt = new_time - current_time
        current_time = new_time
        accumulator = accumulator + frame_dt

        -- Fixed timestep update loop.
        while accumulator >= fixed_dt do
            love.fixedUpdate(fixed_dt)
            accumulator = accumulator - fixed_dt
        end

        if love.timer then dt = love.timer.step() end
        dt_smooth = math.min(0.8*dt_smooth + 0.2*dt, 0.1)
        --TODO fix hotreloading
        if (D_DEBUG) then love.update(dt_smooth) else love.update(dt_smooth) end
        --if love.update then love.update(dt) end

        -- Optionally compute an interpolation factor:
        -- local alpha = accumulator / fixed_dt

        if love.graphics and love.graphics.isActive() then
            love.graphics.origin()
            love.graphics.clear(love.graphics.getBackgroundColor())
            if love.draw then
                -- Optionally, you can pass 'alpha' into your draw function.
                love.draw()
            end
            love.graphics.present()
        end

        run_time = math.min(love.timer.getTime() - run_time, 0.1)
		G.FPS_CAP = G.FPS_CAP or 500
		if run_time < 1./G.FPS_CAP then love.timer.sleep(1./G.FPS_CAP - run_time) end 
    end
end


function love.load()
    love.graphics.setDefaultFilter("nearest", "nearest")
    G:init()
    


    if (D_DEBUG) then
        Debug.setup()
    else
        Release.setup()
    end
end

function love.update(dt)
    G:update(dt)
    T_ELAPSED_TIME = T_ELAPSED_TIME + dt

    if (D_DEBUG) then
        Debug.update(dt)
    end 
   
end

function love.fixedUpdate(dt)
    G:fixedUpdate(dt)
    if (D_DEBUG) then
        Debug.fixedUpdate(dt)
    end 
end

function love.draw()
    G:draw()
    if (D_DEBUG) then
        Debug.draw()
    end 
end


