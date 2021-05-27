class BookingsController < ApplicationController
  def show
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def new
    @summer_house = SummerHouse.find(params[:summer_house_id])
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    @summer_house = SummerHouse.find(params[:summer_house_id])
    @booking.summer_house = @summer_house
    @booking.user = current_user
    authorize @booking
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    authorize @booking
    # @summer_house = @booking.summer_house
    # @user = @booking.user
    @booking.destroy
    redirect_to user_path(current_user)
  end

  private

  def booking_params
    params.require(:booking).permit(:booking_start, :booking_end)
  end
end
