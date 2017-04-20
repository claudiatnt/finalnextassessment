class BraintreeController < ApplicationController
	 def new
  	@client_token = Braintree::ClientToken.generate
	end

	def checkout
	  nonce_from_the_client = params[:checkout_form][:payment_method_nonce]

	  value = 5 

	  result = Braintree::Transaction.sale(
	   :amount => value, #this is currently hardcoded
	   :payment_method_nonce => nonce_from_the_client,
	   :options => {
	      :submit_for_settlement => true
	    }
	   )

	  if result.success?
	  	byebug
	  	current_user.update(money + value)
	    redirect_to :root, :flash => { :success => "Transaction successful! 5 dollars added!" }
	  else
	    redirect_to :root, :flash => { :error => "Transaction failed. Please try again." }
	  end 
	end
end
