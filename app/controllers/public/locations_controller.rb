class Public::LocationsController < Public::ApplicationController
    def new
        render json: params[:latlong]
    end

    def show
        @smoking_posts = Location.find(params[:id]).smoking_posts
        @users = @smoking_posts.map{|smoking_post| smoking_post.user}
        render json: {smoking_posts: @smoking_posts, users: @users}
    end

    def smoking_search
        @q  = Location.ransack(params[:q])
        @results = @q.result
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
