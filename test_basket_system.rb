require_relative "app/controllers/basket_controller"

puts "Inputs: B01, G01"
basket1 = BasketController.new
basket1.add("B01")
basket1.add("G01")
total = basket1.total
puts "Total: $#{total}"

puts

p "*"*10

puts

puts "Inputs: R01, R01"
basket2 = BasketController.new
basket2.add("R01")
basket2.add("R01")
total = basket2.total
puts "Total: $#{total}"

puts

p "*"*10

puts

puts "Inputs: R01, G01"
basket3 = BasketController.new
basket3.add("R01")
basket3.add("G01")
total = basket3.total
puts "Total: $#{total}"

puts

p "*"*10

puts

puts "B01, B01, R01, R01, R01"
basket4 = BasketController.new
basket4.add("B01")
basket4.add("B01")
basket4.add("R01")
basket4.add("R01")
basket4.add("R01")
total = basket4.total
puts "Total: $#{total}"

puts
