class MountainsController < ApplicationController
  before_action :season_string, only: [:create, :update] 
  before_action :set_q, only: [:index, :search]

  def index
  end

  def show
    @mountain = Mountain.find(params[:id])
  end

  def search
    @results = @q.result
    @search_word = @q.address_cont
  end

  private

  def mountain_params
    params.require(:mountain).permit(:mountain_name, :address, :time, :elevation, :difficulty, :station, :parking, :distance, :mountain_image, season: [])
  end

  def season_string
    params[:mountain][:season] = params[:mountain][:season].join(“,”)
  end

  def set_q
    @q = Mountain.ransack(params[:q])
  end
end
