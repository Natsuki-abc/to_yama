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
    else
      @search_word = @q.area_cont
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
