require 'rubygems'
require 'sqlite3'

db = SQLite3::Database.new( "wallet.db" )
db.execute("create table devises (name varchar(10), rate_currency float)")
db.execute('insert into devises VALUES (:name, :rate_currency)', "name" => name, "rate_currency"=> rate_currency)
db.close()