class TwoBucket
  def initialize(one, two, target, start)
    node = Node.for(one: one, two: two, start: start)

    @target = target
    @search = Search.new(node, target)

    if start == 'one' && one > two
      search.discover!(node.fill('two').empty('one'))
    elsif start == 'two' && two > one
      search.discover!(node.fill('one').empty('two'))
    end
  end

  def moves
    node.parents.count
  end

  def goal_bucket
    node.goal_bucket(target).name
  end

  def other_bucket
    node.other_bucket(target).current
  end

  private

  attr_reader :search, :target

  def node
    @node ||= search.breadth_first
  end
end

class Search
  def initialize(start, target)
    @start = start
    @target = target

    @history = History.new

    history.discover!(start)
    @queue = [start]
  end

  def discover!(node)
    history.discover!(node)
  end

  def breadth_first
    # https://en.wikipedia.org/wiki/Breadth-first_search
    while (vector = queue.shift)

      history.discover!(vector)

      return vector if vector.include?(target)

      vector.neighbors.each do |n|
        next if history.discovered?(n)

        history.discover!(n)
        n.parent = vector
        queue.push(n)
      end
    end

    throw 'Not found'
  end

  private

  attr_reader :start, :target, :history, :queue
end

class Node
  def self.for(one:, two:, start:)
    new(
      one: Bucket.new(current: 0, max: one, name: 'one'),
      two: Bucket.new(current: 0, max: two, name: 'two')
    ).fill(start)
  end

  attr_accessor :parent
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

  def inspect
    "<Node @one=#{one.inspect}, @two=#{two.inspect}, @parent=#{parent.class}>"
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

  def empty(name)
    send("empty_#{name}")
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
    Node.new(one: one.fill, two: two) if one.fillable?
  end

  def fill_two
    Node.new(one: one, two: two.fill) if two.fillable?
  end

  def empty_one
    Node.new(one: one.empty, two: two) if one.emptyable?
  end

  def empty_two
    Node.new(one: one, two: two.empty) if two.emptyable?
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

  def fill
    Bucket.new(current: max, max: max, min: min, name: name)
  end

  def empty
    Bucket.new(current: 0, max: max, min: min, name: name)
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
    Bucket.new(current: current - other, max: max, min: min, name: name)
  end

  def +(other)
    Bucket.new(current: current + other, max: max, min: min, name: name)
  end

  def inspect
    "<Bucket::#{name} #{current}/#{max}>"
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

def Enumerator.unfold(start)
  new do |y|
    loop do
      y << start
      start = yield start
      break if start.nil?
    end
  end
end
