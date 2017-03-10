class ReviewsController < ApplicationController
	
#### dont think we need this, as i imagine we will be posting reviews on places#show. Are we? 
	def new
		@review = Review.new
	end

#### dont think we need this as well? all the reviews of a place is in places#show??? add @place_rev
	# def index
	# 	@reviews = Reviews.all.order(created_at: :desc)
	# end

	def create
		byebug
		@current_place = Place.find(params[:place_id])
		@review = @current_place.reviews.new(review_params)
		@review.place_id = params[:id]
		if @review.save
			redirect_to place_path(params[:place_id])
		else
			redirect_to new_place_review_path
		end
	end

	def destroy
		@review = Review.find(params[:id])
		@review.destroy
	end

	private
	def review_params
		params.require(:review).permit(:rate_general, 
			                             :desc_general, 
			                             :rate_safe, 
			                             :desc_safe, 
			                             :rate_clean, 
			                             :desc_clean, 
			                             :rate_scenery, 
			                             :desc_scenery)
	end
end
