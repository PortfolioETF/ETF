class Public::SmokingPostsController < Public::ApplicationController
    def index
        @location = Location.new
        @smoking_post = @location.smoking_posts.build
        @locations = Location.all.to_json
    end

    def show
        @smoking_post = SmokingPost.find(params[:id])
        @location = @smoking_post.location
        @user = @smoking_post.user
    end

    def create
        @location = Location.new
        @smoking_post = @location.smoking_posts.build
        @locations = Location.all.to_json
        # for render
        latitude = location_smoking_post_params[:latitude]
        longitude = location_smoking_post_params[:longitude]
        title = location_smoking_post_params[:smoking_posts_attributes][:'0'][:title]
        body = location_smoking_post_params[:smoking_posts_attributes][:'0'][:body]
        image_id = location_smoking_post_params[:smoking_posts_attributes][:'0'][:image_id]
        result = Location.create_location_with_smoking_post(latitude, longitude, title, body, current_user,image_id, location_smoking_post_params)
        if result.id
            redirect_to smoking_posts_path(current_user.smoking_posts.last), notice: "投稿しました"
        else
            render 'index'
        end
    end

    def update
        @smoking_post = SmokingPost.find(params[:id])
        if @smoking_post.update(smoking_post_params)
            redirect_to smoking_post_path(@smoking_post), notice: "編集しました"
        else
            render 'edit'
        end
    end

    def edit
        @smoking_post = SmokingPost.find(params[:id])
    end

    def destroy
        SmokingPost.find(params[:id]).destroy!
        redirect_to user_path(current_user), notice: "投稿を削除しました"
    end

    private
    def smoking_post_params
        params.require(:smoking_post).permit(:title, :body, :image_id)
    end

    def location_smoking_post_params
        params.require(:location).permit(:latitude, :longitude, :address, smoking_posts_attributes: [:title, :body, :image_id, :user_id])
    end
end
