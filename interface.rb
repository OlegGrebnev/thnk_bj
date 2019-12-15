# frozen_string_literal: true

class Interface
  OPTIONS = { pass: '1 - pass',
              take_card: '2 - take card',
              show_hand: '3 - show hand' }.freeze

  def init_player
    raise NotImplementedError
  end

  def render_info
    raise NotImplementedError
  end

  def choice_option
    raise NotImplementedError
  end

  def continue?
    raise NotImplementedError
  end

  def game_status
    raise NotImplementedError
  end
end
