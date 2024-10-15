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
       if player1.deck.cards.size < 3 || player2.deck.cards.size < 3
            return :basic
       else 
            if player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) && player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2)
                return :mutually_assured_destruction  
            elsif player1.deck.rank_of_card_at(0) != player2.deck.rank_of_card_at(0)
                return :basic
            elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)
                return :war
            end
       end
    end

    def winner
        if type == :basic
            if player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0)
                return player1
            else 
                return player2
            end
        elsif type == :war
            if player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2)
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
            @spoils_of_war << player1.deck.remove_card
            @spoils_of_war << player2.deck.remove_card
        elsif type == :war
            player1_cards = player1.deck.cards[0..2]
            @spoils_of_war.concat(player1_cards)
            player1.deck.cards.shift(3)

            player2_cards = player2.deck.cards[0..2]
            @spoils_of_war.concat(player2_cards)
            player2.deck.cards.shift(3)

        elsif type == :mutually_assured_destruction
            player1.deck.cards.shift(3)
            player2.deck.cards.shift(3)
        end
    end

    def award_spoils(winner)
        while @spoils_of_war.any?
            card = @spoils_of_war.shift
            winner.deck.cards << card
        end
        @spoils_of_war.clear
    end
end
