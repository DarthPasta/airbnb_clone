class TagsController < ApplicationController
	def new
		listing = Listing.find(params[:id])
		
	end
end
