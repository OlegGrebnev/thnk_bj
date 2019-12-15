# frozen_string_literal: true

class Hand
  attr_accessor :score, :cards

  def initialize
    @score = 0
    @cards = []
  end

  def get_card(card, score)
    cards << card
    self.score += score
  end

  def show_cards
    cards.map(&:face).join(', ')
  end

  def reset
    self.score = 0
    self.cards = []
  end
end
