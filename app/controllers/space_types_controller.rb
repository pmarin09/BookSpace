class SpaceTypesController < ApplicationController
  before_action :authenticate_user!
  def index
    @spacetypes = SpaceType.all
  end
  def new
    @spacetypes = SpaceType.new
  end

  def create
    @spacetypes = SpaceType.new(spacetype_params)
    @spacetypes.user_id = current_user.id
      if @spacetype.save
        redirect_to @spacetype
      flash[:notice] = "New type of space created!"
      else
       redirect_back (fallback location: root_path)
       flash[:alert] = "Space type creation failed"
      end
  end

  private
  def spacetype_params
    params.require(:spacetype).permit(:type, :pic)
  end

end
