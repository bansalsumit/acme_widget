# Acme Widget Co

A proof-of-concept basket system for Acme Widget Co that allows adding products to a basket, calculating subtotals, and managing product data. This project demonstrates clean Ruby code, object-oriented design, and automated testing with RSpec.

## Technologies
- Ruby 3.2.2
- RSpec for testing

## Table of contents
* [Acme Widget Co](#acme-widget-co)
* [Technologies](#technologies)
* [Setup System](#setup-system)
* [Run Solution](#run-solution)
* [Running Tests](#running-tests)
* [Features](#features)
* [Goals](#goals)
* [Other information](#other-information)

## Setup System
To run this project:

```
# Clone the repo
git clone git@github.com:bansalsumit/acme_widget.git
cd acme_widget

# Install Ruby 3.2.2 using RVM
rvm install 3.2.2
rvm use 3.2.2

# Install dependencies
bundle install
```

## Run Solution
  * ruby test_basket_system.rb

## Running Tests
* Run all RSpec test cases:
  * bundle exec rspec --format documentation (**Currently Excluding product test cases.**)
  * bundle exec rspec spec/models/product_spec.rb

## Features
- **Add products to a basket and calculate subtotal**
- **Calculate the total price for a basket of products**
- Retrieve product details by product code
- Return a hash of prices for multiple product codes
- Handle unknown product codes gracefully
- Tested with RSpec to ensure correctness

## Other information
* Author - Sumit Bansal
* Github - https://github.com/bansalsumit
* Linkedin - https://www.linkedin.com/in/sumitbansal-connect/
