class PlacesController < ApplicationController
  def new
    Place.new
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
    @places = @places.similar_to(params[:query]) if params[:query].present

    render template: 'places/index' # render partial: 'places/index'
    def show
      @review = current_user.reviews.new
      @place = Place.find_by(id: params[:id])
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

  private

  def place_params
  params.require(:place).permit(:name, :type, :address, :city, :country, :difficulty, :description, {images: []})
  end
end
