class Brackets
  def self.paired?(input)
    new(input.split('')).paired?
  end

  def initialize(chars)
    @chars = chars
  end

  def paired?
    chars.each_with_object(ContextStack.new) do |char, context|
      case char
      when '[', '{', '('
        context.push(char)
      when ']'
        context.pop_when('[')
      when '}'
        context.pop_when('{')
      when ')'
        context.pop_when('(')
      end
    end.valid?
  end

  private

  attr_reader :chars
end

class ContextStack
  def initialize
    @stack = []
    @voided = false
  end

  def push(char)
    stack << char
  end

  def pop_when(char)
    if stack.last == char
      stack.pop
    else
      void!
    end
  end

  def valid?
    !voided && stack.empty?
  end

  private

  attr_reader :stack, :voided

  def void!
    @voided = true
  end
end
