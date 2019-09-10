class Public::SmokingPostsController < Public::ApplicationController
    def index
        @location = Location.new
        @smoking_post = @location.smoking_posts.build
        @locations = Location.all.to_json
        @q = Location.ransack(params[:q])
        # @search_location = @q.result.includes(:smoking_posts).page(params[:page])
    end

    def show
        @smoking_post = SmokingPost.find(params[:id])
    end

    def create
        latitude = location_smoking_post_params[:latitude]
        longitude = location_smoking_post_params[:longitude]
        title = location_smoking_post_params[:smoking_posts_attributes][:'0'][:title]
        body = location_smoking_post_params[:smoking_posts_attributes][:'0'][:body]
        Location.create_location_with_smoking_post(latitude, longitude, title, body, current_user, location_smoking_post_params)
    end

    def update
    end

    def destroy
    end

    private
    def location_smoking_post_params
        params.require(:location).permit(:latitude, :longitude, :address, smoking_posts_attributes: [:title, :body, :image_id, :user_id])
    end
end