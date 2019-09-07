class Public::PostsController < Public::ApplicationController
    def index
        @post = Post.new
        @locations = current_user.locations.all.to_json
        @location = current_user.locations.first.to_json.html_safe
    end

    def show
    end

    def create
        @latitude = params[:latitude]
        @longitude = params[:longitude]
        location = current_user.locations.create(longitude: @longitude, latitude: @latitude)
        location.posts.create(post_params)
    end

    def update
    end

    def destroy
    end

    private
    def post_params
        params.require(:post).permit(:title, :body, :image_id, :post_flag)
    end

    def location_params
        params.permit(:latitude, :longitude)
    end
end
