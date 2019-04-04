module Raindrops
  module WithPresence
    refine String do
      def presence
        self unless empty?
      end
    end
  end

  using WithPresence
  SOUNDS = [[3, 'Pling'], [5, 'Plang'], [7, 'Plong']].freeze

  def self.convert(number)
    SOUNDS
      .map { |(factor, sound)| (number % factor).zero? ? sound : nil }
      .compact
      .join
      .presence || number.to_s
  end
end
