class Public::LocationsController < Public::ApplicationController
    def new
        render json: params[:latlong]
    end

    def create
    end

    def location_params
        params.require(:location).permit(:latitude, :longitude)
    end
end
