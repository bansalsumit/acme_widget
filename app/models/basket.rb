class Basket
  def initialize
    @items = []
  end

  def add(product_code)
    @items << product_code
  end
end
