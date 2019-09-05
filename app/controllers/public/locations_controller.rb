class Public::LocationsController < Public::ApplicationController
    def show
        @locations = current_user.locations.all
        @hash = Gmaps4rails.build_markers(@locations) do |location, marker|
            marker.lat location.latitude
            marker.lng location.longitude
            marker.infowindow location.location_name
        end
    end

    def create
        @latitude = params[:latitude]
        @longitude = params[:longitude]
        current_user.locations.create(longitude: @longitude, latitude: @latitude)
    end

    def location_params
        params.require(:location).permit(:latitude, :longitude)
    end
end
