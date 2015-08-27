class PricePlansController < ApplicationController

  def index
    @plans = PricePlanQueryHandler.new(PricePlan).get_all
  end

  def new
    @plan = PricePlanService.new(PricePlan).empty_plan
  end

  def create
    plan = PricePlanService.new(PricePlan.new)
    plan.subscribe(self)
    plan.create_plan(params[:price_plan])
  end

  def show
    @plan = PricePlanQueryHandler.new(PricePlan).find(params[:id])
  end


  # Events

  def successful_plan_create_event(plan)
    redirect_to price_plans_path
  end


end
