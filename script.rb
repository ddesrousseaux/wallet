require 'value.rb'
require 'devise.rb'
require 'auction.rb'



euro= Devise.new
euro.name= "euro"
euro.exchange_rate= 1.3471
euro.amount = 200

yen= Devise.new
yen.name= "yen"
yen.exchange_rate= 0.010868
yen.amount = 350

pound= Devise.new
pound.name= "pound"
pound.exchange_rate= 1.5259
pound.amount = 250

aapl_action = Auction.new
aapl_action.name= "AAPL auction"
aapl_action.exchange_rate= lambda {
  240 + rand(20)
}
aapl_action.amount = 5

goog_auction = Auction.new
goog_auction.name= "GOOG auction"
goog_auction.exchange_rate= lambda {
  540 + rand(20)
}
goog_auction.amount = 10

devises = {
  euro.name => euro,
  yen.name => yen,
  pound.name => pound,
  goog_auction.name => goog_auction,
  aapl_action.name => aapl_action
}

# save to db
devises.each { |name, devise|
  devise.save
}


# calc wallet total
somme = 0.0
SQLite3::Database.new( "wallet.db" ) do |db|
  db.execute( "select * from devises" ) do |devise|
    puts devise[0] + " : "+ devise[1].to_s + " * " + devise[2].to_s
    somme+= devise[1].to_f * devise[2].to_f
  end
end
puts "TOTAL = $" + somme.to_s
