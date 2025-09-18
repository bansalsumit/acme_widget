require_relative '../../config/contants'

class Product
  attr_reader :code, :name, :price

  def initialize(code:, name:, price:)
    @code = code
    @name = name
    @price = price
  end

  def self.all
    AcmeConstants::PRODUCTS.map { |p| new(**p) }
  end
end
