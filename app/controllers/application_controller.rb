class ApplicationController < ActionController::API
    include Pundit::Authorization
    before_action :configure_permitted_parameters, if: :devise_controller?

    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

    protected
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
        devise_parameter_sanitizer.permit(:account_update, keys: [:name])
        # devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :current_password)}
    end

    private
    def user_not_authorized
        render json: "OOPS! Yoou are not authorized to perform this action", status: 401
    end
end
