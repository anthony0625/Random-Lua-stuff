--[[
    Back Turtle
    This turtle is in charge of determining when to move, and will alert the other 3 turtle of when to do so

    Inventory:
    1:Energy Cell
    2:Fuel Chest
    3:Block Breaker
    4:Energy Pipe
    5:Redstone Block
    
    6:Drawbridge
    7:New Cell Chest
    8:Empty Cell Chest
    
    16:Fuel
]]
local function deploy()
    turtle.turnRight()
    turtle.select(6)
    turtle.place()
    turtle.up()
    turtle.select(5)
    turtle.placeDown()
    --Turtle is now on top of redstone block

    turtle.forward()
    turtle.forward()
    turtle.select(1)
    turtle.place()
    turtle.back()
    turtle.select(4)
    turtle.place()
end

local function retract()
    turtle.select(4)
    turtle.dig()
    turtle.back()
    turtle.select(5)
    redstone.setAnalogOutput("left", 1)
    turtle.digDown()
    turtle.down()
    os.sleep(1)
    redstone.setAnalogOutput("left", 0)
    turtle.select(6)
    turtle.dig()
    turtle.up()
    turtle.forward()
    turtle.select(3)
    turtle.place()
    turtle.setAnalogOutput("front", 1)
    os.sleep(0.5)
    turtle.setAnalogOutput("front", 0)
    turtle.select(3)
    turtle.dig()
    turtle.back()
    turtle.turnLeft()
    turtle.down()
end

local function checkFuel()
    if turtle.getFuelLevel()<32 then
        turtle.select(16)
        if turtle.getItemCount()<20 then
            turtle.suck(20)
        end
        turtle.refuel(10)
    end
end

local function placeFuel()
    turtle.select(2)
    turtle.place()
    os.sleep(3)
end

--local function replaceCell()
--Begins sending instructions to move before retracting
local function move()
    placeFuel()
    checkFuel()
    turtle.select(2)
    turtle.dig()
    turtle.forward()
    deploy()
    os.sleep(40)
    retract()
end