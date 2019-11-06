class Public::ClosedDaysController < Public::ApplicationController
    def index
        closed_days = Cloak.find(params[:id]).closed_days
        render json: closed_days
    end
end
