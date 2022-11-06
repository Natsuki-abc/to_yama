class MountainsController < ApplicationController
  before_action :season_string, only: [:create, :update] 

  def index
  end

  def show
  end

  def new
    @mountain = Mountain.new
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end

  def order_params
    params.require(:mountain).permit(:mountain_name, :address, :time, :elevation, :difficulty, :station, :parking, :distance, season: [])
  end

  def season_string
    params[:mountain][:season] = params[:mountain][:season].join(“,”)
    end
end
