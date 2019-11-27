# frozen_string_literal: true

class Player

  attr_accessor :score, :cards, :bank_amount
  attr_reader :name

  def initialize(name)
    @name = name
    @bank_amount = 100
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

  def bet
    self.bank_amount -= 10
    10
  end

  def take_money(amount)
    self.bank_amount += amount
  end

  def reset
    self.score = 0
    self.cards = []
  end

  def bank_zero?
    bank_amount.zero?
  end

  def game_status(_action, _data); end

  def continue?
    !bank_zero?
  end
end
