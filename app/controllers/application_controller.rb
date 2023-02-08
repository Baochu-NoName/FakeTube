class ApplicationController < ActionController::Base
    before_action :set_cats
            
    def set_cats
        @categories = Category.all.order(:name)
    end
end
