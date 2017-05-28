class ListingsController < ApplicationController
	def index 
		@listings = Listing.all
	end

	def show 
		@listing = Listing.find(params[:id])
	end 

	def edit 
		@listing = Listing.find(params[:id])
	end 

	def destroy 
		@listing = Listing.find(params[:id])
	end
end
