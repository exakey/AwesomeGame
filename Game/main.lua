---@diagnostic disable: param-type-mismatch
game   = {}
player = {}

function love.load()
        -- SCREEN
        game.screen_width  = 800
        game.screen_height = 600
        -- love.window.setMode(game.screen_width, game.screen_height, { resizable = true, highdpi = true })

        -- PLAYER
        player.sprite      = love.graphics.newImage("assets/pacman.png")
        player.w           = player.sprite:getWidth() * 0.5
        player.h           = player.sprite:getHeight() * 0.5
        -- player.scale       = (game.screen_height * game.screen_width) * 0.01
        player.scale       = 0.05

        player.x           = love.graphics.getWidth() * 0.5
        player.y           = love.graphics.getHeight() * 0.5

        player.angle       = 270 * (math.pi / 180)
        player.speed       = 2
end

------------------------------------------------------------------------------------------------------------------------
-- MOVEMENT AND CONTROLS

controls     = {
        left  = { "a", "h", "left" },
        right = { "d", "l", "right" },
        up    = { "w", "k", "up" },
        down  = { "s", "j", "down" },
}

local isDown = love.keyboard.isDown

function love.update(dt)
        if isDown(controls.left) then
                player.x     = player.x - player.speed
                player.angle = 180 * (math.pi / 180)
        elseif isDown(controls.right) then
                player.x     = player.x + player.speed
                player.angle = 0 * (math.pi / 180)
        elseif isDown(controls.down) then
                player.y     = player.y + player.speed
                player.angle = 90 * (math.pi / 180)
        elseif isDown(controls.up) then
                player.y     = player.y - player.speed
                player.angle = 270 * (math.pi / 180)
        end

        if isDown("escape") then
                love.event.quit(0)
        end

        function love.keypressed()
                if isDown("f") then
                        fullscreen = not fullscreen
                        love.window.setFullscreen(fullscreen, "exclusive")
                end
        end
end

function love.draw()
        love.graphics.draw(
                player.sprite,
                player.x,
                player.y,
                player.angle,
                -- player.scale.x,
                -- player.scale.y,
                player.scale,
                player.scale,
                player.h,
                player.w
        )
end
