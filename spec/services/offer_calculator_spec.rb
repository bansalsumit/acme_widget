require 'spec_helper'
require_relative '../../app/services/offer_calculator'
require_relative '../../app/models/product'

RSpec.describe OfferCalculator do
  let(:calculator) { described_class.new }
  let(:red_widget) { Product.find_by('R01') }
  let(:green_widget) { Product.find_by('G01') }

  describe '.apply' do
    it 'should returns 0.0 if no eligible products in basket' do
      product_codes = ['G01', 'B01']
      expect(calculator.apply(product_codes, red_widget)).to eq(0.0)
    end

    it 'should returns 0.0 if only one eligible product' do
      product_codes = ['R01']
      expect(calculator.apply(product_codes, red_widget)).to eq(0.0)
    end

    it 'should applies half price discount for every second eligible product' do
      product_codes = ['R01', 'R01']  # 2 Reds → 1 half-price
      expect(calculator.apply(product_codes, red_widget)).to eq((red_widget.price / 2.0).round(2))

      product_codes = ['R01', 'R01', 'R01']  # 3 Reds → 1 half-price
      expect(calculator.apply(product_codes, red_widget)).to eq((red_widget.price / 2.0).round(2))

      product_codes = ['R01', 'R01', 'R01', 'R01']  # 4 Reds → 2 half-price
      expect(calculator.apply(product_codes, red_widget)).to eq((red_widget.price / 2.0 * 2).round(2))
    end

    it 'should ignores other products in basket' do
      product_codes = ['R01', 'G01', 'R01', 'B01']
      expect(calculator.apply(product_codes, red_widget)).to eq((red_widget.price / 2.0).round(2))
    end
  end
end
