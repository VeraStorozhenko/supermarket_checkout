require_relative 'product'

class Checkout
  def initialize(pricing_rules)
    @pricing_rules = pricing_rules
    @items = []
  end

  def scan(item)
    @items << item
  end

  def total
    updated_items = @items.dup
    @pricing_rules.each do |rule|
      updated_items = rule.apply(updated_items)
    end
    updated_items.map(&:price).sum.round(2)
  end
end
