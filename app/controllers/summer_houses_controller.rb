class SummerHousesController < ApplicationController
  def index
    @summer_houses = SummerHouse.all
  end

  def show
    @summer_houses = SummerHouse.find(params[:id])
    @summer_house = SummerHouse.new
  end

  def new
    @summer_house = SummerHouse.new
    authorize @summer_house
  end

  def create
    @summer_house = SummerHouse.new(summer_house_params)
    @summer_house.user = current_user
    authorize @summer_house
    if @summer_house.save
      redirect_to summer_house_path(@summer_house)
    else
      render :new
    end
  end

  def destroy
  end

  def summer_house_params
    params.require(:summer_house).permit(:title, :description, :price, :location, :capacity)
  end
end
