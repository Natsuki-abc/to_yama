class CommentsController < ApplicationController
  def index
    @comments = current_user.comments
  end

  def new
  end

  def create
    @comment = current_user.comments.new(comment_params)
    @mountain = @comment.mountain_id
    if @comment.save
      flash[:notice] = "新規口コミを投稿しました"
      redirect_to mountain_path(@mountain)
    else
      flash[:notice] = "口コミの投稿に失敗しました"
      redirect_to mountain_path(@mountain)
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def comment_params
    params.require(:comment).permit(:user_id, :mountain_id, :title, :content)
  end
end
