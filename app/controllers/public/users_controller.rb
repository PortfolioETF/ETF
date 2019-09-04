class Public::UsersController < Public::ApplicationController
    def show
    end

    def edit
        @user = User.find(params[:id ])
    end

    def update
        user = User.find(params[:id])
        if user.update(user_params)
            redirect_to user_path(user), notice: "更新が完了しました"
        else
            render 'edit'
        end
    end

    def destroy
    end

    def image_select
        @user = User.find(params[:id ])
    end

    private
    def user_params
        params.require(:user).permit(:name, :email, :image_id)
    end
end
