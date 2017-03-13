class HomesController < ApplicationController

  def index
     @places = Place.all
  end

end
