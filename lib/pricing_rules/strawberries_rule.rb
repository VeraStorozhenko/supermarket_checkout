require_relative 'base_rule'

class StrawberriesRule < BaseRule
  def apply(items)
    strawberry_count = items.count { |i| i.code == 'SR1' }

    items.map do |item|
      if item.code == 'SR1'
        price = strawberry_count >= 3 ? 4.50 : item.price
        Product.new(item.code, item.name, price)
      else
        item
      end
    end
  end
end