class Public::UsersController < Public::ApplicationController
    def show
        @user = current_user
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            redirect_to user_path(@user), notice: "更新が完了しました"
        else
            render 'edit'
        end
    end

    def image_select
        @user = User.find(params[:id])
    end

    def my_posts
        @smoking_posts = current_user.smoking_posts.page(params[:page]).per(10).order(updated_at: "DESC").preload(:location)
    end

    private
    def user_params
        params.require(:user).permit(:name, :email, :image_id)
    end
end
