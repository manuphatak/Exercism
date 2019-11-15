class ETL
  def self.transform(input)
    input.each_pair.each_with_object({}) do |(value, chars), result|
      chars.each { |char| result[char.downcase] = value }
    end
  end
end
