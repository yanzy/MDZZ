class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

  def add_login_wrong_count
    session[:add_login_wrong_count] ||= 0
    session[:add_login_wrong_count] = session[:add_login_wrong_count] + 1
  end

  def clear_login_wrong_count
    session[:add_login_wrong_count] = nil
  end
end
