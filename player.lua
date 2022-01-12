player = {}

function player:load()
  player.width = 50
  player.height = 200
  player.x = 50
  player.y = love.graphics.getHeight() / 2 - player.height / 2
  player.speed = 300
end

function player:update(dt)
  player:move(dt)
end

function player:draw()
  love.graphics.rectangle("fill", player.x, player.y, player.width, player.height)
end

function player:move(dt)
  if love.keyboard.isDown("up") then
    player.y = player.y - player.speed * dt
  end
  if love.keyboard.isDown("down") then
    player.y = player.y + player.speed * dt
  end
  player:collision()
end

function player:collision()
  if player.y < 0 then
    player.y = 0
  elseif player.y + player.height > love.graphics.getHeight() then
    player.y = love.graphics.getHeight() - player.height
  end
end
