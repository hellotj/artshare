class UsersController < ApplicationController

  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  def show
    @user = User.find(params[:id])
    @activities = PublicActivity::Activity.where(owner_id: @user.id, owner_type: "User")
    
    respond_to do |format|
      format.html
      format.json { render json: @user }
    end
  end

  def follow
    @user = User.find(params[:id])
    current_user.follow!(@user)

    respond_to do |format|
      format.js {}
    end
  end
  def unfollow
    @user = User.find(params[:id])
    current_user.unfollow!(@user)

    respond_to do |format|
      format.js {}
    end 
  end
  def like
      if params[:likeable_type] == "Post"
          @likeable = Post.find(params[:likeable_id])
      else
          @likeable = Comment.find(params[:likeable_id])
      end
      current_user.like!(@likeable)
  end

  def unlike
      if params[:likeable_type] == "Post"
          @likeable = Post.find(params[:likeable_id])
      else
          @likeable = Comment.find(params[:likeable_id])
      end
    current_user.unlike!(@likeable)
  end
end