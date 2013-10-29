class CommentsController < ApplicationController
  #def index
  #end

  def new
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
    @comment = Comment.new
    authorize! :create, @comment, message: "You need to be signed up to do that."
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])

    @comment = current_user.comments.build(params[:comment])
    @comment.post = @post

    # @comment = @post.comment.build(params[:comment])
    # @comment.user = current_user

    authorize! :create, @comment, message: "You need to be signed in to do that."
    if @comment.save
      flash[:notice] = "Comment was saved."
      redirect_to [@topic, @post]
    else
      flash[:error] = "There was an error saving the comment. Please try again."
      render :new
  end


  # #posts controller create:
  # def create
  #   @topic = Topic.find(params[:topic_id])
  #   @post = current_user.posts.build(params[:post])
  #   @post.topic = @topic
  #   #rem: raise -method -this will short-circuit the method, for testing purposes if needed
  #   authorize! :create, @post, message: "You need to be signed up to do that."
  #   if @post.save #.save is an AR method that updates the DB
  #     flash[:notice] = "Post was saved."
  #     redirect_to [@topic, @post]
  #   else
  #     flash[:error] = "There was an error saving the post. Please try again."
  #     render :new
  # end

  #   #topics controller create:
  # def create
  #   @topic = Topic.new(params[:topic])
  #   #same as above line: @topic = Topic.new(name: 'new topic', description: 'this is a new topic')
  #   authorize! :create, @topic, message: "You need to be an admin to do that."
  #   if @topic.save
  #     flash[:notice] = "Topic was saved successfully."
  #     redirect_to @topic
  #   else
  #     flash[:error] = "Error creating topic. Please try again."
  #     render :new
  #   endk
  # end

end
end
