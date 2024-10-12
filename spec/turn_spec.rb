require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

describe Turn do
    it "#initializes player1 and player2" do
        card1 = Card.new(:heart, 'Jack', 11)
        card2 = Card.new(:heart, '10', 10)    
        card3 = Card.new(:heart, '9', 9)    
        card4 = Card.new(:diamond, 'Jack', 11)    
        card5 = Card.new(:heart, '8', 8)    
        card6 = Card.new(:diamond, 'Queen', 12)    
        card7 = Card.new(:heart, '3', 3)    
        card8 = Card.new(:diamond, '2', 2)    

        deck1 = Deck.new([card1, card2, card5, card8])    
        deck2 = Deck.new([card3, card4, card6, card7])    

        player1 = Player.new("Megan", deck1)    
        player2 = Player.new("Aurora", deck2)    

        turn = Turn.new(player1, player2)   
        
        expect(turn).to be_an_instance_of(Turn)
        expect(turn.player1.name).to eq("Megan")
        expect(turn.player2.name).to eq("Aurora")
    end

    # :basic
    it 'returns turn type as :basic' do
        card1 = Card.new(:heart, 'Jack', 11)
        card2 = Card.new(:heart, '10', 10)    
        card3 = Card.new(:heart, '9', 9)    
        card4 = Card.new(:diamond, 'Jack', 11)    
        card5 = Card.new(:heart, '8', 8)    
        card6 = Card.new(:diamond, 'Queen', 12)    
        card7 = Card.new(:heart, '3', 3)    
        card8 = Card.new(:diamond, '2', 2)    

        deck1 = Deck.new([card1, card2, card5, card8])    
        deck2 = Deck.new([card3, card4, card6, card7])    

        player1 = Player.new("Megan", deck1)    
        player2 = Player.new("Aurora", deck2)    

        turn = Turn.new(player1, player2) 

        expect(turn.type).to eq(:basic)
    end

    it 'displays the winner of :basic turn' do
        card1 = Card.new(:heart, 'Jack', 11)
        card2 = Card.new(:heart, '10', 10)    
        card3 = Card.new(:heart, '9', 9)    
        card4 = Card.new(:diamond, 'Jack', 11)    
        card5 = Card.new(:heart, '8', 8)    
        card6 = Card.new(:diamond, 'Queen', 12)    
        card7 = Card.new(:heart, '3', 3)    
        card8 = Card.new(:diamond, '2', 2)    

        deck1 = Deck.new([card1, card2, card5, card8])    
        deck2 = Deck.new([card3, card4, card6, card7])    

        player1 = Player.new("Megan", deck1)    
        player2 = Player.new("Aurora", deck2)    

        turn = Turn.new(player1, player2) 

        expect(turn.winner).to eq(player1)
    end

    it 'runs pile_cards and checks the spoils_of_war to make sure the cards are there' do
        card1 = Card.new(:heart, 'Jack', 11)
        card2 = Card.new(:heart, '10', 10)    
        card3 = Card.new(:heart, '9', 9)    
        card4 = Card.new(:diamond, 'Jack', 11)    
        card5 = Card.new(:heart, '8', 8)    
        card6 = Card.new(:diamond, 'Queen', 12)    
        card7 = Card.new(:heart, '3', 3)    
        card8 = Card.new(:diamond, '2', 2)    

        deck1 = Deck.new([card1, card2, card5, card8])    
        deck2 = Deck.new([card3, card4, card6, card7])    

        player1 = Player.new("Megan", deck1)    
        player2 = Player.new("Aurora", deck2)    

        turn = Turn.new(player1, player2) 
        turn.pile_cards
        expect(turn.spoils_of_war).to eq([card1, card3])
    end

    it 'awards the two cards from spoils_of_war to :basic winner' do
        card1 = Card.new(:heart, 'Jack', 11)
        card2 = Card.new(:heart, '10', 10)    
        card3 = Card.new(:heart, '9', 9)    
        card4 = Card.new(:diamond, 'Jack', 11)    
        card5 = Card.new(:heart, '8', 8)    
        card6 = Card.new(:diamond, 'Queen', 12)    
        card7 = Card.new(:heart, '3', 3)    
        card8 = Card.new(:diamond, '2', 2)    

        deck1 = Deck.new([card1, card2, card5, card8])    
        deck2 = Deck.new([card3, card4, card6, card7])    

        player1 = Player.new("Megan", deck1)    
        player2 = Player.new("Aurora", deck2)    

        turn = Turn.new(player1, player2) 
        winner = turn.winner
        turn.pile_cards
        expect(turn.spoils_of_war).to eq([card1, card3])
        turn.award_spoils(winner)

        expect(turn.player1.deck.cards.size).to eq(5)
        expect(turn.player2.deck.cards.size).to eq(3)
    end

    # :war
    it 'returns turn type :war' do
        card1 = Card.new(:heart, 'Jack', 11)
        card2 = Card.new(:heart, '10', 10)    
        card3 = Card.new(:heart, '9', 9)    
        card4 = Card.new(:diamond, 'Jack', 11)    
        card5 = Card.new(:heart, '8', 8)    
        card6 = Card.new(:diamond, 'Queen', 12)    
        card7 = Card.new(:heart, '3', 3)    
        card8 = Card.new(:diamond, '2', 2)    

        deck1 = Deck.new([card1, card2, card5, card8])    
        deck2 = Deck.new([card4, card3, card6, card7])    

        player1 = Player.new("Megan", deck1)    
        player2 = Player.new("Aurora", deck2)    

        turn = Turn.new(player1, player2) 

        expect(turn.type).to eq(:war)
    end

    it 'displays the winner :war' do
        card1 = Card.new(:heart, 'Jack', 11)
        card2 = Card.new(:heart, '10', 10)    
        card3 = Card.new(:heart, '9', 9)    
        card4 = Card.new(:diamond, 'Jack', 11)    
        card5 = Card.new(:heart, '8', 8)    
        card6 = Card.new(:diamond, 'Queen', 12)    
        card7 = Card.new(:heart, '3', 3)    
        card8 = Card.new(:diamond, '2', 2)    

        deck1 = Deck.new([card1, card2, card5, card8])    
        deck2 = Deck.new([card4, card3, card6, card7])    

        player1 = Player.new("Megan", deck1)    
        player2 = Player.new("Aurora", deck2)    

        turn = Turn.new(player1, player2) 

        expect(turn.winner).to eq(player2)
    end

    it 'runs pile_cards and checks the spoils_of_war to make sure the cards are there' do
        card1 = Card.new(:heart, 'Jack', 11)
        card2 = Card.new(:heart, '10', 10)    
        card3 = Card.new(:heart, '9', 9)    
        card4 = Card.new(:diamond, 'Jack', 11)    
        card5 = Card.new(:heart, '8', 8)    
        card6 = Card.new(:diamond, 'Queen', 12)    
        card7 = Card.new(:heart, '3', 3)    
        card8 = Card.new(:diamond, '2', 2)    

        deck1 = Deck.new([card1, card2, card5, card8])    
        deck2 = Deck.new([card4, card3, card6, card7])    

        player1 = Player.new("Megan", deck1)    
        player2 = Player.new("Aurora", deck2)    

        turn = Turn.new(player1, player2) 
        turn.pile_cards

        expect(turn.spoils_of_war.size).to eq(6)
    end

    it 'awards the two cards from spoils_of_war to :war winner' do
        card1 = Card.new(:heart, 'Jack', 11)
        card2 = Card.new(:heart, '10', 10)    
        card3 = Card.new(:heart, '9', 9)    
        card4 = Card.new(:diamond, 'Jack', 11)    
        card5 = Card.new(:heart, '8', 8)    
        card6 = Card.new(:diamond, 'Queen', 12)    
        card7 = Card.new(:heart, '3', 3)    
        card8 = Card.new(:diamond, '2', 2)    

        deck1 = Deck.new([card1, card2, card5, card8])    
        deck2 = Deck.new([card4, card3, card6, card7])    

        player1 = Player.new("Megan", deck1)    
        player2 = Player.new("Aurora", deck2)    

        turn = Turn.new(player1, player2) 
        winner = turn.winner
        turn.pile_cards
        expect(turn.spoils_of_war.size).to eq(6)
        turn.award_spoils(winner)

        expect(turn.player1.deck.cards.size).to eq(1)
        expect(turn.player2.deck.cards.size).to eq(7)
    end
end