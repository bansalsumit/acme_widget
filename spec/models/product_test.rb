require "spec_helper"
require_relative "../../app/models/product"

RSpec.describe Product do
  it "it should initializes with code, name, and price" do
    product = Product.new(code: "R01", name: "Red Widget", price: 32.95)
    expect(product.code).to eq("R01")
    expect(product.name).to eq("Red Widget")
    expect(product.price).to eq(32.95)
  end
end
