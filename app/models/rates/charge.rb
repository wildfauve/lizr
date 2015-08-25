module Rates
  class Charge
  
    include Mongoid::Document
    include Mongoid::Timestamps  
  
  
    field :type, type: Symbol
    field :price_setter, type: Symbol
  
    embeds_many :periods
  

  end
end