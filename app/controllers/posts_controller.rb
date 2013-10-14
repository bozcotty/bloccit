class PostsController < ApplicationController
  def index
    @posts = Post.all #3.8 declared instance variable @posts and assigned it a coll.
    #of Post objects using the ActiveRecord .all method (all method returns a coll.
    #(array) of Post objects)
  end

  def show
    @post = Post.find(params[:id])#find is an AR method that takes an id attribute
    #as an argument. Rails has a params hash that is passed around on every request
    #rem params is a hash, thats why you can extract a value by specifying the key 
    # key: id , in this case
  end

  def new
    @post = Post.new
  end

  #adding a create method to posts_controller.rb
  def create
    post = current_user.posts.build(params[:post])
    raise (params[:post]).to_s
    @post = Post.new(params[:post])
    #rem: raise -method -this will short-circuit the method, for testing purposes if needed
    if @post.save #.save is an AR method that updates the DB
      flash[:notice] = "Post was saved."
      redirect_to @post
    else
      flash[:error] = "There was an error saving the post. Please try again."
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(params[:post])
      flash[:notice] = "Post was updated."
      redirect_to @post
    else
      flash[:error] = "There was an error saving the post. Please try again."
      render :new
    end
  end

end
