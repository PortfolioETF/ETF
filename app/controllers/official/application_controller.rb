class Official::ApplicationController < ApplicationController
    before_action :authenticate_cloak!
end
