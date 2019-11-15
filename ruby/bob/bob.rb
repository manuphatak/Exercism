module Bob
  SHOUTING_A_QUESTION = ->(message) { message.shouting? && message.question? }
  SHOUTING_A_MESSAGE = ->(message) { message.shouting? }
  ASKING_A_QUESTION = ->(message) { message.question? }
  EMPTY = ->(message) { message.empty? }

  def self.hey(message)
    case Message.new(message.strip)
    when SHOUTING_A_QUESTION
      "Calm down, I know what I'm doing!"
    when SHOUTING_A_MESSAGE
      'Whoa, chill out!'
    when ASKING_A_QUESTION
      'Sure.'
    when EMPTY
      'Fine. Be that way!'
    else
      'Whatever.'
    end
  end
end

class Message
  def initialize(text)
    @text = text
  end

  attr_reader :text

  def question?
    text.end_with?('?')
  end

  def shouting?
    text.upcase == text && /[A-Z]/.match?(text)
  end

  def empty?
    text.empty?
  end
end
