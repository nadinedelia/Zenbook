class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    p @post
    @comment = @post.comments.build(comment_params)
    @comment.user_id = current_user.id
    p @post.comments.first
    @comment.save
    p @post.comments.first
    flash[:msg] = 'Your comment was successful!'
    redirect_to posts_path
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :post_id, :user_id)
  end
end
