require 'pry'
require 'date'
require_relative 'fruit_classes'

class ShoppingCart

	def initialize
		@cart_cost = 0
		@item_details = {}
	end

	def add_discount
		discount = 0
		@item_details.each do |fruit, rest_of_data|
			dto_line = @item_details[fruit].discount(@item_details)
			if dto_line != 0
				print "discount: "
				@item_details[fruit].print_name
				puts dto_line
			end
			discount += dto_line
		end
		@cart_cost -= discount.to_i
	end

	def cost
		@item_details.each do |fruit, rest_of_data|
			if @item_details[fruit]
				@cart_cost += @item_details[fruit].add(0) * @item_details[fruit].price
				@item_details[fruit].print_name
				@item_details[fruit].print_qty
				print " * "
				puts @item_details[fruit].price
			end
		end
		print "First Total: "
		puts @cart_cost
		add_discount
		return @cart_cost
	end

	def buy(fruit,units=1)
		fruit_name=fruit.to_s.capitalize
		if @item_details[fruit]
			@item_details[fruit].add(units)
		else	
			@item_details[fruit]=Object.const_get(fruit_name).new
			@item_details[fruit].add(units)
		end
	end

	def print_cart
		puts "The price of your cart is: #{cost}" 
	end
end

