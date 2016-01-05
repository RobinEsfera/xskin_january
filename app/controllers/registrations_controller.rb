class RegistrationsController < Devise::RegistrationsController

  def create
    super
    UserMailer.welcome_email(@user).deliver unless @user.invalid?
  end

  protected

    def after_update_path_for(resource)
      edit_user_registration_path
    end
end