
local release = {}


function release.setup()

    love.window.setTitle("RELEASE")
    love.window.setVSync(true)

    local success = love.window.setMode(
        1920,
        1080,
        { fullscreen = true, 
        fullscreentype = "desktop",
        vsync = 1,
        centered = true,
        display = 2 --for debugging, change to 1 for main monitor
    })
end

return release
