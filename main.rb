# frozen_string_literal: true

require_relative './hand.rb'
require_relative './player.rb'
require_relative './interface.rb'
require_relative './console_interface.rb'
require_relative './dealer.rb'

require_relative './card.rb'
require_relative './deck.rb'

require_relative './game.rb'

game = Game.new(ConsoleInterface.new)
game.start