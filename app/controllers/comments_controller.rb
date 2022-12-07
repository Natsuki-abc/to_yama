class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create]

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
      redirect_to mountain_path(@mountain)
    else
      flash[:notice] = '口コミの投稿に失敗しました'
      redirect_to mountain_path(@mountain)
    end
  end

  def show
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.user_id == current_user.id
      @comment.update(comment_params)
      flash[:notice] = '口コミを更新しました'
      redirect_to comments_path
    else
      flash.now[:notice] = '他のユーザーが投稿した口コミは編集できません'
      render 'edit'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.user_id == current_user.id
      @comment.destroy
      flash[:notice] = '口コミを削除しました'
      redirect_to comments_path
    else
      flash.now[:notice] = '他のユーザーが投稿した口コミは削除できません'
      render 'edit'
    end
  end

  def comment_params
    params.require(:comment).permit(:user_id, :mountain_id, :title, :content)
  end
end
