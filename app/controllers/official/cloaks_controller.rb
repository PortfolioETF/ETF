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
            redirect_to official_cloak_path(current_cloak), notice: "編集しました"
        else
            render 'edit'
        end
    end

    private
    def cloak_params
        params.require(:cloak).permit(:cloak_name, :email, :phone_number, :address, :image_id)
    end
end
