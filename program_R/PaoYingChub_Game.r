#Play at -> https://replit.com/@WarisaraBoontha/Pao-Ching-Chub#main.r
print("Welcome to Pao Ching Chub game")
print("Your Username:")
user_name <- readLines("stdin", n=1) 
print("Game Rule:")
print("You will play against Bot A ")
print("Rock wins Scissors ")
print("Scissors wins Paper")
print("Paper wins Rock ")

print("-------------------------------------")
print("!!!! Let START !!!!!")

  #Count summary
    count <- 0
    win <- 0
    draw <- 0
    lose <- 0


  #Your Turn
    while (TRUE){
      print("--------------------------------")
       print("Please choose a number")
      print("1.Rock 2. Paper 3. Scissors 4. Exit")
      action <- as.numeric(readLines("stdin", n=1))

    bot <-c("Rock","Paper","Scissors")
    bot_a <- sample(bot, size = 1)
      
     ## You play Rock
     if (action == 1){
          if(bot_a == "Rock"){
             print("You play: Rock")
            print(paste("Bot play:",bot_a))
            print("You Draw!")
            count <- count + 1
            draw <- draw + 1
  
            
             } else if(bot_a == "Paper"){
              print("You play: Rock")
              print(paste("Bot play:",bot_a))
              print("You Lose")
              count <- count + 1
              lose <- lose + 1
            
             } else if(bot_a == "Sriccors"){
              print("You play: Rock")
              print(paste("Bot play:",bot_a))
              print("You Won")
              count <- count + 1
              win <- win + 1
            } 
     ## You play Paper
        } else if (action == 2){
          if(bot_a == "Rock"){
          print("You play: Paper")
          print(paste("Bot play:",bot_a))
          print("You Won!")
          count <- count + 1
          win <- win + 1
            
          } else if(bot_a == "Paper"){
          print("You play: Paper")
          print(paste("Bot play:",bot_a))
          print("You Draw")
          count <- count + 1
            draw <- draw + 1
            
          } else if(bot_a == "Sriccors"){
          print("You play: Paper")
          print(paste("Bot play:",bot_a))
          print("You Lose")
          count <- count + 1
          lose <- lose + 1
          } 
        ## You play Scrissors
      } else if (action == 3){
          if(bot_a == "Rock"){
          print("You play: Scrissors")
          print(paste("Bot play:",bot_a))
          print("You Lose!")
          count <- count + 1
          lose <- lose + 1
            
          } else if(bot_a == "Paper"){
          print("You play: Scrissors")
          print(paste("Bot play:",bot_a))
          print("You Win")
          count <- count + 1
          win <- win + 1
            
          } else if(bot_a == "Sriccors"){
          print("You play: Scrissors")
          print(paste("Bot play:",bot_a))
          print("You Draw")
          count <- count + 1
            draw <- draw + 1
          } 
      ##Exit
       
      } else if (action == 4){  
         print("You Exit")
            print("You Scores:")
            print(paste("Total Round:", count))
            print(paste("Total Won:", win))
            print(paste("Total Lost:", lose))
            print(paste("Total Draw:", draw))
          break        
          } else {
        print("Please Try agian")
      }
      
 }
     
       
    
      
       
      
      
 


  


  
