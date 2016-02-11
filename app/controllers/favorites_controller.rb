class FavoritesController < ApplicationController

  def create
    post = Post.find(params[:post_id])
    favorite = current_user.favorites.build(post: post)

    if favorite.save
      flash[:notice] = "This post was added to your favorite list."
      redirect_to [post.topic, post]
    else
      flash[:error] = "There was an error adding this post to your favorites. please try again."
      redirect_to [post.topic, post]
    end
  end

  def destroy
    post = Post.find(params[:post_id])
    favorite = current_user.favorites.find_by_post_id(post)

    if favorite.destroy
      flash[:notice] = "This pos was removed from you favorites list."
      redirect_to [post.topic, post]
    else
      flash[:error] = "There is an error removing this from you favorites list. please try again."
      redirect_to [post.topic, post]
    end
  end
end
