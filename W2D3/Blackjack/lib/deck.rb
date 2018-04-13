require_relative 'card.rb'

class Deck
  attr_reader :cards

  SUITS = {
    0 => :hearts,
    1 => :spades,
    2 => :clubs,
    3 => :diamonds
  }

  def initialize(cards = Deck.populate)
    @cards = cards
    @cards.shuffle
  end


   private
  def self.populate
    local_cards = []
    4.times do |suit|
      13.times do |val|
        local_cards << Card.new(val, SUITS[suit])
      end
    end
    local_cards
  end
end
