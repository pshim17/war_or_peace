require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'

RSpec.describe Player do
    it 'can initialize' do 
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3)    
        card3 = Card.new(:heart, 'Ace', 14) 
        cards = [card1, card2, card3]
        
        deck = Deck.new(cards)

        player = Player.new('Clarisa', deck)

        expect(player).to be_an_instance_of(Player)
    end

    it 'displays player name' do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3)    
        card3 = Card.new(:heart, 'Ace', 14) 
        cards = [card1, card2, card3]
        
        deck = Deck.new(cards)

        player = Player.new('Clarisa', deck)

        expect(player.name).to eq("Clarisa")
    end

    it 'displays player deck' do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3)    
        card3 = Card.new(:heart, 'Ace', 14) 
        cards = [card1, card2, card3]
        
        deck = Deck.new(cards)

        player = Player.new('Clarisa', deck)

        expect(player.deck).to eq(deck)
    end

    it 'shows whether the player has lost the game or not' do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3)    
        card3 = Card.new(:heart, 'Ace', 14) 
        cards = [card1, card2, card3]
        
        deck = Deck.new(cards)

        player = Player.new('Clarisa', deck)

        expect(player.has_lost?).to eq(false)
    end

    it "removes the top card from the deck - round 1" do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3)    
        card3 = Card.new(:heart, 'Ace', 14) 
        cards = [card1, card2, card3]
        
        deck = Deck.new(cards)

        player = Player.new('Clarisa', deck)

        expect(player.deck.remove_card).to eq(card1)
    end

    it "displays whether player has lost the game after removal of card (round 1)" do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3)    
        card3 = Card.new(:heart, 'Ace', 14) 
        cards = [card1, card2, card3]
        
        deck = Deck.new(cards)

        player = Player.new('Clarisa', deck)

        expect(player.has_lost?).to eq(false)
    end

    it "removes the top card from the deck again - round 2" do
        card2 = Card.new(:spade, '3', 3)    
        card3 = Card.new(:heart, 'Ace', 14) 
        cards = [card2, card3]
        
        deck = Deck.new(cards)

        player = Player.new('Clarisa', deck)

        expect(player.deck.remove_card).to eq(card2)
    end

    it "displays whether player has lost the game after the removal of card (round 2)" do
        card3 = Card.new(:heart, 'Ace', 14) 
        cards = [card3]
        
        deck = Deck.new(cards)

        player = Player.new('Clarisa', deck)

        expect(player.has_lost?).to eq(false)
    end

    it "removes the top card from the deck again - round 3" do
        card3 = Card.new(:heart, 'Ace', 14) 
        cards = [card3]
        
        deck = Deck.new(cards)

        player = Player.new('Clarisa', deck)

        expect(player.deck.remove_card).to eq(card3)
    end

    it "displays whether player has lost the game after the removal of card (round 3)" do
        cards = []
        
        deck = Deck.new(cards)

        player = Player.new('Clarisa', deck)

        expect(player.has_lost?).to eq(true)
    end

    it "confirms the player's deck is empty and the player has indeed lost the game " do
        cards = []
        
        deck = Deck.new(cards)

        player = Player.new('Clarisa', deck)

        expect(player.deck.cards).to eq([])
    end   
end