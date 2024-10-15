require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'
require 'pry'

class Game
    def initialize(shuffled_card_deck)
        @cards = shuffled_card_deck
        @deck1 = Deck.new(@cards[0..25])
        @deck2 = Deck.new(@cards[26..51])
        @player1 = Player.new("Megan", @deck1)
        @player2 = Player.new("Aurora", @deck2)
        @turn = Turn.new(@player1, @player2)
    end

    def start
        p "Welcome to War! (or Peace) This game will be played with 52 cards."
        p "The players today are Megan and Aurora."
        prompt_user
    end

    def prompt_user
        p "Type 'GO' to start the game!"
        p "------------------------------------------------------------------"
        user_input = gets.chomp

        if user_input == 'GO'
            #p "Game is starting"
            play_game
        else
            p "Invalid input! Please type 'GO' to start the game!"
            prompt_user
        end
    end

    def play_game
        count = 0

        until count == 1000000
        # until count == 500
            @turn.pile_cards
            count += 1

            #p "Player 1 has #{@player1.deck.cards.count} cards left"
            #p "Player 2 has #{@player2.deck.cards.count} cards left"

            if @player1.has_lost?
                p "*~*~*~* #{@player2.name} has won the game! *~*~*~*"
                break
            elsif @player2.has_lost?
                p "*~*~*~* #{@player1.name} has won the game! *~*~*~*"  
                break
            end

            if @turn.type == :basic
                @turn.award_spoils(@turn.winner)
                p "Turn #{count}: #{@turn.winner.name} won 2 cards"
            elsif @turn.type == :war
                @turn.award_spoils(@turn.winner)
                p "Turn #{count}: WAR - #{@turn.winner.name} won 6 cards"
            elsif @turn.type == :mutually_assured_destruction
                p "Turn #{count}: *mutually assured destruction* 6 cards removed from play"
            end
            draw(count)
        end 
    end

    def draw(count)
        if count == 1000000
        # if count == 500
            p "---- DRAW ----"
        end
    end
end


