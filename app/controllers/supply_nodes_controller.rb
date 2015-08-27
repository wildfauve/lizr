class SupplyNodesController < ApplicationController

  def new
    @plan = PricePlanQueryHandler.new(PricePlan).find(params[:price_plan_id])
    @supply = PricePlanService.new(SupplyNode).empty_node
  end

  def create
    plan = PricePlanQueryHandler.new(PricePlan).find(params[:price_plan_id])
    supply = PricePlanService.new(SupplyNode.new)
    supply.subscribe(self)
    supply.create_node_plan(plan, params[:supply_node])
  end

  def successful_supply_node_create_event(plan)
    @plan = plan
  end

end
