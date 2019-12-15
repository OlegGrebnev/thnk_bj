# frozen_string_literal: true

class ConsoleInterface < Interface
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
                    winner: ->(data) { puts "#{data[:name]} winner, take money #{data[:bank_amount]}" }
  }.freeze

  def init_player
    print 'enter your name...'
    player = Player.new(gets.chomp)
    puts
    player
  end

  def init_dealer
    Dealer.new
  end

  def choice_option
    puts OPTIONS.values
    print 'select options...'
    choice = gets.chomp.to_i
    OPTIONS.keys[choice - 1]
  end

  def continue?(players)
    print 'print any button for new game or q for exit... '
    choice = gets.chomp
    puts
    choice != 'q' && players.none?(&:bank_zero?)
  end

  def render_info(player)
    puts "#{player.name} bank: #{player.bank_amount}, cards: #{player.show_cards}, score: #{player.score}"
  end

  def game_status(action, data)
    GAME_STATUSES[action].call(data)
  end
end
