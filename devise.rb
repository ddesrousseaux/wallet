require 'rubygems'
require 'sqlite3'


class Devise
  include Value
	attr_accessor :name, :exchange_rate

  def save
    db = SQLite3::Database.new( "wallet.db" )
    db.execute('insert into devises VALUES (:name, :rate_currency)', "name" => @name, "rate_currency"=> @exchange_rate)
    db.close()
  end

end