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
        latitude = location_smoking_post_params[:latitude]
        longitude = location_smoking_post_params[:longitude]
        if duplicate_location = current_user.locations.find_by(latitude: latitude, longitude: longitude)
            title = location_smoking_post_params[:smoking_posts_attributes][:'0'][:title]
            body = location_smoking_post_params[:smoking_posts_attributes][:'0'][:body]
            duplicate_location.smoking_posts.create(title: title, body: body)
        else
          current_user.locations.create!(location_smoking_post_params)
        end
    end

    def update
    end

    def destroy
    end

    private
    def location_smoking_post_params
        params.require(:location).permit(:latitude, :longitude, :address, smoking_posts_attributes: [:title, :body, :image_id])
    end
end
