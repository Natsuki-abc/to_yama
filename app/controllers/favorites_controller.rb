class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def index
    @favorites = current_user.favorites
  end

  def create
    @mountain = Mountain.find(params[:mountain_id])
    current_user.favorite(@mountain)
  end

  def destroy
    @mountain = current_user.favorite_mountains.find(params[:id])
    current_user.unfavorite(@mountain)
  end
end
