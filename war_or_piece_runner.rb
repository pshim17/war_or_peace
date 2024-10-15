require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'
require 'pry'

##create 52 cards
suits = ["Hearts", "Diamonds", "Clubs", "Spades"] 
values = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K", "A"]
ranks = [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]
card_deck = []

suits.each do |suit|
    values.each.with_index do |value, index|
        card_deck << Card.new(suit, value, ranks[index])
    end 
end

shuffled_card_deck = card_deck.shuffle

#binding.pry
game = Game.new(shuffled_card_deck)
game.start

