class HomesController < ApplicationController

  def index
     @cities = City.all
  end

end
