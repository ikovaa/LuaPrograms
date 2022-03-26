--[[
    Authors: ikova && Spaida
    Last Update: 20/03/22
    Description: Simple PVP Turns Game
]]

--[[ Variables ]]
local turn = 0
local input
local round = 0
local player1 = {
    health = 100,
    armor = 20,
    wins = 0,
}

local player2 = {
    health = 100,
    armor = 20,
    wins = 0,
}

function main()
    math.randomseed(os.time());
    math.random();
    round = round + 1

    os.execute("clear") -- os.execute("cls") on Windows
    io.write("Round "..round.."\n")
    io.write("player1 Health " .. player1.health .. "\n")
    io.write("player2 Health " .. player2.health .. "\n")
    --[[
        If turn equals to 0 is the character turn 
        Otherwise it's the enemy turn
    ]]
    if dice() > 3 then turn = 1 else turn = 0 end
    next("play")
end

function play(data)

    --[[
        Receive the dmg value and store it in a variable
    ]]
    local dmg = getGamage()
	    if data == 0 then
        io.write("\nplayer1 Damage "..dmg .. "\n")
        applyDamage(player2, dmg)
    else
        io.write("\nplayer2 Damage ".. dmg .. "\n")
        applyDamage(player1, dmg)
    end
end


--[[ Get random damage amount ]]
function getGamage()
    local dmg = math.random(20,60)
    return dmg
end

function applyDamage(data, dmg)
    local newDamage = data.armor - dmg
    data.health = data.health + newDamage
    next("main")
end

--[[ Determine the turn randomly ]]
function dice()
    local random = math.random(1,6)
    return random
end


--[[
    If any of the players health is lower or equal to 0 continue to win(), otherwise play again
]]
function next(args)
    if (player1.health <= 0) or (player2.health <= 0) then win() end
        io.write("\nPress X to continue\n")
        input = io.read()
    if (input == "X") or (input == "x") then
        if args == "play" then
            play(turn)
        elseif args == "main" then
            main()
        end
    else return end
end


--[[ 
  Checks if any of the players health is lower or equal to 0
]]
function win()
    io.write("\n\n--------------------------\n\n")
        if (player1.health <= 0) then
        player2.wins = player2.wins + 1
        io.write("\nplayer2 wins\n")
        io.write("player2 now has "..player2.wins.." wins")
    elseif (player2.health <= 0) then
        player1.wins = player1.wins + 1
        io.write("\nplayer1 Wins\n")
        io.write("player1 now has "..player1.wins.." wins")
    end
    reset()
end


--[[ Resets the rounds and players health ]]
function reset()
    io.write("\nThis game took "..round.." rounds\n")
    io.write("Reseting Game\n\n")
    round = 0
    player1.health = 100
    player2.health = 100
end


main()