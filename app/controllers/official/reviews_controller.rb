class Official::ReviewsController < ApplicationController
    def index
        @reviews = current_cloak.reviews.order(created_at: "DESC").preload(:user)
    end
end
