class UsersController < ApplicationController
    before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
    before_action :correct_user, only: [:edit, :update]
    before_action :admin_user,     only: [:destroy, :build]

    def index
        @users = User.paginate(page: params[:page])
    end

    def show
        @user = User.find(params[:id])
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new
        if @user.save
          @user.send_activation_email
          flash[:info] = "请检查邮箱，并激活帐号！"
          redirect_to root_url
        else
          render 'new'
        end
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        if @user.update_attributes(user_params)
          flash[:success] = "个人信息修改成功！"
          redirect_to @user
        else
          render 'edit'
        end
    end

    def destroy
        User.find(params[:id]).destroy
        flash[:success] = "User deleted"
        redirect_to users_url
    end

    def build
      
    end

    private
        # 确保是管理员
        def admin_user
          redirect_to(root_url) unless current_user.admin?
        end
        
        def logged_in_user
          unless logged_in?
            store_location
            flash[:danger] = "请先登录！"
            redirect_to login_url
          end
        end

        # 确保是正确的用户
        def correct_user
          @user = User.find(params[:id])
          redirect_to(root_url) unless current_user?(@user)
        end

        def user_params
            params.require(:user).permit(:name,:email,:phone,:address,:birthday,:password,:password_confirmation)
        end
end
