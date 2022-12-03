class MountainsController < ApplicationController
  before_action :season_string, only: [:create, :update] 
  before_action :set_q, only: [:index, :search]

  def index
  end

  def show
    @mountain = Mountain.find(params[:id])
    @comments = @mountain.comments
    @comment = Comment.new
  end

  def search
    @results = @q.result
    if @q.address_cont.present?
      @search_word = @q.address_cont
    elsif @q.area_cont.present? 
      @search_word = @q.area_cont
    else
      @search_word = @q.mountain_name_or_address_or_time_or_elevation_or_station_or_season_or_parking_or_distance_or_area_or_furigana_cont
    end
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
