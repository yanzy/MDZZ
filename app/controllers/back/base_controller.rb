class Back::BaseController < ActionController::Base
  include SessionsHelper
  before_action :detection
  layout 'back/back'

  private

    def detection
      if !logged_in?
        redirect_to login_url
      end
    end
end
