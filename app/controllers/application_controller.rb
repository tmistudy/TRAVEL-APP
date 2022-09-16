class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :signd_in_my_image
  def signd_in_my_image
      if user_signed_in?
        @profile = Mypage.find_by(user_id: current_user.id)
      end
  end

  def after_sign_in_path_for(resource)
    travels_path
  end

  def after_sign_out_path_for(resource)
    travels_path
  end
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [mypage_attributes: [:name] ])
  end
end
