# app/controllers/application_controller.rb
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    # Assuming you have a User model and want to get the first user from the database
    @current_user ||= User.first
  end
  helper_method :current_user
end
