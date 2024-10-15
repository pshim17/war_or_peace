require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'
require './lib/card_generator'
require 'pry'

filename = "./cards.txt"

card_generator = CardGenerator.new(filename)
cards = card_generator.cards.shuffle 

#binding.pry

game = Game.new(cards)
game.start

