class TwoBucket
  def initialize(one, two, target, start)
    node = Node.for(one: one, two: two)
    other = start == 'one' ? 'two' : 'one'

    @search = Search.setup(node, start, target, other)
  end

  def moves
    node.parents.count
  end

  def goal_bucket
    node.goal_bucket(search.target).name
  end

  def other_bucket
    node.other_bucket(search.target).current
  end

  private

  attr_reader :search

  def node
    @node ||= search.breadth_first
  end
end

class Search
  attr_reader :target

  def self.setup(node, start, target, other)
    new(node.fill(start), target, node.fill(other))
  end

  def initialize(start, target, exclude)
    @start = start
    @target = target
    @history = History.new
    @queue = [start]

    history.discover!(start)
    history.discover!(exclude)
  end

  def breadth_first
    # https://en.wikipedia.org/wiki/Breadth-first_search
    while (vector = queue.shift)
      history.discover!(vector)

      return vector if vector.include?(target)

      vector.neighbors.each do |n|
        next if history.discovered?(n)

        n.parent = vector
        history.discover!(n)
        queue.push(n)
      end
    end

    throw 'Not found'
  end

  private

  attr_reader :start, :history, :queue
end

class Node
  attr_accessor :parent

  def self.for(one:, two:)
    new(
      one: Bucket.new(current: 0, max: one, name: 'one'),
      two: Bucket.new(current: 0, max: two, name: 'two')
    )
  end

  def initialize(one:, two:)
    @one = one
    @two = two
    @parent = nil
  end

  def neighbors
    [
      one_into_two,
      two_into_one,
      fill_one,
      fill_two,
      empty_one,
      empty_two
    ].compact
  end

  def goal_bucket(target)
    [one, two].find { |bucket| bucket.current == target }
  end

  def other_bucket(target)
    [one, two].find { |bucket| bucket.current != target }
  end

  def hash
    bucket_amounts.hash
  end

  def ==(other)
    bucket_amounts == other.bucket_amounts
  end

  alias eql? ==

  def include?(number)
    bucket_amounts.include?(number)
  end

  def parents
    Enumerator.unfold(self, &:parent).to_a
  end

  def fill(name)
    send("fill_#{name}")
  end

  protected

  attr_reader :one, :two

  def bucket_amounts
    [one, two].map(&:current)
  end

  private

  def one_into_two
    return unless two.fillable? && one.emptyable?

    amount = [two.capacity, one.current].min
    Node.new(one: one - amount, two: two + amount)
  end

  def two_into_one
    return unless one.fillable? && two.emptyable?

    amount = [one.capacity, two.current].min
    Node.new(one: one + amount, two: two - amount)
  end

  def fill_one
    Node.new(one: one + Float::INFINITY, two: two) if one.fillable?
  end

  def fill_two
    Node.new(one: one, two: two + Float::INFINITY) if two.fillable?
  end

  def empty_one
    Node.new(one: one - Float::INFINITY, two: two) if one.emptyable?
  end

  def empty_two
    Node.new(one: one, two: two - Float::INFINITY) if two.emptyable?
  end
end

class Bucket
  attr_reader :name, :current, :max, :min

  def initialize(current:, max:, min: 0, name:)
    @current = current
    @max = max
    @min = min
    @name = name
  end

  def capacity
    max - current
  end

  def fillable?
    capacity.positive?
  end

  def emptyable?
    current.positive?
  end

  def -(other)
    Bucket.new(
      current: (current - other).clamp(min, max),
      max: max,
      min: min,
      name: name
    )
  end

  def +(other)
    Bucket.new(
      current: (current + other).clamp(min, max),
      max: max,
      min: min,
      name: name
    )
  end

  def ==(other)
    current == other.current && max == other.max
  end
end

class History < Hash
  def discover!(node)
    self[node] = true
  end

  def discovered?(node)
    self[node]
  end
end

# https://stackoverflow.com/questions/35530324/create-a-ruby-enumerable-from-a-first-element-and-a-function-to-get-the-next-el
def Enumerator.unfold(start)
  new do |y|
    loop do
      y << start
      start = yield start
      break if start.nil?
    end
  end
end
