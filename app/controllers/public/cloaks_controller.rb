class Public::CloaksController < ApplicationController
    def show
        @cloak = Cloak.find(params[:id])
    end

    def cloak_search
        @search_cloaks = Cloak.search(params[:data][:text])
        @cloaks = Cloak.search_result_cloak_string?(@search_cloaks, params[:data][:page_data])
        @search_error = Cloak.be_error?(@cloaks, @search_cloaks)
    end

    def cloak_calendar
        @cloak = Cloak.find(params[:id])
    end
end
