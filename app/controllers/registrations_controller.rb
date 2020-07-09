# frozen_string_literal: true

class RegistrationsController < Devise::RegistrationsController
  # RegistrationsController is inherited / imported from Devise::RegistrationsController class (available to view on GitHub)

  private

  def sign_up_params
    params.require(:user).permit(:name,
                                 :email,
                                 :password,
                                 :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:name,
                                 :email,
                                 :password,
                                 :password_confirmation,
                                 :current_password)
  end
end
