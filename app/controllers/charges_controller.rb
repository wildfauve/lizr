class ChargesController < ApplicationController

  def new
    @plan = PricePlanQueryHandler.new(PricePlan).find(params[:price_plan_id])
    @charge = PricePlanService.new(Charge).empty_charge
    @node = params[:node]
    @node_type = params[:node_type]
  end

  def create
    @charge = PricePlanService.new(Charge).empty_charge(plan: @plan, for: params[:node], type: params[:node_type])
  end

  def successful_supply_node_create_event(plan)
    @plan = plan
  end

end
