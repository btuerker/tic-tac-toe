module GameState
  X_WON = 'X won'
  O_WON = 'O won'
  TIED = 'Tied'
  NOT_ENDED = 'Not ended'

  def self.state(state)
    return X_WON     if state == 'X'
    return O_WON     if state == 'O'
    return TIED      if state == '0'
    return NOT_ENDED if state == '-'
  end
end
