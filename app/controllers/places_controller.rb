class PlacesController < ApplicationController

  def new
    @place = Place.new
  end

  def create
    @place = Place.new(place_params)
    if @place.save
      redirect_to place_path(@place)
    else
      render tempate: 'places/new'
    end
  end

  def index
    @places = Place.all
    @places = @places.similar_to(params[:query]) if params[:query]
    render template: 'places/index' # render partial: 'places/index'
  end
    
  def show
    @place         = Place.find(params[:id])
    @new_review    = @place.reviews.new
    @reviews       = @place.reviews.all
    @place_reviews = Review.where(place_id: params[:id])
    # @all_users     = Review.where(user_id: )
      
    render template: 'places/show'
    
    # @places = @places.search_places(params[:query]) if params[:query] # .page(params[:page]).per_page(3) for pagination
    # render template: 'places/index' # render partial: 'places/index'
  end
    
  # def show
  #   @place = Place.find(params[:id])
  #   render template: 'places/show'
  # end

  def edit
    @place = Place.find_by(id: params[:id])
  end

  def update
    @place = Place.find_by(id: params[:id])
    if @place.update(place_params)
      flash[:success] = 'Successfully updated the place'
      redirect_to @place
    else
      flash[:danger] = 'Error updating place'
      render :edit
    end
  end

  def destroy
    @place = Place.find_by(id: params[:id])
  end

  private
  def place_params
    params.require(:place).permit(:name, 
                                  :kind, 
                                  :address, 
                                  :city, 
                                  :country, 
                                  :difficulty, 
                                  :description, 
                                  {image: []})
  end

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
