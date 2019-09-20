class Public::CloakLocationsController < Public::ApplicationController
    def index
        @cloak_locations = CloakLocation.all.to_json
        @cloaks = Cloak.all.to_json
    end

    def cloak_location_info
        @cloak_location = CloakLocation.find(params[:cloak_location_id])
        render json: @cloak_location
    end
end
