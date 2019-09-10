class Public::LocationsController < Public::ApplicationController
    def new
        render json: params[:latlong]
    end

    def show
        @smoking_posts = Location.find(params[:id]).smoking_posts
        render json: @smoking_posts
    end

    def smoking_search
        @q  = Location.ransack(params[:q])
        @results = @q.result
    end

    private
    def location_params
        params.require(:location).permit(:latitude, :longitude)
    end
end
