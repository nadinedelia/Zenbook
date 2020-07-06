class PostsController < ApplicationController
  
  def new
    @post = Post.new
  end
  # GET REQUEST. render the form new.html.erb
  
  def create
    @post = Post.create(post_params)

    if @post.errors.any?
      render 'new'
    else
      flash[:msg] = 'Your post was successful!'
      redirect_to posts_url
    end
  end
  # p = Post.create(message: 'hello Minsi')
  #  (0.4ms)  BEGIN
  # SQL (3.9ms)  INSERT INTO "posts" ("message", "created_at", "updated_at") 
  # VALUES ($1, $2, $3) RETURNING "id"  [["message", "hello Minsi"], ["created_at", "2020-07-03 10:13:30.055910"], 
  # "updated_at", "2020-07-03 10:13:30.055910"]]
  # after making the create note, it redirect_to posts_url

  def index
    @posts = Post.all.order(created_at: :desc)
        # default setting order for created_at column, newest item first

  end
  # SELECT  "posts".* FROM "posts" LIMIT $1 
  # render index.erb page to display all the posts
  

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    # destroy is a buildin method for delete post. @post is assignning the id to a particular post to destroy
    flash[:msg] = 'Your post was deleted!'
    redirect_to posts_path
  end
 
  # Post.destroy(2)
  # Post Load (0.7ms)  SELECT  "posts".* FROM "posts" WHERE "posts"."id" = $1 LIMIT $2  [["id", 2], ["LIMIT", 1]]
  #  (0.3ms)  BEGIN
  # SQL (0.4ms)  DELETE FROM "posts" WHERE "posts"."id" = $1  [["id", 2]]

 #<Post id: 2, message: "It is testing", created_at: "2020-07-03 10:59:27", updated_at: "2020-07-03 10:59:27"> 

  def edit
    @post = Post.find(params[:id])
  end

  # GET ROUTE
  # Post.find(4)
  # Post Load (0.3ms)  SELECT  "posts".* FROM "posts" WHERE "posts"."id" = $1 LIMIT $2  [["id", 4], ["LIMIT", 1]]

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    flash[:msg] = 'Your post was updated!'
    redirect_to posts_path

  end

  # @post.update(message: "It is Minsi")
  # SQL (1.8ms)  UPDATE "posts" SET "message" = $1, "updated_at" = $2 WHERE "posts"."id" = $3  
  # [["message", "It is Minsi"], ["updated_at", "2020-07-03 11:14:08.997113"], ["id", 1]]
  
  private

  def post_params
    params.require(:post).permit(:message)
  end
end