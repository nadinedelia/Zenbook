class CommentsController < ApplicationController
    
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user_id = current_user.id
    @comment.save
    flash[:msg] = 'Your comment was successful!'
    redirect_to posts_path
  end

  def edit
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
  end

  def update
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.update(comment_params)
    flash[:msg] = 'Your comment is updated!'
    redirect_to posts_path
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])

    @comment.destroy
    flash[:msg] = "Comment gone!!"
    redirect_to posts_path
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end

end
