# rubocop:disable all
require 'awesome_print'

DEBUG = false

def apd(*args)
  ap(*args) if DEBUG
end

class TwoBucket
  attr_reader :left, :right, :target, :q, :history, :rejected_states

  def initialize(left, right, target, start)
    @left = left
    @right = right
    @target = target
    @history = History.new
    @rejected_states = []

    history.visit([0, 0])
    case start
    when 'one'
      rejected_states << [0, right] if left > right
      history.enqueue!([left, 0], [0, 0])
    when 'two'
      rejected_states << [left, 0] if right > left

      history.enqueue!([0, right], [0, 0])
    end

    apd rejected_states.inspect
  end

  def moves
    solution.moves_to(target)
  end

  def goal_bucket
    state = solution.state_for(target)

    if state.first == target
      'one'
    elsif state.last == target
      'two'
    end
  end

  def other_bucket
    state = solution.state_for(target)
    if state.first == target
      state.last
    elsif state.last == target
      state.first
    end
  end

  private

  def solution
    @solution ||= begin
      while (node = history.dequeue)
        history.visit(node)
        break if node.include? target

        neighbors = []
        neighbors <<  (node.first < left ? [left, node.last] : nil)
        neighbors <<  (node.last < right ? [node.first, right] : nil)
        neighbors <<  (node.first > 0 ? [0, node.last] : nil)
        neighbors <<  (node.last > 0 ? [node.first, 0] : nil)

        l_cap = left - node.first
        delta = [node.last, l_cap].min
        # apd node: node.inspect, l_cap: l_cap, delta: delta, first: node.first, last: node.last, left: left, right: right
        neighbors <<  (node.last > 0 && node.first < left ? [node.first + delta, node.last - delta] : nil)
        r_cap = right - node.last
        delta = [node.first, r_cap].min
        neighbors << (node.first > 0 && node.last < right ? [node.first - delta, node.last + delta] : nil)

        neighbors.compact.reject { |n| rejected_states.include? n }.each { |neighbor| history.enqueue!(neighbor, node) }

        if true
          apd node: node.inspect, neighbors: neighbors.inspect, q: history.send(:q).inspect
        end

      end

      history
    end
  end
end

class History
  def initialize
    @store = {}
    @q = []
  end

  def visit(node)
    store[node] = []
  end

  def enqueue!(node, from)
    unless visited?(node)
      store[from] << node
      q << node
      q.uniq!
    end
  end

  def dequeue
    q.shift
  end

  def state_for(value)
    store.keys.find { |key| key.include? value }
  end

  def moves_to(value)
    start = state_for(value)

    _moves(start)
  end

  private

  attr_reader :store, :q

  def visited?(node)
    store.key?(node)
  end

  def _moves(start, count: 0)
    if (pair = store.find { |_key, value| value.include? start })
      _moves(pair.first, count: count + 1)
    else
      count
    end
  end
end
