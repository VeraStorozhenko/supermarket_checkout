Technical evaluation of checkout system writed in Ruby.

interface:
co = Checkout.new(pricing_rules)
co.scan(item)
co.scan(item)
price = co.total
