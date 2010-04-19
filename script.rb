require 'devise.rb'


euro= Devise.new
euro.name= "euro"
euro.exchange_rate= 1.3471

yen= Devise.new
yen.name= "yen"
yen.exchange_rate= 0.010868

pound= Devise.new
pound.name= "pound"
pound.exchange_rate= 1.5259

devises = {
  euro.name => euro,
  yen.name => yen,
  pound.name => pound,
}

puts devises