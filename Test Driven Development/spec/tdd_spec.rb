require 'rspec'
require 'tdd'

RSpec.describe "TDD" do
  describe "#my_uniq" do
    it "returns an empty array when given an empty array" do
      expect([].my_uniq).to eq([])
    end

    it "returns the original array if given no duplicate values" do
      expect([1,2,3].my_uniq).to eq([1,2,3])
    end

    it "returns unique values when given duplicates" do
      expect([1,1,2,2,3,3].my_uniq).to eq([1,2,3])
    end
  end

  describe "#two_sum" do
    it "returns nil if given an empty array" do
      expect([].two_sum).to eq(nil)
    end

    it "returns nil if no pairs sum to zero" do
      expect([1,2,3,4,5].two_sum).to eq(nil)
    end

    it "returns all pairs that sum to zero" do
      expect([-1, 1, -2, 2, -3, 3].two_sum).to eq([[0, 1], [2, 3], [4, 5]])
    end

    it "must add two elements togeher that sum to zero (not just one '0')" do
      expect([0,1].two_sum).to eq(nil)
    end
  end

  describe "#my_transpose" do
    let (:row) { [[0, 1, 2],[3, 4, 5],[6, 7, 8]]}
    let (:col) { [[0, 3, 6],[1, 4, 7],[2, 5, 8]]}


    it "returns an empty array if given an empty array" do
      expect([].my_transpose).to eq([])
    end

    it "switches the positions of columns and rows" do
        a = row.my_transpose
      expect(a[1][0]).to eq(1)

    end

    it "does not call #transpose" do
        a = row.my_transpose
      expect(a).not_to receive (:transpose)
    end
  end

  describe "#stock_picker" do

    let (:prices) { [77, 68, 93, 27, 31] }

    it "buys the stock before selling it" do
      expect(prices.stock_picker).to eq(["Tuesday", "Wednesday"])
    end

    it "only picks the most profitable pair" do
      expect(prices.stock_picker).to eq(["Tuesday", "Wednesday"].length == 1)
    end








  end

end
