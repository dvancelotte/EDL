screenWidth = love.graphics.getWidth()
screenHeight = love.graphics.getHeight()


-- Tamanho padrão dos Blocos.
default_block_size = 20

-- Pontuação máxima.
high_score = 0

-- Flag de Gameover.
gameover = false

-- Flag de Debug.
debug = false

-- Variavel splashscreen
local splash
local o_ten_one = require "o-ten-one"

-- Flag de Carregamento
loading = true

function love.load ()

  -- Carregamento da Lib de splashscreen
  splash = o_ten_one({fill="lighten",delay_after = 3})
  splash.onDone = function() loading = false end

  -- Título do Jogo.
  love.window.setTitle("Snake Game" )

  -- Sons do Jogo.
  sound_eating =  love.audio.newSource("eating.wav", "static")
  sound_gameover = love.audio.newSource("gameover.wav", "static")

  -- Inicializa a Cor do Cenário
  love.graphics.setBackgroundColor(255,255,255)
    
  -- Inicializa a Cor das Linhas de Demarcação do Cenário.
  love.graphics.setColor(0,0, 0)

  -- Define os limites do cenário na tela. ( Xi , Yi )
  scenarioLimits = {
    10,20,
    10,screenHeight-10,
    screenWidth-10,screenHeight-10,
    screenWidth-10,20,
    10,20
  }

  -- Iniciliza o Jogador.
  player = {
    pos = {
      current = {
        x = screenWidth/2,
        y = screenHeight/2
      },
      previous = {
        x = nil,
        y = nil

      }
    },
    direction = {
      x = 1,
      y = 0,
    },
    body = {
      size = 0,
      speed = 1400,
      gap = 1,
      blocks = {}

    }
  }
    

  food = {
    pos = {
      x = nil,
      y = nil
    },
    isAlive = false
  }
    

     --[[trabalho 07
            Array: foodEspecial
            Escopo: foodEspecial é uma variável global
            Tempo de vida: Sua duração é o tempo em que o programa é executado.
            Alocação: É incrementado ao iniciar o programa e quando o jogado come uma comida especial no qual seu luck é 1
            Desalocação: Por completo quando o programa é encerrado e quando o jogado come uma comida especial no qual seu luck é 2
    
            Esta variavel é responsavel por criar comidas especiais com cores diferentes a cada ciclo de score divisivel por 5.
    ]]--    
    
    
foodEspecial = {{
    pos = {
      x = nil,
      y = nil
    },
    isAlive = false,
    color = { r = 123, g = 231 , b = 132 }         
    
  },{
    pos = {
      x = nil,
      y = nil
    },
    isAlive = false,
    color = { r = 44, g = 99 , b = 21 }
  },{
    pos = {
      x = nil,
      y = nil
    },
    isAlive = false,
    color = { r = 120, g = 91 , b = 12 }        
  },{
    pos = {
      x = nil,
      y = nil
    },
    isAlive = false,
    color = { r = 123, g = 221 , b = 255 }    
  }}
  
  tot = 3
  count = love.math.random(1,tot)
 


  print("Criei Corpo do Player! : " .. tostring(player.body.size) .. "    x: " .. tostring(player.pos.current.x) .. "    y: " .. tostring(player.pos.current.y))

    -- Inicializa dois blocos ao Jogador e Inicializa comida no cenário.
    for i = 1,4 do

      initialPosX = player.pos.current.x - ( ( default_block_size + player.body.gap ) * ( player.body.size + 1 ) ) * player.direction.x

      new_block = playerAddBlock(initialPosX,player.pos.current.y)

      table.insert(player.body.blocks, new_block)
    end

    -- Inicializa a comida no cenário.
    respawnPlayerFood()

    -- Inicializa o limitador de tickRate.
    accumulator = {
      current = 0,
      limit= 0.1
    }

  end

  function love.keypressed (key)

    if key == 'left' or key == 'd' then
      if player.direction.x ~=1 and player.direction.y ~=0 then
        player.direction.x = -1
        player.direction.y = 0
      end
    elseif key == 'right' then
      if player.direction.x ~=-1 and player.direction.y ~=0 then
        player.direction.x = 1
        player.direction.y = 0
      end
    elseif key == 'up' then
      if player.direction.x ~= 0 and player.direction.y ~=1 then
        player.direction.x = 0
        player.direction.y = -1
      end
    elseif key == 'down' then
      if player.direction.x ~= 0 and player.direction.y ~=-1 then
        player.direction.y = 1
        player.direction.x = 0
      end
    elseif key == 'f' then
      playerAddBlock()
    elseif key == '2' then
      player.body.speed = player.body.speed + 50
    elseif key == '1' then
      player.body.speed = player.body.speed - 50
    elseif key == 'r' and gameover then
      gameover = false
      love.load()
    end
  end

  -- Adiciona um bloco ao Jogador.
  function playerAddBlock(x,y)
    
    -- Estrutura do Novo Bloco.
    new_block = {
      pos = {
        x = x,
        y = y
      }
    }

    player.body.size = player.body.size + 1
    

    
    
    print("Criei Corpo no Player! : " .. tostring(player.body.size) .. "    x: " .. tostring(new_block.pos.x) .. "    y: " .. tostring(new_block.pos.y))

    return new_block

  end

  function newfoodAdd()

    newfood= {pos = {
              x = nil,
              y = nil
            },
            isAlive = false,
            color = { r = 123, g = 231 , b = 132 }         

}
    tot = tot+1
    return newfood
  end






  -- Atualiza a posição da Comida.
  function respawnPlayerFood()

    food.pos.x = love.math.random(20, screenWidth - 30)
    food.pos.y = love.math.random(20, screenHeight - 30)
    
    food.isAlive = true

        
  end 

function respawnEspecialFood()
    if(foodEspecial[count].isAlive == false)then
         foodEspecial[count].pos.x = love.math.random(20, screenWidth - 30)
         foodEspecial[count].pos.y = love.math.random(20, screenHeight - 30)
         foodEspecial[count].isAlive = true
    end
  end

  -- Ativa o modo gameOver no Jogo.
  function gameOver()

    if not gameover then
      love.audio.play( sound_gameover )
      gameover = true
      player_movement_speed = 0
      high_score = player.body.size
    end


  end

  -- Atualiza o placar do jogo.
  function updatescore()
    
    if(player.body.size > high_score) then
      high_score = player.body.size
    end
      
  
    
  end



  -- Jogador colidindo com as paredes.
  function playerWallCollision ()

    if player.pos.current.x <= 10 or player.pos.current.x >= screenWidth-10 - default_block_size  or player.pos.current.y <= 20  or player.pos.current.y >= screenHeight-10 -default_block_size then
      player.body.speed = 0
      gameOver()
    end
  end

  -- Jogador colidindo com algum outro bloco
  function blockCollision (player, block)
    return ( player.pos.current.x + default_block_size >= block.pos.x ) and ( player.pos.current.x <= block.pos.x + default_block_size) and ( player.pos.current.y + default_block_size >= block.pos.y) and ( player.pos.current.y <= block.pos.y + default_block_size )
  end

  function love.update (dt)

    -- Splash Screen sendo executada
    if loading then
      splash:update(dt)
      return true
    end

    -- Acumulador do dt.
    accumulator.current = accumulator.current + dt

    -- Limita o tickRate do jogo e verifica gameOver.
    if (accumulator.current >= accumulator.limit and gameover == false) then

      accumulator.current = accumulator.current-accumulator.limit;

      -- Guarda a posição antiga do jogador.
      player.pos.previous.x = player.pos.current.x
      player.pos.previous.y = player.pos.current.y

      -- Atualiza a posição atual do jogador.
      player.pos.current.x = player.pos.current.x + ( player.direction.x * player.body.speed * dt )
      player.pos.current.y = player.pos.current.y + ( player.direction.y * player.body.speed * dt )

      -- Verifica a colisão entre player e parede.
      playerWallCollision()

      -- Verifica a colisão entre player e seus blocos do corpo.
      for i,block in ipairs(player.body.blocks) do
        if (blockCollision(player,block) == true) then
          player.body.speed = 0
          gameOver()
        end
      end

      -- Colisão entre player e comida.
      if (blockCollision(player,food)) then

        tail = playerAddBlock(player.pos.previous.x , player.pos.previous.y)
        love.audio.play( sound_eating )
        respawnPlayerFood()
      else
        if(foodEspecial[count].isAlive and blockCollision(player,foodEspecial[count]) == false or foodEspecial[count].isAlive==false )then
            tail = table.remove(player.body.blocks,player.body.size)
            tail.pos.x = player.pos.previous.x
            tail.pos.y = player.pos.previous.y
        end 
      end
        
    if(foodEspecial[count].isAlive == true)then
        if (blockCollision(player,foodEspecial[count])) then
              --luck = 2
            count = love.math.random(1,tot)
            luck = love.math.random(0, 2)
            if(luck == 1)then
                tail = playerAddBlock(player.pos.previous.x , player.pos.previous.y)
                love.audio.play( sound_eating )
                 nfood = newfoodAdd()
                 --trabalho07 
                 table.insert(foodEspecial,nfood)
            else
                --trabalho07
                table.remove(foodEspecial,count)
                tot = tot -1;
                tail = table.remove(player.body.blocks,player.body.size)
                tail.pos.x = player.pos.previous.x
                tail.pos.y = player.pos.previous.y
                love.audio.play( sound_gameover )
                player.body.size = player.body.size-1;  
            end
                
                
          end
    end

        
      -- Funcionamento do FILO ( First In Last Out )
      table.insert(player.body.blocks,1,tail)

      -- Atualiza a pontuação.
      updatescore()
       if(player.body.size % 5 ==0)then
            respawnEspecialFood()
        else
           foodEspecial[count].isAlive = false
        end

    end
  end

  -- Desenha o Jogador e seus blocos.
  function drawPlayer()

    love.graphics.setColor(255, 0, 0, 180)

    -- Desenho do Jogador. ( Cabeça )
    love.graphics.rectangle( "fill", player.pos.current.x, player.pos.current.y, default_block_size, default_block_size )

    love.graphics.setColor(0, 0, 0, 255)

    -- Desenho do Corpo.
    for i,block in ipairs(player.body.blocks) do
      love.graphics.rectangle( "fill", block.pos.x, block.pos.y, default_block_size, default_block_size )
    end

    --Desenho do status
    love.graphics.print("Body Size " .. tostring(player.body.size) , 5, 5)
    love.graphics.print("Speed " .. tostring(player.body.speed) , 150, 5)
    love.graphics.print("High Score " .. tostring(high_score) , screenWidth-150, 5)

    -- Mostra a posição do Jogador.
    if (debug == true) then
      love.graphics.print("x " .. tostring(player.pos.current.x) , screenWidth-150, 20)
      love.graphics.print("y " .. tostring(player.pos.current.y) , screenWidth-150, 30)
    end
  end


  function love.draw()

    -- Verifica se não é a SplashScreen que tem que desenhar.
    if not loading then
      -- Desenho do Cenário.
      love.graphics.line(scenarioLimits)

      -- Desenha o Jogador.
      drawPlayer()

      -- Desenho da Comida.
      if (food.isAlive) then
        love.graphics.setColor(0,0,255)
        love.graphics.rectangle( "fill", food.pos.x, food.pos.y, default_block_size, default_block_size )
      end   
        
    if (foodEspecial[count].isAlive) then
        love.graphics.setColor(foodEspecial[count].color.r,foodEspecial[count].color.g,foodEspecial[count].color.b)
        love.graphics.rectangle( "fill", foodEspecial[count].pos.x, foodEspecial[count].pos.y, default_block_size, default_block_size )
    end      
        

      if(gameover) then
        love.graphics.print("Press R to restart game", screenWidth/2 - 70, screenHeight/2)
      end
    else
      -- Desenho da splashscreen
      splash:draw()
    end

  end
