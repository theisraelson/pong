require("ball")
enemy = {}

function enemy:load()
  enemy.width = 50
  enemy.height = 200
  enemy.x = love.graphics.getWidth() - 50 - enemy.width
  enemy.y = love.graphics.getHeight() / 2 - enemy.height / 2
  enemy.speed = 250
end

function enemy:update(dt)
  enemy:move(dt)
  enemy:collision()
end

function enemy:draw()
  love.graphics.rectangle("fill", enemy.x, enemy.y, enemy.width, enemy.height)
end

function enemy:move(dt)
  if ball.x > love.graphics.getWidth() / 2 then
    enemy:setVel(dt)
  end
end

function enemy:setVel(dt)
  if ball.y + ball.width < enemy.y + enemy.height then
    enemy.y = enemy.y - enemy.speed * dt
  elseif ball.y + ball.width > enemy.y + enemy.height then
    enemy.y = enemy.y + enemy.speed * dt
  end
end

function enemy:collision()
  if enemy.y < 0 then
    enemy.y = 0
  elseif enemy.y + enemy.height > love.graphics.getHeight() then
    enemy.y = love.graphics.getHeight() - enemy.height
  end
end
