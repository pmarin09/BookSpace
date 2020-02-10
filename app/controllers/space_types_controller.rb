class SpaceTypesController < ApplicationController
  before_action :authenticate_user!
  def index
    @spacetypes = SpaceType.all
  end
  def new
    @coworkingspace = Coworkingspace.find(params[:coworkingspace_id])
    @spacetype = SpaceType.new
  end

  def create
    @spacetype = SpaceType.new(spacetype_params)
    @coworkingspace = Coworkingspace.find(params[:coworkingspace_id])
    @spacetype.coworkingspace_id = params[:coworkingspace_id]
      if @spacetype.save
        redirect_to coworkingspace_space_type_path(@coworkingspace,@spacetype)
      flash[:notice] = "New type of space created!"
      else
       redirect_back (fallback location: root_path)
       flash[:alert] = "Space type creation failed"
      end
  end

  def show
    @spacetype = SpaceType.find(params[:coworkingspace_id])
  end

  private
  def spacetype_params
    params.require(:space_type).permit(:types_of_spaces, :pic)
  end

end
