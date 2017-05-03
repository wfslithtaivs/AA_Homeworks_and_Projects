require "card"

context "Card" do
  subject {Card.new(:clubs, 10)}
  let (:king) { Card.new(:hearts, 13) }

  describe "#initialize" do
    it "initialize a card object" do
      expect(subject.class).to be Card
    end
    it "set suite" do
      expect(subject.suite).to eq(:clubs)
    end
    context "Values" do
      it "sets a numerical values" do
        expect(subject.value).to eq(10)
      end
      it "sets a string values" do
        expect(king.value).to eq(:King)
      end
    end
  end
end

context "Deck" do
  describe "#initialize" do
    subject { Deck.instance }

    it "initialize a deck object" do
      expect(subject.class).to be Deck
      expect(subject.is_a?(Singleton)).to be true
    end
    it "create and fill an array of 52 unique cards" do
      expect(subject.deck.size).to eq(52)
      check = subject.deck.all? {|el| el.class == Card}
      expect(check).to be true
    end
  end
end
