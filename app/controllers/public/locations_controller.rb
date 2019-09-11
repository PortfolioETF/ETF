class Public::LocationsController < Public::ApplicationController
    def new
        render json: params[:latlong]
    end

    def show
        @smoking_posts = Location.find(params[:id]).smoking_posts.page(params[:page]).per(5).preload(:user)
        # render json: {smoking_posts: @smoking_posts, users: @users}
    end

    def smoking_search
        @q  = Location.ransack(params[:q])
        @results = @q.result.page(params[:page]).per(5)
    end

    def after_smoking_search
        @q  = Location.ransack(params[:page][:q])
        @results = @q.result.page(params[:page][:page]).per(5)
    end

    def get_destination
        @location = Location.find(params[:id])
        render json: @location
    end

    private
    def location_params
        params.require(:location).permit(:latitude, :longitude)
    end
end
