class Charge

  include Mongoid::Document
  include Mongoid::Timestamps


  field :type, type: Symbol
  field :price_setter, type: Symbol

  embeds_many :periods

  def self.charge_type
    [:network_daily, :flick_daily, :metering, :ea_levy, :flick_kwh, :network_kwh]
  end

  def self.price_setter_type
    [:flick, :network, :electricity_auth, :meter_company]
  end

end
