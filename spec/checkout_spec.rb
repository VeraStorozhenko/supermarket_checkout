require_relative '../lib/product'
require_relative '../lib/checkout'
require_relative '../lib/pricing_rules/green_tea_rule'
require_relative '../lib/pricing_rules/strawberries_rule'
require_relative '../lib/pricing_rules/coffee_rule'

# создаём продукты
products = {
  'GR1' => Product.new('GR1', 'Green tea', 3.11),
  'SR1' => Product.new('SR1', 'Strawberries', 5.00),
  'CF1' => Product.new('CF1', 'Coffee', 11.23)
}

# создаём правила
rules = [
  GreenTeaRule.new,
  StrawberriesRule.new,
  CoffeeRule.new
]

def test_basket(items, expected, rules, products)
  co = Checkout.new(rules)
  items.each { |code| co.scan(products[code]) }
  total = co.total
  puts "Basket: #{items.join(', ')} => Total: £#{total} #{'✅' if total == expected}"
end

# Тесты
test_basket(%w[GR1 SR1 GR1 GR1 CF1], 22.45, rules, products)
test_basket(%w[GR1 GR1], 3.11, rules, products)
test_basket(%w[SR1 SR1 GR1 SR1], 16.61, rules, products)
test_basket(%w[GR1 CF1 SR1 CF1 CF1], 30.58, rules, products)