--Strength 1: change cube
local function checkCube()
    if peripheral.isPresent("left") and peripheral.call("left", "getEnergyStored")<3000 then
        redstone.setAnalogOutput("front", 1)
    end
    os.sleep(1)
    redstone.setAnalogOutput("front", 0)
end

while true do
    os.queueEvent("Event")
    os.pullEvent()
    checkCube()
end