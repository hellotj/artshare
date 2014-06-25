class HomeController < ApplicationController
  def index
  	unless user_signed_in?
            redirect_to new_user_session_path
            else
        @post = Post.new
        @activities = PublicActivity::Activity.where(owner_id: followees_ids, owner_type: "User")
     
  end
  end
end