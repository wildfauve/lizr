class Rates::PricePlansController < ApplicationController
  
  def index
    @plans = PricePlanQueryHandler.new(Rates::PricePlan).get_all
  end

  def new
    @plan = PricePlanService.new(Rates::PricePlan).empty_plan
  end

  def create
    plan = PricePlanService.new(Rates::PricePlan.new)
    plan.subscribe(self)
    plan.create_plan(params[:rates_price_plan])
  end
  
  
  # Events 
  
  def successful_plan_create_event(plan)
    redirect_to rates_price_plans_path
  end
  
  
end