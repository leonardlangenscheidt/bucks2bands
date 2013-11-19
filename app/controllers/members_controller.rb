class MembersController < ApplicationController
	def create
		member = Stripe::Customer.create(
		  :card => params[:stripeToken],
		  :plan => "Standard",
		  :email => current_user.email
		)
		flash[:notice] = "Successfully suscribed!"
		redirect_to 'profile'
	end
end
