class UsersController < ApplicationController
  def show
    # write a method to get the instance of that specific id from routes.
    # @user = User.find(params[:id])
    def show
      @user = User.find(params[:id])
      @bookings = Booking.where(user_id: @user)
      @summer_houses = SummerHouse.where(user_id: @user)
      authorize @user
    end
  end
end
