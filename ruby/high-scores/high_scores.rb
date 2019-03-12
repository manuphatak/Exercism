class HighScores
  attr_reader :scores

  def initialize(scores)
    @scores = scores
  end

  def latest
    @scores.last
  end

  def personal_best
    sorted_scores.first
  end

  def personal_top_three
    sorted_scores.take(3)
  end

  private

  def sorted_scores
    @scores.sort.reverse
  end
end
