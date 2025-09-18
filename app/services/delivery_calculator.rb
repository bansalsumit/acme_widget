require_relative '../../config/contants'

class DeliveryCalculator
  def delivery_cost(order_value)
    AcmeConstants::DELIVERY_RULES
    .sort_by { |r| r[:threshold] } # to ensure ascending order
    .each do |rule|
      return rule[:cost] if order_value < rule[:threshold]
    end
    0.0 # order_value of $90 or more have free delivery.
  end
end
