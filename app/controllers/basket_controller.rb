require_relative "../models/basket"
require_relative "../models/product"

class BasketController

  def initialize
    @basket = Basket.new()
  end

  def add(code)
    product = Product.find_by(code)
    raise "Unknown product code: #{code}" unless product
    @basket.add(product.code)
  end
end
