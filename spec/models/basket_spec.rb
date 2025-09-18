require "spec_helper"
require_relative "../../app/models/basket"

RSpec.describe Basket do
  let(:catalogue) { class_double('Product') }
  let(:delivery_calculator) { instance_double('DeliveryCalculator') }
  let(:basket) { Basket.new(catalogue: catalogue) }

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

  describe ".total" do
    it "calls catalogue.subtotal with the list of items" do
      basket.add("R01")
      basket.add("G01")
      allow(delivery_calculator).to receive(:delivery_cost).with(57.90).and_return(2.95)

      expect(catalogue).to receive(:subtotal).with(["R01", "G01"]).and_return(57.90)

      total = basket.total
      expect(total).to eq(60.85)
    end

    it "returns 0.0 when the basket is empty" do
      expect(catalogue).to receive(:subtotal).with([]).and_return(0.0)
      expect(basket.total).to eq(4.95)
    end
  end
end
