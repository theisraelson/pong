require("player")
require("enemy")
require("ball")

function love.load()
  player:load()
  enemy:load()
  ball:load()
end

function love.update(dt)
  player:update(dt)
  enemy:update(dt)
  ball:update(dt)
end

function love.draw()
  player:draw()
  enemy:draw()
  ball:draw()
end
