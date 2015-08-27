class Segment

  include Mongoid::Document
  include Mongoid::Timestamps


  field :rate_unit, type: Symbol
  field :rate, type: Integer
  field :rate_per, type: Symbol

  field :duration, type: String
  field :start_time, type: Time

  def rate_amt=(amt)
    if /^[\d]+(\.[\d]+){0,1}$/ === amt.gsub(/\$/, "")
      money_amt = Monetize.parse(amt, "NZD")
      if [Fixnum, Money].include? money_amt.class
        self.rate = money_amt.cents if money_amt.is_a? Money
      else
        errors.add(:amt, "Amount is not a Money value")
      end
    else
      errors.add(:amt, "Amount does not appear to be a number") unless /^[\d]+(\.[\d]+){0,1}$/ === amt.gsub(/\$/, "")
    end
  end

  def rate_amt(options = {})
    raise ArgumentError, 'The "options" arg must be a Hash' unless options.is_a? Hash
    options[:in] ||= 'NZD'
    self.rate.nil? ? cents = 0 : cents = self.rate
    f = Money.new(cents, options[:in])
  end


end
