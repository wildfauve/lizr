class PricePlanService
  
  attr_accessor :plan
  
  include Wisper::Publisher
  
  def initialize(plan_class)
    @plan_class = plan_class
  end
  
  def empty_plan
    @plan_class.new
  end
  
  def create_plan(params)
    @plan = @plan_class.create_it(params)
    publish(:successful_plan_create_event, self)
  end
  
end