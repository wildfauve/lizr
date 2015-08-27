class PricePlanQueryHandler

  include Wisper::Publisher

  def initialize(plan_class)
    @plan_class = plan_class
  end

  def get_all
    @plan_class.all
  end

  def find(id)
    @plan_class.find(id)
  end

end
