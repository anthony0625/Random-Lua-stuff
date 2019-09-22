--[[
    1: Front Chest
    2: Back Chest
]]
local function checkChests()
    turtle.select(1)
    if turtle.getItemCount()<32 then
        turtle.suck(64)
    end
    turtle.select(2)
    if turtle.getItemCount()<6 then
        turtle.turnRight()
        turtle.turnRight()
        turtle.suck(16)
        turtle.turnRight()
        turtle.turnRight()
    end
end

while true do
    os.queueEvent("Event")
    os.pullEvent()
    checkChests()
end