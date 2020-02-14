class RoomsController < ApplicationController
  before_action :authenticate_user!
  def index
    @rooms = Room.all
    @roomlist = Room.where(types_of_spaces: params[:types_of_spaces], available: true)
    @coworkingspace = Coworkingspace.all
  end
  def new
    @coworkingspace = Coworkingspace.find(params[:coworkingspace_id])
    @room = Room.new
  end
  def create
    @room = Room.new(room_params)
    @coworkingspace = Coworkingspace.find(params[:coworkingspace_id])
    @room.coworkingspace_id = params[:coworkingspace_id]
    if current_user == @coworkingspace.user
      if @room.save
        redirect_to coworkingspace_room_path(@coworkingspace,@room)
      flash[:notice] = "New type of space created!"
      else
       redirect_back(fallback_location: root_path)
       flash[:alert] = "Space type creation failed"
      end
    else
      redirect_back(fallback_location: root_path)
      flash[:alert] = "You are not authorized to create this room"
    end
  end
  def show
    @room = Room.find(params[:id])
  end
  def edit
    @room = Room.find(params[:id])
    @coworkingspace = Coworkingspace.find(params[:coworkingspace_id])
  end
  def update
    @coworkingspace = Coworkingspace.find(params[:coworkingspace_id])
    @room = Room.find(params[:id])
    if current_user == @coworkingspace.user
      @room.update(room_params)
      redirect_to "/coworkingspaces/#{@coworkingspace.id}/rooms/#{@room.id}/edit"
      flash[:notice] = "Room Succesfully Updated"
    else
      redirect_back(fallback_location: root_path)
      flash[:alert] = "Not authorized to edit this Room"
    end
  end

  private
  def room_params
    params.require(:room).permit(:types_of_spaces, :pic, :available)
  end

end
