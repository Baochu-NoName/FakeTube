class ApplicationController < ActionController::Base
    before_action :set_cats
    before_action :configure_permitted_parameters, if: :devise_controller?

    protected
    def set_cats
        @categories = Category.all.order(:name)
    end

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:user_name])
    end
end
