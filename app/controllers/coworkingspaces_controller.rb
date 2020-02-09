class CoworkingspacesController < ApplicationController
  before_action :authenticate_user!
  def index
    @coworkingspaces = Coworkingspace.all
  end
  def new
    @coworkingspace = Coworkingspace.new
  end
  def create
    @coworkingspace = Coworkingspace.new(coworkingspace_params)
    #@coworkingspace.user_id = current_user.id
      #if @coworkingspace.save
        #redirect_to @coworkingspace
      #  flash[:notice] = "Coworking Space Created!"
      #else
      #  redirect_back (fallback location: root_path)
      #  flash[:alert] = "Coworking Space Creation failed"
      #end
  end
  def show
    @coworkingspace = Coworkingspace.find(params[:id])
  end
  private
  def coworkingspace_params
    params.require(:coworkingspace).permit(:name, :pic, :address, :city,:spaces_qty)
  end
end
