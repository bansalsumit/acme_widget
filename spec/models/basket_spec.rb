require "spec_helper"
require_relative "../../app/models/basket"

RSpec.describe Basket do
  let(:basket) { Basket.new }

  describe ".add" do
    it "adds a product code to the basket" do
      basket.add("R01")
      basket.add("G01")
      expect(basket.instance_variable_get(:@items)).to eq(["R01", "G01"])
    end

    it "allows adding multiple of the same product code" do
      basket.add("B01")
      basket.add("B01")
      expect(basket.instance_variable_get(:@items)).to eq(["B01", "B01"])
    end
  end
end
