require_relative '../services/delivery_calculator'
require_relative '../services/offer_calculator'

class Basket
  def initialize(catalogue:)
    @catalogue = catalogue
    @items = []
    @delivery_calculator = DeliveryCalculator.new
    @offer_calculator = OfferCalculator.new
    @red_widget = @catalogue.find_by('R01')
  end

  def add(product_code)
    @items << product_code
  end

  def total
    subtotal = @catalogue.subtotal(@items)
    discount = @offer_calculator.apply(@items, @red_widget)
    delivery = @delivery_calculator.delivery_cost(subtotal - discount)
    (subtotal - discount + delivery).round(2)
  end
end
