--[[
    Front bottom turtle
    This turtle can only deploy its drawbridge after the top turtle has successfully done so
    In moving, this turtle will be the first to move
    
    Inventory:
    1:Drawbridge
    16:Fuel

    Assumption: 2 seconds is safe for full retraction of drawbridge(accounting for server lag)
]]
local function deploy()
    turtle.turnRight()
    turtle.select(1)
    turtle.place()
    redstone.setAnalogOutput("front", 1)
end

local function retract()
    turtle.setAnalogOutput("front", 0)
    os.sleep(2)
    turtle.dig()
    turtle.turnLeft()
    turtle.forward()
end

local function checkFuel()
    if turtle.getFuelLevel()<16 then
        turtle.select(16)
        if turtle.getItemCount()<10 then
            turtle.turnRight()
            turtle.turnRight()
            turtle.suck(10)
        end
        turtle.refuel(5)
    end
end

--Will only run once enderchest is detected
local function move()
    checkFuel()
    while redstone.getAnalogInput("top")<1 do
        os.queueEvent("Event")
        os.pullEvent()
    end
    deploy()
    while redstone.getAnalogInput("right")<1 or redstone.getAnalogInput("right")>5 do
        os.queueEvent("Event")
        os.pullEvent()
    end
    retract()
end

while true do
    while not peripheral.getType("back") == ender_chest do
        os.queueEvent("Event2")
        os.pullEvent()
    end
    move()
end