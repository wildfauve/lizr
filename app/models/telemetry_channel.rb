class TelemetryChannel

  include Mongoid::Document
  include Mongoid::Timestamps

  field :channel_code, type: String

  embeds_many :charges

end
