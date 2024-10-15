require './lib/card'

class CardGenerator
    attr_reader :cards

    def initialize(filename)
      @cards = []

      File.open(filename, 'r').each_line do |line|
        card_data = line.strip.split(", ")
        @cards << Card.new(card_data[0], card_data[1], card_data[2].to_i)
        
        #binding.pry
        end
    end
end

