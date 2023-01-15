class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_user, only: [:edit, :update, :destroy]

  def index
    @comments = current_user.comments
  end

  def new
  end

  def create
    @comment = current_user.comments.new(comment_params)
    @mountain = @comment.mountain_id
    if @comment.save
      flash[:notice] = '新規口コミを投稿しました'
    else
      flash[:notice] = '口コミの投稿に失敗しました'
    end
    redirect_to mountain_path(@mountain)
  end

  def show
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      flash[:notice] = '口コミを編集しました'
      redirect_to comments_path
    else
      flash.now[:notice] = '口コミの編集に失敗しました'
      render 'edit'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:notice] = '口コミを削除しました'
    redirect_to comments_path
  end

  def comment_params
    params.require(:comment).permit(:user_id, :mountain_id, :title, :content)
  end

  private

  def ensure_user
    @comment = Comment.find(params[:id])
    redirect_to root_path unless @comment.user_id == current_user.id
  end
end
