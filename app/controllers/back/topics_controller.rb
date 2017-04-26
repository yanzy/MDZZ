class Back::TopicsController < Back::BaseController
  before_filter :find_topic, only: [:show, :edit, :update, :destroy]

  def index
    @q = Back::Topic.ransack(params[:q])
    @back_topics = @q.result(distict: true).paginate(page: params[:page], :per_page => 8)
  end

  def show
  end

  def new
    @back_topic = Back::Topic.new
  end

  def create
    @back_topic = Back::Topic.new(topic_params)
    @back_topic.user_id = current_user.id
    if @back_topic.save
      flash[:success] = "添加成功！"
      redirect_to back_topics_path
    else
      flash[:fail] = "添加失败！"
      render 'new'
    end
  end

  def edit
  end

  def update
    if @back_topic.update(topic_params)
      flash[:success] = "修改成功！"
      redirect_to back_topics_path
    else
      flash[:fail] = "修改失败！"
      render 'edit'
    end
  end

  def destroy
    if @back_topic.destroy
      flash[:success] = "删除成功！"
      redirect_to back_topics_path
    else
      flash[:fail] = "删除失败！"
      redirect_to back_topics_path
    end
  end

  private
    def find_topic
      @back_topic = Back::Topic.find(params[:id])
    end

    def topic_params
      params.require(:back_topic).permit(:title, :user_id, :content, :status, :created_at, :updated_at)
    end
end
