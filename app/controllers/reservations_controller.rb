class ReservationsController < ApplicationController
  def index
    @reservations = Reservations.all
  end
  def new
    @reservation = Reservation.new
    @coworkingspace = Coworkingspace.find(params[:coworkingspace_id])
    @chooseroom = params[:types_of_spaces]
  end
  def create
    @reservation = Reservation.new(reservation_params)
    @coworkingspace = Coworkingspace.find(params[:coworkingspace_id])
    @reservation.user_id = current_user.id
    if @reservation.save
      @reservation.room.update(available: false)
      redirect_to root_path
     flash[:notice] = "Your Reservation is Completed"
    else
     redirect_back fallback_location: root_path
     flash[:alert] = "Reservation Failed"
    end
  end


  private
  def reservation_params
    params.require(:reservation).permit(:reservation_start, :reservation_end, :room_id, )
  end

end
