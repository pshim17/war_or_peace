class Start
    def start
        p "Welcome to War! (or Peace)" 
        p "This game will be played with 52 cards."
        p "The players today are Megan and Aurora."
        prompt_user
    end

    def prompt_user
        p "Type 'GO' to start the game!"
        p "------------------------------------------------------------------"
        user_input = gets.chomp

        if user_input == 'GO'
            p "Game is starting"
            #play_game
        else
            p "Invalid input! Please type 'GO' to start the game!"
            prompt_user
        end
    end

    def play_game
        
    end
end

game = Start.new
game.start