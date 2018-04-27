class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def after_sign_in_path_for(resource_or_scope)
    if employeer_signed_in?
      employeer_dashboard_employeer_path
    else
      redirect_to root_path
    end
  end

end
