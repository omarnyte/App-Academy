require 'deck.rb'
require 'rspec'

RSpec.describe Deck do
  subject(:deck) {Deck.new}
  let(:other_deck) {Deck.new} 
  # let (:card1) { double("card1", :value => 0 , :suit => :hearts )}
  # let (:card2) { double("card2", :value => 1 , :suit => :hearts )}
  # let (:card3) { double("card3", :value => 2 , :suit => :hearts )}

  describe "#initialize" do
    it ":cards instance variable is an array" do
      expect(deck.cards).to be_an_instance_of(Array)
    end

    it "creates a deck of 52 unique cards" do
      expect(deck.cards.count).to eq(52)
    end

    it "creates a shuffled deck" do
      expect(deck.cards).not_to eq(other_deck.cards)
    end
  end
end
