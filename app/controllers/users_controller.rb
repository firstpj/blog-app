class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find_by_id(params[:id])
      @recent_posts = @user.most_recent_posts
  end
end
