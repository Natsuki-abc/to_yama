class CommentsController < ApplicationController
  def index
    @comment = current_user.comments
  end

  def new
  end

  def create
    @comment = current_user.comments.new(comment_params)
    if @comment.save
      flash[:notice] = "新規口コミを投稿しました"
      redirect_to controller: :mountains, action: :show, id: @comment.mountain_id
    else
      flash.now[:notice] = "口コミの投稿に失敗しました"
      render mountain_path(@comment.mountain_id)
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
