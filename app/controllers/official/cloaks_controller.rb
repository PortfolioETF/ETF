class Official::CloaksController < Official::ApplicationController
    def show
        @cloak = current_cloak
        @closed_days = @cloak.closed_days
    end
end
