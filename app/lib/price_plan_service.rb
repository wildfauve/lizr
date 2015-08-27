class PricePlanService

  attr_accessor :plan, :node_plan

  include Wisper::Publisher

  def initialize(plan_class)
    @plan_class = plan_class
  end

  def empty_plan
    @plan_class.new
  end

  def empty_node
    @plan_class.new
  end

  def create_plan(params)
    @plan = @plan_class.create_it(params)
    publish(@plan_class.success_create_event, self)
  end

  def create_node_plan(plan, params)
    @plan = plan
    @node_plan = @plan_class.create_it(params)
    @plan.supply_nodes << node_plan
    @plan.save
    publish(@node_plan.successful_create_event, self)
  end

  def empty_charge()
    @plan_class.new
  end


end
