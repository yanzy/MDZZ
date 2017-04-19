class Back::UsersController < Back::BaseController
    before_filter :find_user , only: [:show, :edit, :update, :destroy]
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
      if @user.save
        flash[:success] = "添加成功！"
        redirect_to back_uses_path
      else
        flash[:fail] = "添加失败！"
        render 'new'
      end
    end

    def edit
    end

    def update
      if @user.update_attributes(user_params)
        flash[:success] = "个人信息修改成功！"
        redirect_to @user
      else
        render 'edit'
      end
    end

    def destroy
      if @user.destroy
        flash[:success] = "删除成功！"
        redirect_to back_users_path
      else
        flash[:fail] = "删除失败！"
        redirect_to back_users_path
      end
    end

    private
      # 确保是管理员
      def find_user
        @user = User.find(params[:id])
      end

      def user_params
          params.require(:user).permit(:name,:email,:phone,:address,:birthday,:password,:password_confirmation)
      end
end
