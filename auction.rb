class Auction
  include Value
  attr_accessor :name, :exchange_rate, :amount
	
  def to_usd
    @exchange_rate.call
  end
  
  def save
    db = SQLite3::Database.new( "wallet.db" )
    db.execute('insert into devises VALUES (:name, :rate_currency, :amount)', "name" => @name, "rate_currency"=> @exchange_rate.call, "amount"=> @amount)
    db.close()
  end

end