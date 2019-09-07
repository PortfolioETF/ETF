class Public::SmokingPostsController < Public::ApplicationController
    def index
        @location = current_user.locations.new
        @smoking_post = @location.smoking_posts.build
        @locations = current_user.locations.to_json
    end

    def show
        @smoking_post = SmokingPost.find(params[:id])
    end

    def create
        current_user.locations.create!(location_smoking_post_params)
    end

    def update
    end

    def destroy
    end

    private
    def location_smoking_post_params
        params.require(:location).permit(:latitude, :longitude, smoking_posts_attributes: [:title, :body, :image_id])
    end
end
