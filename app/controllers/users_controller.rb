class UsersController < ApplicationController
    before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
    before_action :correct_user, only: [:edit, :update]
    before_action :admin_user,     only: [:destroy, :build]
    before_action :find_user ,  only: [:show,:edit,:update,:destroy]

    def index
      @users = User.paginate(page: params[:page])
    end

    def show
      @user = User.find(params[:id])
    end

    def new
      @user = User.new
    end

    def sign_up
      @user = User.new
      if @user.save
        @user.send_activation_email
        flash[:info] = "请检查邮箱，并激活帐号！"
        redirect_to root_url
      else
        render 'new'
      end
    end

    def create

    end

    def edit
      @user = User.find(params[:id])
    end

    def update
      @user = User.find(params[:id])
      binding.pry
      if @user.update_attributes(user_params)
        flash[:success] = "信息修改成功！"
        redirect_to @user
      else
        render 'edit'
        falsh[:fail] = "信息修改失败!"
      end
    end

    def destroy
      if @user.destroy
        flash[:default] = "删除成功！"
        redirect_to users_url
      else
        flash[:fail] = "删除失败！"
        redirect_to users_path
      end
    end

    def build

    end

    private
      # 确保是管理员
      def find_user
        @user = User.find(params[:id])
      end

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
