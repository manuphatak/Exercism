# frozen_string_literal: true

module FlattenArray
  def self.flatten(array)
    array.flatten.compact
  end
end
