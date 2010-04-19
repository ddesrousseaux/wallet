require 'devise.rb'

d= Devise.new
d.exchange_rate = 0.88
d.name = "Euro"

puts d