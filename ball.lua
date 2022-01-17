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
  ball:collision()
  ball:move(dt)
end

function ball:draw()
  love.graphics.rectangle("fill", ball.x, ball.y, ball.width, ball.width)
end

function ball:move(dt)
  ball.x = ball.x + (ball.xVel * dt)
  ball.y = ball.y + (ball.yVel * dt)
end

function ball:collision()
  ball:paddleCollision(player)
  ball:paddleCollision(enemy)
  ball:wallCollision()
end

function ball:wallCollision()
  if ball.y <= 0 or ball.y + ball.width >= love.graphics.getHeight() then
    ball.yVel = -ball.yVel
  end
end

function ball:paddleCollision(paddle)
  if ball.x < paddle.x + paddle.width and ball.x + ball.width > paddle.x and ball.y < paddle.y + paddle.height and ball.y + ball.width > paddle.y then
    ball:reverse()
    if ball.y + (ball.width / 2) < paddle.y + paddle.height / 3 then
      ball.yVel = -300
    elseif ball.y + (ball.width / 2) < paddle.y + (paddle.height / 3) * 2 then
      ball.yVel = 0
    else
      ball.yVel = 300
    end
  end
end

function ball:reverse()
  ball.xVel = -ball.xVel
  ball.xVel = ball.xVel + 25
end
