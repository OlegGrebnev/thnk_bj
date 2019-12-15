# frozen_string_literal: true

class Card
  attr_reader :type, :suit, :value

  SUITS = %w[♠ ♥ ♦ ♣].freeze
  TYPES = %w[2 3 4 5 6 7 8 9 10 J Q K A].freeze
  VALUES = [2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10, [1, 11]].freeze

  def initialize(type, suit, value)
    @type = type
    @suit = suit
    @value = value
  end

  def face
    type + suit
  end
end
