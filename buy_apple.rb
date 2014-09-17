require_relative "shopping_cart.rb"

cart = ShoppingCart.new
cart.buy :watermelon
cart.buy :oranges, 4
cart.buy :apple, 6
cart.buy :grapes, 5
cart.buy :banana, 3
cart.buy :watermelon, 2
cart.print_cart