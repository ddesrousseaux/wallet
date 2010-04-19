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

# sort
sorted = devises.values.sort_by {|devise| devise.exchange_rate}

# average
somme = 0.0
devises.each { |name, devise|
  somme+= devise.exchange_rate
}
average = somme / devises.values.length



puts "La moyenne est : "+ average.to_s