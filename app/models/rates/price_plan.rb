module Rates
  class PricePlan

    include Mongoid::Document
    include Mongoid::Timestamps  
  
    field :name, type: String
    field :category, type: String
    field :network, type: String
    field :description, type: String
    field :type, type: String
    field :industry_id, type: String
  
    embeds_many :telemetry_channels, class_name: "Rates::TelemetryChannel"
  
  
    def self.category_options
      [:uncontrolled, :controlled]
    end
    
    def self.industry_id_options
      [:g100, :g200 ]
    end
    
    def self.type_options
      [:low_user, :standard]
    end
    
    def self.network_options
      [:wellington]
    end
    
    def create_it(params)
      self.name = params[:name]
      self.category = params[:category].to_sym
      self.network = params[:network].to_sym
      self.description = params[:description]
      self.type = params[:type].to_sym
      self.industry_id = params[:industry_id].to_sym
      self.save
      self
    end
  
    
  end
end