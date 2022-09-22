class ReservationsController < ApplicationController
  before_action :authenticate_user!
#   before_action :set_reservation, only: [:show, :edit, :update, :destroy]
#   before_action :set_reservations, only: [:index, :show, :edit]

      
  def index 
    @upcoming_reservations = current_user.upcoming_reservations
  end 
  
  def show 
     render('reservationview')
  end
  
  def new 
    @reservations = current_user.reservations.select { |a| a.persisted? }
    @reservation = current_user.reservations.build
   
  end

    def create 
    @reservation = Reservation.new(reservation_params.merge(user_id: current_user.id))
    if @reservation.valid?
      @reservation.save
      redirect_to reservations_path
    else 
      @reservation.user = nil
      @reservations = current_user.reservations.select { |a| a.persisted? }
      render :new
    end
  end
  
  def edit 
  end

   def update 
    if @reservation.update(reservation_params)
      redirect_to reservations_path
    else 
      set_reservations
      render :edit
    end
  end
  
  def destroy 
    @reservation.destroy 
    redirect_to reservations_path
  end

  private

#    def set_reservation
#     @reservation = current_user.reservations.find_by(id: params[:id])
#     if @reservation.nil? 
#       flash[:error] = "Appointment not found."
#       redirect_to reservations_path
#     end
#   end
  
#   def set_reservations
#     @reservations = current_user.reservations.order(reservation_time: :desc)
#   end
  
#   def reservation_params
#     params.require(:reservation).permit( appointment_time: [:date, :hour, :min], duration: [:hour, :min])
#   end


end
