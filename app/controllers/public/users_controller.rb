class Public::UsersController < Public::ApplicationController
    def show
        @user = User.find(params[:id])
    end

    def edit
        @user = User.find(params[:id ])
    end

    def update
        if current_user.update(user_params)
            redirect_to user_path(current_user), notice: "更新が完了しました"
        else
            render 'edit'
        end
    end

    def image_select
        @user = User.find(params[:id ])
    end

    private
    def user_params
        params.require(:user).permit(:name, :email, :image_id)
    end
end
