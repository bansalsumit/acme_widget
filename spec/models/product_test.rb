require "spec_helper"
require_relative "../../app/models/product"

RSpec.describe Product do
  it "it should initializes with code, name, and price" do
    product = Product.new(code: "R01", name: "Red Widget", price: 32.95)
    expect(product.code).to eq("R01")
    expect(product.name).to eq("Red Widget")
    expect(product.price).to eq(32.95)
  end

  describe '.all' do
    it "it should returns all products as Product objects" do
      products = Product.all
      expect(products).to be_an(Array)
      expect(products).to all(be_a(Product))
      expect(products.size).to eq(AcmeConstants::PRODUCTS.size)
      first_product = products.first
      first_constant = AcmeConstants::PRODUCTS.first
      expect(first_product.code).to eq(first_constant[:code])
      expect(first_product.name).to eq(first_constant[:name])
      expect(first_product.price).to eq(first_constant[:price])
    end
  end
end
