require 'spec_helper'
require_relative '../../app/controllers/basket_controller'

RSpec.describe BasketController do
  let(:controller) { BasketController.new }

  describe '.add' do
    it 'should adds a valid product code to the basket' do
      product_code = 'R01'
      controller.add(product_code)
      basket_items = controller.instance_variable_get(:@basket).instance_variable_get(:@items)
      expect(basket_items).to include(product_code)
    end

    it "raises an error for unknown product code" do
      expect { controller.add("X01") }.to raise_error("Unknown product code: X01")
    end
  end

  describe '.total' do
    it 'returns the total for multiple items' do
      controller.add('R01')
      controller.add('G01')

      subtotal = Product.find_by('R01').price + Product.find_by('G01').price
      expect(controller.total).to eq(subtotal.round(2))
    end

    it 'returns 0.0 for an empty basket' do
      expect(controller.total).to eq(0.0)
    end
  end
end
