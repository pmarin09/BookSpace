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
    @coworkingspace.user_id = current_user.id
      if @coworkingspace.save
        redirect_to @coworkingspace
      flash[:notice] = "Coworking Space Created!"
      else
       redirect_back (fallback location: root_path)
       flash[:alert] = "Coworking Space Creation failed"
      end
  end
  def show
    @coworkingspace = Coworkingspace.find(params[:id])
  end

  def destroy
        coworkingspace = Coworkingspace.find(params[:id])
      if current_user == coworkingspace.user
        coworkingspace.destroy
        redirect_to "/coworkingspaces"
        flash[:notice] = "Coworking Space Deleted"
      else
        redirect_back (fallback location: root_path)
        flash[:alert] = "Not authorized to delete Coworking Space"
      end
    end
    def edit
      @coworkingspace = Coworkingspace.find(params[:id])
      if current_user != @coworkingspace.user
        sign_out current_user
        redirect_to root_path
        flash[:notice] = "Unauthorized Request"
      end
    end
    def update
      @coworkingspace = Coworkingspace.find(params[:id])
      if current_user == @coworkingspace.user
        @coworkingspace.update(coworkingspace_params)
        redirect_to "/coworkingspaces/#{@coworkingspace.id}/edit"
        flash[:notice] = "Coworking Space Succesfully Updated"
      else
        redirect_back(fallback_location: root_path)
        flash[:alert] = "Not authorized to edit this Coworking Space"
      end
    end


  private
  def coworkingspace_params
    params.require(:coworkingspace).permit(:name, :pic, :address, :city,:spaces_qty)
  end
end
