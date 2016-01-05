class ApplicationController < ActionController::Base
  before_filter :configure_permitted_parameters, if: :devise_controller?
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name, :email, :password,:password_confirmation, :current_password) }
  end

  protect_from_forgery with: :exception
  # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(resource_or_scope)
    # root_path
    demo_path
  end
  def after_sign_in_path_for(resource)
    if(request.referrer)
      if current_user.try(:admin?)
        if (request.referrer).include? "admin"
          "/backend"
        else
          "/users/edit"
        end
      else
        edit_user_registration_path
      end
    else
      edit_user_registration_path
    end  	
	end
end
