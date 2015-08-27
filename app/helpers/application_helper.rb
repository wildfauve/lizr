module ApplicationHelper

  def category_options
    PricePlan.category_options.collect {|c| [c.to_s, c]}
  end

  def plan_selects(option)
    PricePlan.send(option).collect {|c| [c.to_s, c]}
  end

  def charges_select(option)
    Charge.send(option).collect {|c| [c.to_s, c]}
  end

  def periods_select(option)
    Period.send(option).collect {|c| [c.to_s, c]}
  end


end
