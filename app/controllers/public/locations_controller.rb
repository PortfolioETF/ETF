class Public::LocationsController < Public::ApplicationController
    def new
        render json: params[:latlong]
    end

    def smoking_search
        @q  = Location.ransack(params[:q])
        @result = @q.result
    end

    private
    def location_params
        params.require(:location).permit(:latitude, :longitude)
    end
end
