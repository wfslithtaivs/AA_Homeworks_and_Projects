require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double(:titleize => "Misha") }
  subject (:desert) { Dessert.new("brownie", 10, chef) }

  describe "#initialize" do
    it "sets a type" do
      expect(desert.type).to eq("brownie")
    end

    it "sets a quantity" do
      expect(desert.quantity).to eq(10)
    end

    it "starts ingredients as an empty array" do
      expect(desert.ingredients).to eq([])
    end

    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new("1", "1", "1")}.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      desert.add_ingredient("meat")
      desert.add_ingredient("salt")
      desert.add_ingredient("crumbs")
      expect(desert.ingredients).to eq(["meat", "salt", "crumbs"])
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      # silly example
      desert.mix!
      expect(desert.ingredients.shuffle).to eq(desert.ingredients)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      desert.eat(5)
      expect(desert.quantity).to eq(5)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect {desert.eat(1000)}.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      expect(desert.serve).to match(/Misha/)
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert  passed in" do
      expect(chef).to receive(:bake).with(desert)
      desert.make_more
    end
  end
end
