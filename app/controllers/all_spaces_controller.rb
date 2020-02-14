class AllSpacesController < ApplicationController
  def index
    @all_spaces = Room.where( available: true)
    @coworkingspace = Coworkingspace.all
  end
  def show
    @room = Room.find(params[:id])
  end

end
