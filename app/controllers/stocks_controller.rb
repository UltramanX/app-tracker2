class StocksController < ApplicationController

	def search
	 if params[:stock].present?
       @stock = Stock.new_from_lookup(params[:stock])
       if @stock
       	respond_to do |format|
        format.js { render partial: 'users/schresult' }
        #'users/my_portfolio' -http req 
        #json: @stock - test
       end
        
       else
        flash[:danger] = "Incorrect ticker entered"
        redirect_to my_portfolio_path
       end
 	   else
 	    flash[:danger] = "Empty ticker entered"
 	    redirect_to my_portfolio_path
 	   end
  	end

end