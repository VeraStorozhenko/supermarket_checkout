require_relative 'base_rule'

class GreenTeaRule < BaseRule
  def apply(items)
    return items unless items.any? { |i| i.code == 'GR1' }

    grouped = items.group_by(&:code)
    new_items = []

    grouped.each do |code, group_items|
      if code == 'GR1'
        group_items.each_with_index do |item, index|
          new_items << item if index.even?
        end
      else
        new_items.concat(group_items)
      end
    end

    new_items
  end
end
