--Output of Strength 1 to turtle
local function checkEnergy()
    if (peripheral.isPresent("right") and peripheral.call("right", "getEnergyStored") == peripheral.call("right", "getMaxEnergyStored")) or (not peripheral.isPresent("right") and redstone.getAnalogInput("bottom")>0) then
        redstone.setAnalogOutput("", 1)
        os.sleep(1)
    end
    redstone.setAnalogOutput("front", 0)
end

--Output of Strength 2 to turtle
local function refillReactor()
local function retrieveWaste()


--Change based on maximum amount of energy the reactor can store
local function checkAvailableStorage()
    if peripheral.call("back", "getEnergyStored") == 10000000 then
        peripheral.call("back", "setActive", false)
    end
    if peripheral.call("back", "getEnergyStored") < 3000000 then
        peripheral.call("back", "setActive", true)
    end
end

while true do
    os.queueEvent("Event")
    os.pullEvent()
    checkEnergy()
    checkAvailableStorage()
end