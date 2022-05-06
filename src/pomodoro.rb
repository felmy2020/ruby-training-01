# frozen_string_literal: true

require './timer_base'

# ポモドーロクラス
class Pomodoro < TimerBase
  MINUTES = 25

  def initialize(minutes: MINUTES)
    super
  end
end
