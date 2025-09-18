class Basket
  def initialize(catalogue:)
    @catalogue = catalogue
    @items = []
  end

  def add(product_code)
    @items << product_code
  end

  def total
    @catalogue.subtotal(@items)
  end
end
