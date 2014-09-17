class ItemInfo
	def initialize
	end
	def season
		case Time.now.mon
			when 12,1,2 then "winter"
			when 3,4,5 then "spring"
			when 6,7,8 then "summer"
			else "fall"
		end
	end
	def add(qty=0)
		@qty ||= 0
		@qty += qty
	end

	def print_qty
		print @qty
	end

end

class Apple < ItemInfo
	def price
		case season 
			when "winter" then 12
			when "fall" then 15
			else 10
		end
	end
	def discount(cart)
		discount = 0
		if cart[:apple].add >= 2
			discount += price * (cart[:apple].add / 2)
		end
		return discount
	end
	def print_name
		print "Apples"
		print " => "
	end
end

class Oranges < ItemInfo
	def price
		case season 
			when "summer" then 2
			else 5
		end
	end
	def discount(cart)
		discount = 0
		if cart[:oranges].add >= 3
			discount += price * (cart[:oranges].add / 3)
		end
		return discount
	end
	def print_name
		print "Oranges"
		print " => "
	end

end

class Grapes < ItemInfo
	def price
		return 15
	end
	def discount(cart)
		discount = 0
		if cart[:grapes].add >= 4 && cart[:banana].add > 0
			discount += price * (cart[:grapes].add / 4)
			if discount > price * cart[:banana].add
				discount = price * cart[:banana].add
			end
		end
		return discount
	end
	def print_name
		print "Grapes"
		print " => "
	end
end

class Banana < ItemInfo
	def price
		case season 
			when "winter" then 21
			else 20
		end
	end
	def discount(cart="")
		return 0
	end
	def print_name
		print "Bananas"
		print " => "
	end
end

class Watermelon < ItemInfo
	def price
		if Time.now.sunday?
			return 100
		else
			return 50
		end
	end
	def discount(cart="")
		return 0
	end
	def print_name
		print "Watermelon"
		print " => "
	end
end