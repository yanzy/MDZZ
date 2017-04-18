class SessionsController < ApplicationController
  def new
    clear_login_wrong_count
    render layout: false
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      if user.activated?
        log_in user
        params[:session][:remember_me] == '1' ? remember(user) : forget(user)
        redirect_to back_root_url
      else
        message  = "*帐号未激活*"
        message += "  查看邮箱是否收到激活链接？ "
        flash[:warning] = message
        redirect_to back_root_url
      end
    else
      flash[:danger] = "哎呀！登录失败了~~再检查一下输入的邮箱和密码是否正确"
      render 'new'
    end  end

  def destroy
    log_out if logged_in?
    redirect_to sign_up_url
  end
end
