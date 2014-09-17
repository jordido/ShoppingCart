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

	def print_name
		print self.class.name
		print " => "
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
			discount = price * (cart[:apple].add / 2).floor
		end
		return discount
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
			discount = price * (cart[:oranges].add / 3).floor
		end
		return discount
	end
end

class Grapes < ItemInfo
	def price
		return 15
	end
	def discount(cart)
		discount = 0
		grapes_qty = cart[:grapes].add
		bananas_qty = cart[:banana].add
		bananas_price = cart[:banana].price
		if grapes_qty >= 4 && bananas_qty > 0
			discount = bananas_price * (grapes_qty / 4).floor
			if discount > bananas_price * bananas_qty
				discount = bananas_price * bananas_qty
			end
		end
		return discount
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
end