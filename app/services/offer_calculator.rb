class OfferCalculator
  def apply(product_codes, eligible_product)
    eligible_count = product_codes.count { |code| code == eligible_product.code }

    # Calculate how many half-price discounts apply
    num_half_price_discounts = eligible_count / 2

    (num_half_price_discounts * (eligible_product.price / 2.0)).round(2)
  end
end
