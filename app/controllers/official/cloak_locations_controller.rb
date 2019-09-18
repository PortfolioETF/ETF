class Official::CloakLocationsController < Official::ApplicationController
    def index
        @cloak_locations = CloakLocation.all.to_json
        @cloaks = Cloak.all.to_json
        @cloak_location = CloakLocation.new
        @cloak = current_cloak
    end

    def new
        render json: params[:latlong]
    end

    def create
        if current_cloak.cloak_location.present?
            redirect_to official_cloak_path(current_cloak), notice: '既に登録してあります'
        else
            cloak_location = current_cloak.build_cloak_location(cloak_location_params)
            cloak_location.save!
            redirect_to official_cloak_path(current_cloak), notice: '店舗の位置情報を登録しました'
        end
    end

    private
    def cloak_location_params
        params.require(:cloak_location).permit(:latitude, :longitude, :cloak_id, :description)
    end
end
