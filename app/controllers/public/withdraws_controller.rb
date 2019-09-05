class Public::WithdrawsController < Public::ApplicationController
    def show
        ＠opinion = Opinion.new
    end

    def create
        current_user.withdraw_after_create_opinion!(opinion_params)
        redirect_to withdraw_complete_path
    end

    private
    def opinion_params
        params.permit(:opinion, :withdraw_flag)
    end
end
