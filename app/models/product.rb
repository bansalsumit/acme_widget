require_relative '../../config/contants'

class Product
  attr_reader :code, :name, :price

  @@products = nil

  def initialize(code:, name:, price:)
    @code = code
    @name = name
    @price = price
  end

  def self.all
    @@products ||= AcmeConstants::PRODUCTS.map { |p| new(**p) }
  end

  def self.find_by(code)
    all.find { |p| p.code == code }
  end
end
