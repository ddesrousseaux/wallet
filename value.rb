require 'rubygems'
require 'sqlite3'


module Value

	def to_usd
		@exchange_rate
	end


  def save
    db = SQLite3::Database.new( "wallet.db" )
    db.execute('insert into devises VALUES (:name, :rate_currency, :amount)', "name" => @name, "rate_currency"=> @exchange_rate, "amount"=> @amount)
    db.close()
  end

end