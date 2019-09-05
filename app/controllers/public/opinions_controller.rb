class Public::OpinionsController < Public::ApplicationController

    def new
        @opinion = Opinion.new
    end

    def create
        current_user.opinions.create!(opinion_params)
        redirect_to user_path(current_user)
    end

    private
    def opinion_params
        params.require(:opinion).permit(:opinion, :withdraw_flag)
    end
end
