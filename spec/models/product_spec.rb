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

  describe ".find_by" do
    it "returns the correct Product object by code" do
      product = Product.find_by("R01")
      expect(product).to be_a(Product)
      expect(product.code).to eq("R01")
      expect(product.name).to eq("Red Widget")
      expect(product.price).to eq(32.95)
    end

    it "returns nil for unknown product code" do
      product = Product.find_by("X01")
      expect(product).to be_nil
    end
  end

  describe '.prices_for' do
    it 'should returns a hash of prices for the given codes' do
      result = Product.prices_for(['R01', 'B01'])
      expect(result).to eq({ 'R01' => 32.95, 'B01' => 7.95 })
    end

    it 'should returns 0.0 for unknown codes' do
      result = Product.prices_for(['X01'])
      expect(result).to eq({ 'X01' => 0.0 })
    end

    it 'removes duplicates in the input' do
      result = Product.prices_for(["R01", "R01"])
      expect(result.keys).to eq(["R01"])
    end
  end

  describe '.subtotal' do
    it 'sums the prices for the given codes' do
      total = Product.subtotal(['R01', 'B01'])
      expect(total).to eq(40.90)
    end

    it 'returns 0.0 when no codes are given' do
      expect(Product.subtotal([])).to eq(0.0)
    end
  end
end
