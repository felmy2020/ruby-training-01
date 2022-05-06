# frozen_string_literal: true

require './break'

# 短い休憩クラス
class ShortBreak < Break
  def initialize
    super(type: :short)
  end
end
