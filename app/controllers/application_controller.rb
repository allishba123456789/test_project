class ApplicationController < ActionController::Base
	include Pundit
	protect_from_forgery
	rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

	private

	def user_not_authorized
		flash[:alert] = "Access Denied"
		redirect_to (request.referrer || new_user_session_path)
	end

	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up) { |u|
			u.permit(:name, :email, :password,:password_confirmation, :remember_me, :image, :image_cache, :remove_image)
		}
		devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password,
			:password_confirmation, :current_password, :image, :image_cache, :remove_image) }
	end

	def errorMessage(message)
		flash[:alert] = message
	end
end
