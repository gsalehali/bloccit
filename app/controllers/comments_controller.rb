class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @comment.post = @post
    authorize @comment
    if @comment.save
      flash[:notice] = "Comment was saved"
      redirect_to topic_post_path(@post.topic, @post)
    else
      flash[:error] = "There was an error saving the comment. Please try again."
      redirect_to topic_post_path(@post.topic, @post)
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])

    authorize @comment
    if @comment.destroy
      flash[:notice] = "Comment was removed"
      redirect_to [@post.topic, @post]
    else 
      flash[:error] = "Comment coulden't be deleted. Try again."
      render :show
    end
  end

  private 

  def comment_params
    params.require(:comment).permit(:body)
  end
end