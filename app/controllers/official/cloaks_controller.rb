class Official::CloaksController < Official::ApplicationController
    def show
        @cloak = Cloak.find(params[:id])
        @closed_days = @cloak.closed_days
    end

    def edit
        @cloak = current_cloak
    end

    def update
        cloak = current_cloak
        if cloak.update!(cloak_params)
            cloak.cloak_remove_img(params[:cloak][:remove_img])
            redirect_to official_cloak_path(current_cloak), notice: "編集しました"
        else
            render 'edit'
        end
    end

    def destroy
        current_cloak.destroy!
        redirect_to root_path
    end

    def cloak_calendar
        @cloak = current_cloak
    end

    def closed_day
        closed_days = current_cloak.closed_days
        render json: closed_days
    end

    private
    def cloak_params
        params.require(:cloak).permit(:cloak_name, :email, :phone_number, :address, :image_id)
    end
end
