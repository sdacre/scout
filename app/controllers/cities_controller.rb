class CitiesController < ApplicationController
  def new
    @city = City.new
  end

  def create
    @city = City.new(city_params)
    if @city.save
      redirect_to root_path
    else
      render tempate: 'cities/new'
    end
  end

  def index
    @cities = City.all
    render template: 'homes/index' # render partial: 'citys/index'
  end
  #
  # def show
  #   # byebug
  #   @city         = City.find(params[:id])
  #   redirect_to
  # end


  def edit
     @city = City.find(params[:id])
  end

  def update
    @City = City.find(params[:id])
    if @city.update(city_params)
      flash[:success] = 'Successfully updated the city'
      redirect_to root_path
    else
      flash[:danger] = 'Error updating city'
      render :edit
    end
  end

  def destroy
    @city = City.find(params[:id])
  end

  private
  def city_params
    params.require(:city).permit(:name,
                                  :link,
                                  {photo: []})
  end
end
