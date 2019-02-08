class Player
  attr_reader :name, :score
  def initialize name
    @name = name
    @score = 0
  end

  def info
    "#{@name}'s score: #{@score}"
  end

  def increment_score
    @score += 1
  end
end
