class Proverb
  def initialize(*subjects, qualifier: nil)
    @subjects = subjects
    @qualifier = qualifier
  end

  def to_s
    phrases +
      "And all for the want of a #{qualified_subject}."
  end

  private

  attr_reader :subjects, :qualifier

  def phrases
    (1...subjects.length).map { |n| phrase(n) }.join
  end

  def phrase(number)
    "For want of a #{subjects[number - 1]} the #{subjects[number]} was lost.\n"
  end

  def qualified_subject
    [qualifier, subjects[0]].compact.join(' ')
  end
end
