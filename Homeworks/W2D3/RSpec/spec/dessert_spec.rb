require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef", name: "Boyardee") }
  let(:pie) {Dessert.new("pie", 4, chef)}

  describe "#initialize" do
    it "sets a type" do
      expect(pie.type).to eq("pie")
    end

    it "sets a quantity" do
      expect(pie.quantity).to eq(4)
    end

    it "starts ingredients as an empty array" do
      expect(pie.ingredients.empty?).to be(true)
    end

    it "raises an argument error when given a non-integer quantity" do
      expect{dessert.quantity}.to raise_error
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      pie.add_ingredient("apple")
      expect(pie.ingredients).to include("apple")
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      ingredients = ["sugar", "peaches", "flour", "eggs"]

      pie.add_ingredient("sugar")
      pie.add_ingredient("peaches")
      pie.add_ingredient("flour")
      pie.add_ingredient("eggs")

      pie.mix!
      expect(pie.ingredients).not_to eq(ingredients)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      expect(pie.eat(3)).to eq(1)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect{pie.eat(5)}.to raise_error
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Chef Boyardee the Great Baker")
      expect(pie.serve).to eq("Chef Boyardee the Great Baker has made 4 pies!")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(pie)
      pie.make_more
    end
  end
end
