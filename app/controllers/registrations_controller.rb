class RegistrationsController < Devise::RegistrationsController

  private
  def sign_up_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation,:billing_day, :image, :image_cache, :remove_image)
  end

  def account_update_params
  	params.require(:user).permit(:name, :email, :password, :password_confirmation,:billing_day, :current_password, :image, :image_cache, :remove_image)
  end
end
