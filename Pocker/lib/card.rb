require 'singleton'

class Card
  attr_reader :suite, :value

  VALUES = [:Ace] + (2..10).to_a + [:Jack, :Queen, :King]

  def initialize(suite, value)
    @suite = suite
    @value = VALUES[value - 1]
  end
end

class Deck
  include Singleton
  attr_accessor :deck

  def initialize
    @deck = []
    populate_deck
    shuffle
  end

  def populate_deck
    suits = [:clubs, :hearts, :spades, :diamonds]
    values = (1..13).to_a

    suits.each do |suit|
      values.each do |value|
        @deck << Card.new(suit, value)
      end
    end
  end

  def shuffle
    @deck.shuffle
  end
end
