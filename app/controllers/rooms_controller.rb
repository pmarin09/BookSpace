class RoomsController < ApplicationController
  before_action :authenticate_user!
  def index
    @rooms = Room.all
  end
  def new
    @coworkingspace = Coworkingspace.find(params[:coworkingspace_id])
    @room = Room.new
  end
  def create
    @room = Room.new(room_params)
    @coworkingspace = Coworkingspace.find(params[:coworkingspace_id])
    @room.coworkingspace_id = params[:coworkingspace_id]
      if @room.save
        redirect_to coworkingspace_room_path(@coworkingspace,@room)
      flash[:notice] = "New type of space created!"
      else
       redirect_back (fallback location: root_path)
       flash[:alert] = "Space type creation failed"
      end
  end
  def show
    @room = Room.find(params[:id])
  end
  def edit
    @room = Room.find(params[:id])
    if current_user != @room.user
      sign_out current_user
      redirect_to root_path
      flash[:notice] = "Unauthorized Request"
    end
  end
  def update
    @room = Room.find(params[:id])
    if current_user == @room.user
      @room.update(room_params)
      redirect_to "/coworkingspaces/#{@coworkingspace.id}/space_types/#{@room.id}/edit"
      flash[:notice] = "Coworking Space Succesfully Updated"
    else
      redirect_back(fallback_location: root_path)
      flash[:alert] = "Not authorized to edit this Coworking Space"
    end
  end

  private
  def room_params
    params.require(:room).permit(:types_of_spaces, :pic)
  end

end
