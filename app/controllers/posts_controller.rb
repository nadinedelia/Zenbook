class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    redirect_to posts_url
  end
  # p = Post.create(message: 'hello Minsi')
  #  (0.4ms)  BEGIN
  # SQL (3.9ms)  INSERT INTO "posts" ("message", "created_at", "updated_at") 
  # VALUES ($1, $2, $3) RETURNING "id"  [["message", "hello Minsi"], ["created_at", "2020-07-03 10:13:30.055910"], 
  # "updated_at", "2020-07-03 10:13:30.055910"]]

  def index
    @posts = Post.all
  end
  # SELECT  "posts".* FROM "posts" LIMIT $1 
  

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to posts_path
  end

  def edit
    @post = Post.find(params[:id])
  end
  # Post.find(4)
  # Post Load (0.3ms)  SELECT  "posts".* FROM "posts" WHERE "posts"."id" = $1 LIMIT $2  [["id", 4], ["LIMIT", 1]]

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    
    redirect_to posts_path

  end
  
  private

  def post_params
    params.require(:post).permit(:message)
  end
end

# how to create a post locally in the console?