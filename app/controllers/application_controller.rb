class ApplicationController < ActionController::Base
    before_action :configure_permitted_paramaters, if: :devise_controller?

    protected

    def configure_permitted_paramaters
        devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password)}
        devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :current_password)}
    end

    private

    def require_login
        unless signed_in?
            flash[:error] = "You must be logged in to do this action"
            redirect_to new_user_session_path
        end
    end
end
