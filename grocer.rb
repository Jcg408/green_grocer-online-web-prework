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

  cart.each do |prod, data|
    if coupons[:item] == prod
      amount = cart[prod][:count] - coupons[:num]
      update[prod][:count] = amount
      update["#{coupons[:item]} W/COUPON"] = {:price => coupons[:cost], :clearance => true, :count => 1}
    end
  end
  update
end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end
