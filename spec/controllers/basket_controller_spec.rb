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
end
