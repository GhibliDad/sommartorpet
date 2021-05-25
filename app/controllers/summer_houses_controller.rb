class SummerHousesController < ApplicationController
  def index
    @summer_houses = SummerHouse.all
  end

  def show
    @summer_houses = SummerHouse.find(params[:id])
    @summer_house = SummerHouse.new
  end

  def new
  end

  def create
  end

  def destroy
  end
end
