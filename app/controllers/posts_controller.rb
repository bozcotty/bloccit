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
  end

  def edit
  end
end
