class Public::ReviewsController < ApplicationController
    def index
        @review = current_user.reviews.page(params[:page]).per(10)
    end

    def new
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

    private
    def review_params
        params.require(:review).permit(:cloak_id, :review)
    end
end
