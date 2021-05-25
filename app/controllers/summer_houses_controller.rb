class SummerHousesController < ApplicationController

  def index
    @summer_houses = SummerHouse.all
    @summer_houses = policy_scope(SummerHouse).order(created_at: :desc)
  end

  def show
    @summer_house = SummerHouse.find(params[:id])
    # @summer_house = policy_scope(summer_house)
    authorize @summer_house
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
    @summer_house = SummerHouse.find(params[:id])
    authorize @summer_house
    @summer_house.destroy
    redirect_to summer_houses_path
  end

  def summer_house_params
    params.require(:summer_house).permit(:title, :description, :price, :location, :capacity)
  end
end
