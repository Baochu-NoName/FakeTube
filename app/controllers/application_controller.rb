class ApplicationController < ActionController::Base
    before_action :set_cats
            
    def set_cats
        @categories = Category.includes(:videos).all.order(:name)
    end
end
