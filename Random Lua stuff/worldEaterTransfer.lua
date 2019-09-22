--[[
    Front top turtle
    Moves when signaled by master turtle from bottom
    Inventory:
    1:Drawbridge
    16:Fuel
]]
local function deploy()
    turtle.turnRight()
    turtle.select(1)
    turtle.place()
    redstone.setAnalogOutput("front", 1)
end

local function checkFuel()
    if turtle.getFuelLevel()<16 then
        turtle.select(16)
        if turtle.getItemCount()<10 then
            turtle.suckDown(10)
        end
        turtle.refuel(5)
    end
end


local function retract()
    redstone.setAnalogOutput("front", 0)
    os.sleep(2)
    turtle.dig()
    turtle.turnLeft()
end

--Will only run once enderchest is detected
local function move()
    checkFuel()
    turtle.forward()
    deploy()
    os.sleep(1)

    --gives bottom turtle the signal to deploy
    redstone.setAnalogOutput("bottom", 1)
    os.sleep(0.5)
    redstone.setAnalogOutput("bottom", 0)
    while redstone.getAnalogInput("right")<1 do
        os.queueEvent("Event")
        os.pullEvent()
    end
    retract()
end

while true do
    while not peripheral.getType("bottom") == ender_chest do
        os.queueEvent("Event2")
        os.pullEvent()
    end
    move()
end