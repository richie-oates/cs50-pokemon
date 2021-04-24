--[[
    GD50
    Pokemon
    Assignment

    This state displays the levelUp increases for the player pokemon stats   
]]

LevelUpMenuState = Class{__includes = BaseState}

function LevelUpMenuState:init(levelUpValues, playerPokemon, onClose)

    self.HPIncrease = levelUpValues[1]
    self.attackIncrease = levelUpValues[2]
    self.defenseIncrease = levelUpValues[3]
    self.speedIncrease = levelUpValues[4]

    self.newHP = playerPokemon.HP
    self.newAttack = playerPokemon.attack
    self.newDefense = playerPokemon.defense
    self.newSpeed = playerPokemon.speed

    self.startHP = self.newHP - self.HPIncrease
    self.startAttack = self.newAttack - self.attackIncrease
    self.startDefense = self.newDefense -self.defenseIncrease
    self.startSpeed = self.newSpeed - self.speedIncrease

    self.onClose = onClose or function() end

    self.levelUpMenu = Menu {
        x = 0,
        y = 0,
        width = VIRTUAL_WIDTH,
        height = 112,
        items = {
            {
                text = 'HP: ' .. self.startHP .. ' + ' .. self.HPIncrease .. ' = ' .. self.newHP,
                onSelect = function()
                    gStateStack:pop()
                    self.onClose()
                end
            },
            {
                text = 'Attack: ' .. self.startAttack .. ' + ' .. self.attackIncrease .. ' = ' .. self.newAttack
            },
            {
                text = 'Defense: ' .. self.startDefense .. ' + ' .. self.defenseIncrease .. ' = ' .. self.newDefense
            },
            {
                text = 'Speed: ' .. self.startSpeed .. ' + ' .. self.speedIncrease .. ' = ' .. self.newSpeed
            }
        },
        selectable = false
    }
end

function LevelUpMenuState:update(dt)
    self.levelUpMenu:update(dt)
end

function LevelUpMenuState:render()
    self.levelUpMenu:render()
end
