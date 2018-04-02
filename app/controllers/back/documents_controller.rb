class Back::DocumentsController < Back::BaseController

    def index
        @q = Document.ransack(params[:q])
        @documents = @q.result(distinct: true).paginate(page: params[:page])
    end
    private
      def picture_params
        params.require(:document).permit(:name,:file_id,:file_type,:description,:created_at,:updated_at)
      end

end
