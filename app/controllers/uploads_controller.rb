class UploadsController < ActionController::BaseController

  include ApplicationHelper

  def index
    #获取上传凭证
    @uptoken = uptoken
  end
end
