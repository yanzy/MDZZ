class Back::PicturesController < Back::BaseController

    def index
      @q = Picture.ransack(params[:q])
      @pictures = @q.result(distinct:true).paginate(page: params[:page])
    end

    private
      def picture_params
        params.require(:document).permit(:name,:imageable_id,:imageable_type,:description,:created_at,:updated_at)
      end

end
