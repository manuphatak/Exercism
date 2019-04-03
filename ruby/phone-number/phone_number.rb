module PhoneNumber
  def self.clean(phone_number)
    phone_number.gsub(/\D/, '')[/^1?([2-9]\d{2}[2-9]\d{6})$/, 1]
  end
end
