class BinarySearch
  attr_reader :list

  def initialize(list, index: 0)
    raise ArgumentError if list.sort != list

    @list = list
    @index = index
  end

  def search_for(number)
    raise RuntimeError unless list.include?(number)

    case list[middle] <=> number
    when -1
      search_right.search_for(number)
    when 0
      left.length + index
    when 1
      search_left.search_for(number)
    end
  end

  def middle
    list.length / 2
  end

  private

  attr_reader :index

  def left
    @left ||= list[0...middle]
  end

  def right
    @right ||= list[middle..-1]
  end

  def search_left
    BinarySearch.new(left, index: index)
  end

  def search_right
    BinarySearch.new(right, index: index + left.length)
  end
end
