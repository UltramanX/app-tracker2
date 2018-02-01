class Stock < ApplicationRecord
has_many :user_stocks
has_many :users, through: :user_stocks

 def self.find_by_ticker(ticker_symbol)
    where(ticker: ticker_symbol).first
 end
	
def self.new_from_lookup(ticker_symbol)
	begin
	    looked_up_stock = StockQuote::Stock.quote(ticker_symbol)
	    price = strip_commas(looked_up_stock.l)
	    new(name: looked_up_stock.name, ticker: looked_up_stock.t, last_price: price, change: looked_up_stock.c ,
	    	percentage_change: looked_up_stock.cp, volume: looked_up_stock.vo, market_volume: looked_up_stock.mc)
		rescue Exception  => e
		return nil
	end	    
  end

  def self.strip_commas(number)
    number.gsub(",", "")
  end



end
