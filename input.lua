local Input = {}

Input.mouseX = 0
Input.mouseY = 0
Input.mouse1Pressed = false
Input.mouse2Pressed = false
Input.KeyUP = false
Input.KeyDOWN = false
Input.KeyLEFT = false
Input.X = 0
Input.KeyRIGHT = false
Input.Y = 0

local function getMouseInput(self)
    Input.mouseX, Input.mouseY = love.mouse.getPosition()
end

--Translate screen to canvas to camera
function Input.screenToWorld(x, y)
    if Canvas then
        Canvas:setCanvas("crt")
        local temp_x, temp_y = Canvas:toGame(x, y)
        print(temp_x, temp_y)
        Canvas:setCanvas("main")
        return temp_x, temp_y
    end
end

function love.mousepressed(x, y, button, touch)
    if button == 1 then
        Input.mouse1Pressed = true
    end

    if button == 2 then
        Input.mouse2Pressed = true
    end

end

function love.mousereleased(x, y, button, touch)
    if button == 1 then
        Input.mouse1Pressed = false
    end

    if button == 2 then
        Input.mouse2Pressed = false
    end

end


function love.keypressed(key, scancode, isrepeat)
    if key == "escape" then
       love.event.quit()
    end

    if key == "w" then
        Input.KeyUP = true
        Input.Y = Input.Y - 1
    end

    if key == "s" then
        Input.KeyDOWN = true
        Input.Y = Input.Y + 1
    end

    if key == "a" then
        Input.KeyLEFT = true
        Input.X = Input.X - 1
   end

    if key == "d" then
        Input.KeyRIGHT = true
        Input.X = Input.X + 1
    end
end

 function love.keyreleased(key, scancode)
    if key == "escape" then
        love.event.quit()
    end

    if key == "w" then
        Input.KeyUP = false
        Input.Y = Input.Y + 1
    end

    if key == "s" then
        Input.KeyDOWN = false
        Input.Y = Input.Y - 1
    end

    if key == "a" then
        Input.KeyLEFT = false
        Input.X = Input.X + 1
    end

    if key == "d" then
        Input.KeyRIGHT = false
        Input.X = Input.X - 1
    end
   
 end

Input.update = function(self)
    getMouseInput(self)

end



return Input