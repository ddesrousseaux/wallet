class Auction
  include Value
  attr_accessor :name, :exchange_rate
	
  def randnum
    @exchange_rate.call
  end
end