require_relative '../services/delivery_calculator'

class Basket
  def initialize(catalogue:)
    @catalogue = catalogue
    @items = []
    @delivery_calculator = DeliveryCalculator.new
  end

  def add(product_code)
    @items << product_code
  end

  def total
    subtotal = @catalogue.subtotal(@items)
    delivery = @delivery_calculator.delivery_cost(subtotal)
    (subtotal + delivery).round(2)
  end
end
