module ApplicationHelper
  
  def category_options
    Rates::PricePlan.category_options.collect {|c| [c.to_s, c]}
  end
  
  def plan_selects(option)
    Rates::PricePlan.send(option).collect {|c| [c.to_s, c]}
  end
  
  
end
