class Public::LocationsController < Public::ApplicationController
    def show
        @locations = current_user.locations.all.to_json
        @location = current_user.locations.first.to_json.html_safe
        # @latitudes = @locations.map{|location| location.latitude}
        # @longitudes = @locations.map{|location| location.longitude}
        # @hash = Gmaps4rails.build_markers(@locations) do |location, marker|
        #     marker.lat location.latitude
        #     marker.lng location.longitude
        #     marker.infowindow location.location_name
        # end
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
