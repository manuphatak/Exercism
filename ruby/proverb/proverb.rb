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
    subjects.each_cons(2).map { |desired, lost| phrase(desired, lost) }.join
  end

  def phrase(new_thing, asset_we_had)
    "For want of a #{new_thing} the #{asset_we_had} was lost.\n"
  end

  def qualified_subject
    [qualifier, subjects[0]].compact.join(' ')
  end
end
