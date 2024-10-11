class Turn
    attr_reader :player1,
                :player2,
                :spoils_of_war

    def initialize (player1, player2)
        @player1 = player1
        @player2 = player2
        @spoils_of_war = []
    end

    def type 
       if player1.deck.cards[0].rank != player2.deck.cards[0].rank
            return :basic
       elsif player1.deck.cards[0].rank == player2.deck.cards[0].rank
            return :war
       elsif (player1.deck.cards[0].rank == player2.deck.cards[0].rank) && (player1.deck.cards[2].rank == player2.deck.cards[2].rank)
            return :mutually_assured_destruction
       end
    end

    def winner
        if type == :basic
            if player1.deck.cards[0].rank > player2.deck.cards[0].rank
                return player1
            else 
                return player2
            end
        elsif type == :war
            if player1.deck.cards[2].rank > player2.deck.cards[2].rank
                return player1
            else
                return player2
            end
        elsif type == :mutually_assured_destruction
            return "No Winner"
        end
    end

    def pile_cards
        if type == :basic
            @spoils_of_war << player1.deck.cards[0]
            player1.deck.cards.delete_at(0)

            @spoils_of_war << player2.deck.cards[0]
            player2.deck.cards.delete_at(0)
        elsif type == :war
            @spoils_of_war.concat(player1.deck.cards[0..2])
            player1.deck.cards.shift(3)

            @spoils_of_war.concat(player2.deck.cards[0..2])
            player2.deck.cards.shift(3)

        elsif type == :mutually_assured_destruction
            puts "hello"
        end
    end

    def award_spoils(winner)
        @spoils_of_war.each {|value| 
            winner.deck.cards << value
        }
    end
end