class ApplicationController < ActionController::Base
  include ApplicationHelper
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # # before_action :authorize
  #
  # def authorize
  #   redirect_to root_path unless session[:user_id]
  # end
end
