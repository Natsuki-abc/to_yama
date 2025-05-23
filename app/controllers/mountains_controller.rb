class MountainsController < ApplicationController
  before_action :season_string, only: [:create, :update]
  before_action :set_q, only: [:index, :search]

  def index
  end

  def show
    @mountain = Mountain.find(params[:id])
    gon.latitude = @mountain.latitude
    gon.longitude = @mountain.longitude
    @comments = @mountain.comments
    @comment = Comment.new
  end

  def search
    @results = @q.result
    @search_word = if @q.address_cont.present?
                     @q.address_cont
                   elsif @q.area_cont.present?
                     @q.area_cont
                   else
                     @q.mountain_name_or_address_or_time_or_station_or_season_or_parking_or_area_or_furigana_cont
                   end
  end

  private

  def mountain_params
    params.require(:mountain)
          .permit(:mountain_name, :address, :time, :elevation, :difficulty,
                  :station, :parking, :distance, :mountain_image, :area,
                  :latitude, :longitude, season: [])
  end

  def season_string
    params[:mountain][:season] = params[:mountain][:season].join(“, ”)
  end

  def set_q
    @q = Mountain.ransack(params[:q])
  end
end
