# frozen_string_literal: true

class ConsoleUser < Player
  GAME_STATUSES = { player_bank_zero: lambda do |_data|
    puts 'one of the players bank amount is zero!'
  end,
                    game_start: ->(_data) { puts 'game start' },
                    take_card: ->(data) { puts "#{data[:name]} take card" },
                    rate: ->(data) { puts "#{data[:name]} rate #{data[:bank_amount]}" },
                    pass: ->(data) { puts "#{data[:name]} pass" },
                    show_hand: lambda do |data|
                     data.each do |player, info|
                       puts "#{player} has cards #{info[:cards]}, with score #{info[:score]}"
                     end
                   end,
                    winner: ->(data) { puts "#{data[:name]} winner, take money #{data[:bank_amount]}" } }.freeze

  def initialize
    print 'enter your name: '
    name = gets.chomp
    puts
    super(name)
  end

  def options
    { pass: '1 - pass',
      take_card: '2 - take card',
      show_hand: '3 - show hand' }
  end

  def render_info
    puts "bank amount: #{bank_amount} money, cards: #{show_cards}, score: #{score}"
  end

  def turn
    render_info
    choiced = choice
    puts
    options.keys[choiced - 1]
  end

  def choice
    puts options.values
    print 'select options...'
    gets.chomp.to_i
  end

  def continue?
    print 'print any button for new game or q for exit... '
    choice = gets.chomp
    puts
    choice != 'q' && super
  end

  def game_status(action, data)
    GAME_STATUSES[action].call(data)
  end
end
