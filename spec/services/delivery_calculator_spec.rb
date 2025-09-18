require 'spec_helper'
require_relative '../../app/services/delivery_calculator'

RSpec.describe DeliveryCalculator do
  subject(:calculator) { described_class.new }

  describe '.delivery_cost' do
    it 'should returns $4.95 for orders under $50' do
      expect(calculator.delivery_cost(49.99)).to eq(4.95)
    end

    it 'returns $2.95 for orders under $90 but $50 or more' do
      expect(calculator.delivery_cost(50)).to eq(2.95)
      expect(calculator.delivery_cost(89.99)).to eq(2.95)
    end

    it 'returns 0.0 for orders of $90 or more' do
      expect(calculator.delivery_cost(90)).to eq(0.0)
    end
  end
end
