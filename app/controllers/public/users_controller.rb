class Public::UsersController < Public::ApplicationController
    def show

    end

    def edit

    end

    def update

    end

    def destroy
    end

    def image_select
    end

    private
    def user_params
        params.require(:users).permit(:name, :email, :image)
    end
end
