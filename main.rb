require_relative 'lib/product'
require_relative 'lib/checkout'
require_relative 'lib/pricing_rules/green_tea_rule'
require_relative 'lib/pricing_rules/strawberries_rule'
require_relative 'lib/pricing_rules/coffee_rule'

pricing_rules = [
  GreenTeaRule.new,
  StrawberriesRule.new,
  CoffeeRule.new
]

products = {
  'GR1' => Product.new('GR1', 'Green tea', 3.11),
  'SR1' => Product.new('SR1', 'Strawberries', 5.00),
  'CF1' => Product.new('CF1', 'Coffee', 11.23)
}

baskets = [
  ['GR1','SR1','GR1','GR1','CF1'],
  ['GR1','GR1'],
  ['SR1','SR1','GR1','SR1'],
  ['GR1','CF1','SR1','CF1','CF1']
]

baskets.each do |basket|
  co = Checkout.new(pricing_rules)
  basket.each { |code| co.scan(products[code]) }
  puts "Basket: #{basket.join(', ')} => £#{co.total}"
end