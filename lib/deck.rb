class Deck
    attr_reader :cards

    def initialize(cards)
        @cards = cards
    end

    def rank_of_card_at(index)
        return cards[index].rank
    end

    def high_ranking_cards
        high_ranking_cards_array = [];
        cards.each do |card|
            if card.rank >= 11
                high_ranking_cards_array << card
            end
        end
        return high_ranking_cards_array
    end

    def percent_high_ranking
        percent = (((high_ranking_cards.count).to_f) / (cards.count) * 100).round(2)
        return percent
    end

    def remove_card
    end

    def add_card
    end
end
