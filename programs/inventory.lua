--[[
    FreeCodeCamp Challenge
    Algorithms - Inventory Update but in Lua
]]
local curInv = {
    {
        amount = 21,
        name = "Bowling Ball"
    },
    {
        amount = 1,
        name = "Hair Pin"
    },
    {
        amount = 2,
        name = "Dirty Sock"
    },
    {
        amount = 5,
        name = "Microphone"
    }
}

local newInv = {
    {
        amount = 67,
        name = "Bowling Ball"
    },
    {
        amount = 2,
        name = "Hair Pin"
    },
    {
        amount = 3,
        name = "Half-Eaten Apple"
    },
    {
        amount = 7,
        name = "Toothpaste"
    }
}


function UpdateInventory(arr1, arr2)
    -- Loop through the new Inventory
    for k,v in pairs(arr2) do
        -- We will use this variable to find a value in the cur Inventory
        local index = nil
        -- Let's see if there's already some values with the same name
        for _,x in pairs(arr1) do
            -- If true, we assign the key value to the index variable
            if (x.name == v.name) then
                index = k
            end
        end

        -- Yes, we need to use the index variable, we need to check if there's already an entry
        -- If we wanted to use the key(k) value it wouldn't work
        if (index) then
            -- Change the amount value
            arr1[index].amount = arr1[index].amount + v.amount
        else
            -- Why can't I use arr1[#arr1+1] ?
            table.insert(arr1, v)
        end
    end

    -- So we can see it on console
    for _,v in pairs(arr1) do
        print(v.name .. " " .. v.amount)
    end
    return arr1
end

UpdateInventory(curInv, newInv)


