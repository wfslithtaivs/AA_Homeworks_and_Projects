require "hand"
require "de"

describe "Hand building" do
  let (:deck) { double('deck', deck: [1, 2, 3, 4, 5])}
  subject('hand') { Hand.new(deck) }
  let (:full_hand) { Hand.new([1, 2, 3, 4, 5])}

  context "#initialize" do
    it "Should initialize as an empty hand/array" do
      expect(subject.hand).to be_empty
    end
    it "Should reference a deck" do
      expect(subject.deck.class).to be Deck
    end
  end
  context "#deal" do
    it "Should add cards until 5 card hand" do
      subject.deal
      expect(subject.hand.length).to eq(5)
    end
    it "Should be calling from Deck class" do
      expect(:deal).to receive(deck)
    end
    it "Should not deal if hand is full/has 5 cards already" do
      full_hand.deal
      expect(full_hand.hand).to eq([1, 2, 3, 4, 5])
    end
  end
end

describe "Hand parsing" do
  context "Values" do
    #hand1 = Array.new(5) { Card.new(:hearts, (2..13).to_a.sample) }
    #let (:non_ace_hand) = { hand1 }
    it "Should correctly parse into an array of values"
    it "Should correctly sort with regard to Aces"
    it "correctly counts cards with identical values"
    it "correctly identify if values are in sequence"

  end
  context "Suits" do
    it "Should correctly parse into an array of suits"
    it "correctly identify if hand contains only one suite"

  end
  context "Hand value" do
    it "returns number of pairs if any"
    it "returns number of triples if any"
    it "returns number of quads if any"
    it "returns the array of same suite consequences"
  end
end
