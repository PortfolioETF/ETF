class Public::OpinionsController < Public::ApplicationController

    def new
    end

    def create
        current_user.opinions.create!(opinion_params)
    end

    private
    def opinion_params
        params.require(:opinion).permit(:opinion, :withdraw_flag)
    end
end
