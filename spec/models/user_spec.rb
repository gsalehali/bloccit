require 'rails_helper'

describe User do

  include TestFactories

  describe "#favorited(post)" do
    before do
      @post = associated_post
      @user = authenticated_user
    end

    it "returns 'nil' if the user has not favorited the post" do
      favorite = @user.favorites.find_by_post_id(@post)
      expect(favorite).to be_nil
    end

    it "returns the appropriate favorite if it exists" do
      @user.favorites.create(post: @post)
      favorite = @user.favorites.find_by_post_id(@post)
      expect(favorite.post_id).to eq(@post.id)
    end
  end
end