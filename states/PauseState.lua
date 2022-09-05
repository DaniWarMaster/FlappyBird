
PauseState = Class{__includes = BaseState}

function PauseState:init()

end

function PauseState:enter(params)
    sounds['music']:pause()
    
    self.bird = params.bird
    self.pipePairs = params.pipePairs
    self.timer = params.timer
    self.spawnTimer = params.spawnTimer
    self.score = params.score
    self.lastY = params.lastY
end


function PauseState:update(dt)
    if love.keyboard.wasPressed('p') then
        sounds['pause']:play()

        -- send saved state to play
        gStateMachine:change('play', {
            bird = self.bird,
            pipePairs = self.pipePairs,
            timer = self.timer,
            spawnTimer = self.spawnTimer,
            score = self.score,
            lastY = self.lastY
        })
    end
end

function PauseState:render()
    love.graphics.setFont(flappyFont)
    love.graphics.printf('PAUSED', 0, 90, VIRTUAL_WIDTH, 'center')

    love.graphics.setFont(flappyFont)
    love.graphics.printf('Press \'p\' to resume', 0, 120, VIRTUAL_WIDTH, 'center')

    love.graphics.setFont(mediumFont)
    love.graphics.printf('Current score: '..self.score, 0, 170, VIRTUAL_WIDTH, 'center')
end

