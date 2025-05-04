function love.load()
        game               = {}
        game.screen_width  = 800
        game.screen_height = 600
end

function love.draw()
        love.graphics.push()

        love.graphics.scale(love.graphics.getWidth() / game.screen_width)

        -- Window border
        love.graphics.setColor(0, 1, 0, 1)
        love.graphics.rectangle("line", 0, 0, game.screen_width, game.screen_height)

        -- Red rectangle
        love.graphics.setColor(1, 0, 0, 1)
        love.graphics.rectangle("fill", 100, 100, 50, 50)
        love.graphics.pop()
end
