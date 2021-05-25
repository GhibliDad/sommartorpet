class SummerHousesController < ApplicationController

  def index
  end

  def show
  end

  def new
  end

  def create
  end

  def destroy
    @summer_house = SummerHouse.find(params[:id])
    @summer_house.destroy
    redirect_to summer_houses_path
  end

end
