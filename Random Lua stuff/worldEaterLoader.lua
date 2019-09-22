--[[
    Inventory:
    1:Chunkloaders
    16:Fuel
]]
local function forward()
    turtle.foward()
    turtle.select(1)
    turtle.place()
    turtle.back()
    turtle.turnLeft()
    turtle.dig()
    turtle.turnRight()
    turtle.forward()
    turtle.turnLeft()
    turtle.place()
    turtle.turnRight()
    turtle.dig()
end

local function checkFuel()
    if turtle.getFuelLevel()<16 then
        turtle.select(16)
        if turtle.getItemCount()<10 then
            turtle.turnRight()
            turtle.suck(10)
            turtle.turnLeft()
        end
        turtle.refuel(5)
    end
end

local function move()
    checkFuel()
    forward()
end

while true do
    while not peripheral.getType("right") == ender_chest do
        os.queueEvent("Event2")
        os.pullEvent()
    end
    move()
end
     