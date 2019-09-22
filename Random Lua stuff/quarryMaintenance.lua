--[[
    Inventory Management
    1:Empty Energy Cube
    2:Filled Energy Cube
    14:Universal Cable
    15:Fuel
    16:Fuel Ender Chest

]]

local function grabFuel()
    turtle.select(16)
    turtle.placeUp()
    turtle.select(15)
    turtle.suckUp(16)
    turtle.select(16)
    turtle.digUp()
    turtle.select(15)
end

local function checkFuel()
    if turtle.getFuelLevel()<16 then
        turtle.select(15)
        if turtle.getItemCount()<8 then
            grabFuel()
        end
        turtle.refuel(8)
    end
end

--This is made as a seperate function as to ensure the turtle will wait until a charged cube is grabbed
local function grabCube()
    turtle.select(2)
    while turtle.getItemCount()<1 do
        os.queueEvent("Event")
        os.pullEvent()
        turtle.suck(1)
    end
end

local function changeCube()
    checkFuel()
    grabCube()
    turtle.up()
    turtle.up()
    turtle.back()
    turtle.turnRight()
    turtle.forward()
    turtle.select(1)
    redstone.setAnalogOutput("bottom", 1)
    os.sleep(1)
    redstone.setAnalogOutput("bottom", 0)
    turtle.back()
    turtle.turnLeft()
    turtle.forward()
    turtle.down()
    turtle.select(1)

    turtle.drop()
    turtle.down()
    turtle.turnRight()
    turtle.select(14)
    turtle.dig()
    turtle.forward()
    turtle.turnRight()

    turtle.select(2)
    turtle.place()
    turtle.turnLeft()
    turtle.back()
    turtle.select(14)
    turtle.place()
    turtle.turnLeft()
end

while true do
    os.queueEvent("Event")
    os.pullEvent()
    if redstone.getAnalogInput("bottom")>0 or redstone.getAnalogInput("back")>0 then
        changeCube()
    end
end