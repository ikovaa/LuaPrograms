--[[
    Authors: ikova
    Last Update: 23/05/22
    Description: Fibonacci Sequence
]]

function Main(args)
    -- The first 2 values of the fibonacci sequence are both 1
    -- If the user input is equal to 1 or 2 return 1
    local sequence = {1,1}
    if args == 1 or args == 2 then return 1 end

    -- Start the loop at 3 because the first 2 values are already assigned to 1
    for i=3,args do
        -- Add the previous 2 values inside our sequence and assign it to insertValue variable
        local insertValue = sequence[i - 1] + sequence[i - 2]
        -- Insert insertValue variable in our sequence
        table.insert(sequence, insertValue)
    end

    -- Return the last value of the sequence
    -- # returns the lenght of our sequence
    return sequence[#sequence]
end

print(Main(9))