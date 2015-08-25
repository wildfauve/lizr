module Rates
  class TelemetryChannel
    
    include Mongoid::Document
    include Mongoid::Timestamps  
    
  
    field :channel_code, type: String
  
    embeds_many :charges, class_name: "Rates::Charge"
  
  end
end