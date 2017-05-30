class ListingsController < ApplicationController
	def index 
		@listings = Listing.all.paginate(page: params[:page], per_page: 6)

	end

	def new 
		@listing = Listing.new
	end

	def create 
		if current_user.id
		@listing = Listing.create(listing_params)
		@listing.user_id = current_user.id
		@listing.save
		redirect_to addtag_path(@listing.id)
		else
			render 'new'
		end
	end

	def add_tag 
		@listing = Listing.find(params[:id])
	end

	def adding_tag 
		@listing = Listing.find(params[:id])
		@taggable = Taggable.new
		@taggable.listing_id = @listing.id
		@taggable.tag_id = Tag.find_by_name(params[:name]).id
		
		@taggable.save 
		redirect_to addtag_path(@listing.id)
	end

	def book 
		r = Reservation.new
		if current_user
			r.user_id = current_user.id 
			r.listing_id = params[:id]
			r.save 
			 redirect_to tag_add_path 

			 else
			 	redirect_to root_path
		 end
	end

	def show 
		@listing = Listing.find(params[:id])
	end 

	def edit 
		@listing = Listing.find(params[:id])
	end 

	def update 
		@listing = Listing.find(params[:id])
		@listing = Listing.update(listing_params)
		redirect_to listings_path
	end

	def destroy 
		@listing = Listing.find(params[:id])

		if @listing 
		@listing.destroy
		redirect_to listings_path

		else
			redirect_to listings_path
		end
	end

	private 
	def listing_params
	params.require(:listing).permit(:title, :user_id)
	end

	def taggable_params
	params.require(:taggable).permit(:listing_id, :tag_id)
	end
end
