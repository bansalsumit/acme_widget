require_relative "../models/basket"

class BasketController

  def initialize
    @basket = Basket.new()
  end
end
