require 'rspec'
require './lib/deck'
require './lib/card'

RSpec.describe Deck do
    it 'initializes Deck class' do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3) 
        card3 = Card.new(:heart, 'Ace', 14)
        cards = [card1, card2, card3]

        deck = Deck.new(cards)

        expect(deck).to be_an_instance_of(Deck)
    end

    it 'can display cards in deck' do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3) 
        card3 = Card.new(:heart, 'Ace', 14)
        cards = [card1, card2, card3]

        deck = Deck.new(cards)

        expect(deck.cards).to eq([card1, card2, card3])
    end

    it 'can return rank of card at index 0' do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3) 
        card3 = Card.new(:heart, 'Ace', 14)
        cards = [card1, card2, card3]

        deck = Deck.new(cards)
        
        expect(deck.rank_of_card_at(0)).to eq(12)
        expect(deck.rank_of_card_at(2)).to eq(14)
    end

    it 'can return rank of card at index 2' do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3) 
        card3 = Card.new(:heart, 'Ace', 14)
        cards = [card1, card2, card3]

        deck = Deck.new(cards)
        
        expect(deck.rank_of_card_at(2)).to eq(14)
    end

    it 'can return high ranking cards' do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3) 
        card3 = Card.new(:heart, 'Ace', 14)
        cards = [card1, card2, card3]

        deck = Deck.new(cards)
        
        expect(deck.high_ranking_cards).to eq([card1, card3])
    end

    it 'can return the percentage of high ranking cards' do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3) 
        card3 = Card.new(:heart, 'Ace', 14)
        cards = [card1, card2, card3]

        deck = Deck.new(cards)
        
        expect(deck.percent_high_ranking).to eq(66.67)
    end

    it 'can remove top card from the deck' do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3) 
        card3 = Card.new(:heart, 'Ace', 14)
        cards = [card1, card2, card3]

        deck = Deck.new(cards)

        expect(deck.remove_card).to eq(card1)
    end

    it 'shows next high ranking cards after removal' do
        card2 = Card.new(:spade, '3', 3) 
        card3 = Card.new(:heart, 'Ace', 14)
        cards = [card2, card3]

        deck = Deck.new(cards)

        expect(deck.high_ranking_cards).to eq([card3])
    end

    it 'shows percent ranking cards after removal' do
        card2 = Card.new(:spade, '3', 3) 
        card3 = Card.new(:heart, 'Ace', 14)
        cards = [card2, card3]

        deck = Deck.new(cards)

        expect(deck.percent_high_ranking).to eq(50.0)
    end

    it 'can add new card to bottom of deck' do
        card2 = Card.new(:spade, '3', 3) 
        card3 = Card.new(:heart, 'Ace', 14)
        card4 = Card.new(:club, '5', 5)
        cards = [card2, card3]

        deck = Deck.new(cards)

        expect(deck.add_card(card4)).to eq([card2, card3, card4])
    end

    it 'shows high ranking cards after adding card 4' do
        card2 = Card.new(:spade, '3', 3) 
        card3 = Card.new(:heart, 'Ace', 14)
        card4 = Card.new(:club, '5', 5)
        cards = [card2, card3, card4]

        deck = Deck.new(cards)

        expect(deck.high_ranking_cards).to eq([card3])
    end

    it 'shows percent high ranking after adding card 4' do
        card2 = Card.new(:spade, '3', 3) 
        card3 = Card.new(:heart, 'Ace', 14)
        card4 = Card.new(:club, '5', 5)
        cards = [card2, card3, card4]

        deck = Deck.new(cards)

        expect(deck.percent_high_ranking).to eq(33.33)
    end
end
