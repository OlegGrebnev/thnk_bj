# frozen_string_literal: true

class Deck
  def initialize
    @deck = generate
  end

  def take_card
    deck.pop
  end

  private

  attr_reader :deck

  def generate
    Card::SUITS.reduce([]) do |acc, suit|
      acc + Card::TYPES.map.with_index do |type, idx|
        Card.new(type, suit, Card::VALUES[idx])
      end
    end.shuffle
  end
end
