class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :login_require
  layout :main_layout

  private
    def main_layout
      if ['/users/sign_in'].include?( request.path )
        false
      elsif params[:controller] =~ /^user/
        'user'
      else
        'application'
      end
    end

    def login_require
      authenticate_user! if params[:controller] =~ /^user/
    end
end
