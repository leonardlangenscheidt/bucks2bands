class PagesController < ApplicationController

	def landing
		if signed_in?
			redirect_to '/faceoff'
		end
	end

	def profile
		@user = current_user
		@upvotes = @user.upvotes
		@artists = Artist.all
	end

end
