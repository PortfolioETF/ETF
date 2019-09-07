class Public::LocationsController < Public::ApplicationController
    def show
    end

    def create
    end

    def location_params
        params.require(:location).permit(:latitude, :longitude)
    end
end
