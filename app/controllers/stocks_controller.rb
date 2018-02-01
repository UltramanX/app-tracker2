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
        flash.now[:danger] = "Incorrect ticker entered"
        render partial: 'users/schresult'
       end
 	   else
 	    flash.now[:danger] = "Empty ticker entered"
 	    render partial: 'users/schresult'
 	  end
  end
end