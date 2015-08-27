
class TelemetryNode

  include Mongoid::Document
  include Mongoid::Timestamps

  field :registered_price_category, type: Symbol

  embeds_many :charges

end
