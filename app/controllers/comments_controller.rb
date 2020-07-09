class CommentsController < ApplicationController

    before_action :find_post
    before_action :find_comment, only: [:edit, :update, :destroy]

  def create
    @comment = @post.comments.build(comment_params)
    @comment.user_id = current_user.id
    @comment.save
    flash[:msg] = 'Your comment was successful!'
    redirect_to posts_path
  end

  def edit
  end

  def update
    @comment.update(comment_params)
    flash[:msg] = 'Your comment is updated!'
    redirect_to posts_path
  end

  def destroy
    @comment.destroy
    flash[:msg] = "Comment gone!!"
    redirect_to posts_path
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end

  def find_post
    @post = Post.find(params[:post_id])
  end

  def find_comment
    @comment = @post.comments.find(params[:id])
  end

end
