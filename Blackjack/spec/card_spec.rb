require 'card.rb'
require 'rspec'

RSpec.describe Card do

  subject(:card) { Card.new(5, :spades)}

  describe "#initialize" do
    it "initializes with a value" do
      expect(card.value).to eq(5)
    end
    it "initializes with a suit" do
      expect(card.suit).to eq(:spades)
    end

  end

end
