# frozen_string_literal: true

class Player < Hand

  attr_accessor :bank_amount
  attr_reader :name

  def initialize(name)
    @name = name
    @bank_amount = 100
    super()
  end

  def bet
    self.bank_amount -= 10
    10
  end

  def take_money(amount)
    self.bank_amount += amount
  end

  def bank_zero?
    bank_amount.zero?
  end
end
