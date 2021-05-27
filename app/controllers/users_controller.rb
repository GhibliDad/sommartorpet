class UsersController < ApplicationController
  # write a method to get the instance of that specific id from routes.
  # @user = User.find(params[:id])
  def show
    @user = User.find(params[:id])
    @bookings = Booking.where(user_id: @user)
    @summer_houses = SummerHouse.where(user_id: @user)
    authorize @user
  end

  def edit
    @user = User.find(params[:id])
    authorize @user
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    authorize @user
    redirect_to user_path(@user)
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :bio, :photo)
  end
end
