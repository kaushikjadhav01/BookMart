class ApplicationController < ActionController::Base
    include ApplicationHelper, Pundit::Authorization
    before_action :configure_permitted_parameters, if: :devise_controller?

    # Pundit is used to prevent users from accessing pages they are not authorized to access. Handle the error by calling user_not_authorized defined below
    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

    protected

    # Devise settings to allow sign-in with username instead of email
    def configure_permitted_parameters
        added_attrs = [:username, :email, :password, :password_confirmation, :remember_me, :name, :address, :credit_card_number, :phone_number]
        devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
        devise_parameter_sanitizer.permit :sign_in, keys: [:login, :password]
        devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    end

    private

    def user_not_authorized
        flash[:alert] = "You are not authorized to perform this action."
        redirect_back(fallback_location: root_path)
    end
end
