require_relative 'base_rule'
require 'bigdecimal'
require 'bigdecimal/util'

class CoffeeRule < BaseRule
  def apply(items)
    count = items.count { |i| i.code == 'CF1' }
    return items if count < 3

    # считаем цену с дисконтом один раз с BigDecimal и потом приводим к float
    discounted_price = (BigDecimal(items.find { |i| i.code == 'CF1' }.price.to_s) * 2 / 3).round(2).to_f

    items.map do |item|
      if item.code == 'CF1'
        # создаём новый объект только с нужной ценой
        Product.new(item.code, item.name, discounted_price)
      else
        item
      end
    end
  end
end