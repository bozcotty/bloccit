class CommentsController < ApplicationController
  
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
  end

  def destroy
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
    # @post = @topic.posts.find(params[:post_id])
    @comment = Comment.find(params[:id])
    # @comment = @post.comments.find(params[:id])

    authorize! :destroy, @comment, message: "You need to own the comment to delete it."
    if @comment.destroy
      flash[:notice] = "Comment was removed."
      redirect_to [@topic, @post]
    else
      flash[:error] = "Comment could not be deleted. Try again."
      redirect_to [@topic, @post]
    end
  end

end
