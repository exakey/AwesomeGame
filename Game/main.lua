function love.load()
        -- SCREEN
        game               = {}
        game.screen_width  = 800
        game.screen_height = 600

        -- PLAYER
        player             = {}
        player.sprite      = love.graphics.newImage("assets/pacman.png")
        player.w           = player.sprite:getWidth() * 0.5
        player.h           = player.sprite:getHeight() * 0.5
        player.scale       = (game.screen_height * game.screen_width) * 0.01

        player.position    = {
                x = love.graphics.getWidth() * 0.5,
                y = love.graphics.getHeight() * 0.5,
        }

        player.angle       = 270 * (math.pi / 180)
        player.speed       = 3

        -- CONTROLS
        controls           = {}
        controls.left      = { "a", "h", "left" }
        controls.down      = { "s", "j", "down" }
        controls.up        = { "w", "k", "up" }
        controls.right     = { "d", "l", "right" }
end

function love.update(dt)
        ---@diagnostic disable-next-line: param-type-mismatch
        if love.keyboard.isDown(controls.left) then
                player.position.x = player.position.x - player.speed
                player.angle      = 180 * (math.pi / 180)
        end
        ---@diagnostic disable-next-line: param-type-mismatch
        if love.keyboard.isDown(controls.down) then
                player.position.y = player.position.y + player.speed
                player.angle      = 90 * (math.pi / 180)
        end
        ---@diagnostic disable-next-line: param-type-mismatch
        if love.keyboard.isDown(controls.up) then
                player.position.y = player.position.y - player.speed
                player.angle      = 270 * (math.pi / 180)
        end
        ---@diagnostic disable-next-line: param-type-mismatch
        if love.keyboard.isDown(controls.right) then
                player.position.x = player.position.x + player.speed
                player.angle      = 0 * (math.pi / 180)
        end
end

function love.draw()
        love.graphics.draw(
                player.sprite,
                player.position.x,
                player.position.y,
                player.angle,
                -- player.scale.x,
                -- player.scale.y,
                player.scale,
                player.h,
                player.w
        )
end
