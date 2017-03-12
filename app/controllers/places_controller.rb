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
    @places = @places.search_places (params[:query]) if params[:query] # .page(params[:page]).per_page(3) for pagination
      if params[:search].present?
      @locations = Place.near(params[:search], 50, :order => :distance)
      else
      @locations = Place.all
      end
    render template: 'places/index' # render partial: 'places/index'
  end


  def show
    # @reviews = Review.find_by(place_id: params[:id])
    # @review = current_user.reviews.new
    @place = Place.find(params[:id])
    render template: 'places/show'
  end

def edit
  @place = Place.find_by(id: params[:id])

end

def update
  @place = Place.find_by(id: params[:id])
if @place.update(place_params)
  flash[:success] = 'Successfully updated the listing'
  redirect_to @place
else
  flash[:danger] = 'Error updating listing'
  render :edit
end
end

def destroy
  @place = Place.find_by(id: params[:id])
end

  private

  def place_params
  params.require(:place).permit(:name, :kind, :address, :city, :country, :difficulty, :description, {image: []})
  end
end
