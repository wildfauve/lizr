
class SupplyNode

  include Mongoid::Document
  include Mongoid::Timestamps

  field :registered_price_category, type: Symbol

  embeds_many :charges

  def create_it(params)
    self.registered_price_category = params[:registered_price_category].to_sym
    self.save
    self
  end

  def successful_create_event
    :successful_supply_node_create_event
  end

  def type_of
    self.class.name
  end

end
