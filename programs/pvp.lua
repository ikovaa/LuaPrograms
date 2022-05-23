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

function Main()
    math.randomseed(os.time());
    round = round + 1

    os.execute("clear") -- os.execute("cls") on Windows
    io.write("Round "..round.."\n")
    io.write("player1 Health " .. player1.health .. "\n")
    io.write("player2 Health " .. player2.health .. "\n")
    --[[
        If turn equals to 0 is the character turn 
        Otherwise it's the enemy turn
    ]]
    if Dice() > 3 then turn = 1 else turn = 0 end
    Next("play")
end

function Play(data)

    --[[
        Receive the dmg value and store it in a variable
    ]]
    local dmg = GetGamage()
	    if data == 0 then
        io.write("\nplayer1 Damage "..dmg .. "\n")
        ApplyDamage(player2, dmg)
    else
        io.write("\nplayer2 Damage ".. dmg .. "\n")
        ApplyDamage(player1, dmg)
    end
end


--[[ Get random damage amount ]]
function GetGamage()
    local dmg = math.random(20,60)
    return dmg
end

function ApplyDamage(data, dmg)
    local newDamage = data.armor - dmg
    data.health = data.health + newDamage
    Next("main")
end

--[[ Determine the turn randomly ]]
function Dice()
    local random = math.random(1,6)
    return random
end


--[[
    If any of the players health is lower or equal to 0 continue to win(), otherwise play again
]]
function Next(args)
    if (player1.health <= 0) or (player2.health <= 0) then Win() end
        io.write("\nPress X to continue\n")
        input = io.read()
    if (input == "X") or (input == "x") then
        if args == "play" then
            Play(turn)
        elseif args == "main" then
            Main()
        end
    else return end
end


--[[
  Checks if any of the players health is lower or equal to 0
]]
function Win()
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
    Reset()
end


--[[ Resets the rounds and players health ]]
function Reset()
    io.write("\nThis game took "..round.." rounds\n")
    io.write("Reseting Game\n\n")
    round = 0
    player1.health = 100
    player2.health = 100
end

Main()