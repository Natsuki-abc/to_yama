class MountainsController < ApplicationController
  before_action :season_string, only: [:create, :update] 
  before_action :set_q, only: [:index, :search]

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

  def search
    @results = @q.result
  end

  private

  def mountain_params
    params.require(:mountain).permit(:mountain_name, :address, :time, :elevation, :difficulty, :station, :parking, :distance, season: [])
  end

  def season_string
    params[:mountain][:season] = params[:mountain][:season].join(“,”)
  end

  def set_q
    @q = Mountain.ransack(params[:q])
  end
end
