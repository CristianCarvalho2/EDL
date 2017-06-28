screenWidth = love.graphics.getWidth()
screenHeight = love.graphics.getHeight()


function love.load()
	imgNave = love.graphics.newImage('nave.png')
	background_image = love.graphics.newImage('background.png')
	moon = love.graphics.newImage('moon2.png')
	
	
	nave = {
		x = screenWidth / 2,
		y = screenWidth /2,
		speed = 150
	}
	
	--bullets
		
	shoot = true
	delayBullet = 0.16
	timeBullet = delayBullet
	
	bullets = {}
	
	imgBullet = love.graphics.newImage('bullet.png')
	--Enemy
	delayEnemy = 0.8
	createEnemyTimer = delayEnemy
	enemies = {}
	imgEnemy = love.graphics.newImage('enemy.png')
	--check life
	
	
	isalive = true

	sco = {'SCORE: ',0.0}
	score = sco[2]
end

--TAREFA-08: Aqui foi utilizado o conceito de co rotina e de
--closure para fazer um objeto qualquer fazer um movimento 
--retangular no canto superior esquerdo da tela, neste caso 
--a imagem de uma lua foi inserida ao jogo.

function new (x,y,vx)
    local me; me = {
        move = function (dx,dy)
             x = x + dx
             y = y + dy
             return x, y
        end,
        get = function ()
             return x, y
        end,
        co = coroutine.create(function (dt)
            while true do
                if(x < 200 and y == 50) then
                    me.move(vx*dt, 0)
                end
                if(x == 200 and y < 150) then
                    me.move(0, vx*dt)
                end
                if(x > 100 and y == 150) then
                    me.move(vx*dt*(-1), 0)
                end
                if(x == 100 and y > 50) then
                    me.move(0, vx*dt*(-1)) 
                end 

		if(x > 200) then
			x=200
		end
		if(x < 100) then
			x=100
		end
		if(y > 150) then
			y=150
		end
		if(y < 50) then
			y=50
		end
                dt = coroutine.yield()
            end
        end),
    }
    return me
end

local o1 = new(0,  290,  100)

function love.update(dt)

	if love.keyboard.isDown("right") then
		if nave.x < (screenWidth - imgNave:getWidth() /2) then
			nave.x = nave.x + nave.speed * dt
		end
	end
	
	if love.keyboard.isDown("left") then
		if nave.x > (0 + imgNave:getWidth() /2) then
			nave.x = nave.x - nave.speed * dt
		end
	end
	
	if love.keyboard.isDown("up") then
		if nave.y > (0 + imgNave:getHeight() /2) then
			nave.y = nave.y - nave.speed * dt
		end
	end
	
	if love.keyboard.isDown("down") then
		if nave.y < (screenHeight - imgNave:getHeight() /2) then
			nave.y = nave.y + nave.speed * dt

		end
	end
	
	gun(dt)
	enemy(dt)
	colision()
	
	if not isalive and love.keyboard.isDown('r') then

		bullets = {}
		enemies = {}
		
		shoot = timeBullet
		createEnemyTimer = delayEnemy
		
		nave.x=screenWidth / 2
		nave.y = screenHeight / 2
		
		isalive = true
		score = sco[2];
	end
	
	coroutine.resume(o1.co, dt)
	
	
end

function colision()
	for i,enemy in ipairs(enemies) do
		for j, bullet in ipairs(bullets) do
			if checkCollision(enemy.x, enemy.y, imgEnemy:getWidth(), imgEnemy:getHeight(), bullet.x, bullet.y, imgBullet:getWidth(), imgBullet:getHeight()) then
				table.remove(bullets, j)
				table.remove(enemies, i)
				score = score + 1
			end
		end
		if checkCollision(enemy.x, enemy.y, imgEnemy:getWidth(), imgEnemy:getHeight(), nave.x - (imgNave:getWidth() / 2), nave.y, imgNave:getWidth(), imgNave:getHeight()) then
		table.remove(enemies,i)
		isalive = false
		end
	end
end

function checkCollision(x1, y1, w1, h1, x2, y2, w2, h2)
	return x1 < x2 + w2 and x2 < x1 + w1 and y1 < y2 + h2 and y2 < y1 + h1
end

function gun(dt)
	timeBullet = timeBullet - (1 * dt)
	if timeBullet < 0 then
		shoot = true
	end
	
	if isalive then
		if love.keyboard.isDown("space") and shoot then
			newBullet = { x = nave.x, y = nave.y, img = imgBullet}
			table.insert (bullets, newBullet)
			shoot = false
			timeBullet = delayBullet
		end
	end
		
	for i, bullet in ipairs(bullets) do
		bullet.y = bullet.y - (300 * dt)
		if bullet.y < 0 then
			table.remove(bullets,i)
		end
	end
end	



function enemy(dt)

	createEnemyTimer = createEnemyTimer - (1 * dt)
	if createEnemyTimer < 0 then
		createEnemyTimer = delayEnemy
		numeroAleatorio = math.random (10, love.graphics.getWidth() - ((imgEnemy:getWidth() / 2) + 10))
		newEnemy = { x = numeroAleatorio, y = -imgEnemy:getWidth(),img = imgEnemy}
	
	table.insert(enemies, newEnemy)
	end
 
	for i, enemy in ipairs(enemies) do
		enemy.y = enemy.y + (100 * dt)
		if enemy.y > 600 then

			table.remove(enemies,i)
		end
	end	
end

function love.draw()
	love.graphics.draw(background_image)

	for i,bullet in ipairs (bullets) do
	love.graphics.draw(bullet.img, bullet.x, bullet.y,0,1,1,imgBullet:getWidth() / 2, imgBullet:getHeight()) 
	end
	
	
	for i,enemy in ipairs (enemies) do
	love.graphics.draw(enemy.img, enemy.x, enemy.y) 
	end
	
	if isalive then
		love.graphics.draw(imgNave,nave.x,nave.y,0,1,1,imgNave:getWidth() / 2, imgNave:getHeight() /2)
	else
		love.graphics.print("Pressione 'r' para o jogo reiniciar",screenWidth /3,screenHeight / 2)
	end
	
	love.graphics.print(tostring(sco[1]).. tostring(score), 400, 10)

	local x,y = o1.get()
	love.graphics.draw(moon, x, y,moon.x,moon.y)
end
