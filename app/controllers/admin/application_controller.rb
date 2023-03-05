# All Administrate controllers inherit from this
# `Administrate::ApplicationController`, making it the ideal place to put
# authentication logic or other before_actions.
#
# If you want to add pagination or other controller-level concerns,
# you're free to overwrite the RESTful controller actions.
module Admin
  class ApplicationController < Administrate::ApplicationController
    before_action :authenticate_admin

    def authenticate_admin
      # TODO Add authentication logic here.
      if user_signed_in?
        page_not_found if !current_user.admin?
      else
        page_not_found      
      end
    end

    # def render_404_page
    #   redirect_to :file => "#{Rails.root}/public/404.html", :status => 404
    # end

    def page_not_found
      raise ActionController::RoutingError.new('Not Found')
    end

    # Override this value to specify the number of elements to display at a time
    # on index pages. Defaults to 20.
    # def records_per_page
    #   params[:per_page] || 20
    # end
  end
end
