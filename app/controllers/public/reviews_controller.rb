class Public::ReviewsController < ApplicationController
    def index
        @reviews = current_user.reviews.order(created_at: "DESC").preload(:cloak)
    end

    def new
        @id = params[:id]
        @review = current_user.reviews.new
    end

    def create
        review = current_user.reviews.new(review_params)
        if review.save
            redirect_to cloak_locations_path, notice: 'レビューを登録しました'
        else
            render 'new'
        end
    end

    def destroy
        review = Review.find(params[:id])
        review.destroy!
        redirect_to reviews_path, notice: '削除しました'
    end

    def reviews_cloak
        @reviews = Review.where(params[:cloak_id]).order(created_at: "DESC").page(params[:page_data]).per(10).preload(:user)
    end

    private
    def review_params
        params.require(:review).permit(:cloak_id, :review)
    end
end
