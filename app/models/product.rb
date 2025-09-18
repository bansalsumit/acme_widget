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

  def self.prices_for(codes)
    codes.uniq.each_with_object({}) do |code, hash|
      product = find_by(code)
      hash[code] = product&.price.to_f
    end
  end

  def self.subtotal(product_codes)
    prices = prices_for(product_codes)
    product_codes.map { |code| prices[code] }.sum.round(2)
  end
end
