def consolidate_cart(cart)
  update_cart = {}
  cart.each do |item|
    item.each do |name, data|
      if update_cart.has_key?(name)
        update_cart[name][:count]=update_cart[name][:count]+1
     else
       update_cart[name]=data
       update_cart[name][:count]=1
     end
  end
end
update_cart
end

def apply_coupons(cart, coupons)
    update = cart
    coupons.each do |discount|
        if update.has_key?(discount[:item])
            count = 0
            while update[discount[:item]][:count] >= discount[:num]
                count += 1
                update["#{discount[:item]} W/COUPON"] = {:price => discount[:cost], :clearance => update[discount[:item]][:clearance], :count => count}
                update[discount[:item]][:count] -= discount[:num]
            end
        end
    end
    update
end 

def apply_clearance(cart)
  update = cart
  cart.each do |item, data|
    if cart[item][:clearance]==true
      update[item][:price]=(cart[item][:price])-(cart[item][:price] * 0.20)
    end
  end
  update
end

 def checkout(cart, coupons)
  consolidated_cart = consolidate_cart(cart)
  discount = apply_coupons(consolidated_cart, coupons)
  update_cart = apply_clearance(discount)
  total = 0
  	update_cart.each do |name, data|
    	total += data[:price] * data[:count]
  	end
  	if total > 100
      total = total * 0.9 
    end
  total
end