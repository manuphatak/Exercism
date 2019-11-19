class Proverb
  def initialize(*subjects, qualifier: nil)
    @subjects = subjects
    @qualifier = qualifier
  end

  def to_s
    phrases(subjects.length - 1) +
      "And all for the want of a #{qualified_subject}."
  end

  private

  attr_reader :subjects, :qualifier

  def phrases(count)
    (1..count).map { |n| phrase(n) }.join
  end

  def phrase(number)
    "For want of a #{subjects[number - 1]} the #{subjects[number]} was lost.\n"
  end

  def qualified_subject
    [qualifier, subjects[0]].compact.join(' ')
  end
end
