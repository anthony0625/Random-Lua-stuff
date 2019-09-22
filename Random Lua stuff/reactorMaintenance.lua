--[[Inventory Setup:
1:Charged Energy Cell
2:Empty Energy Cell
15:Fuel
16:Ender Chest of Fuel
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
    if turtle.getFuelLevel()<14 then
        turtle.select(15)
        if turtle.getItemCount()<8 then
            grabFuel()
        end
        turtle.refuel(8)
    end
end

local function replaceCell()
    checkFuel()
    turtle.up()
    turtle.forward()
    turtle.select(1)
    redstone.setAnalogOutput("bottom", 1)
    os.sleep(1)
    redstone.setAnalogOutput("bottom", 0)

    turtle.forward()
    turtle.down()
    turtle.down()
    turtle.drop(1)
    turtle.select(2)
    turtle.suckDown(1)
    turtle.turnRight()
    turtle.turnRight()
    
    turtle.place()
    turtle.turnLeft()
    turtle.turnLeft()
    turtle.up()
    turtle.up()
    turtle.back()
    turtle.back()
    turtle.down()
end

while true do
    os.queueEvent("Event")
    os.pullEvent()
    if redstone.getAnalogInput("bottom")>0 or redstone.getAnalogInput("back")>0 then
        replaceCell()
    end
end
--turtle should check fuel before executing sequence