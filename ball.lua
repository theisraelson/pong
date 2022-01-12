require("player")
ball = {}

function ball:load()
  ball.width = 20
  ball.x = love.graphics.getWidth() / 2 - ball.width / 2
  ball.y = love.graphics.getHeight() / 2 - ball.width / 2
  ball.xVel = -300
  ball.yVel = 0
end

function ball:update(dt)
  ball:move(dt)
  ball:collision()
end

function ball:draw()
  love.graphics.rectangle("fill", ball.x, ball.y, ball.width, ball.width)
end

function ball:move(dt)
  ball.x = ball.x + (ball.xVel * dt)
  ball.y = ball.y + (ball.yVel * dt)
end

function ball:collision()
  if ball.x < player.x + player.width then
    ball.xVel = -ball.xVel
    if ball.y < player.y + (player.height / 3) then
      ball.yVel = -200
    elseif ball.y < player.y + (player.height / 3 * 2) then
      ball.yVel = 0
    else
      ball.yVel = 200
    end
  end
end
