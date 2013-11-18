class PagesController < ApplicationController
	def landing
		if signed_in?
			redirect_to '/faceoff'
		end
	end
end
