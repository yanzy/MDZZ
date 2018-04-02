class Back::UsersController < Back::BaseController
    before_filter :find_user , only: [:show, :edit, :update, :destroy, :fix_password, :update_password]
    def index
      @q = User.ransack(params[:q])
      @users = @q.result(distinct: true).paginate(page: params[:page], :per_page => 15)
    end

    def show
      @user = User.find(params[:id])
    end

    def new
      @user = User.new
    end

    def create
      @user = User.new(user_params)
      if @user.save
        flash[:success] = "添加成功！"
        redirect_to back_users_path
      else
        flash[:fail] = "添加失败！"
        render :new
      end
    end

    def edit
    end

    def update
      if @user.update(user_params)
        flash[:success] = "信息修改成功！"
        redirect_to back_users_path
      else
        flash[:fail] = "信息修改成功！"
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

    def fix_password

    end

    def update_password
      if @user.update(password_params)
        flash[:success] = "密码修改成功！"
        log_out if logged_in?
        redirect_to login_path
      else
        flash[:fail] = "密码修改成功！"
        redirect_to back_root_path
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

      def password_params
        params.require(:user).permit(:password,:password_confirmation)
      end
end
