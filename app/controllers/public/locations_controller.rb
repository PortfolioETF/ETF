class Public::LocationsController < Public::ApplicationController
    def new
        render json: params[:latlong]
    end

    def show
        @smoking_posts = Location.find(params[:id]).smoking_posts.page(params[:page_data]).per(5).preload(:user)
    end

    def smoking_search
        @search_locations = Location.search(params[:data][:text])
        @locations = Location.search_result_smo_string?(@search_locations, params[:data][:page_data])
        @search_error = Location.be_error?(@locations, @search_locations)
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
